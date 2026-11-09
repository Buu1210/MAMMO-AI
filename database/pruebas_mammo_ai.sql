-- =====================================================================
-- MAMMO-AI · Pruebas del diseño físico
-- Ejecutar DESPUÉS de mammo_ai_bd.sql, sobre la misma base de datos.
-- Las pruebas marcadas "DEBE FALLAR" muestran un ERROR a propósito:
-- ese error es la prueba de que la regla del negocio funciona.
-- =====================================================================
SET search_path TO mammo_ai;

-- ---------- Datos válidos (DEBEN FUNCIONAR) ----------
INSERT INTO modelo (version, arquitectura, hiperparametros, ruta_pesos,
                    sensibilidad, especificidad, auc, fecha_entrenamiento, activo)
VALUES ('v1.0', 'EfficientNet-B0', '{"lr": 0.0001, "epocas": 30}', 'modelos/v1_0.pt',
        0.87, 0.81, 0.90, '2026-10-20', TRUE);

INSERT INTO modelo_conjunto
SELECT m.id_modelo, c.id_conjunto
FROM modelo m, conjunto_datos c
WHERE m.version = 'v1.0' AND c.nombre IN ('CBIS-DDSM', 'MIAS');

INSERT INTO usuario (id_rol, nombres, apellidos, correo, hash_contrasena, acepta_terminos, fecha_aceptacion)
VALUES ((SELECT id_rol FROM rol WHERE nombre = 'profesional_salud'), 'Ana', 'Ruiz', 'ana@correo.com', 'hash_demo', TRUE, now()),
       ((SELECT id_rol FROM rol WHERE nombre = 'estudiante'),        'Luis', 'Mora', 'luis@correo.com', 'hash_demo', TRUE, now());

INSERT INTO mamografia (id_usuario, ruta_archivo, hash_sha256, formato, lateralidad, vista)
SELECT id_usuario, 'cargas/0001.png', repeat('a', 64), 'PNG', 'I', 'CC'
FROM usuario WHERE correo = 'ana@correo.com';

INSERT INTO analisis (id_mamografia, id_modelo, clasificacion, confianza, tiempo_respuesta_ms)
SELECT (SELECT max(id_mamografia) FROM mamografia), id_modelo, 'sospechosa', 0.9132, 4210
FROM modelo WHERE activo;

INSERT INTO mapa_calor (id_analisis, ruta_imagen, capa_objetivo)
SELECT max(id_analisis), 'mapas/0001.png', 'top_conv' FROM analisis;

INSERT INTO imagen_referencia (id_conjunto, ruta_archivo, etiqueta_real, particion, lateralidad, vista)
SELECT id_conjunto, 'cbis/0001.png', 'sospechosa', 'prueba', 'D', 'MLO'
FROM conjunto_datos WHERE nombre = 'CBIS-DDSM';

INSERT INTO escenario (id_imagen, titulo, descripcion, dificultad, prediccion_mostrada, retroalimentacion)
SELECT max(id_imagen), 'Caso 1', 'Masa de bordes irregulares', 2, 'normal',
       'El modelo se equivocó: observe el borde espiculado de la lesión'
FROM imagen_referencia;

INSERT INTO sesion_simulacion (id_usuario)
SELECT id_usuario FROM usuario WHERE correo = 'luis@correo.com';

INSERT INTO respuesta_escenario (id_sesion, id_escenario, decision_usuario, puntaje_obtenido, tiempo_respuesta_s)
SELECT max(id_sesion), (SELECT max(id_escenario) FROM escenario), 'sospechosa', 10, 45
FROM sesion_simulacion;

-- ---------- Consultar las vistas ----------
\echo '--- Resultado que muestra la interfaz ---'
SELECT clasificacion, confianza, ruta_mapa_calor, version_modelo, tiempo_respuesta_ms
FROM v_resultado_analisis;

\echo '--- Desempeño en el tutor (sesgo de automatización) ---'
SELECT decision_usuario, etiqueta_real, prediccion_mostrada,
       decision_correcta, siguio_a_la_ia, ia_se_equivoco
FROM v_desempeno_tutor;

\echo '--- Requisito 4.1: tiempos de respuesta ---'
SELECT * FROM v_tiempo_respuesta;

-- ---------- Reglas del negocio (DEBEN FALLAR) ----------
\echo '--- Prueba 1: modelo activo con sensibilidad 0,82 (DEBE FALLAR) ---'
INSERT INTO modelo (version, arquitectura, ruta_pesos, sensibilidad, especificidad, auc, fecha_entrenamiento, activo)
VALUES ('v0.9', 'ResNet50', 'modelos/v0_9.pt', 0.82, 0.80, 0.86, '2026-10-15', TRUE);

\echo '--- Prueba 2: segundo modelo activo (DEBE FALLAR) ---'
INSERT INTO modelo (version, arquitectura, ruta_pesos, sensibilidad, especificidad, auc, fecha_entrenamiento, activo)
VALUES ('v1.1', 'ResNet50', 'modelos/v1_1.pt', 0.88, 0.80, 0.90, '2026-10-21', TRUE);

\echo '--- Prueba 3: conjunto de datos no anonimizado (DEBE FALLAR) ---'
INSERT INTO conjunto_datos (nombre, version, fuente_url, licencia, anonimizado, fecha_descarga)
VALUES ('Hospital X', '1.0', 'interno', 'privada', FALSE, '2026-10-01');

\echo '--- Prueba 4: segundo mapa de calor para el mismo análisis (DEBE FALLAR) ---'
INSERT INTO mapa_calor (id_analisis, ruta_imagen, capa_objetivo)
SELECT max(id_analisis), 'mapas/0001_b.png', 'top_conv' FROM analisis;

\echo '--- Prueba 5: misma imagen cargada dos veces (DEBE FALLAR) ---'
INSERT INTO mamografia (id_usuario, ruta_archivo, hash_sha256, formato)
SELECT id_usuario, 'cargas/0002.png', repeat('a', 64), 'PNG' FROM usuario WHERE correo = 'ana@correo.com';

\echo '--- Prueba 6: resultado sin aviso de herramienta de apoyo (DEBE FALLAR) ---'
INSERT INTO analisis (id_mamografia, id_modelo, clasificacion, confianza, tiempo_respuesta_ms, aviso_mostrado)
SELECT max(id_mamografia), (SELECT id_modelo FROM modelo WHERE activo), 'normal', 0.60, 3000, FALSE FROM mamografia;

-- ---------- Optimización ----------
\echo '--- Plan de ejecución del historial de un usuario ---'
SET enable_seqscan = off;  -- con pocas filas PostgreSQL prefiere leer la tabla completa; esto obliga a mostrar el uso del índice
EXPLAIN SELECT * FROM mamografia WHERE id_usuario = 1 ORDER BY fecha_carga DESC LIMIT 10;
RESET enable_seqscan;
