# Matriz de trazabilidad de requisitos

Relaciona cada requisito de MAMMO-AI con su criterio de aceptación, el entregable de la EDT, el diseño, el desarrollo, la estrategia de pruebas y el interesado responsable. El archivo editable está en [`originales/Matriz_Trazabilidad_Requisitos_MAMMO-AI.xlsx`](originales/Matriz_Trazabilidad_Requisitos_MAMMO-AI.xlsx).

## Resumen

| ID | Requisito | Entregable (EDT) | Prioridad | Estado |
|---|---|---|---|---|
| 1.1 | El sistema debe de clasificar mamografias y etiquetarlas como normales o sospechosas con el uso de DEEP LEARNING | E1: Modelo de clasificacion | Alta | Identificado |
| 2.1 | El aplicativo web debe permitir cargar imágenes de mamografías desde la interfaz gráfica. | E1: Modelo de clasificación; EDT 2: Aplicativo web | Alta | Identificado |
| 3.1 | El aplicativo debe mostrar un mapa de calor Grad-CAM que permita visualizar las regiones de la imagen que influyeron en la clasificación. | EDT 3: Visualizador explicable | Alta | Identificado |
| 4.1 | El aplicativo debe presentar la clasificación preliminar y el mapa de calor por imagen. | EDT 2: Aplicativo web; EDT 3: Visualizador explicable; EDT 4: Informe de pruebas | Alta | Identificado |
| 5.1 | El sistema debe incluir un módulo de simulación gamificada con un tutor de IA que guíe al usuario y proporcione retroalimentación, incluidos casos donde el modelo se equivoca | E6: Módulo de simulación con tutor IA; relación con E1, E2 y E3 | Media | Identificado |
| 6.1 | El proyecto debe utilizar únicamente conjuntos de datos públicos | EDT 1: Modelo de clasificación; EDT 5: Repositorio del proyecto | Alta | Identificado |
| 7.1 | El sistema debe presentarse como una herramienta de apoyo y no debe emitir un diagnóstico médico definitivo ni reemplazar el criterio profesional. | EDT 2: Aplicativo web; EDT 4: Documentación técnica y manual de usuario | Alta | Identificado |
| 8.1 | El proyecto debe contar con documentación técnica, manual de usuario, requerimientos e informes de pruebas, y mantener el código en un repositorio versionado. | EDT 4: Documentación técnica y manual de usuario; EDT 5: Repositorio del proyecto | Media | Identificado |
| 9.1 | El proyecto debe implementar y aprobar el 100% de los requisitos funcionales y no funcionales acordados. | EDT 4: Documentación técnica e informe de pruebas; todos los entregables aplicables | Alta | Identificado |

## Detalle por requisito

### Requisito 1.1

| Campo | Valor |
|---|---|
| Descripción del requisito | El sistema debe de clasificar mamografias y etiquetarlas como normales o sospechosas con el uso de DEEP LEARNING |
| Versión | 1.0 |
| Estado actual | Identificado |
| Última fecha estado registrado | 04/10/2026 |
| Criterios de aceptación | Alcanzar una sensibilidad igual o superior al 85% sobre el conjunto de prueba |
| Nivel de complejidad | Media |
| Necesidad, oportunidades u objetivos de negocio | Necesidad 01: Filtro preeliminar con prioridad a casos sospechosos |
| Objetivo del proyecto | Desarrollar una aplicación web que clasifica mamografias mediante el DEEP LEARNING |
| Entregables (EDT) | E1: Modelo de clasificacion |
| Diseño del producto | Arquitectura de red neuronal convolucional con aprendizaje por transferencia |
| Desarrollo del producto | Entrenamiento del modelo en python |
| Estrategia y escenarios de pruebas | Validación cruzada y pruebas de precisión |
| Interesado (Stakeholder) dueño del requisito | Alvaro Jose Jaramillo, Juan Jose Herrera |
| Nivel de prioridad | Alta |

### Requisito 2.1

