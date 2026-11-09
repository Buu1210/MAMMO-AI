# Plan para la dirección del proyecto

**Fecha:** 18/10/2026

## Información del proyecto

Datos

|                        |                                                                                                                             |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| Empresa / Organización | Equipo de desarrollo MAMMO-AI – proyecto académico \[Institución educativa: por definir\]                                   |
| Proyecto               | MAMMO-AI: aplicación web de apoyo al análisis preliminar en mamografía con IA y simulación gamificada                       |
| Fecha de preparación   | 18/10/2026                                                                                                                  |
| Cliente                | Profesionales de la salud de regiones con déficit de radiólogos (usuarios beneficiarios) \[Cliente académico: por definir\] |
| Patrocinador principal | \[Por definir – docente / patrocinador académico\]                                                                          |
| Gerente de Proyecto    | Líder de equipo (rol rotativo bajo TSP) \[Nombre del líder del ciclo vigente: por definir\]                                 |

Patrocinador / Patrocinadores

| **Nombre**                       | **Cargo**                        | **Departamento / División** | **Rama ejecutiva (Vicepresidencia)** |
|----------------------------------|----------------------------------|-----------------------------|--------------------------------------|
| \[Por definir\]                  | Docente / patrocinador académico | \[Por definir\]             | No aplica (proyecto académico)       |
| **Universidad santiago de cali** | **Jair Enrique Sanclemente**     | **Ingenieria**              |                                      |

## Aprobaciones

<table>
<colgroup>
<col style="width: 45%" />
<col style="width: 20%" />
<col style="width: 34%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Nombre / Cargo</strong></th>
<th><strong>Fecha</strong></th>
<th><strong>Firma</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>Docente / Patrocinador académico</strong></p>
<p>Jair Enrique Sanclemente Castro</p></td>
<td>19/10/2026</td>
<td>Jair sanclemente</td>
</tr>
<tr class="even">
<td><p><strong>Kelvin Andres Palma</strong></p>
<p>Integrante del equipo de desarrollo</p></td>
<td>19/10/2026</td>
<td>Kelvin andres palma</td>
</tr>
<tr class="odd">
<td><p><strong>Daniel Esteban Olarte Vasquez</strong></p>
<p>Integrante del equipo de desarrollo</p></td>
<td>19/10/2026</td>
<td>Daniel esteban olarte vasquez</td>
</tr>
<tr class="even">
<td><p><strong>Alvaro Jose Jaramillo Gonzalez</strong></p>
<p>Integrante del equipo de desarrollo</p></td>
<td>19/10/2026</td>
<td>Alvaro jose jaramillo gonzalez</td>
</tr>
<tr class="odd">
<td><p><strong>Juan Camilo Ospina Daza</strong></p>
<p>Integrante del equipo de desarrollo</p></td>
<td>19/10/2026</td>
<td>Juan camilo ospina daza</td>
</tr>
<tr class="even">
<td><p><strong>Juan José Herrera Rengifo</strong></p>
<p>Integrante del equipo de desarrollo</p></td>
<td>19/10/2026</td>
<td>Juan jose herrera rengifo</td>
</tr>
</tbody>
</table>

## Introducción

**Problema y contexto**

El cáncer de mama es uno de los mayores desafíos del sistema de salud colombiano, especialmente en los departamentos periféricos y zonas vulnerables, donde existe un marcado déficit de médicos radiólogos. A esto se suma que gran parte de los desarrollos académicos de análisis de imágenes médicas no llega a ser software sostenible: carece de control de versiones, trazabilidad de los datos, pruebas y documentación útil. Además, las interfaces convencionales solo informan un resultado positivo o negativo y no permiten saber si el usuario lo aceptó por criterio propio o por simple deferencia hacia la máquina (sesgo de automatización), ni si habría detectado el error cuando el modelo se equivoca.

**Antecedentes (conocimiento actual del tema)**

La literatura reporta que los modelos basados en redes neuronales convolucionales (CNN) alcanzan precisiones medias superiores al 90 % y AUC cercano a 0,95 en clasificación y detección en mamografía, y que los sistemas de IA pueden igualar la doble lectura humana reduciendo la carga del radiólogo. En el contexto nacional y local se destacan:

- **Hernández Cárdenas (2024, Universidad Mariana):** evaluó arquitecturas de CNN profundas sobre imágenes mamarias y comprobó que la extracción automática de características permite alta precisión en la identificación de lesiones tempranas; valida la viabilidad técnica del enfoque en el contexto universitario colombiano.

- **González Mariño:** analizó la integración de IA en los programas de cribado de cáncer de mama en Colombia y concluyó que los algoritmos como “segunda lectura” reducen los falsos negativos y optimizan los tiempos de triaje.

- **Instituto Nacional de Cancerología y Ministerio de Salud y Protección Social (2023):** su Anuario estadístico del cáncer evidencia las diferencias de acceso a diagnóstico oportuno y la falta de radiólogos subespecialistas en regiones apartadas; las demoras en la revisión de mamografías elevan el diagnóstico en fases tardías.

- **Tecnológico de Antioquia (2024):** “Sistema web IA para detección y seguimiento del cáncer de mama”, que integra un modelo de IA en un sistema web interactivo y aporta una referencia de ingeniería de software para la plataforma.

**Propósito (objetivo)**

