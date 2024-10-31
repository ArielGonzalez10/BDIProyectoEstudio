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

**TEMA 1: Manejo de permisos y roles a nivel de usuarios de base de datos

Existen los permisos a nivel servidor y a nivel de base de datos
Los permisos a nivel servidor se administran a través de inicios de sesión y roles de servidor. Los permisos a nivel de base de datos se administran a través de usuarios y roles de bases de datos.

Entidades de seguridad: Son el nombre oficial de las identidades que utilizan SQL server y a las que se puede asignar permiso para realizar acciones. Suelen ser personas o grupos de personas, pero pueden ser otras entidades que finjan ser personas.

Inicios de sesión: Son cuentas de usuario individuales para iniciar sesión en el motor de base de datos. SQL server y SQL database admiten inicios de sesión basados en la autenticación de windows y en la autenticación de SQL server.

Usuarios de bases de datos: Los inicios de sesión conceden acceso a una base de datos mediante la creación de un usuario en una base de datos y la asignación de ese usuario para iniciar sesión. Por lo general, el nombre de usuario de la base de datos es el mismo que el nombre de inicio de sesión. Cada usuario se asigna a un inicio de sesión único. Un inicio de sesión se puede asignar a un único usuario en una base de datos, pero se puede asignar como un usuario en distintas bases de datos.

Roles fijos de bases de datos: Son un conjunto de roles preconfigurados que proporcionan un práctico grupo de permisos a nivel de bases de datos. Se pueden agregar usuarios de base de datos y roles de base de datos definidos por el usuario a los roles fijos de bases de datos mediante la instrucción ALTER ROLE … ADD MEMBER.

Roles de base de datos definidos por el usuario: Los usuarios con el permiso CREATE ROLE pueden crear nuevos roles de bases de datos definidos por el usuario para representar grupos de usuarios con permisos comunes. Normalmente, los permisos se conceden o deniegan a todo el rol, lo que simplifica la administración y supervisión de permisos. Se pueden agregar usuarios de bases de datos a los roles de base de datos mediante la instrucción ALTER ROLE… ADD MEMBER.

Permisos: Cada elemento protegible tiene permisos asociados que se pueden conceder a las entidades de seguridad. Los permisos se administran en el nivel del servidor asignados a los inicios de sesión y roles de servidor, y en el nivel de base de datos asignados a usuarios de base de datos y roles de base de datos.

El formato para los permisos es: AUTHORIZATION PERMISSION ON SECURABLE::NAME TO PRINCIPAL;

Donde Authorization debe ser Grant el cual concede permisos,Deny que niega permisos o Revoke el cual quita permisos.

Permission establece las acciones permitidas o prohibidas como por ej: SELECT,UPDATE,etc.

Principal es la entidad de seguridad que recibe o pierde el permiso

On securable: : name es el tipo de elemento protegible (servidor, base de datos) y su nombre ** 


**TEMA 2 " ----- "** 

## CAPÍTULO III: METODOLOGÍA SEGUIDA 


## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 



### Diagrama conceptual (opcional)

### Diagrama relacional
![diagrama_relacional](https://github.com/ArielGonzalez10/BDIProyectoEstudio/blob/master/doc/RelacionalHotel.jpeg)


### Diccionario de datos
Acceso al documento [PDF](doc/diccionario_datos.pdf) del diccionario de datos. 


### Desarrollo TEMA 1 "Manejo de permisos y roles a nivel de usuarios de base de datos"

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_1](script/tema01_manejodepermisosyroles)

### Desarrollo TEMA 2 "----"

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_2](script/tema02_procedimientosyfuncionesalmacenadas/)

... 


## CAPÍTULO V: CONCLUSIONES




## BIBLIOGRAFÍA DE CONSULTA

 1. List item
 2. List item
 3. List item
 4. List item
 5. List item

