# SolidOfrevolution
Proyecto de "Creando interfaces de usuario", asignatura de la ULPGC (Universidad de Las Palmas de Gran Canaria) hecho por **Álvaro Javier Afonso López**

### Introducción

Esta práctica consiste en proporcionar una herramienta de modelado 3D a partir del contorno simétrico de una figura deseada, este proyecto se realiza en lenguaje de Processing. El objetivo de este proyecto es aprender como funcionan las herramientas 3D de este lenguaje y su posterior uso y aplicación.

![Gif de una prueba del proyecto](https://github.com/AlvaroAfonso/SolidOfrevolution/blob/main/sketch_3DModel/3DModel.gif)

### Desarrollo

Primeramente lo primero que hice fue identificar qué elementos se reutilizaban, siendo los puntos de las coordendas de la figura los únicos elementos reutilizables que usaría en el proyecto, por ello hice de esto una clase "Point" donde su única información serían las coordenadas 'x', 'y' y 'z'.

Lo primero que se encuentra el usuario al ejecutar la aplicación es un menú donde se hace una explicación del funcionamiento base, además de los mensajes de ayuda que se especificarán en cada pantalla que se le presente. Una vez se encuentre en la pantalla de diseño, hará uso de la mitad derecha de la pantalla para dibujar el contorno de la figura que desea obtener, teniendo que pulsar enter para ver el resultado o 'R' para volver a empezar el diseño. En la pantalla resultado se le proporciona los controles necesarios para visualizar con detalle el modelo 3D.

### Controles

* En la pantalla de diseño se usa el "enter" para finalizar el dibujo y ver el resultado, además de la letra 'R' para borrar lo hecho hasta el momento y volver a empezar.
* En la pantalla final donde se ve el resultado se usan las flechas para rotar el modelo; 'R' para realizar otro diseño; 'I' y 'O' para acercar o alejar el modelo; y por último, las teclas ',' y '.' para disminuir o aumentar la calidad del visualizado.

### Dificultades

La única y principal dificultad fue darme cuenta de que el hecho de usar la mitad la pantalla en la fase de diseño y almacenar las coordenadas de esa manera no obtenía el resultado correcto en la creación del modelo 3D, no tenía en cuenta que al pasar esas mismas coordenadas en la creación del modelo, estas eran teniendo en cuenta la parte izquierda de la pantalla como punto de origen. Para solucionar este problema, al recoger las coordenadas, las escalaba restando la mitad de la pantalla que no estaba en uso para el usuario, y de esta manera conseguía que el punto medio (línea blanca) se tomara como punto de origen, y asi conseguir el resultado deseado al crear el modelo 3D.

### Bibliografía

* Documentos de la propia práctica
* Página oficial de Proccesing