**Objetivo general:** desarrollar una aplicación web que facilite el diagnóstico preliminar en mamografía basado en modelos de aprendizaje profundo, aplicando la metodología TSP y la guía PMBOK sobre datos públicos anonimizados, con el fin de optimizar el proceso de triaje oncológico y mitigar el sesgo de automatización en el personal médico.

**Objetivos específicos:**

- **OE1.** Analizar los requerimientos funcionales y no funcionales y los conjuntos de datos mamográficos públicos, estableciendo los criterios de clasificación de hallazgos sospechosos.

- **OE2.** Diseñar la arquitectura de la aplicación web y la interfaz para el profesional de la salud, incorporando visualizadores explicables (Grad-CAM y mapas de calor).

- **OE3.** Construir la aplicación entrenando y ajustando CNN sobre los conjuntos de datos seleccionados e integrando el modelo con la interfaz diseñada.

- **OE4.** Realizar pruebas funcionales y de integración que evalúen el desempeño diagnóstico del modelo y su comportamiento frente al sesgo de automatización, validando su idoneidad como sistema de apoyo y no como reemplazo del criterio médico.

**Importancia (justificación)**

MAMMO-AI responde al déficit de especialistas en radiología de las regiones apartadas ofreciendo una herramienta de bajo costo capaz de apoyar el filtro inicial de mamografías sin sustituir el criterio médico. Al incorporar un componente de tutoría con simulación gamificada, el proyecto no se limita a automatizar una clasificación, sino que fortalece la capacidad del profesional de la salud y le enseña a cuestionar a la IA. Finalmente, el uso de PMBOK y TSP no es un mero requisito académico: son los estándares que permiten que la aplicación se construya, documente y valide con rigor, evitando una solución fragmentada o incompleta dentro de los tiempos y el equipo reducido del proyecto.

## Planes de gestión de proyecto subsidiarios

### Plan de gestión del alcance

El alcance se gestiona con los procesos de PMBOK 6 (planificar la gestión del alcance, recopilar requisitos, definir el alcance, crear la EDT, validar y controlar el alcance), ejecutados dentro de los ciclos de trabajo del TSP.

**Enunciado del alcance del producto**

MAMMO-AI es una aplicación web de apoyo al análisis preliminar en mamografía que reúne en un mismo aplicativo: (1) un módulo de análisis de imagen que clasifica hallazgos sospechosos mediante redes neuronales convolucionales y los explica con Grad-CAM y mapas de calor; y (2) un módulo de simulación gamificada en el que un tutor basado en IA acompaña la toma de decisiones del usuario. Se construye sobre conjuntos de datos públicos y desidentificados, con modelos reproducibles y una infraestructura de costo cercano a cero. Es un sistema de apoyo y no reemplaza el criterio médico.

**Entregables y criterios de aceptación**

| **ID** | **Entregable**                                                                    | **Criterio de aceptación**                                                                                                              |
|--------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| E1     | Documento de requerimientos y criterios de clasificación de hallazgos sospechosos | Requerimientos funcionales y no funcionales identificados, priorizados y aprobados en revisión de pares.                                |
| E2     | Conjuntos de datos públicos seleccionados y depurados                             | Origen, versión, licencia y preprocesamiento documentados; solo datos desidentificados.                                                 |
| E3     | Documento de arquitectura y diseño                                                | Define aplicación web, estructura de base de datos e integración modelo–interfaz; aprobado en revisión.                                 |
| E4     | Modelo CNN entrenado y ajustado                                                   | Entrenamiento reproducible con reporte de métricas (sensibilidad, especificidad, exactitud, AUC).                                       |
| E5     | Interfaz web para el profesional de la salud con visualizadores explicables       | Carga de imagen, resultado preliminar y Grad-CAM/mapa de calor funcionando de extremo a extremo.                                        |
| E6     | Módulo de simulación gamificada con tutor IA                                      | Escenarios de decisión operativos; el tutor guía, solicita justificación y señala posibles errores del modelo.                          |
| E7     | Informe de pruebas y evaluación                                                   | Pruebas funcionales y de integración ejecutadas; desempeño diagnóstico y comportamiento frente al sesgo de automatización documentados. |
| E8     | Documentación de gestión y repositorio versionado                                 | Plan de dirección, registros TSP, postmortems y lecciones aprendidas disponibles en el repositorio único.                               |

**Exclusiones**

- Uso clínico real, diagnóstico definitivo o sustitución del criterio del profesional de la salud.

- Uso o almacenamiento de datos de pacientes reales: solo se emplean datos públicos y desidentificados.

- Módulos de otras especialidades (p. ej., próstata, cérvix): se consideran evolución futura del producto y no forman parte de este alcance.

- Validación clínica o regulatoria del modelo para un entorno real; la conclusión del proyecto reconoce que ello exigiría una validación contundente posterior.

**Supuestos y restricciones**

- Equipo reducido de cinco estudiantes, trabajando sobre un único repositorio y dentro de los tiempos del semestre académico.

- Las entregas deben ser verificables en cada ciclo.

- Costo de infraestructura cercano a cero: se emplean herramientas abiertas y servicios de capa gratuita.

- Disponibilidad de los conjuntos de datos públicos (CBIS-DDSM, OPTIMAM, INbreast, MIAS) y compatibilidad de sus licencias con el uso previsto.

**Validación y control del alcance**

Cada entregable se verifica mediante revisión de pares contra sus criterios de aceptación y se presenta al docente/patrocinador para su aceptación formal al cierre del ciclo. El Planificador compara el alcance realizado con la línea base en cada reunión de seguimiento; cualquier modificación sigue el Plan de gestión de cambios.

