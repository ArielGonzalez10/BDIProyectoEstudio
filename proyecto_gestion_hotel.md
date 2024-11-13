# Proyecto de Estudio!
    
**Estructura del documento principal:**

# PRESENTACIÓN "Gestión de hoteles"

**Asignatura**: Bases de Datos I (FaCENA-UNNE)

**Integrantes**:
 - Fátima Bret
 - Iara Bongiovanni
 - Ariel Gonzalez.
 - Enzo Barrios.

**Año**: 2024

## CAPÍTULO I: INTRODUCCIÓN

### Caso de estudio
Un hotel necesita gestionar las reservas de sus habitaciones y la información relacionada con los huéspedes y los pagos.
Cada habitación cuenta con un número único, el número de piso al que corresponde, un tipo de habitación (simple, doble o triple) y un costo asociado según el tipo de habitación.
Para la reserva, se identifica con un número único de reserva, se registra la fecha de ingreso y egreso, la habitación, y la información del monto pagado por cada medio de pago utilizado, permitiendo que el huésped puede abonar con diferentes métodos de pago (tarjeta de crédito, débito, o efectivo).
Se almacena información del huésped se registra su DNI, nombre y apellido, fecha de nacimiento (debe ser mayor de 18 años para reservar). Cada huésped puede tener muchas reservas en diferentes periodos de tiempo. 
 

### Definición o planteamiento del problema
El principal desafío que enfrentan muchos hoteles es la falta de un sistema puntual que permita gestionar de manera eficiente todas las áreas operativas del negocio. Actualmente, en muchos establecimientos, los registros de habitaciones, reservas, pagos y detalles de los huéspedes suelen estar dispersos o gestionados manualmente, lo que genera problemas, tal como, errores en la asignación de habitaciones, falta de control en reservas, problemas de registro de pagos, dificultades en la gestión de huéspedes, etc. 
Por lo tanto, surge la necesidad de desarrollar un sistema que permita automatizar estos procesos, brindando una solución integral que minimice los errores, facilite la toma de decisiones y mejore la experiencia tanto del personal administrativo como de los huéspedes.

## CAPITULO II: MARCO CONCEPTUAL O REFERENCIAL

**TEMA 1: Manejo de permisos y roles a nivel de usuarios de base de datos**

    Existen los permisos a nivel servidor y a nivel de base de datos
Los permisos a nivel servidor se administran a través de inicios de sesión y roles de servidor. Los permisos a nivel de base de datos se administran a través de usuarios y roles de bases de datos.

    Entidades de seguridad
Son el nombre oficial de las identidades que utilizan SQL server y a las que se puede asignar permiso para realizar acciones. Suelen ser personas o grupos de personas, pero pueden ser otras entidades que finjan ser personas.

    Inicios de sesión
Son cuentas de usuario individuales para iniciar sesión en el motor de base de datos. SQL server y SQL database admiten inicios de sesión basados en la autenticación de windows y en la autenticación de SQL server.

    Usuarios de bases de datos
Los inicios de sesión conceden acceso a una base de datos mediante la creación de un usuario en una base de datos y la asignación de ese usuario para iniciar sesión. Por lo general, el nombre de usuario de la base de datos es el mismo que el nombre de inicio de sesión. Cada usuario se asigna a un inicio de sesión único. Un inicio de sesión se puede asignar a un único usuario en una base de datos, pero se puede asignar como un usuario en distintas bases de datos.

    Roles fijos de bases de datos
Son un conjunto de roles preconfigurados que proporcionan un práctico grupo de permisos a nivel de bases de datos. Se pueden agregar usuarios de base de datos y roles de base de datos definidos por el usuario a los roles fijos de bases de datos mediante la instrucción ALTER ROLE … ADD MEMBER.

    Roles de base de datos definidos por el usuario
Los usuarios con el permiso CREATE ROLE pueden crear nuevos roles de bases de datos definidos por el usuario para representar grupos de usuarios con permisos comunes. Normalmente, los permisos se conceden o deniegan a todo el rol, lo que simplifica la administración y supervisión de permisos. Se pueden agregar usuarios de bases de datos a los roles de base de datos mediante la instrucción ALTER ROLE… ADD MEMBER.

    Permisos
Cada elemento protegible tiene permisos asociados que se pueden conceder a las entidades de seguridad. Los permisos se administran en el nivel del servidor asignados a los inicios de sesión y roles de servidor, y en el nivel de base de datos asignados a usuarios de base de datos y roles de base de datos.

    El formato para los permisos es: AUTHORIZATION PERMISSION ON SECURABLE::NAME TO PRINCIPAL;

