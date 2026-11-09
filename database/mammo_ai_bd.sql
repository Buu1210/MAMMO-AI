-- =====================================================================
-- MAMMO-AI · Diseño físico de la base de datos
-- Motor: PostgreSQL 16
-- Universidad Santiago de Cali · Ingeniería de Sistemas · 2026B
--
-- Nota de diseño: las imágenes (mamografías, mapas de calor, pesos del
-- modelo) NO se guardan dentro de la base de datos. Se guardan en un
-- almacenamiento de archivos y la base de datos solo registra su ruta,
-- su huella SHA-256 y sus metadatos.
-- =====================================================================

DROP SCHEMA IF EXISTS mammo_ai CASCADE;
CREATE SCHEMA mammo_ai;
SET search_path TO mammo_ai;

-- ---------------------------------------------------------------------
-- 1. Usuarios y roles
-- ---------------------------------------------------------------------
CREATE TABLE rol (
    id_rol        SMALLSERIAL  PRIMARY KEY,
    nombre        VARCHAR(30)  NOT NULL UNIQUE,
    descripcion   VARCHAR(200)
);

CREATE TABLE usuario (
    id_usuario         SERIAL        PRIMARY KEY,
    id_rol             SMALLINT      NOT NULL REFERENCES rol (id_rol),
    nombres            VARCHAR(60)   NOT NULL,
    apellidos          VARCHAR(60)   NOT NULL,
    correo             VARCHAR(120)  NOT NULL UNIQUE,
    hash_contrasena    VARCHAR(255)  NOT NULL,
    profesion          VARCHAR(60),
    acepta_terminos    BOOLEAN       NOT NULL DEFAULT FALSE,
    fecha_aceptacion   TIMESTAMPTZ,
    fecha_registro     TIMESTAMPTZ   NOT NULL DEFAULT now(),
    activo             BOOLEAN       NOT NULL DEFAULT TRUE,
    CONSTRAINT ck_usuario_correo CHECK (correo ~* '^[^@\s]+@[^@\s]+\.[^@\s]+$'),
    CONSTRAINT ck_usuario_terminos CHECK (acepta_terminos = FALSE OR fecha_aceptacion IS NOT NULL)
);

-- ---------------------------------------------------------------------
-- 2. Datos de entrenamiento (conjuntos públicos y anonimizados)
-- ---------------------------------------------------------------------
CREATE TABLE conjunto_datos (
    id_conjunto      SERIAL        PRIMARY KEY,
    nombre           VARCHAR(60)   NOT NULL,
    version          VARCHAR(20)   NOT NULL,
    fuente_url       VARCHAR(300)  NOT NULL,
    licencia         VARCHAR(120)  NOT NULL,
    anonimizado      BOOLEAN       NOT NULL,
    fecha_descarga   DATE          NOT NULL,
    CONSTRAINT uq_conjunto UNIQUE (nombre, version),
    -- Requisito 6.1: solo se aceptan conjuntos anonimizados
    CONSTRAINT ck_conjunto_anonimizado CHECK (anonimizado = TRUE)
);

CREATE TABLE imagen_referencia (
    id_imagen        SERIAL        PRIMARY KEY,
    id_conjunto      INTEGER       NOT NULL REFERENCES conjunto_datos (id_conjunto),
    ruta_archivo     VARCHAR(300)  NOT NULL UNIQUE,
    etiqueta_real    VARCHAR(10)   NOT NULL,
    particion        VARCHAR(15)   NOT NULL,
    lateralidad      CHAR(1),
    vista            VARCHAR(3),
    CONSTRAINT ck_imgref_etiqueta    CHECK (etiqueta_real IN ('normal', 'sospechosa')),
    CONSTRAINT ck_imgref_particion   CHECK (particion IN ('entrenamiento', 'validacion', 'prueba')),
    CONSTRAINT ck_imgref_lateralidad CHECK (lateralidad IN ('I', 'D')),
    CONSTRAINT ck_imgref_vista       CHECK (vista IN ('CC', 'MLO'))
);