### Plan de gestión de requerimientos

Los requerimientos se levantan en la fase de análisis de cada ciclo a partir de los objetivos del proyecto, la revisión de literatura y el estudio de los conjuntos de datos disponibles. Se documentan con identificador único, se priorizan (Alta / Media / Baja), se revisan por pares y se trazan hasta su diseño, componente de código y caso de prueba. La siguiente es la lista inicial, que se refinará durante la fase de análisis.

| **ID** | **Requerimiento**                                                                                                                  | **Prior.** | **Obj.** | **Verificación**                       |
|--------|------------------------------------------------------------------------------------------------------------------------------------|------------|----------|----------------------------------------|
| RF-01  | El profesional carga y visualiza una mamografía en la aplicación web.                                                              | Alta       | OE2      | Prueba funcional                       |
| RF-02  | El sistema clasifica la imagen como hallazgo sospechoso o no sospechoso mediante una CNN y muestra el resultado preliminar.        | Alta       | OE3      | Prueba funcional y métricas del modelo |
| RF-03  | El sistema superpone Grad-CAM / mapa de calor para explicar la predicción.                                                         | Alta       | OE2      | Prueba funcional y revisión            |
| RF-04  | La interfaz indica de forma explícita que el resultado es un apoyo preliminar y no un diagnóstico definitivo.                      | Alta       | OE4      | Inspección                             |
| RF-05  | El módulo de simulación gamificada ofrece escenarios de decisión sobre casos.                                                      | Alta       | OE3      | Prueba funcional                       |
| RF-06  | El tutor IA acompaña al usuario, le pide justificar sus decisiones y le ayuda a reconocer cuándo el modelo puede estar equivocado. | Alta       | OE3      | Prueba funcional y revisión            |
| RF-07  | El sistema registra la decisión del usuario frente a la sugerencia de la IA para medir el sesgo de automatización.                 | Alta       | OE4      | Prueba de integración                  |
| RNF-01 | Reproducibilidad: código, datos, configuración y semillas del entrenamiento versionados.                                           | Alta       | OE1, OE3 | Reejecución de experimentos            |
| RNF-02 | Trazabilidad de datos: origen, versión y preprocesamiento de cada conjunto documentados.                                           | Alta       | OE1      | Revisión documental                    |
| RNF-03 | Privacidad: solo datos públicos desidentificados, sin datos personales; cumplimiento de la Ley 1581 de 2012.                       | Alta       | OE1      | Revisión de cumplimiento               |
| RNF-04 | Costo: infraestructura de costo cercano a cero.                                                                                    | Alta       | Todos    | Revisión de costos                     |
| RNF-05 | Usabilidad y explicabilidad: interfaz clara para el profesional de la salud y resultados interpretables.                           | Media      | OE2      | Revisión de usabilidad                 |
| RNF-06 | Mantenibilidad: pruebas unitarias, integración continua, revisión de código y documentación.                                       | Alta       | OE4      | Reporte de CI                          |
| RNF-07 | Accesibilidad: uso desde navegador web, sin instalación local.                                                                     | Media      | OE2      | Prueba funcional                       |

**Trazabilidad y criterio de cumplimiento**

El Gestor de calidad mantiene una matriz de trazabilidad en el repositorio que enlaza cada requerimiento con su objetivo específico (OE1–OE4), el elemento de diseño, el módulo o commit que lo implementa y el caso de prueba. Un requerimiento se considera cumplido cuando su caso de prueba se ejecuta con éxito y es aprobado en revisión de pares.

### Plan de gestión del cronograma

El cronograma se organiza en ciclos de trabajo del TSP, con hitos de entrega por semestre. Las estimaciones de esfuerzo se basan en datos históricos del propio equipo (horas reales por tarea y fase) y el avance se controla semanalmente comparando horas planificadas contra reales y valor ganado. Las fechas concretas se fijan en el lanzamiento de cada ciclo según el calendario académico.

| **Fase TSP** | **Actividades principales**                                                                                                | **Hito / salida**                               | **Fecha objetivo** |
|--------------|----------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------|--------------------|
| Lanzamiento  | Definir objetivos del ciclo, estimar esfuerzo con datos históricos, asignar roles rotativos y acordar el plan del ciclo.   | H1. Plan del ciclo aprobado                     | \[Por definir\]    |
| Análisis     | Levantar y validar requerimientos; identificar y depurar conjuntos de datos públicos; definir criterios de clasificación.  | H2. Requerimientos y datos validados (E1, E2)   | \[Por definir\]    |
| Diseño       | Definir arquitectura web, estructura de base de datos, integración modelo–interfaz, visualizadores y módulo de simulación. | H3. Diseño aprobado (E3)                        | \[Por definir\]    |
| Construcción | Entrenar y ajustar CNN; desarrollar Grad-CAM, interfaz, simulación y tutor IA, con revisión de pares.                      | H4. Incremento funcional integrado (E4, E5, E6) | \[Por definir\]    |
| Pruebas      | Pruebas funcionales y de integración; evaluación del desempeño diagnóstico y del sesgo de automatización.                  | H5. Informe de pruebas (E7)                     | \[Por definir\]    |
| Postmortem   | Documentar lecciones aprendidas, desvíos frente al plan y mejoras para el ciclo siguiente.                                 | H6. Postmortem documentado (E8)                 | \[Por definir\]    |

