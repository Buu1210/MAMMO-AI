# Estructura del repositorio

El repositorio de MAMMO-AI se organiza según los entregables de la EDT.

| Carpeta | Contenido | Entregables | Estado |
|---|---|---|---|
| `docs/` | Documentación del proyecto (esta publicación de GitBook) | Gestión del proyecto | En curso |
| `database/` | Script de la base de datos PostgreSQL y sus pruebas | Diseño de datos | Terminado |
| `modelo/` | Clasificador CNN y mapas de calor Grad-CAM | E1 y E3 | Pendiente |
| `app/` | Aplicativo web | E2 | Pendiente |
| `tutor/` | Simulación con tutor IA | E6 | Pendiente |

## Cómo se relacionan

El usuario carga una mamografía en el **aplicativo web**, que la envía al **modelo**. El modelo devuelve la clasificación y el mapa de calor, y la aplicación guarda el análisis en la **base de datos**. El **tutor** usa imágenes de referencia de la misma base de datos para sus escenarios y registra las sesiones de práctica.

La arquitectura completa está en la [justificación de la arquitectura](justificacion-arquitectura.md).
