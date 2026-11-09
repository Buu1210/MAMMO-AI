# Arquitectura de software

**Integrantes:** Álvaro José Jaramillo González, Daniel Esteban Olarte Vasquez, Kelvin Andrés Palma, Juan Camilo Ospina y Juan José Herrera Rengifo.

## 1. Modelado de la arquitectura

Para este proyecto se usará una arquitectura en capas. Esto permite que podamos trabajar en paralelo.

### Componentes del software

**Capa de presentación**

- **Componente 1: Interfaz de usuario.** Permite que el usuario pueda cargar la imagen, seleccionar opciones y mostrar los resultados.
- **Componente 2: Visualizador.** Recibe la imagen original y la imagen procesada con el mapa de calor y las muestra lado a lado.
- **Propiedades externas visibles:** interfaz web responsiva, mensajes de advertencia claros, indicador de carga.

**Backend**

- **Componente 3: Gestor de peticiones.** Recibe la imagen, valida el formato, que tiene que ser JPG o PNG, y la envía al modelo.
- **Componente 4: Motor de inferencia.** Es el que se comunica con el modelo de deep learning. Toma la imagen, se la pasa a la red neuronal y recibe la clasificación, que puede ser normal o sospechosa, y el nivel de confianza.
- **Componente 5: Generador Grad-CAM.** Toma la imagen original y los pesos de la red para generar el mapa de calor explicativo.
- **Propiedades externas visibles:** endpoints documentados, tiempos de respuesta controlados y manejo de errores: si se sube un archivo que no es imagen, devuelve un error controlado.

**Capa de datos**

- **Componente 6: Modelo de deep learning.** El archivo entrenado con transferencia de aprendizaje.
- **Componente 7: Almacenamiento temporal.** Carpeta local o en la nube para guardar la imagen subida mientras se procesa.

### Relaciones

- El frontend se comunica con el backend mediante peticiones HTTP.
- El backend invoca al motor de inferencia y al generador Grad-CAM.
- El modelo se carga en memoria al iniciar el servidor.

## 2. Administración de la calidad

La arquitectura permite analizar la efectividad del diseño. Para MAMMO-AI, la calidad se administra a través de estos atributos:

- **Usabilidad:** la arquitectura separa la vista de la lógica, lo que permite diseñar una interfaz clara, con avisos legales visibles y sin ambigüedades, asegurando que el usuario sepa que es una herramienta de apoyo.
- **Rendimiento:** el motor de inferencia debe cargar el modelo en memoria. La arquitectura debe garantizar que el paso de la imagen por la red neuronal y la generación del Grad-CAM no superen los 10 segundos.
- **Seguridad y privacidad:** al usar una arquitectura sin base de datos persistente para las imágenes, se garantiza que los datos de los pacientes no queden almacenados ni expuestos. El componente de almacenamiento es temporal.
- **Mantenibilidad y reproducibilidad:** al separar el modelo de la web, si el modelo falla o hay que reentrenarlo para subir la sensibilidad del 60 %, el equipo no necesita tocar el código del aplicativo web.
- **Explicabilidad:** el generador Grad-CAM está desacoplado del motor de inferencia principal, lo que permite probarlo visualmente de forma independiente.

## 3. Administración de proyectos de software

La arquitectura elegida impacta directamente en cómo administramos el proyecto.

### División de tareas

- **Juan José y Álvaro:** se enfocan en la capa de lógica, que es el modelo de deep learning, su entrenamiento y el generador Grad-CAM.
- **Kelvin:** se enfoca en la capa de presentación: la interfaz web, la carga de imágenes y la visualización del mapa de calor.
- **Juan Camilo:** se enfoca en la calidad, probando que la comunicación entre frontend y backend funcione, midiendo los tiempos de respuesta y documentando la evidencia.

### Gestión de riesgos

- **Riesgo:** no alcanzar la sensibilidad esperada.
- **Mitigación:** si el modelo no alcanza el 60 %, se puede cambiar la arquitectura de la red neuronal sin afectar el desarrollo de la página web.

### Control de cambios

**Integración continua:** como el proyecto está en un repositorio versionado, la arquitectura debe definir que el archivo final del modelo entrenado se guarde en una carpeta específica y el código de la web en otra.
