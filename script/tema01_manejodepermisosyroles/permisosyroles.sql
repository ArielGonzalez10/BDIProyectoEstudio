USE gestion_hotel;
--ROLES DE BASES DE DATOS
--Creacion de rol Administrador
CREATE ROLE rolAdministrador;

--Creacion de rol Usuario
CREATE ROLE rolUsuario;

--Se asigna permisos de administrador al rol Administrador
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

--Ejecucion de funciones y procedimientos
--Insert con sentencia sql sobre la tabla del procedimiento con ambos usuarios
EXECUTE AS USER = 'Administrador';
INSERT INTO Huesped VALUES(43789123,'Ariel','Gonzalez','10-05-2000');
SELECT * FROM Huesped WHERE Huesped.dni = 43789123;
REVERT;
--Resultado de ejecución a traves de administrador: Se inserto correctamente

--Insertar un huesped como usuario
EXECUTE AS USER = 'Usuario';
INSERT INTO Huesped VALUES(46324618,'Marcos','Olmedo','20-10-2012');
REVERT;
--Resultado de ejecucion a traves de usuario: Falló, ya que usuario no tiene permitido hacer inserts

--Borrar un huesped como administrador
EXECUTE AS USER = 'Administrador';
EXECUTE sp_borrar_huesped @dni = 43789123;
SELECT * FROM Huesped WHERE Huesped.dni = 43789123;
REVERT;
--Resultado de ejecución a traves de administrador: Elimina el huesped

--Obtener edad de un huesped como administrador: Obtiene la edad
EXECUTE AS USER = 'Administrador';
SELECT  DBO.fn_obtener_edad(43789123) AS EDAD;
REVERT;

--Obtener los datos de reserva como usuario
EXECUTE AS USER = 'Usuario';
SELECT * FROM Reserva;
REVERT;
--Detalle de la ejecución: Pasó

--Obtener los datos de la reserva como administrador
EXECUTE AS USER = 'Administrador';
SELECT * FROM Reserva;
REVERT;
--Detalle de la ejecución: Pasó

--Obtener los datos de los huesped como usuario
EXECUTE AS USER = 'Usuario';
SELECT * FROM Huesped;
REVERT;
--Detalle de la ejecución: Falló, porque no tiene permiso para obtener los datos de esta tabla

EXECUTE AS USER = 'Administrador';
SELECT * FROM Huesped;
REVERT;
--Detalle de la ejecución: Paso