**Control del cronograma**

- El Planificador registra cada semana las horas planificadas y reales por tarea y calcula el valor ganado y el índice de desempeño del cronograma (SPI).

- Umbral propuesto: un SPI menor a 0,9 activa una acción correctiva (reasignación, repriorización de requerimientos o solicitud de cambio).

- Una vez aprobadas, las fechas de los hitos constituyen la línea base de cronograma; solo se modifican mediante el Plan de gestión de cambios.

### Plan de gestión de costos

MAMMO-AI es un proyecto académico concebido con una infraestructura de costo cercano a cero. El costo se gestiona principalmente como esfuerzo (horas-persona) bajo el enfoque de planificación basada en datos del TSP, y cualquier gasto monetario no previsto requiere aprobación mediante el Plan de gestión de cambios.

| **Concepto**                   | **Tratamiento**                                                                     | **Estimación base**                                    |
|--------------------------------|-------------------------------------------------------------------------------------|--------------------------------------------------------|
| Recurso humano (5 estudiantes) | Esfuerzo medido en horas-persona por tarea y fase; no implica desembolso monetario. | Horas a definir en el lanzamiento con datos históricos |
| Datos                          | Conjuntos públicos y desidentificados (CBIS-DDSM, OPTIMAM, INbreast, MIAS).         | \$0                                                    |
| Software y modelos             | Librerías de código abierto y modelos preentrenados con licencia abierta.           | \$0                                                    |
| Cómputo y alojamiento          | Capas gratuitas de servicios en la nube o equipos propios del equipo.               | ≈ \$0                                                  |
| Reserva de contingencia        | Reserva en horas para riesgos de cronograma y calidad.                              | Propuesta: 10 % del esfuerzo planificado               |

**Control de costos**

- Se aplica la técnica del valor ganado en horas: CPI = EV / AC, revisado en cada reunión semanal de seguimiento.

- Umbral propuesto: un CPI menor a 0,9 se analiza en la reunión y genera una acción correctiva.

- Si se requiriera cómputo de pago u otro gasto, el Líder presenta una solicitud de cambio con su justificación al docente/patrocinador.

### Plan de gestión de calidad

El objetivo de calidad es que MAMMO-AI sea un producto de software mantenible, versionado, documentado y reproducible, y no un conjunto de notebooks experimentales. La calidad se asegura con revisión de pares y testing sistemático (TSP) y con pruebas unitarias, integración continua y revisión de código, y se mide con las siguientes métricas.

| **Métrica**                            | **Qué mide**                                                                                  | **Frecuencia**                            | **Criterio**                                                                  |
|----------------------------------------|-----------------------------------------------------------------------------------------------|-------------------------------------------|-------------------------------------------------------------------------------|
| Defectos hallados antes de integración | Porcentaje de defectos detectados en revisiones de pares frente al total.                     | Cada ciclo                                | Mejora respecto al ciclo anterior                                             |
| Pruebas unitarias en CI                | Ejecución automática de pruebas en cada integración.                                          | Cada pull request                         | 100 % de pruebas aprobadas para fusionar                                      |
| Revisión de código                     | Cambios revisados por al menos otro integrante.                                               | Cada pull request                         | 100 % de cambios revisados                                                    |
| Desempeño del modelo                   | Sensibilidad, especificidad, exactitud, AUC, falsos positivos y falsos negativos.             | Cada entrenamiento relevante y en pruebas | Meta mínima a fijar tras la línea base (referencia de literatura: AUC ≈ 0,95) |
| Explicabilidad                         | Que Grad-CAM resalte regiones clínicamente relevantes.                                        | Fase de pruebas                           | Revisión cualitativa aprobada                                                 |
| Sesgo de automatización                | Aceptación acrítica de sugerencias erróneas y detección de errores del modelo por el usuario. | Pruebas del módulo de simulación          | Línea base y comparación entre ciclos                                         |
| Reproducibilidad                       | Que un experimento reejecutado reproduzca sus resultados.                                     | Cada hito                                 | 100 % de experimentos reportados reproducibles                                |

**Cumplimiento normativo (base legal)**

- **Ley Estatutaria 1581 de 2012:** protección de datos personales; se usan solo datos públicos desidentificados y se tratan con autorización los datos de los integrantes y usuarios de la plataforma.

- **Ley 527 de 1999:** valor jurídico de los mensajes de datos, comercio electrónico y firmas digitales, aplicable al funcionamiento de la plataforma digital.

- **Ley 23 de 1982 y Decisión Andina 351 de 1993:** protección de derechos de autor del software, la documentación y los diseños originales del proyecto, y respeto de las licencias de terceros.

### Plan de gestión de recursos (Matriz RACI)

El equipo está integrado por cinco estudiantes: Kelvin Andres Palma, Daniel Esteban Olarte Vasquez, Alvaro Jose Jaramillo Gonzalez, Juan Camilo Ospina Daza y Juan José Herrera Rengifo. Siguiendo el TSP, los roles de gestión son rotativos para distribuir y documentar formalmente la responsabilidad; la asignación de nombres a roles se registra en el lanzamiento de cada ciclo.

**Roles y recursos**

- **Líder de equipo:** coordina el ciclo y actúa como gerente del proyecto.

- **Planificador:** elabora el plan, da seguimiento al cronograma, costos y riesgos.