-- ---------------------------------------------------------------------
-- 3. Versiones del modelo de clasificación
-- ---------------------------------------------------------------------
CREATE TABLE modelo (
    id_modelo            SERIAL         PRIMARY KEY,
    version              VARCHAR(20)    NOT NULL UNIQUE,
    arquitectura         VARCHAR(60)    NOT NULL,
    hiperparametros      JSONB          NOT NULL DEFAULT '{}'::jsonb,
    ruta_pesos           VARCHAR(300)   NOT NULL,
    sensibilidad         NUMERIC(5,4)   NOT NULL,
    especificidad        NUMERIC(5,4)   NOT NULL,
    auc                  NUMERIC(5,4)   NOT NULL,
    umbral_decision      NUMERIC(5,4)   NOT NULL DEFAULT 0.5,
    fecha_entrenamiento  DATE           NOT NULL,
    activo               BOOLEAN        NOT NULL DEFAULT FALSE,
    CONSTRAINT ck_modelo_metricas CHECK (
        sensibilidad    BETWEEN 0 AND 1 AND
        especificidad   BETWEEN 0 AND 1 AND
        auc             BETWEEN 0 AND 1 AND
        umbral_decision BETWEEN 0 AND 1),
    -- Criterio de aceptación: solo puede quedar activo un modelo con sensibilidad >= 0,85
    CONSTRAINT ck_modelo_activo_sensibilidad CHECK (activo = FALSE OR sensibilidad >= 0.85)
);

-- Solo puede existir un modelo activo a la vez
CREATE UNIQUE INDEX ux_modelo_un_activo ON modelo (activo) WHERE activo;

-- Relación N:M entre modelos y conjuntos de datos usados para entrenarlos
CREATE TABLE modelo_conjunto (
    id_modelo     INTEGER  NOT NULL REFERENCES modelo (id_modelo) ON DELETE CASCADE,
    id_conjunto   INTEGER  NOT NULL REFERENCES conjunto_datos (id_conjunto),
    PRIMARY KEY (id_modelo, id_conjunto)
);

-- ---------------------------------------------------------------------
-- 4. Análisis de mamografías cargadas por los usuarios
-- ---------------------------------------------------------------------
CREATE TABLE mamografia (
    id_mamografia    SERIAL        PRIMARY KEY,
    id_usuario       INTEGER       NOT NULL REFERENCES usuario (id_usuario),
    ruta_archivo     VARCHAR(300)  NOT NULL,
    hash_sha256      CHAR(64)      NOT NULL,
    formato          VARCHAR(5)    NOT NULL,
    lateralidad      CHAR(1),
    vista            VARCHAR(3),
    fecha_carga      TIMESTAMPTZ   NOT NULL DEFAULT now(),
    CONSTRAINT uq_mamografia_hash    UNIQUE (id_usuario, hash_sha256),
    CONSTRAINT ck_mamografia_formato CHECK (formato IN ('DICOM', 'PNG', 'JPG')),
    CONSTRAINT ck_mamografia_lat     CHECK (lateralidad IN ('I', 'D')),
    CONSTRAINT ck_mamografia_vista   CHECK (vista IN ('CC', 'MLO'))
);

CREATE TABLE analisis (
    id_analisis          SERIAL         PRIMARY KEY,
    id_mamografia        INTEGER        NOT NULL REFERENCES mamografia (id_mamografia) ON DELETE CASCADE,
    id_modelo            INTEGER        NOT NULL REFERENCES modelo (id_modelo),
    clasificacion        VARCHAR(10)    NOT NULL,
    confianza            NUMERIC(5,4)   NOT NULL,
    tiempo_respuesta_ms  INTEGER        NOT NULL,
    aviso_mostrado       BOOLEAN        NOT NULL DEFAULT TRUE,
    fecha_analisis       TIMESTAMPTZ    NOT NULL DEFAULT now(),
    CONSTRAINT ck_analisis_clasif    CHECK (clasificacion IN ('normal', 'sospechosa')),
    CONSTRAINT ck_analisis_confianza CHECK (confianza BETWEEN 0 AND 1),
    CONSTRAINT ck_analisis_tiempo    CHECK (tiempo_respuesta_ms > 0),
    -- Requisito 7.1: el resultado siempre se muestra con el aviso de herramienta de apoyo
    CONSTRAINT ck_analisis_aviso     CHECK (aviso_mostrado = TRUE)
);

