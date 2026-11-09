# Informe MAMMO-AI

Integrantes:

Kelvin Andres Palma

Daniel Esteban Olarte Vasquez

Alvaro Jose Jaramillo Gonzalez

Juan Camilo Ospina Daza

Juan José Herrera Rengifo

## Introducción
En la actualidad el cáncer de mama y demás cánceres representan uno de los mayores desafíos del sistema de salud colombiano, teniendo en los departamentos periféricos y zonas vulnerables del país un gran déficit de especialistas en estos temas. Sabemos que la investigación en análisis computacional aplicada a imágenes médicas ha producido un avance fuerte en la última década, desde los sistemas de tamizaje mamográfico hasta los estudios de no inferioridad en próstata, con esta evidencia se nos plantea una muy favorable situación para implementar estos avances en otras áreas de la salud.

El desarrollo de MAMMO-AI consiste en una aplicación web de apoyo al análisis preliminar en mamografía, utilizando la guía PMBOK, integrando herramientas de AI, imágenes 3D, machine learning, deep learning, analítica de datos y demás tecnologías. Todo esto se desarrollará con base a la metodología Team Software Process, la aplicación reunirá, dentro de un mismo aplicativo, un módulo de análisis de imagen para cáncer de mama, y un componente que ofrecerá escenarios de simulación gamificada en donde un tutor (agente AI) acompañará la toma de decisiones del usuario. Todo esto construido sobre conjuntos de datos públicos y desidentificados, con modelos reproducibles y una infraestructura de costo cercano a cero.

Este desarrollo resulta pertinente en la medida en que responde directamente al déficit de especialistas en radiología que enfrentan las regiones apartadas del país, ofreciendo una herramienta de bajo costo capaz de apoyar el filtro inicial de mamografías sin sustituir el criterio médico. También, al incorporar el componente de tutoría dentro de la misma aplicación, el proyecto no se limita a automatizar una clasificación, sino que busca fortalecer la capacidad del profesional de la salud.

## Planteamiento del problema
La brecha que impulsa este proyecto radica en la distancia que separa un experimento realmente exitoso de un software mediocre que otro equipo puede ejecutar y sostener, buena parte de los desarrollos académicos se confinan sin ningún tipo de control de versiones, sin trazabilidad de los datos, sin testing y sin una documentación que realmente contribuya al SW.

Existe también, una dimensión del problema que los SW convencionales desatienden, y es la del comportamiento humano frente a las recomendaciones automáticas, una GUI que se limita a informar un resultado ya sea positivo o negativo, no permite saber si el usuario aceptó la sugerencia por decisión propia o por simple consideración hacia la máquina, ni mucho menos si habría identificado el error cuando el modelo se equivoca. En este punto entran discusiones sobre la sobredependencia, el rechazo a la AI y la pérdida de destreza del profesional, que, constantemente delega al sistema.

Todo lo anterior se complica por la naturaleza académica del proyecto, pues debe adelantarse dentro de los tiempos indicados, con un equipo reducido de estudiantes y sobre un único repositorio de trabajo, exigiendo entregas verificables. Sin una gestión del alcance, del cronograma y de los riesgos, el desarrollo puede derivar en una solución fragmentada o incompleta que nunca llegue a comportarse como un verdadero proyecto de software. Por esta razón, el PMBOK y el TSP no se adoptan aquí como un simple requisito de la materia, sino como los estándares necesarios para que la aplicación se construya, se documente y se valide de manera rigurosa.

## Objetivo general
Desarrollar una aplicación web que facilite el diagnóstico preliminar en mamografía basado en modelos de aprendizaje profundo, aplicando la metodología TSP y la guía PMBOK sobre datos públicos anonimizados, con el fin de optimizar el proceso de triaje oncológico y mitigar el sesgo de automatización en el personal médico.