| Campo | Valor |
|---|---|
| Descripción del requisito | El aplicativo web debe permitir cargar imágenes de mamografías desde la interfaz gráfica. |
| Versión | 1.0 |
| Estado actual | Identificado |
| Última fecha estado registrado | 04/10/2026 |
| Criterios de aceptación | Al analizar una imagen, el sistema presenta una de las dos categorías y un nivel de confianza |
| Nivel de complejidad | Alta |
| Necesidad, oportunidades u objetivos de negocio | Necesidad 02: priorizar los casos sospechosos ante la escasez de radiólogos |
| Objetivo del proyecto | Desarrollar un modelo de IA que apoye la clasificación preliminar de mamografías |
| Entregables (EDT) | E1: Modelo de clasificación; EDT 2: Aplicativo web |
| Diseño del producto | Diseñar el flujo de presentación de categoría y confianza |
| Desarrollo del producto | Entrenar y conectar una red neuronal convolucional mediante aprendizaje por transferencia |
| Estrategia y escenarios de pruebas | Evaluar con datos públicos separados para entrenamiento y evaluación; medir sensibilidad y revisar errores de clasificación |
| Interesado (Stakeholder) dueño del requisito | Alvaro Jose Jaramillo,  Juan Jose Herrera |
| Nivel de prioridad | Alta |

### Requisito 3.1

| Campo | Valor |
|---|---|
| Descripción del requisito | El aplicativo debe mostrar un mapa de calor Grad-CAM que permita visualizar las regiones de la imagen que influyeron en la clasificación. |
| Versión | 1.0 |
| Estado actual | Identificado |
| Última fecha estado registrado | 04/10/2026 |
| Criterios de aceptación | Después del análisis, se muestra un mapa de calor asociado a la imagen evaluada y a la clasificación preliminar |
| Nivel de complejidad | Alta |
| Necesidad, oportunidades u objetivos de negocio | Necesidad 03: comprender por qué el sistema marca una imagen como sospechosa y verificar el resultado con criterio profesional |
| Objetivo del proyecto | Ofrecer una visualización explicable de la clasificación preliminar |
| Entregables (EDT) | EDT 3: Visualizador explicable |
| Diseño del producto | Diseñar la visualización de la imagen original junto con el mapa de calor |
| Desarrollo del producto | Integrar Grad-CAM al flujo de análisis y presentar el resultado en la interfaz. |
| Estrategia y escenarios de pruebas | Pruebas de integración y verificación visual con diferentes imágenes; comprobar que el mapa corresponda al análisis realizado |
| Interesado (Stakeholder) dueño del requisito | Kelvin Andres Palma Viveros, Juan Jose Herrera |
| Nivel de prioridad | Alta |

### Requisito 4.1

| Campo | Valor |
|---|---|
| Descripción del requisito | El aplicativo debe presentar la clasificación preliminar y el mapa de calor por imagen. |
| Versión | 1.0 |
| Estado actual | Identificado |
| Última fecha estado registrado | 04/10/2026 |
| Criterios de aceptación | En las condiciones de prueba documentadas, el tiempo desde el envío de la imagen hasta la presentación del resultado es inferior a 10 segundos |
| Nivel de complejidad | Alta |
| Necesidad, oportunidades u objetivos de negocio | Necesidad 04: disponer de un filtro preliminar rápido |
| Objetivo del proyecto | Proporcionar resultados preliminares oportunos a los profesionales de la salud |
| Entregables (EDT) | EDT 2: Aplicativo web; EDT 3: Visualizador explicable; EDT 4: Informe de pruebas |
| Diseño del producto | Diseñar una pantalla de resultado que muestre clasificación y mapa de calor |
| Desarrollo del producto | Optimizar el flujo de inferencia y visualización según los recursos disponibles |
| Estrategia y escenarios de pruebas | Medir el tiempo de respuesta con varias imágenes y registrar los resultados |
| Interesado (Stakeholder) dueño del requisito | Juan Camilo Ospina,  Juan Jose Herrera |
| Nivel de prioridad | Alta |

### Requisito 5.1