-- Relación 1:1 con análisis (cada análisis genera un único mapa de calor)
CREATE TABLE mapa_calor (
    id_mapa         SERIAL         PRIMARY KEY,
    id_analisis     INTEGER        NOT NULL UNIQUE REFERENCES analisis (id_analisis) ON DELETE CASCADE,
    ruta_imagen     VARCHAR(300)   NOT NULL,
    metodo          VARCHAR(20)    NOT NULL DEFAULT 'Grad-CAM',
    capa_objetivo   VARCHAR(60)    NOT NULL,
    fecha_generado  TIMESTAMPTZ    NOT NULL DEFAULT now()
);

-- ---------------------------------------------------------------------
-- 5. Tutor de IA y simulación gamificada
-- ---------------------------------------------------------------------
CREATE TABLE escenario (
    id_escenario         SERIAL         PRIMARY KEY,
    id_imagen            INTEGER        NOT NULL REFERENCES imagen_referencia (id_imagen),
    titulo               VARCHAR(100)   NOT NULL,
    descripcion          TEXT           NOT NULL,
    dificultad           SMALLINT       NOT NULL,
    prediccion_mostrada  VARCHAR(10)    NOT NULL,
    retroalimentacion    TEXT           NOT NULL,
    puntaje_maximo       SMALLINT       NOT NULL DEFAULT 10,
    activo               BOOLEAN        NOT NULL DEFAULT TRUE,
    CONSTRAINT ck_escenario_dificultad CHECK (dificultad BETWEEN 1 AND 3),
    CONSTRAINT ck_escenario_prediccion CHECK (prediccion_mostrada IN ('normal', 'sospechosa')),
    CONSTRAINT ck_escenario_puntaje    CHECK (puntaje_maximo > 0)
);

CREATE TABLE sesion_simulacion (
    id_sesion      SERIAL        PRIMARY KEY,
    id_usuario     INTEGER       NOT NULL REFERENCES usuario (id_usuario),
    fecha_inicio   TIMESTAMPTZ   NOT NULL DEFAULT now(),
    fecha_fin      TIMESTAMPTZ,
    CONSTRAINT ck_sesion_fechas CHECK (fecha_fin IS NULL OR fecha_fin >= fecha_inicio)
);

CREATE TABLE respuesta_escenario (
    id_respuesta         SERIAL         PRIMARY KEY,
    id_sesion            INTEGER        NOT NULL REFERENCES sesion_simulacion (id_sesion) ON DELETE CASCADE,
    id_escenario         INTEGER        NOT NULL REFERENCES escenario (id_escenario),
    decision_usuario     VARCHAR(10)    NOT NULL,
    justificacion        TEXT,
    puntaje_obtenido     SMALLINT       NOT NULL DEFAULT 0,
    tiempo_respuesta_s   INTEGER        NOT NULL,
    fecha_respuesta      TIMESTAMPTZ    NOT NULL DEFAULT now(),
    CONSTRAINT uq_respuesta          UNIQUE (id_sesion, id_escenario),
    CONSTRAINT ck_respuesta_decision CHECK (decision_usuario IN ('normal', 'sospechosa')),
    CONSTRAINT ck_respuesta_puntaje  CHECK (puntaje_obtenido >= 0),
    CONSTRAINT ck_respuesta_tiempo   CHECK (tiempo_respuesta_s > 0)
);

-- ---------------------------------------------------------------------
-- 6. Índices para las consultas más frecuentes
-- ---------------------------------------------------------------------
CREATE INDEX ix_usuario_rol            ON usuario (id_rol);
CREATE INDEX ix_imgref_conjunto        ON imagen_referencia (id_conjunto, particion);
CREATE INDEX ix_mamografia_usuario     ON mamografia (id_usuario, fecha_carga DESC);
CREATE INDEX ix_analisis_mamografia    ON analisis (id_mamografia);
CREATE INDEX ix_analisis_modelo_fecha  ON analisis (id_modelo, fecha_analisis);
CREATE INDEX ix_escenario_imagen       ON escenario (id_imagen);
CREATE INDEX ix_sesion_usuario         ON sesion_simulacion (id_usuario);
CREATE INDEX ix_respuesta_escenario    ON respuesta_escenario (id_escenario);

-- ---------------------------------------------------------------------
-- 7. Vistas (los atributos derivados se calculan, no se almacenan)
-- ---------------------------------------------------------------------

