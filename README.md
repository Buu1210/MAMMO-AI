# MAMMO-AI

Aplicación web de apoyo para el análisis preliminar de mamografías. Este repositorio reúne la documentación de gestión del proyecto y el diseño de la base de datos.

> **Aviso:** MAMMO-AI es una herramienta de apoyo académica. No emite diagnósticos médicos ni reemplaza el criterio de un profesional de la salud.

## Descripción

MAMMO-AI propone tres componentes:

- **Clasificador:** una red neuronal convolucional, entrenada con aprendizaje por transferencia sobre conjuntos de datos públicos (CBIS-DDSM, INbreast, MIAS), que etiqueta cada mamografía como *normal* o *sospechosa* e indica un nivel de confianza.
- **Visualizador explicable:** un mapa de calor Grad-CAM que muestra las regiones de la imagen que más influyeron en la clasificación.
- **Simulación con tutor IA:** escenarios gamificados en los que un tutor guía al usuario, le da retroalimentación y le muestra casos en los que el modelo se equivoca, para fomentar un uso crítico de la IA.

Metodología de trabajo: **TSP (Team Software Process)**, con plantillas de gestión de proyectos.

## Información académica

| | |
|---|---|
| Universidad | Universidad Santiago de Cali |
| Asignatura | Gestión de Proyectos de TI (GPT01) |
| Periodo | 2026B |
| Docente | Jair Enrique Sanclemente Castro |

## Equipo

| Integrante | Rol |
|---|---|
| Alvaro Jose Jaramillo Gonzalez | Director de proyecto / Analista |
| Juan Jose Herrera Rengifo | Constructor |
| Juan Camilo Ospina Daza | Tester |
| Kelvin Andres Palma Viveros | Diseñador |
| Daniel Esteban Olarte Vasquez | Planificador |

## Documentación

| Documento | Markdown | Original |
|---|---|---|
| Informe del proyecto | [docs/informe.md](docs/informe.md) | [.docx](docs/originales/Informe_MAMMO-AI.docx) |
| Acta de constitución | [docs/acta-constitucion.md](docs/acta-constitucion.md) | [.docx](docs/originales/Acta_de_Constitucion_MAMMO-AI_v1.2.docx) |
| Plan de gestión del alcance | [docs/plan-gestion-alcance.md](docs/plan-gestion-alcance.md) | [.docx](docs/originales/Plan_Gestion_del_Alcance_MAMMO-AI.docx) |
| Estructura de desglose del trabajo (EDT) | [docs/edt.md](docs/edt.md) | [.docx](docs/originales/EDT_WBS_MAMMO-AI.docx) |
| Diccionario de la EDT | [docs/diccionario-edt.md](docs/diccionario-edt.md) | [.docx](docs/originales/Diccionario_EDT_MAMMO-AI.docx) |
| Matriz de trazabilidad de requisitos | [docs/matriz-trazabilidad.md](docs/matriz-trazabilidad.md) | [.xlsx](docs/originales/Matriz_Trazabilidad_Requisitos_MAMMO-AI.xlsx) |
| Arquitectura de datos y diseño de BD | [docs/diseno-base-datos.md](docs/diseno-base-datos.md) | [.docx](docs/originales/Diseno_Base_de_Datos_MAMMO-AI.docx) |

La documentación también se publica en GitBook a partir de la carpeta `docs/`.

## Estructura del repositorio

```text
mammo-ai/
├── README.md               Este archivo
├── .gitbook.yaml           Configuración de GitBook (usa la carpeta docs/)
├── docs/
│   ├── README.md           Portada de la documentación en GitBook
│   ├── SUMMARY.md          Índice de GitBook
│   ├── *.md                Documentos del proyecto en Markdown
│   ├── img/                Diagramas e imágenes
│   └── originales/         Archivos Word y Excel entregados
└── database/
    ├── mammo_ai_bd.sql     Script de creación de la base de datos (PostgreSQL 16)
    └── pruebas_mammo_ai.sql Pruebas de restricciones, vistas e índices
```

## Base de datos

El diseño físico está hecho para PostgreSQL 16. Para crear la base y ejecutar las pruebas:

```bash
createdb mammo_ai
psql -d mammo_ai -f database/mammo_ai_bd.sql
psql -d mammo_ai -f database/pruebas_mammo_ai.sql
```

## Estado

Fase de planificación y diseño. El código del prototipo (modelo, aplicación web y tutor) se agregará en carpetas propias cuando comience la fase de construcción.