| Campo | Valor |
|---|---|
| Descripción del requisito | El sistema debe incluir un módulo de simulación gamificada con un tutor de IA que guíe al usuario y proporcione retroalimentación, incluidos casos donde el modelo se equivoca |
| Versión | 1.0 |
| Estado actual | Identificado |
| Última fecha estado registrado | 04/10/2026 |
| Criterios de aceptación | El usuario puede recorrer una simulación guiada y recibir retroalimentación en los casos definidos para el módulo |
| Nivel de complejidad | Alta |
| Necesidad, oportunidades u objetivos de negocio | Necesidad 05: fortalecer el criterio profesional y evitar aceptar o rechazar ciegamente los resultados de la IA |
| Objetivo del proyecto | Promover el uso crítico de la IA como herramienta de apoyo |
| Entregables (EDT) | E6: Módulo de simulación con tutor IA; relación con E1, E2 y E3 |
| Diseño del producto | Diseñar el recorrido de simulación, mensajes de tutoría y retroalimentación |
| Desarrollo del producto | Implementar el módulo educativo y sus escenarios de aprendizaje |
| Estrategia y escenarios de pruebas | Probar los recorridos principales, la aparición de retroalimentación y los escenarios de error previstos |
| Interesado (Stakeholder) dueño del requisito | Kelvin Andres Palma Viveros,  Juan Jose Herrera |
| Nivel de prioridad | Media |

### Requisito 6.1

| Campo | Valor |
|---|---|
| Descripción del requisito | El proyecto debe utilizar únicamente conjuntos de datos públicos |
| Versión | 1.0 |
| Estado actual | Identificado |
| Última fecha estado registrado | 04/10/2026 |
| Criterios de aceptación | El inventario y la documentación de los datos permiten verificar su procedencia pública o condición anonimizada; no se incluyen datos identificables |
| Nivel de complejidad | Alta |
| Necesidad, oportunidades u objetivos de negocio | Necesidad 06: proteger la información de los pacientes; cumplir las restricciones legales del proyecto |
| Objetivo del proyecto | Desarrollar y evaluar la solución respetando la privacidad y las restricciones definidas |
| Entregables (EDT) | EDT 1: Modelo de clasificación; EDT 5: Repositorio del proyecto |
| Diseño del producto | Documentar fuentes, permisos y criterios de selección de los conjuntos de datos |
| Desarrollo del producto | Seleccionar, depurar y almacenar solo los datos permitidos para el proyecto |
| Estrategia y escenarios de pruebas | Revisión del inventario de datos, muestras y documentación antes del entrenamiento y de la entrega |
| Interesado (Stakeholder) dueño del requisito | Alvaro Jose Jaramillo Gonzalez |
| Nivel de prioridad | Alta |

### Requisito 7.1

| Campo | Valor |
|---|---|
| Descripción del requisito | El sistema debe presentarse como una herramienta de apoyo y no debe emitir un diagnóstico médico definitivo ni reemplazar el criterio profesional. |
| Versión | 1.0 |
| Estado actual | Identificado |
| Última fecha estado registrado | 04/10/2026 |
| Criterios de aceptación | La interfaz y la documentación identifican los resultados como preliminares e indican que deben ser revisados por un profesional de la salud |
| Nivel de complejidad | Media |
| Necesidad, oportunidades u objetivos de negocio | Necesidad 07: Reducir la sobredependencia de la IA y favorecer la verificación profesional de los resultados |
| Objetivo del proyecto | Delimitar el uso de MAMMO-AI como apoyo al análisis |
| Entregables (EDT) | EDT 2: Aplicativo web; EDT 4: Documentación técnica y manual de usuario |
| Diseño del producto | Diseñar avisos visibles y lenguaje claro para comunicar el alcance del resultado |
| Desarrollo del producto | Incluir mensajes de uso responsable en la interfaz y en la documentación |
| Estrategia y escenarios de pruebas | Inspección de pantallas y manual; comprobar que no se presenta el resultado como diagnóstico definitivo |
| Interesado (Stakeholder) dueño del requisito | Alvaro Jose Jaramillo Gonzalez, Juan Camilo Ospina |
| Nivel de prioridad | Alta |