-- Resultado completo que consume la interfaz web
CREATE VIEW v_resultado_analisis AS
SELECT a.id_analisis,
       m.id_usuario,
       m.ruta_archivo       AS ruta_mamografia,
       a.clasificacion,
       a.confianza,
       mc.ruta_imagen       AS ruta_mapa_calor,
       mo.version           AS version_modelo,
       a.tiempo_respuesta_ms,
       a.fecha_analisis
FROM analisis a
JOIN mamografia m     ON m.id_mamografia = a.id_mamografia
JOIN modelo mo        ON mo.id_modelo    = a.id_modelo
LEFT JOIN mapa_calor mc ON mc.id_analisis = a.id_analisis;

-- Desempeño en el tutor: si la decisión fue correcta y si el usuario
-- siguió la sugerencia de la IA (mide el sesgo de automatización)
CREATE VIEW v_desempeno_tutor AS
SELECT r.id_respuesta,
       s.id_usuario,
       e.id_escenario,
       e.dificultad,
       r.decision_usuario,
       i.etiqueta_real,
       e.prediccion_mostrada,
       (r.decision_usuario = i.etiqueta_real)            AS decision_correcta,
       (r.decision_usuario = e.prediccion_mostrada)      AS siguio_a_la_ia,
       (e.prediccion_mostrada <> i.etiqueta_real)        AS ia_se_equivoco,
       r.puntaje_obtenido
FROM respuesta_escenario r
JOIN sesion_simulacion s  ON s.id_sesion   = r.id_sesion
JOIN escenario e          ON e.id_escenario = r.id_escenario
JOIN imagen_referencia i  ON i.id_imagen    = e.id_imagen;

-- Cumplimiento del requisito 4.1 (respuesta en menos de 10 segundos)
CREATE VIEW v_tiempo_respuesta AS
SELECT mo.version,
       count(*)                                              AS total_analisis,
       round(avg(a.tiempo_respuesta_ms))                     AS promedio_ms,
       max(a.tiempo_respuesta_ms)                            AS maximo_ms,
       round(100.0 * avg((a.tiempo_respuesta_ms < 10000)::int), 1) AS pct_menor_10s
FROM analisis a
JOIN modelo mo ON mo.id_modelo = a.id_modelo
GROUP BY mo.version;

-- ---------------------------------------------------------------------
-- 8. Roles de acceso (principio de mínimo privilegio)
-- ---------------------------------------------------------------------
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'mammo_app') THEN
        CREATE ROLE mammo_app LOGIN PASSWORD 'cambiar_en_produccion';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'mammo_lectura') THEN
        CREATE ROLE mammo_lectura NOLOGIN;
    END IF;
END $$;

GRANT USAGE ON SCHEMA mammo_ai TO mammo_app, mammo_lectura;
GRANT SELECT ON ALL TABLES IN SCHEMA mammo_ai TO mammo_lectura;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA mammo_ai TO mammo_app;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA mammo_ai TO mammo_app;
-- La aplicación no puede borrar ni modificar los modelos ni los conjuntos de datos
REVOKE INSERT, UPDATE ON modelo, modelo_conjunto, conjunto_datos, imagen_referencia FROM mammo_app;

-- ---------------------------------------------------------------------
-- 9. Datos iniciales
-- ---------------------------------------------------------------------
INSERT INTO rol (nombre, descripcion) VALUES
  ('profesional_salud', 'Carga mamografías y consulta la clasificación preliminar'),
  ('estudiante',        'Usa el módulo de simulación con tutor de IA'),
  ('docente',           'Revisa el desempeño de los estudiantes en el tutor'),
  ('administrador',     'Gestiona usuarios, modelos y escenarios');

INSERT INTO conjunto_datos (nombre, version, fuente_url, licencia, anonimizado, fecha_descarga) VALUES
  ('CBIS-DDSM', '1.0', 'https://www.cancerimagingarchive.net/collection/cbis-ddsm/', 'CC BY 3.0', TRUE, '2026-10-05'),
  ('INbreast',  '1.0', 'https://doi.org/10.1016/j.acra.2011.09.014',                 'Uso académico con solicitud', TRUE, '2026-10-05'),
  ('MIAS',      '1.21','http://peipa.essex.ac.uk/info/mias.html',                     'Uso académico', TRUE, '2026-10-05');