- **Gestor de calidad:** coordina revisiones de pares, pruebas, métricas y trazabilidad.

- **Equipo de desarrollo:** todos los integrantes ejecutan análisis, diseño, construcción y pruebas.

- **Docente / patrocinador académico:** orienta, valida y acepta los entregables.

- **Recursos técnicos:** equipos de cómputo, repositorio único de código, conjuntos de datos públicos, entorno de entrenamiento de bajo costo y herramientas de IA y desarrollo web.

**Matriz RACI**

| **Actividad**                          | **Líder** | **Planificador** | **Gestor calidad** | **Equipo desarrollo** | **Docente** |
|----------------------------------------|-----------|------------------|--------------------|-----------------------|-------------|
| Plan de proyecto y seguimiento         | A         | R                | C                  | C                     | I           |
| Levantamiento de requerimientos        | A         | C                | C                  | R                     | C           |
| Selección y depuración de datos        | A         | I                | C                  | R                     | I           |
| Diseño de arquitectura e interfaz      | A         | C                | C                  | R                     | C           |
| Entrenamiento y ajuste del modelo CNN  | A         | I                | C                  | R                     | I           |
| Visualizadores Grad-CAM e integración  | A         | I                | C                  | R                     | I           |
| Módulo de simulación y tutor IA        | A         | I                | C                  | R                     | I           |
| Revisiones de pares y de código        | I         | I                | A/R                | R                     | –           |
| Pruebas funcionales y de integración   | A         | I                | R                  | R                     | I           |
| Gestión de configuración (repositorio) | A         | I                | R                  | R                     | I           |
| Gestión de riesgos                     | A         | R                | C                  | C                     | I           |
| Postmortem y lecciones aprendidas      | A         | R                | R                  | R                     | I           |
| Aceptación de entregables              | R         | I                | C                  | I                     | A           |

*R = Responsable · A = Aprobador / rinde cuentas · C = Consultado · I = Informado.*

### Plan de gestión de comunicaciones

La comunicación se apoya en el repositorio único como fuente de verdad, en reuniones periódicas del ciclo TSP y en documentos breves y verificables. Los canales y frecuencias siguientes son la propuesta inicial y se confirman en el lanzamiento.

| **Comunicación**                 | **Objetivo**                                    | **Frecuencia**       | **Medio**                              | **Responsable**      |
|----------------------------------|-------------------------------------------------|----------------------|----------------------------------------|----------------------|
| Reunión de lanzamiento del ciclo | Definir objetivos, estimaciones y roles.        | Inicio de cada ciclo | Reunión (presencial o virtual) y acta  | Líder                |
| Reunión de seguimiento           | Revisar avance, horas, riesgos y bloqueos.      | Semanal              | Reunión y acta breve                   | Líder / Planificador |
| Reporte de avance al docente     | Informar valor ganado, hitos y desviaciones.    | Por hito o ciclo     | Informe escrito                        | Planificador         |
| Revisión de pares y de código    | Detectar defectos antes de integrar.            | Cada pull request    | Repositorio (revisiones y comentarios) | Gestor de calidad    |
| Registro de cambios y decisiones | Dejar trazabilidad de solicitudes y decisiones. | Continuo             | Repositorio / bitácora                 | Líder                |
| Postmortem                       | Documentar lecciones aprendidas y mejoras.      | Fin de cada ciclo    | Sesión y documento                     | Líder                |

**Reglas de comunicación**

- Toda decisión relevante y todo acuerdo se registran por escrito en el repositorio o la bitácora del proyecto.

- Los bloqueos y riesgos nuevos se comunican al Líder y al Planificador en el mismo día y se tratan en la siguiente reunión semanal.

- Las desviaciones que afecten alcance, cronograma o costo se escalan al docente/patrocinador mediante una solicitud de cambio.

### Plan de gestión de riesgos de un proyecto

Los riesgos se identifican en el lanzamiento de cada ciclo y se revisan en cada reunión de seguimiento. Se clasifican por categoría (técnicos, organizacionales, éticos y legales, de uso y de gestión) y se califican cualitativamente en probabilidad (P) e impacto (I) como Baja, Media o Alta. Los riesgos de exposición alta se tratan primero y se registran en el repositorio.

