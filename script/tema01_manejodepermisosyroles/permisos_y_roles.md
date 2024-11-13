Manejo de permisos a nivel de usuarios de base de datos

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

Principal es la entidad de seguridad que recibe o pierde el permiso.

On securable: : name es el tipo de elemento protegible (servidor, base de datos) y su nombre.