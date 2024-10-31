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