### Requisito 8.1

| Campo | Valor |
|---|---|
| Descripción del requisito | El proyecto debe contar con documentación técnica, manual de usuario, requerimientos e informes de pruebas, y mantener el código en un repositorio versionado. |
| Versión | 1.0 |
| Estado actual | Identificado |
| Última fecha estado registrado | 04/10/2026 |
| Criterios de aceptación | Se entrega la documentación acordada y el repositorio contiene el código y los archivos del proyecto organizados y versionados |
| Nivel de complejidad | Media |
| Necesidad, oportunidades u objetivos de negocio | Necesidad 08: la universidad requiere un software documentado y versionado, no solo experimentos aislados |
| Objetivo del proyecto | Asegurar la trazabilidad, reproducibilidad y entrega organizada del proyecto |
| Entregables (EDT) | EDT 4: Documentación técnica y manual de usuario; EDT 5: Repositorio del proyecto |
| Diseño del producto | Definir estructura documental y organización del repositorio |
| Desarrollo del producto | Registrar versiones, documentación, instrucciones de uso e informes de prueba |
| Estrategia y escenarios de pruebas | Revisión de completitud documental, acceso al repositorio y verificación de que los archivos acordados estén presentes |
| Interesado (Stakeholder) dueño del requisito | Alvaro Jose Jaramillo Gonzalez |
| Nivel de prioridad | Media |

### Requisito 9.1

| Campo | Valor |
|---|---|
| Descripción del requisito | El proyecto debe implementar y aprobar el 100% de los requisitos funcionales y no funcionales acordados. |
| Versión | 1.0 |
| Estado actual | Identificado |
| Última fecha estado registrado | 04/10/2026 |
| Criterios de aceptación | Existe una lista de requisitos con evidencia de prueba y estado aprobado para cada requisito incluido en el alcance |
| Nivel de complejidad | Alta |
| Necesidad, oportunidades u objetivos de negocio | Necesidad 09: Cumplir los criterios de éxito y entregar una solución coherente con el alcance acordado |
| Objetivo del proyecto | Verificar que la solución cumpla los requisitos definidos antes de la entrega final. |
| Entregables (EDT) | EDT 4: Documentación técnica e informe de pruebas; todos los entregables aplicables |
| Diseño del producto | Diseñar una lista de comprobación vinculada a cada requisito |
| Desarrollo del producto | Implementar y corregir funcionalidades según los resultados de las verificaciones |
| Estrategia y escenarios de pruebas | Pruebas funcionales, de integración y revisión de aceptación; registrar evidencia y resultado por requisito |
| Interesado (Stakeholder) dueño del requisito | Alvaro Jose Jaramillo Gonzalez, Juan Camilo Ospina |
| Nivel de prioridad | Alta |

## Notas de uso

- **Proyecto:** MAMMO-AI
- **Fuente base:** Acta de Constitución del Proyecto MAMMO-AI, versión 1.1, fecha 04/10/2026.
- **Estado inicial:** Los requisitos se registran como «Identificado» porque la matriz se deriva del acta y no se aportó evidencia de implementación o aprobación individual.
- **Fechas:** Se usa 04/10/2026 como fecha del documento fuente; actualizar la fecha cuando se registre un cambio real.
- **Trazabilidad:** Los identificadores EDT se refieren a los entregables enumerados en el acta: 1 Modelo de clasificación, 2 Aplicativo web, 3 Visualizador explicable, 4 Documentación técnica y manual, 5 Repositorio, 6 Módulo de simulación con tutor IA.
- **Validación:** Los criterios de aceptación concretan los criterios del acta. Deben confirmarse con el equipo y el director del proyecto antes de considerarlos aprobados.
- **Alcance clínico:** MAMMO-AI es una herramienta de apoyo; no reemplaza el diagnóstico ni el criterio de profesionales de la salud.