| **ID** | **Riesgo**                                                           | **Cat.**      | **P** | **I** | **Respuesta**                                                                                                   | **Resp.**      |
|--------|----------------------------------------------------------------------|---------------|-------|-------|-----------------------------------------------------------------------------------------------------------------|----------------|
| R01    | Baja calidad o desbalance de los datos públicos de mamografía.       | Técnico       | Media | Alta  | Mitigar: depuración documentada, aumento de datos, validación con varios conjuntos (CBIS-DDSM, INbreast, MIAS). | Gestor calidad |
| R02    | Sobreajuste del modelo.                                              | Técnico       | Media | Alta  | Mitigar: transferencia de aprendizaje, regularización, partición estricta entrenamiento/validación/prueba.      | Equipo         |
| R03    | Rotación o salida de integrantes del equipo.                         | Organiz.      | Media | Alta  | Mitigar: roles rotativos, documentación continua, repositorio único y revisión de pares.                        | Líder          |
| R04    | Incumplimiento del cronograma por equipo reducido y carga académica. | Gestión       | Alta  | Media | Mitigar: estimación con datos históricos, seguimiento semanal, priorización y entregas incrementales.           | Planificador   |
| R05    | Vulneración de la privacidad o uso indebido de datos personales.     | Ético / legal | Baja  | Alta  | Evitar: solo datos públicos desidentificados; cumplimiento de la Ley 1581.                                      | Líder          |
| R06    | Sesgo de automatización o aversión al algoritmo en los usuarios.     | Uso           | Media | Alta  | Mitigar: simulación con tutor IA, registro de decisiones y medición del sesgo.                                  | Equipo         |
| R07    | Interpretar la herramienta como reemplazo del criterio médico.       | Ético         | Media | Alta  | Mitigar: avisos explícitos en la interfaz y en la documentación.                                                | Líder          |
| R08    | Falta de trazabilidad o reproducibilidad de datos y modelos.         | Técnico       | Media | Alta  | Mitigar: control de versiones de código, datos y modelos; semillas y configuración registradas.                 | Gestor calidad |
| R09    | Capacidad de cómputo limitada por la infraestructura de bajo costo.  | Técnico       | Media | Media | Mitigar: transferencia de aprendizaje, modelos eficientes y entrenamiento planificado.                          | Equipo         |
| R10    | Restricciones de licencia o acceso a algún conjunto de datos.        | Legal         | Media | Media | Mitigar: verificar condiciones al inicio y contar con conjuntos alternativos.                                   | Planificador   |
| R11    | Fallas al integrar el modelo con la interfaz.                        | Técnico       | Media | Media | Mitigar: definir interfaces temprano, pruebas de integración y CI.                                              | Equipo         |

### Plan de gestión de adquisiciones

El proyecto no contempla contratación de proveedores. Las adquisiciones consisten en obtener datos, modelos y herramientas abiertas o gratuitas, cuidando que su licencia y condiciones de uso sean compatibles con el proyecto.

| **Ítem**                         | **Fuente / tipo**                                                                  | **Costo** | **Condición de selección**                                               |
|----------------------------------|------------------------------------------------------------------------------------|-----------|--------------------------------------------------------------------------|
| Conjuntos de datos de mamografía | CBIS-DDSM, OPTIMAM, INbreast, MIAS (repositorios públicos)                         | \$0       | Desidentificados; verificar licencia y si requieren solicitud de acceso. |
| Modelos preentrenados            | Modelos base (p. ej., preentrenados en ImageNet) para transferencia de aprendizaje | \$0       | Licencia abierta compatible.                                             |
| Librerías y frameworks           | Software de código abierto para IA y desarrollo web                                | \$0       | Licencia abierta y documentación disponible.                             |
| Cómputo y alojamiento            | Capas gratuitas o equipos propios                                                  | ≈ \$0     | Sin costo recurrente; suficiente para entrenar y desplegar.              |
| Repositorio de código            | Plataforma de control de versiones (repositorio único)                             | \$0       | Permite revisión de código e integración continua.                       |

**Proceso**

- El equipo identifica el recurso y el Gestor de calidad verifica su licencia y su condición de desidentificación o de uso.

- El Líder aprueba la incorporación y se documenta su origen, versión y condiciones en el repositorio (ficha del recurso).

- Cualquier recurso de pago se trata como solicitud de cambio.

### Plan de gestión de los interesados

Se identifican los interesados, se evalúa su influencia e interés y se define la estrategia de involucramiento. El registro se revisa al inicio de cada ciclo.

| **Interesado**                                            | **Rol / interés**                                                           | **Influencia** | **Interés** | **Estrategia**                                                |
|-----------------------------------------------------------|-----------------------------------------------------------------------------|----------------|-------------|---------------------------------------------------------------|
| Equipo de desarrollo (5 integrantes)                      | Ejecutan el proyecto y rotan los roles TSP.                                 | Alta           | Alta        | Gestionar de cerca; reuniones semanales.                      |
| Docente / patrocinador académico                          | Orienta, valida y acepta los entregables.                                   | Alta           | Alta        | Gestionar de cerca; reportes por hito.                        |
| Profesionales de la salud y radiólogos                    | Usuarios finales; se benefician del apoyo en el triaje y del entrenamiento. | Media          | Alta        | Mantener informados; considerar sus necesidades en el diseño. |
| Pacientes de regiones apartadas                           | Beneficiarios indirectos de un triaje más oportuno.                         | Baja           | Alta        | Proteger su privacidad; sin datos de pacientes reales.        |
| Instituciones de salud pública (INC, Ministerio de Salud) | Fuentes de contexto y de la brecha de especialistas.                        | Media          | Baja        | Monitorear; usar sus datos como referencia.                   |
| Proveedores de datos públicos                             | Publican los conjuntos de mamografía.                                       | Baja           | Baja        | Cumplir sus términos de uso y citar la fuente.                |
| Equipos del semestre siguiente                            | Heredan documentación y lecciones aprendidas.                               | Media          | Media       | Mantener informados mediante postmortem y documentación.      |

## Líneas base del proyecto

### Línea base de alcance

La línea base de alcance está formada por el enunciado del alcance (ver Plan de gestión del alcance), la estructura de desglose del trabajo (EDT) y el diccionario de la EDT. A continuación se presenta la EDT a nivel de paquetes de trabajo.

