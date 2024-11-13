USE gestion_hotel;
--ROLES DE BASES DE DATOS
--Creacion de rol Administrador
CREATE ROLE rolAdministrador;

--Creacion de rol Usuario
CREATE ROLE rolUsuario;

--Se asigna permisos de administrador al rol Administrador
--	GRANT concede permisos seguido de las acciones permitidas
GRANT ALTER,DELETE,INSERT,SELECT,UPDATE TO rolAdministrador;
GRANT EXECUTE ON sp_insertar_huesped TO rolAdministrador;
GRANT EXECUTE ON sp_modificar_huesped TO rolAdministrador;
GRANT EXECUTE ON sp_borrar_huesped TO rolAdministrador;
GRANT EXECUTE ON fn_total_pagos TO rolAdministrador;
GRANT EXECUTE ON fn_contar_huespedes TO rolAdministrador;
GRANT EXECUTE ON fn_obtener_edad TO rolAdministrador;

--Se asgina permiso de solo lectura al rol Usuario y ejecucion de funcion almacenada
GRANT SELECT ON Reserva TO rolUsuario;
GRANT SELECT ON Detalle_Reserva TO rolUsuario;


--USUARIOS DE BASES DE DATOS
--Creacion de inicios de sesion
CREATE LOGIN administradorSesion WITH PASSWORD = 'adminSesion123';
CREATE LOGIN usuarioSesion WITH PASSWORD = 'userSesion321';

--Creacion de usuarios de base de datos y asignación de inicios de sesion
CREATE USER Administrador FOR LOGIN administradorSesion;
CREATE USER Usuario FOR LOGIN usuarioSesion;


--ASIGNACION DE ROLES
ALTER ROLE rolAdministrador ADD MEMBER Administrador;
ALTER ROLE rolUsuario ADD MEMBER Usuario;

--Para ejecutar las funciones y procedimientos almacenados usamos la clausula EXECUTE/EXEC
--Insert con sentencia sql sobre la tabla del procedimiento con ambos usuarios
EXECUTE AS USER = 'Administrador';
INSERT INTO Huesped VALUES(43789123,'Ariel','Gonzalez','10-05-2000');
SELECT * FROM Huesped WHERE Huesped.dni = 43789123;
REVERT;
--Resultado de ejecución (administrador): Se inserto correctamente

--Insertar un huesped como usuario
EXECUTE AS USER = 'Usuario';
INSERT INTO Huesped VALUES(46324618,'Marcos','Olmedo','20-10-2012');
REVERT;
--Resultado de ejecucion (usuario): Falló, no tiene permitido hacer inserts

--Borrar un huesped como administrador
EXECUTE AS USER = 'Administrador';
EXECUTE sp_borrar_huesped @dni = 43789123;
SELECT * FROM Huesped WHERE Huesped.dni = 43789123;
REVERT;
--Resultado de ejecución (administrador): Elimina el huesped

--Obtener edad de un huesped como administrador: Obtiene la edad
EXECUTE AS USER = 'Administrador';
SELECT  DBO.fn_obtener_edad(43789123) AS EDAD;
REVERT;

--Obtener los datos de reserva como usuario
EXECUTE AS USER = 'Usuario';
SELECT * FROM Reserva;
REVERT;
--Detalle de la ejecución (usuario): Tiene permiso para leer esta tabla

--Obtener los datos de la reserva como administrador
EXECUTE AS USER = 'Administrador';
SELECT * FROM Reserva;
REVERT;
--Detalle de la ejecución (administrador): Tiene permisos de lectura

--Obtener los datos de los huesped como usuario
EXECUTE AS USER = 'Usuario';
SELECT * FROM Huesped;
REVERT;
--Detalle de la ejecución (usuario): Falló, no tiene permiso leer esta tabla

EXECUTE AS USER = 'Administrador';
SELECT * FROM Huesped;
REVERT;
--Detalle de la ejecución (administrador): Tiene permisos de lectura

--Modificar un huesped como administrador
EXECUTE AS USER = 'Administrador';
EXECUTE sp_modificar_huesped 
			@dni = 43789123, 
			@nuevo_nombre = 'Micaela', 
			@nuevo_apellido = 'Fernandez', 
			@nueva_fecha_nacimiento = '2000-03-10';
REVERT;

--Modificar un huesped como usuario
EXECUTE AS USER = 'Usuario';
EXECUTE sp_modificar_huesped 
			@dni = 43789123,
			@nuevo_nombre = 'Juana',
			@nuevo_apellido = 'Marcori', 
			@nueva_fecha_nacimiento = '2000-03-10';
REVERT;
--Resultado de la ejecución (usuario): Fallo, no tiene los permisos de modificacion