Donde Authorization debe ser Grant el cual concede permisos,Deny que niega permisos o Revoke el cual quita permisos.

Permission establece las acciones permitidas o prohibidas como por ej: SELECT,UPDATE,etc.

Principal es la entidad de seguridad que recibe o pierde el permiso

On securable :: name es el tipo de elemento protegible (servidor, base de datos) y su nombre ** 


**TEMA 2 Procedimientos y funciones almacenadas**
    Procedimientos almacenados (Stored Procedures):
Son conjuntos de instrucciones T-SQL predefinidos que se almacenan y ejecutan en el servidor de base de datos. Están diseñados para realizar una serie de operaciones de base de datos, como consultas, modificaciones o manipulaciones de datos, sin necesidad de que el cliente envíe varias consultas de manera explícita.

    Creación y Gestión de Procedimientos Almacenados
Crear Procedimiento: (CREATE PROCEDURE) Los procedimientos pueden aceptar parámetros de entrada y salida.
Modificar Procedimiento: (ALTER PROCEDURE) se utiliza para modificar un procedimiento existente.
Eliminar Procedimiento: (DROP PROCEDURE) se puede eliminar un procedimiento almacenado.

    Características Clave de los Procedimientos Almacenados
Operaciones CRUD: Los procedimientos almacenados pueden ejecutar instrucciones de INSERT, UPDATE, DELETE y SELECT sobre las tablas.
Manejo de Transacciones: Los procedimientos almacenados pueden incluir transacciones mediante BEGIN TRANSACTION, COMMIT y ROLLBACK, lo que permite controlar la consistencia de las operaciones de múltiples tablas.
Llamadas a Otros Procedimientos: Es posible invocar otros procedimientos dentro de un procedimiento almacenado, lo que mejora la modularidad y reutilización del código.
Valor de Estado: Los procedimientos pueden devolver un código de estado o un mensaje de error para indicar si la operación fue exitosa o si hubo fallos.

    Tipos de Procedimientos Almacenados
Definidos por el Usuario: Creación personalizada por los usuarios. Pueden ser locales o globales.
Temporales: Existentes solo durante la sesión. Se almacenan en tempdb y pueden ser locales o globales.
Procedimientos del Sistema: Procedimientos predefinidos en SQL Server para tareas administrativas, como mantenimiento o programación de trabajos.

    Ventajas de Usar Procedimientos Almacenados
Reducción del Tráfico de Red: Al ejecutar las instrucciones directamente en el servidor, se reduce el número de rondas de comunicación entre el cliente-servidor.
Seguridad Mejorada: Los procedimientos almacenados permiten controlar el acceso a los datos, limitando las operaciones que un usuario puede realizar, y evitando que los usuarios ejecuten directamente consultas.
Mejor Rendimiento: Mejoran el rendimiento porque las consultas complejas se procesan en el servidor, evitando la sobrecarga de red.


    Funciones almacenadas (Stored Functions):
Son bloques de código que devuelven un valor único o un conjunto de valores. Son útiles para realizar cálculos o evaluaciones dentro de consultas SQL.

    Características Clave de las Funciones Almacenadas
Valor de Retorno: Las funciones siempre devuelven un valor, que puede ser un valor escalar o una tabla.
No Modifican Datos: Las funciones no pueden modificar los datos directamente. No pueden realizar operaciones INSERT, UPDATE ni DELETE.
Uso en Consultas: Las funciones se utilizan dentro de las consultas para realizar cálculos o para evaluar condiciones lógicas.

    Tipos de Funciones Almacenadas
Funciones Escalares: Devuelven un solo valor.
Funciones de Tabla: Devuelven una tabla que puede ser usada dentro de la consulta SQL como una tabla derivada.


**TEMA 3 Optimización de consultas a traves indices**
El ejercicio de optimización de búsqueda mediante la creación y uso de índices en la tabla Huesped1 nos permitió observar y comparar el impacto de los índices en los tiempos de respuesta y en los planes de ejecución utilizados por el motor de la base de datos.

    Carga Masiva de Datos
La carga masiva de un millón de registros en la tabla Huesped1 sin índices fue exitosa, y proporcionó una base de datos significativa para realizar las pruebas de optimización.

    Consulta Sin Índices
La primera consulta de búsqueda por el rango de fechas 2002-01-01 a 2004-12-01 se ejecutó sin la presencia de índices. 
El plan de ejecución y los tiempos de respuesta registrados mostraron un rendimiento básico sin optimización.

    Índice Agrupado