| **Código** | **Paquete de trabajo**  | **Descripción / entregable**                                                                                                |
|------------|-------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| 1          | **MAMMO-AI**            | Aplicación web de apoyo al análisis preliminar en mamografía.                                                               |
| 1.1        | Gestión del proyecto    | Plan de dirección, seguimiento y control con TSP, gestión de riesgos y cambios.                                             |
| 1.2        | Análisis                | Requerimientos funcionales y no funcionales (E1); selección y depuración de datos (E2); criterios de clasificación.         |
| 1.3        | Diseño                  | Arquitectura web, base de datos, integración modelo–interfaz, visualizadores y módulo de simulación (E3).                   |
| 1.4        | Construcción            | Entrenamiento y ajuste de CNN (E4); interfaz y Grad-CAM (E5); simulación gamificada y tutor IA (E6).                        |
| 1.5        | Pruebas                 | Pruebas funcionales y de integración; desempeño diagnóstico; evaluación del sesgo de automatización (E7).                   |
| 1.6        | Calidad y configuración | Revisiones de pares y de código, pruebas unitarias, integración continua y control de versiones de código, datos y modelos. |
| 1.7        | Cierre                  | Postmortems, lecciones aprendidas y documentación final (E8).                                                               |

### Línea base de cronograma

La línea base de cronograma son las fechas aprobadas de los hitos de cada ciclo, fijadas en el lanzamiento del primer ciclo según el calendario académico. Cualquier cambio posterior requiere el procedimiento del Plan de gestión de cambios.

| **Hito** | **Entregable asociado**                     | **Paquete EDT** | **Fecha línea base** |
|----------|---------------------------------------------|-----------------|----------------------|
| H1       | Plan del ciclo aprobado                     | 1.1             | \[Por definir\]      |
| H2       | Requerimientos y datos validados (E1, E2)   | 1.2             | \[Por definir\]      |
| H3       | Diseño aprobado (E3)                        | 1.3             | \[Por definir\]      |
| H4       | Incremento funcional integrado (E4, E5, E6) | 1.4, 1.6        | \[Por definir\]      |
| H5       | Informe de pruebas (E7)                     | 1.5             | \[Por definir\]      |
| H6       | Postmortem y documentación (E8)             | 1.1, 1.7        | \[Por definir\]      |

### Línea base de costo

La línea base de costo refleja un proyecto de costo monetario cercano a cero; el costo principal es el esfuerzo del equipo, que se fija en horas-persona al aprobar el plan de cada ciclo.

| **Concepto**                        | **Línea base**                                            |
|-------------------------------------|-----------------------------------------------------------|
| Esfuerzo del equipo (horas-persona) | A fijar en el lanzamiento con datos históricos del equipo |
| Datos, software y modelos           | \$0                                                       |
| Cómputo y alojamiento               | ≈ \$0                                                     |
| Reserva de contingencia             | Propuesta: 10 % del esfuerzo planificado                  |
| **Presupuesto monetario total**     | **≈ \$0**                                                 |

### Línea base para la medición del desempeño

La línea base para la medición del desempeño integra alcance, cronograma y costo, y se controla con valor ganado en horas (práctica propia del TSP), complementado con medidas técnicas y de calidad.

| **Indicador**                                         | **Cálculo / medida**                                           | **Frecuencia** | **Umbral de acción**                               |
|-------------------------------------------------------|----------------------------------------------------------------|----------------|----------------------------------------------------|
| Valor planificado (PV), ganado (EV) y costo real (AC) | Horas planificadas, horas de trabajo completado y horas reales | Semanal        | –                                                  |
| SPI (cronograma)                                      | EV / PV                                                        | Semanal        | \< 0,9 (propuesto)                                 |
| CPI (costo)                                           | EV / AC                                                        | Semanal        | \< 0,9 (propuesto)                                 |
| Entregables aceptados                                 | Entregables aprobados frente a los planificados (E1–E8)        | Por hito       | Entrega faltante o rechazada                       |
| Métricas del modelo                                   | Sensibilidad, especificidad, exactitud, AUC                    | En pruebas     | Por debajo de la meta fijada tras la línea base    |
| Defectos y cobertura de revisión                      | Defectos hallados en revisión; cambios revisados               | Cada ciclo     | Cambios sin revisar; tendencia de defectos al alza |
| Sesgo de automatización                               | Aceptación acrítica y detección de errores del modelo          | En pruebas     | Definir tras la línea base                         |

## Componentes adicionales del plan de gestión de proyectos

### Plan de gestión de cambios

Todo cambio al alcance, cronograma, costo, calidad o requerimientos aprobados se gestiona con el siguiente procedimiento, para evitar que el desarrollo derive en una solución fragmentada o incompleta.

- **1. Solicitud:** cualquier integrante registra la solicitud (qué, por qué, urgencia) en el repositorio o bitácora.

- **2. Evaluación de impacto:** el Planificador y el Gestor de calidad analizan el efecto en alcance, cronograma, esfuerzo, calidad y riesgos.

- **3. Decisión:** el Líder aprueba los cambios menores que no alteran las líneas base; los cambios mayores se presentan al docente/patrocinador.

- **4. Implementación y verificación:** se actualizan los planes, la trazabilidad y el código, y se verifica con revisión de pares.

- **5. Cierre:** se actualizan las líneas base, se comunica a los interesados y se archiva el registro.

| **Tipo de cambio**                         | **Ejemplo**                                                        | **Aprueba**                                          |
|--------------------------------------------|--------------------------------------------------------------------|------------------------------------------------------|
| Menor (no afecta líneas base)              | Ajuste de una tarea dentro del ciclo o corrección de un defecto.   | Líder de equipo                                      |
| Mayor (afecta alcance, cronograma o costo) | Nuevo requerimiento, cambio de dataset principal, gasto monetario. | Docente / patrocinador, previa evaluación del equipo |

