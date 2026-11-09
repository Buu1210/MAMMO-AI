# Informe de patrones de diseño aplicados

**Integrantes:** Álvaro José Jaramillo González, Daniel Esteban Olarte Vasquez, Kelvin Andrés Palma, Juan Camilo Ospina y Juan José Herrera Rengifo.
**Programa:** Ingeniería de Sistemas, Universidad Santiago de Cali
**Materia:** Ingeniería de Software

## 1. Introducción

Los patrones de diseño son soluciones que ya se probaron para problemas que pasan seguido cuando se hace software. Sirven para que el código quede más ordenado y sea más fácil de cambiar. En este trabajo explicamos tres patrones del catálogo y cómo los usaríamos en MAMMO-AI, que es una aplicación web que ayuda a analizar mamografías con inteligencia artificial. El proyecto tiene una arquitectura en capas (presentación, backend y datos) y los patrones van dentro de esa arquitectura.

## 2. Patrón Strategy (comportamiento)

**¿Qué es?** Permite tener varias formas de hacer lo mismo y cambiar una por otra sin tocar el resto del programa.

**¿Dónde lo usamos en MAMMO-AI?** En el Motor de Inferencia, que es el que usa el modelo de deep learning para clasificar la imagen. Cada red neuronal sería una estrategia distinta y el motor usa la que se escoja.

**¿Para qué sirve?** Si el modelo no llega al 60 % de sensibilidad, se puede cambiar la red neuronal sin tocar la página web.

## 3. Patrón Facade o Fachada (estructural)

**¿Qué es?** Es una sola entrada sencilla que esconde varias partes complicadas. Quien la usa no necesita saber cómo funciona todo por dentro.

**¿Dónde lo usamos en MAMMO-AI?** En el Gestor de Peticiones. La interfaz solo le manda la imagen y el gestor valida que sea JPG o PNG, llama al Motor de Inferencia y al Generador Grad-CAM, y devuelve el resultado con el mapa de calor.

**¿Para qué sirve?** Separa la capa de presentación del backend. Así una parte del equipo trabaja en la interfaz y la otra en el modelo, y solo se comunican por esa entrada.

## 4. Patrón Singleton (creacional)

**¿Qué es?** Hace que de una clase exista una sola copia en todo el programa y que todos usen esa misma.

**¿Dónde lo usamos en MAMMO-AI?** En el Modelo de deep learning. Como es pesado, se carga en memoria una sola vez cuando arranca el servidor y todas las peticiones usan esa copia.

**¿Para qué sirve?** Evita cargar el modelo con cada imagen, que gastaría memoria y haría todo más lento. Así es más fácil cumplir el tiempo de 10 segundos.

## 5. Resumen

- **Strategy:** cambiar la red neuronal sin dañar el resto del sistema.
- **Facade:** una sola entrada al backend que separa el frontend del modelo.
- **Singleton:** cargar el modelo una sola vez para que sea más rápido.

## 6. Conclusión

Los tres patrones encajan con la arquitectura en capas de MAMMO-AI. Ayudan a que el sistema sea más fácil de mantener y más rápido, y a que el equipo trabaje en paralelo. Por ahora es una propuesta de diseño, porque el proyecto apenas está en desarrollo.

## Referencias

Catálogo de patrones de diseño (creacionales, estructurales y de comportamiento). Material de la actividad en la plataforma pregradov.usc.edu.co.