## Objetivos específicos
- Analizar los requerimientos funcionales y no funcionales de la aplicación, así como los conjuntos de datos mamográficos públicos disponibles, con el fin de establecer los criterios de clasificación de hallazgos sospechosos que servirán de base al modelo de aprendizaje.

- Diseñar la arquitectura de la aplicación web y la interfaz destinada al profesional de la salud, incorporando visualizadores explicables mediante Grad-CAM y mapas de calor, de manera que se facilite la interpretación y la trazabilidad de cada diagnóstico preliminar.

- Construir la aplicación mediante el entrenamiento y ajuste de arquitecturas de redes neuronales convolucionales sobre los conjuntos de datos seleccionados, integrando el modelo de clasificación de hallazgos sospechosos con la interfaz previamente diseñada.

- Realizar pruebas funcionales y de integración sobre la aplicación desarrollada, evaluando tanto el desempeño diagnóstico del modelo como su comportamiento frente al sesgo de automatización, con el propósito de validar su idoneidad como sistema de apoyo y no como reemplazo del criterio médico.

## Antecedentes nacionales y locales

**1.** Hernández Cárdenas (2024), en su trabajo de grado desarrollado en la Universidad Mariana, titulado Clasificación temprana de cáncer de mama mediante aprendizaje automático no supervisado, evaluó el desempeño de las arquitecturas avanzadas de redes neuronales convolucionales profundas sobre bases de datos de imágenes mamarias. La investigación comprobó que, al extraer de forma automática las características por medio de Deep Learning, se consiguen altas precisiones en la identificación de lesiones en etapas tempranas. El trabajo aporta a MAMMO-AI una base metodológica y una validación técnica sobre la viabilidad de emplear modelos convolucionales para el análisis de mamografías en el contexto universitario colombiano.

**2.** González Mariño (2022), en un estudio publicado en la Revista de Senología y Patología Mamaria, analizó la integración de tecnologías avanzadas y modelos de inteligencia artificial en los programas de cribado de cáncer de mama en Colombia. El autor concluyó que la inclusión de sistemas algorítmicos como herramientas de "segunda lectura" reduce significativamente las tasas de falsos negativos y optimiza los tiempos de triaje clínico. Este hallazgo respalda directamente la justificación de MAMMO-AI, fundamentando la necesidad de implementar un visor asistido por IA que sirva como soporte en la toma de decisiones para el personal médico.

**3.** El Instituto Nacional de Cancerología junto al Ministerio de Salud y Protección Social de Colombia (2023), reflejó en su Anuario estadístico del cáncer las notables diferencias de acceso a diagnósticos a tiempo y la profunda falta de médicos radiólogos subespecialistas en las regiones apartadas del país. Según el reporte, las demoras en la revisión de mamografías elevan el diagnóstico en fases tardías de la enfermedad, en consecuencia, disminuyendo las posibilidades de supervivencia de las afectadas. Esta base previa contextualiza la pertinencia de MAMMO-AI, exhibiendo cómo un portal web de bajo costo y fácil acceso logra paliar la escasez de especialistas a través de una clasificación inicial automática.

**4.** En el Tecnológico de Antioquia(2024), en su trabajo titulado Sistema web IA para detección y seguimiento del cáncer de mama, se desarrolló un sistema de Inteligencia Artificial (IA) para la detección del cáncer mama el cual iba integrado en un sistema interactivo y de seguimiento tipo paciente-médico. Bajo esta premisa se le aporta a **MAMMO-AI** una perspectiva de Ingeniería de Software, al evidenciar la importancia de integrar modelos de inteligencia artificial dentro de sistemas web estructurados, de esta manera, aporta una referencia para el diseño y desarrollo de la plataforma web que integre la IA como un mecanismo de apoyo para análisis de mamografías.

## Referente teórico
1.  Aprendizaje profundo para detección y clasificación de cáncer de mama