La creación de un índice agrupado (clustered index) sobre la columna fecha_nacimiento permitió mejorar significativamente el rendimiento de la consulta. 
Los tiempos de respuesta fueron más rápidos y el plan de ejecución mostró un uso eficiente del índice agrupado para acceder a los datos.

    Índice No Agrupado con Columnas Incluidas
La definición de un índice no agrupado (non-clustered index) sobre la columna fecha_nacimiento con las columnas dni y nombre incluidas, permitió una optimización adicional. 
El plan de ejecución y los tiempos de respuesta indicaron que el uso de columnas incluidas puede ayudar a reducir la cantidad de acceso a datos necesarios para satisfacer la consulta.


**TEMA 4 Vistas y vistas indexadas**
    Vistas
Una vista es una consulta guardada en la base de datos que se puede tratar como una tabla virtual. Las vistas permiten abstraer y simplificar las consultas complejas, proporcionando una interfaz lógica para acceder a los datos. Se utilizan comúnmente para mostrar datos de múltiples tablas, ocultar la complejidad de las operaciones de base de datos, y garantizar la seguridad al limitar el acceso a ciertas columnas o filas de una tabla.

    Vistas Indexadas
Las vistas indexadas son vistas a las que se les ha creado un índice físico, lo que permite mejorar el rendimiento de las consultas que acceden frecuentemente a ellas. A diferencia de las vistas normales, las vistas indexadas almacenan datos en disco, lo que las convierte en una forma de materialización de consultas, optimizando la ejecución de consultas complejas al reducir el tiempo de respuesta.

    Impacto en el Rendimiento
Las vistas indexadas pueden mejorar significativamente el rendimiento de las consultas, especialmente cuando se accede a grandes volúmenes de datos o cuando las consultas involucran operaciones complejas, como agregaciones o uniones de múltiples tablas. Al tener los resultados precalculados y almacenados en el índice, SQL Server puede acceder a los datos de manera más eficiente. Sin embargo, el mantenimiento de los índices requiere recursos adicionales, ya que cada vez que los datos subyacentes cambian, el índice debe ser actualizado.

    Consideraciones sobre el Uso de Vistas y Vistas Indexadas
*Vistas:* Son útiles cuando se desea ofrecer una vista simplificada de los datos a los usuarios o aplicaciones, sin necesidad de reescribir consultas complejas constantemente. No almacenan datos y se recalculan cada vez que se consultan.
*Vistas Indexadas:* Son apropiadas cuando la consulta sobre la vista es frecuente y los datos subyacentes no cambian con alta frecuencia. Aportan mejoras en el rendimiento, pero el costo de mantenimiento del índice debe ser evaluado en función de la carga de trabajo y el patrón de actualización de los datos.


## CAPÍTULO III: METODOLOGÍA SEGUIDA 
#Análisis de Requerimientos
Primero, revisamos todo lo que el sistema necesita para manejar reservas, pagos, y detalles de los huéspedes. 

#Diseño de la Base de Datos
Creamos los diagramas que muestran cómo se relacionan las entidades en la base de datos, como Huésped, Reserva, Pago, y Habitación. En esta etapa, definimos cada tabla con sus claves primarias y foráneas para asegurar que los datos se vinculen de forma correcta y eficiente.

#Diccionario de Datos
Documentamos cada tabla y sus columnas en un diccionario de datos, explicando su tipo y función. También describimos las relaciones entre las tablas, incluyendo todas las claves externas.

#Creación de la Base de Datos en SQL Server
Implementamos la base de datos en SQL Server, creando las tablas y configurando las claves y restricciones necesarias para mantener la integridad de los datos. Realizamos una carga inicial de datos para pruebas, especialmente en la tabla de huéspedes, con alrededor de un millón de registros.

#Procedimientos y Funciones Almacenadas
Desarrollamos procedimientos y funciones para manejar las operaciones de crear, leer, actualizar y eliminar. Esto ayuda a procesar los datos de manera más eficiente y facilita las operaciones comunes sin repetir código.

#Optimización de Consultas con Índices
Para que las consultas sean más rápidas, agregamos índices en columnas clave, tanto agrupados como no agrupados. Esto reduce el tiempo de respuesta, especialmente en consultas SELECT, ya que permite acceder directamente a los datos relevantes sin revisar todas las filas.

#Creación de Vistas y Vistas Indexadas
Definimos vistas para simplificar las consultas frecuentes y vistas indexadas para mejorar el acceso a datos específicos. Las vistas ayudan a hacer las consultas más fáciles y rápidas, como ver el historial de reservas de un huésped o los pagos pendientes. Probamos el rendimiento de estas vistas para asegurarnos de que realmente mejoran la velocidad de acceso.


## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 
**ROLES Y PERMISOS**
##  CREACION DE LOS ROLES, INICIOS DE SESION E USUARIOS <br>
![Creacion](https://github.com/ArielGonzalez10/BDIProyectoEstudio/blob/master/script/tema01_manejodepermisosyroles/desarrollo/creación.jpg) <br>

##  ASIGNACIÓN DE PERMISOS Y ASIGNACION DE USUARIOS A LOS ROLES <br>
![Asignaciones](https://github.com/ArielGonzalez10/BDIProyectoEstudio/blob/master/script/tema01_manejodepermisosyroles/desarrollo/asignaciones.jpg) <br>

##  INICIO DE SESION DEL ADMINISTRADOR <br>
![EjecucionesAdmin](https://github.com/ArielGonzalez10/BDIProyectoEstudio/blob/master/script/tema01_manejodepermisosyroles/desarrollo/inicioSesionAdmin.jpg) <br>

##  INICIO DE SESION DEL USUARIO <br>
![EjecucionesUsuario](https://github.com/ArielGonzalez10/BDIProyectoEstudio/blob/master/script/tema01_manejodepermisosyroles/desarrollo/inicioSesionUsuario.jpg) <br>

##  EJECUCION DE LAS TAREAS COMO ADMINISTRADOR <br>
![EjecucionesAdmin](https://github.com/ArielGonzalez10/BDIProyectoEstudio/blob/master/script/tema01_manejodepermisosyroles/desarrollo/ejecucionesAdministrador.jpg) <br>

##  EJECUCION DE LAS TAREAS COMO USUARIO <br>
![EjecucionesUsuario](https://github.com/ArielGonzalez10/BDIProyectoEstudio/blob/master/script/tema01_manejodepermisosyroles/desarrollo/ejecucionesUsuario.jpg)

### Diagrama conceptual (opcional)

### Diagrama relacional
![diagrama_relacional](https://github.com/ArielGonzalez10/BDIProyectoEstudio/blob/master/doc/RelacionalHotel.jpeg)


### Diccionario de datos
Acceso al documento [PDF](doc/diccionario_datos.pdf) del diccionario de datos. 


### Desarrollo TEMA 1 "Manejo de permisos y roles a nivel de usuarios de base de datos"

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_1](script/tema01_manejodepermisosyroles)

### Desarrollo TEMA 2 "Procedimientos y funciones almacenadas"

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_2](script/tema02_procedimientosyfuncionesalmacenadas/)

### Desarrollo TEMA 3 "Optimización de consultas a traves indices"

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_3](script/tema03_optimizaciondeconsultasporindices/)

### Desarrollo TEMA 4 "Vistas y vistas indexadas"

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_4](script/tema04_vistasyvistasindexadas/)


## CAPÍTULO V: CONCLUSIONES

En conclusión, el uso de **índices**, tanto agrupados como no agrupados con columnas incluidas, demostró ser una estrategia efectiva para mejorar el rendimiento de las consultas en la base de datos. 
Este ejercicio destaca la importancia de seleccionar y definir adecuadamente los índices para optimizar las operaciones de búsqueda y acceso a los datos.

Para la asignación de permisos a distintos usuarios de bases de datos, primero se debe crear inicios de sesión para el servidor de bases de datos, luego crear las cuentas de usuario, en nuestro caso, una cuenta de Administrador y una de Usuario, asignamos estas cuentas de usuario a los inicios de sesión.
Luego creamos los roles y le asignamos permisos, para que los usuarios puedan ocupar estos permisos se deben añadir las cuentas de usuarios a los roles.


## BIBLIOGRAFÍA DE CONSULTA
1. Microsoft. (s.f.). Roles a nivel de base de datos. Recuperado de https://learn.microsoft.com/es-es/sql/relational-databases/security/authentication-access/database-level-roles?view=sql-server-ver16

2. Microsoft. (s.f.). Usuarios de base de datos contenidos: Hacer que tu base de datos sea portátil. Recuperado de https://learn.microsoft.com/es-es/sql/relational-databases/security/contained-database-users-making-your-database-portable?view=sql-server-ver16

3. Microsoft. (s.f.). Permisos (motor de base de datos). Recuperado de https://learn.microsoft.com/es-es/sql/relational-databases/security/permissions-database-engine?view=sql-server-ver16

4. Begg, C. E., & Connolly, T. M. (2005). Sistemas de bases de datos: un enfoque práctico para diseño, implementación y gestión. España: Pearson Educación.

5. Microsoft. (s.f.). Documentación técnica de SQL Server. Recuperado de https://learn.microsoft.com/es-es/sql/sql-server/?view=sql-server-ver16