### Plan de gestión de configuración

La gestión de configuración responde directamente a la brecha identificada en el proyecto: desarrollos sin control de versiones, sin trazabilidad de datos y sin documentación. El Gestor de calidad es responsable de que se cumplan las reglas siguientes.

**Elementos de configuración**

- Código fuente de la aplicación web, del modelo y del módulo de simulación y tutor.

- Conjuntos de datos y su preprocesamiento (origen, versión y licencia documentados).

- Modelos entrenados, con hiperparámetros, semillas y métricas asociadas.

- Documentación: requerimientos, diseño, plan de dirección, informes de pruebas y postmortems.

**Reglas de control**

- Un único repositorio de trabajo con control de versiones; la rama principal solo se actualiza mediante pull request con revisión de pares.

- Cada integración dispara pruebas automáticas (integración continua) y debe pasarlas para fusionarse.

- Las versiones se etiquetan al cierre de cada hito o ciclo, de modo que cada resultado pueda reproducirse.

- Los cambios a elementos de configuración aprobados siguen el Plan de gestión de cambios.

- Al cierre de cada ciclo se realiza una auditoría de configuración para verificar que el repositorio y la documentación coinciden con lo entregado.

### Descripción del ciclo de vida del proyecto (Método para obtener el resultado del proyecto)

El ciclo de vida combina los grupos de procesos de PMBOK (inicio, planificación, ejecución, monitoreo y control, y cierre) con los ciclos del TSP. Cada ciclo comienza con un lanzamiento, recorre las fases de análisis, diseño, construcción y pruebas, y termina con un postmortem; el proyecto avanza de forma incremental ciclo a ciclo.

| **Fase TSP** | **Grupo PMBOK**        | **Actividades**                                                                            | **Salidas y control**              |
|--------------|------------------------|--------------------------------------------------------------------------------------------|------------------------------------|
| Lanzamiento  | Inicio y planificación | Objetivos del ciclo, estimación con datos históricos, asignación de roles rotativos.       | Plan del ciclo aprobado            |
| Análisis     | Planificación          | Requerimientos funcionales y no funcionales; selección y depuración de datos públicos.     | E1, E2; revisión de pares          |
| Diseño       | Planificación          | Arquitectura web, base de datos, integración modelo–interfaz.                              | E3; revisión de diseño             |
| Construcción | Ejecución              | Entrenamiento y ajuste de modelos, Grad-CAM, interfaz, simulación y tutor IA.              | E4, E5, E6; revisión de pares y CI |
| Pruebas      | Monitoreo y control    | Pruebas funcionales y de integración; evaluación del modelo y del sesgo de automatización. | E7; criterios de aceptación        |
| Postmortem   | Cierre del ciclo       | Lecciones aprendidas, desvíos y mejoras para el siguiente ciclo.                           | Documento de postmortem            |

*El monitoreo y control (seguimiento semanal, riesgos y cambios) es transversal a todas las fases.*

### Enfoque de desarrollo del plan de proyecto

El proyecto adopta un enfoque iterativo e incremental basado en el Team Software Process (TSP) del Software Engineering Institute, apoyado en la guía PMBOK para la planificación y el control. La combinación PMBOK + TSP busca que MAMMO-AI sea un producto mantenible, versionado y documentado. Los principios aplicados son:

- **Planificación basada en datos:** estimaciones de esfuerzo a partir del histórico del propio equipo.

- **Roles rotativos:** líder, planificador y gestor de calidad, para distribuir las responsabilidades.

- **Revisión de pares y testing sistemático:** reducir defectos antes de cualquier integración.

- **Postmortem y aprendizaje:** al cierre de cada ciclo se documentan lecciones para el siguiente semestre.

- **Entrega incremental y verificable:** cada ciclo produce un incremento funcional con retroalimentación temprana.

- **Experimentación reproducible:** los modelos se entrenan y evalúan con código, datos y configuración versionados.

### Revisiones de la gestión (Evaluaciones de la gerencia)

Las revisiones de la gestión permiten evaluar el avance contra las líneas base y decidir acciones correctivas oportunas.

| **Revisión**                           | **Frecuencia**                      | **Participantes**                      | **Insumos**                                | **Resultado**                                     |
|----------------------------------------|-------------------------------------|----------------------------------------|--------------------------------------------|---------------------------------------------------|
| Seguimiento semanal                    | Semanal                             | Equipo                                 | Horas, valor ganado, riesgos, bloqueos     | Acciones correctivas y actualización del plan     |
| Revisión de fin de fase                | Al cierre de cada fase              | Equipo (y docente si aplica)           | Entregables y criterios de aceptación      | Aprobación para pasar a la siguiente fase         |
| Revisión de riesgos                    | Cada ciclo y cuando surja un riesgo | Líder, Planificador, Gestor de calidad | Registro de riesgos                        | Registro actualizado y respuestas definidas       |
| Postmortem del ciclo                   | Fin de cada ciclo                   | Equipo                                 | Datos reales vs. plan, defectos, lecciones | Lecciones aprendidas y mejoras al siguiente ciclo |
| Revisión con el docente / patrocinador | Por hito                            | Docente y Líder                        | Informe de avance y entregables            | Aceptación formal o solicitudes de cambio         |