**Redes neuronales convolucionales**: Las CNN son el estándar para análisis de imágenes médicas porque aprenden jerarquías de características directamente de los píxeles, desde bordes y texturas hasta patrones complejos de lesiones. En mamografía, modelos basados ​​en CNN han alcanzado precisiones medianas superiores al 90% y AUC alrededor de 0,95 en tareas de clasificación y detección.

**Aprendizaje por transferencia y ajuste fino**: Dado que los conjuntos de datos médicos suelen ser limitados se utilizarán modelos base pre entrenados en ImageNet o en grandes repositorios de imágenes naturales/médicas y ajustar las capas finales para la tarea específica. Esto reduce el riesgo de sobreajuste y acelera la convergencia del entrenamiento.

**Métricas de desempeño clínico**: En tamizaje, las métricas relevantes se basan en la exactitud con la cual se detectan los casos positivos y se evitan los falsos positivos. Revisiones sistemáticas muestran que los sistemas de IA pueden mantener tasas de detección de cáncer equivalentes a la doble lectura humana, con reducción de carga de trabajo sobre el radiológico.

**Conjuntos de datos públicos de mamografía**: Para reproducibilidad y bajo costo, el proyecto puede apoyarse en conjuntos de datos públicos desidentificados como:

- **CBIS-DDSM**: versión curada del Digital Database for Screening Mammography, ampliamente utilizada en investigación.

- **OPTIMAM**: conjunto de mamografías a gran escala usado en desafíos de detección de masas.

- **INbreast**, **MIAS**, y otros repositorios abiertos que permiten realizar benchmarking.

2.  IA explicable y mapas de calor para interpretación clínica

**Grad-CAM y mapas de activación**: Las técnicas de IA explicables, como Grad-CAM generan mapas de calor que resaltan las regiones de la imagen que más contribuyeron a la predicción del modelo. Esto permite al radiólogo verificar si el modelo está atendiendo a lesiones reales.

**SHAP y LIME**: Métodos como SHAP y LIME proporcionan explicaciones locales y globales sobre las decisiones del modelo, aumentando la transparencia y la confianza del usuario clínico.

**Gestión de proyectos y Team Software Process**: PMBOK: alcance, tiempo, costo, calidad, riesgos. El Project Management Body of Knowledge del PMI proporciona un marco estandarizado para gestionar proyectos complejos mediante procesos de inicio, planificación, ejecución, control y cierre.

> **Gestión del alcance**: definir claramente los módulos como son: mama, próstata, cérvix, etc.
>
> **Gestión del tiempo**: cronograma con hitos de entrega por semestre.
>
> **Gestión de riesgos**: identificar riesgos técnicos sobre la calidad de datos y sobreajuste, organizacionales como lo es la rotación de estudiantes y éticos como la privacidad del paciente.
>
> **Gestión de calidad**: pruebas unitarias, integración continua, revisión de código.

3.  Proceso de Software en Equipo (TSP)

Desarrollado por el SEI, TSP es una metodología para equipos de software que combina planificación disciplinada, roles definidos, medición de desempeño y mejora continua. Sus principios claves aplicables al proyecto:

**Planificación basada en datos**: Estimaciones de esfuerzo usando históricos del equipo.

**Roles rotativos**: líder, planificador, gestor de calidad, etc., esto para la distribución de responsabilidades.

**Revisión de pares y testing sistemático**: reducir defectos antes de integración.

**Post-mortem y aprendizaje**: al final de cada ciclo, lecciones documentales para el siguiente semestre.

La combinación PMBOK + TSP asegura que el ecosistema MAMMO-AI no sea solo un conjunto de notebooks experimentales, sino un producto de software mantenible, versionado y documentado.

4.  Sistemas de apoyo a la decisión clínica y comportamiento humano

**CDSS con IA**: Los Sistemas de Apoyo a la Decisión Clínica integrados con IA tienen como objetivo asistir al profesional. Su efectividad depende de factores como la usabilidad, la explicabilidad y la alineación con el flujo de trabajo clínico.

**Sesgos humanos**: sobredependencia y rechazo a la IA

La literatura en interacción humano-IA identifica dos riesgos principales:

> **Sesgo de automatización**: tendencia a aceptar recomendaciones automáticas sin verificación crítica.
>
> **Aversión al algoritmo**: rechazo a sugerencias de IA tras observar un error, incluso si el modelo es en promedio más preciso que el humano.
>
> El módulo de simulación gamificada aborda esto, donde el tutor IA no solo da la respuesta, sino que guía al usuario a razonar, justificar decisiones y reconocer cuándo el modelo puede estar equivocado.

5.  Simulación clínica gamificada y tutoría inteligente

La simulación clínica es una estrategia pedagógica validada para entrenar competencias diagnósticas y de toma de decisiones sin riesgo para pacientes, y un agente tutor inteligente puede acompañar precisamente ese proceso de entrenamiento.

## Base legal
El proyecto **Mammo AI**, como solución tecnológica orientada a la gestión de proyectos mediante herramientas de inteligencia artificial, debe desarrollarse teniendo en cuenta la normativa colombiana relacionada con la protección de datos personales, el uso de medios electrónicos, la propiedad intelectual y los derechos de autor.

En primer lugar, se tendrá en cuenta la **Ley Estatutaria 1581 de 2012**, mediante la cual se establecen disposiciones generales para la protección de datos personales. Esta norma es aplicable debido a que la plataforma puede realizar el tratamiento de información de usuarios, clientes, empleados o integrantes de los equipos de trabajo. Por lo tanto, se deberá garantizar que los datos sean tratados de manera adecuada, segura y conforme a la autorización de sus titulares.

También se considera la **Ley 527 de 1999**, que regula el acceso y uso de los mensajes de datos, el comercio electrónico y las firmas digitales. Esta normativa proporciona el marco jurídico para el manejo de información y comunicaciones realizadas mediante medios electrónicos, aspecto relacionado con el funcionamiento de una plataforma digital como Mammo AI.

En materia de propiedad intelectual, se tendrá en cuenta la **Ley 23 de 1982 sobre derechos de autor**, junto con la **Decisión Andina 351 de 1993**, con el propósito de proteger el software, documentación, diseños, contenidos y demás elementos originales desarrollados durante el proyecto.

De esta manera, Mammo AI deberá garantizar el tratamiento responsable de la información, la protección de los datos personales de sus usuarios y el respeto por los derechos de propiedad intelectual asociados al desarrollo y utilización de la plataforma.

## Metodología
Para el desarrollo del proyecto MAMMO-AI se adoptará el Team Software Process (TSP), una metodología desarrollada por el Software Engineering Institute que combina la planificación disciplinada del trabajo con la definición de roles claros dentro del equipo, permitiendo así medir el desempeño real frente a lo planeado y sostener la calidad del software a lo largo de todo el semestre académico.

El proceso se organizará en ciclos de trabajo, cada uno iniciado con una fase de lanzamiento en la que el equipo define los objetivos del ciclo, estima el esfuerzo requerido con base en datos históricos propios y asigna los roles rotativos de liderazgo, planificación y gestión de calidad, de manera que la responsabilidad del proyecto no recaiga en una sola persona sino que se distribuya y se documente formalmente.

A partir de esta planeación inicial, cada ciclo avanzará a través de las cuatro fases que estructuran el ciclo de vida del software dentro del TSP. En la fase de análisis se levantarán y validarán los requerimientos funcionales y no funcionales del módulo de mamografía, junto con la identificación y depuración de los conjuntos de datos públicos que alimentarán el modelo de aprendizaje profundo. Superada esta etapa, la fase de diseño definirá la arquitectura de la aplicación web, la estructura de la base de datos y la integración entre el modelo de inteligencia artificial y la interfaz destinada al profesional de la salud. Ahora bien, la fase de construcción comprenderá la implementación incremental del sistema, incluyendo el entrenamiento y ajuste de los modelos de deep learning y el desarrollo de los visualizadores explicables mediante Grad-CAM, siguiendo en todo momento las prácticas de revisión de pares propias del TSP para reducir defectos antes de cualquier integración. Finalmente, la fase de pruebas verificará el cumplimiento de los requerimientos establecidos mediante pruebas funcionales y de integración, evaluando tanto el desempeño técnico del modelo como su comportamiento frente a los criterios clínicos definidos.

Al cierre de cada ciclo se realizará una sesión de postmortem en la que el equipo documentará las lecciones aprendidas, los desvíos frente a la planeación inicial y las mejoras a incorporar en el ciclo siguiente, de suerte que el rigor propio del TSP no se limite a una sola entrega, sino que acompañe la evolución completa del proyecto durante el semestre.

## Resultados
A raíz del planteamiento y diseño propuesto por MAMMO-AI, se consolida una solución orientada al apoyo del diagnóstico preliminar de cáncer de mama a través del uso de técnicas de inteligencia artificial y deep learning. El proyecto permitirá que se defina una arquitectura que integra el análisis de mamografías con herramientas de IA, buscando que los resultados que se obtienen por el modelo puedan ser interpretados y revisados por el usuario.

Dentro de esa misma aplicación se integra el componente de tutoría interactiva, que permite crear escenarios de entrenamiento en los que un agente de inteligencia artificial acompaña al usuario en la toma de decisiones. De este modo, la propuesta no se limita a presentar automáticamente una clasificación, sino que busca el análisis crítico de las recomendaciones ofrecidas por la IA, reduciendo así los riesgos asociados a la dependencia de la misma.

Se establecieron además procesos de gestión del alcance, el tiempo, la calidad y los riesgos a partir de los principios planteados por el PMBOK, mientras que el TSP organiza el desarrollo mediante ciclos de trabajo con fases de análisis, diseño, construcción y pruebas, lo que permite entregas progresivas y retroalimentación durante todas las etapas.

Finalmente, se identifican los principales aspectos legales que deben ser tomados en consideración para la implementación, en especial los aspectos relacionados con la protección de datos personales, el uso de medios electrónicos y su propiedad intelectual. La utilización de datos públicos es una estrategia para favorecer la reproducibilidad del proyecto y así evitará riesgos referentes al tratamiento de información sensible.

## Conclusiones
El desarrollo de la propuesta MAMMO-AI permitió establecer una alternativa tecnológica para apoyar el proceso oncológico del cáncer de mama mediante el uso de inteligencia artificial, analizando mamografías. La integración de estos modelos de aprendizaje profundo o Deep Learning dentro de una aplicación web se convierte en una oportunidad para facilitar el análisis de estas imágenes, contribuyendo a suplir la limitada disponibilidad de especialistas en algunas regiones del país.

El uso de técnicas de inteligencia artificial, como pueden ser Grad-CAM y los mapas de calor, resulta siendo esencial y casi imprescindible para que las predicciones no se consideren como resultados aislados. La posibilidad de visualizar regiones que tienen influencia en la decisión del modelo podría facilitar la revisión de parte de un profesional.  
  
Asimismo, el componente de tutoría permite abordar el comportamiento del usuario frente a las recomendaciones de la IA. Mediante escenarios simulados y un agente de inteligencia artificial que acompaña al usuario en la toma de decisiones, logrando un reforzamiento de las decisiones clínicas, además de permitir reconocer situaciones donde el modelo podría equivocarse.

MAMMO-AI presenta una propuesta con potencial tanto académico como tecnológico para integrar inteligencia artificial, análisis de imágenes médicas y simulaciones clínicas. Sin embargo, para la realización en un contexto real, será necesario realizar una validación contundente de los modelos, evaluar las medidas de su desempeño y garantizar el cumplimiento de los requerimientos legales y de seguridad establecidos. La herramienta es un sistema de apoyo y no un reemplazo al criterio médico profesional de la salud.

## Bibliografía

McKinney, S. M., Sieniek, M., Godbole, V., et al. (2020). International evaluation of an AI system for breast cancer screening. Nature, 577, 89–94. <https://doi.org/10.1038/s41586-019-1799-6>

Isensee, F., Jaeger, P. F., Kohl, S. A. A., Petersen, J., & Maier-Hein, K. H. (2021). nnU-Net: A self-configuring method for deep learning-based biomedical image segmentation. Nature Methods, 18, 203–211. <https://doi.org/10.1038/s41592-020-01008-z>

### Antecedente Local / Nacional (IA en Salud)

Hernández Cárdenas, J. S. (2024). Clasificación temprana de cáncer de mama mediante aprendizaje automático no supervisado (Trabajo de grado, Universidad Mariana). Repositorio Institucional Unimariana.

Enlace de acceso directo: <https://repositorio.umariana.edu.co/handle/20.500.14112/21453>

### Antecedente Nacional (Cribado y Tamizaje Mamográfico)

González Mariño, M. A. (2012). Evaluación de la utilidad de un programa de cribado mamográfico en Bogotá, Colombia. Revista de Salud Pública, 14(1), 41–52.

Enlace de acceso directo (SciELO Colombia): <http://www.scielo.org.co/scielo.php?script=sci_abstract&pid=S0124-00642012000100004>

### Antecedente Nacional (Salud Pública y Epidemiología)

Instituto Nacional de Cancerología. (2023). Anuario estadístico de cáncer en Colombia. Ministerio de Salud y Protección Social de Colombia.

Enlace de acceso directo (INC Colombia): <https://www.cancer.gov.co/recursos_user/files/libros/anuario2023.pdf>

Application of deep learning technology in breast cancer: a systematic review of segmentation, detection, and classification approaches. BioMedical Engineering OnLine, 2025. <https://link.springer.com/article/10.1186/s12938-025-01502-5>

A systematic literature review on mammography: deep learning-based CAD systems. PMC, 2025. <https://pmc.ncbi.nlm.nih.gov/articles/PMC12542462/>

AI-Driven Breast Cancer Diagnosis: A Systematic Review of Imaging Modalities. Cancers, 2026. <https://www.mdpi.com/2072-6694/18/8/1305>

Artificial intelligence in breast cancer screening: A systematic review and meta-analysis. PMC, 2026. <https://pmc.ncbi.nlm.nih.gov/articles/PMC12818982/>

Diagnostic performance of FDA-cleared and CE-marked AI systems for breast cancer detection. PubMed, 2026. <https://pubmed.ncbi.nlm.nih.gov/42561891/>

Deep Learning Algorithms Versus Radiologists in Digital Breast Tomosynthesis: Systematic Review and Meta-Analysis. PMC, 2026. <https://pmc.ncbi.nlm.nih.gov/articles/PMC13148330/>

Deep Learning‐Based Analysis of Mammographic Images for Breast Cancer Detection. PMC, 2025. <https://pmc.ncbi.nlm.nih.gov/articles/PMC12547480/>

Ley 1581 de 2012 – Protección de datos personales: <https://www.secretariasenado.gov.co/senado/basedoc/ley_1581_2012.html>

Ley 527 de 1999 – Comercio electrónico y firmas digitales: <https://www.secretariasenado.gov.co/senado/basedoc/ley_0527_1999.html>

Ley 23 de 1982 – Derechos de autor: <https://www.suin-juriscol.gov.co/viewDocument.asp?ruta=Leyes%2F30035790>

Decisión Andina 351 de 1993 – Derechos de autor y software: <https://normograma.dian.gov.co/dian/compilacion/docs/decision_comisioncandina_dec351.htm>
