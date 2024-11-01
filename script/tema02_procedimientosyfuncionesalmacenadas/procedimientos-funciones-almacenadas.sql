--		Procedimientos y funciones almacenadas
use gestion_hotel;

--Procedimientos almacenados (Stored Procedure) sp_
--	INSERTAR huesped
CREATE PROCEDURE sp_insertar_huesped
		@dni INT,
		@nombre VARCHAR(30),
		@apellido VARCHAR(30),
		@fecha_nacimiento DATE
AS
BEGIN
    INSERT INTO Huesped (dni, nombre, apellido, fecha_nacimiento)
    VALUES (@dni, @nombre, @apellido, @fecha_nacimiento);
END;

--	MODIFICAR huesped
CREATE PROCEDURE sp_modificar_huesped
		@dni INT,
		@nuevo_nombre VARCHAR(30),
		@nuevo_apellido VARCHAR(30),
		@nueva_fecha_nacimiento DATE
AS
BEGIN
    UPDATE Huesped
    SET nombre = @nuevo_nombre,
        apellido = @nuevo_apellido,
        fecha_nacimiento = @nueva_fecha_nacimiento
    WHERE dni = @dni;
END;

--	BORRAR huesped
CREATE PROCEDURE sp_borrar_huesped
		@dni INT
AS
BEGIN
    DELETE FROM Huesped
    WHERE dni = @dni;
END;


-- INSERTAR lote de datos
INSERT INTO Huesped (dni, nombre, apellido, fecha_nacimiento)
VALUES
		(12345678, 'Juan', 'Pérez', '1985-04-23'),
		(23456789, 'María', 'González', '1990-08-12'),
		(34567890, 'Carlos', 'López', '1983-02-17'),
		(45678901, 'Ana', 'Martínez', '1995-11-30');


--Invocacion de los procedimientos
EXEC sp_insertar_huesped @dni = 12345678,
						@nombre = 'Juan',
						@apellido = 'Pérez',
						@fecha_nacimiento = '1985-04-23';
EXEC sp_insertar_huesped @dni = 23456789,
						@nombre = 'María',
						@apellido = 'González',
						@fecha_nacimiento = '1990-08-12';


--Update y delete con procedimientos
-- MODIFICAR huesped
EXEC sp_modificar_huesped @dni = 12345678,
						@nuevo_nombre = 'Juan Carlos',
						@nuevo_apellido = 'Pérez',
						@nueva_fecha_nacimiento = '1985-04-23';

-- BORRAR huesped
EXEC sp_borrar_huesped @dni = 23456789;


--Funciones almacenadas fn_
--	Obtener edad del huesped
CREATE FUNCTION fn_obtener_edad
		(@dni INT)
RETURNS INT
AS
BEGIN
    DECLARE @edad INT;
    SELECT @edad = DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) FROM Huesped
    WHERE dni = @dni;
    RETURN @edad;
END;

--	Calcular total de pagos
CREATE FUNCTION fn_total_pagos
    (@dni INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @total FLOAT;
    SELECT @total = SUM(importe) FROM Pago
    INNER JOIN Detalle_reserva ON Pago.id_pago = Detalle_reserva.id_pago
    INNER JOIN Reserva ON Detalle_reserva.id_reserva = Reserva.id_reserva
    WHERE Reserva.dni = @dni;
    RETURN @total;
END;

--	Contar huespedes
CREATE FUNCTION fn_contar_huespedes()
RETURNS INT
AS
BEGIN
    DECLARE @count INT;
    SELECT @count = COUNT(*) FROM Huesped;
    RETURN @count;
END;

-- Lee la reserva
CREATE FUNCTION fn_obtener_reserva
	( @id_reserva INT )
RETURNS TABLE
AS
RETURN (
    SELECT id_reserva,fecha_entrada,fecha_salida,dni
    FROM Reserva
    WHERE id_reserva = @id_reserva
);

-- Lee el detalle de la reserva
CREATE FUNCTION fn_obtener_detalle_reserva
	( @id_reserva INT )
RETURNS TABLE
AS
RETURN (
    SELECT id_reserva,id_pago,total_reserva
    FROM Detalle_reserva
    WHERE id_reserva = @id_reserva
);


--Prueba de consultas
--	Calcular edad
SELECT dbo.fn_obtener_edad(12345678) AS EdadHuesped;
SELECT dbo.fn_obtener_edad(23456789) AS EdadHuesped;
SELECT dbo.fn_obtener_edad(34567890) AS EdadHuesped;
SELECT dbo.fn_obtener_edad(45678901) AS EdadHuesped;

--	Total de pago
SELECT dbo.fn_total_pagos(12345678) AS TotalPagos;
SELECT dbo.fn_total_pagos(23456789) AS TotalPagos;
SELECT dbo.fn_total_pagos(34567890) AS TotalPagos;
SELECT dbo.fn_total_pagos(45678901) AS TotalPagos;

--	Total de huespedes
SELECT dbo.fn_contar_huespedes() AS TotalHuespedes;

--	Leer reserva
SELECT * FROM fn_obtener_reserva(1);
SELECT * FROM fn_obtener_reserva(2);
SELECT * FROM fn_obtener_reserva(3);
SELECT * FROM fn_obtener_reserva(4);

--	Leer detalle de la reserva
SELECT * FROM fn_obtener_detalle_reserva(1);
SELECT * FROM fn_obtener_detalle_reserva(2);
SELECT * FROM fn_obtener_detalle_reserva(3);
SELECT * FROM fn_obtener_detalle_reserva(4);


--Comparacion de eficiencia
SET STATISTICS TIME ON; -- Tiempo de ejecución

-- OPERACION DIRECTA al insertar un huesped
INSERT INTO Huesped (dni, nombre, apellido, fecha_nacimiento)
VALUES (87654321, 'Carlos', 'Gomez', '1995-04-23');

-- PROCEDIMIENTOS Y FUNCIONES al insertar un huesped
EXEC sp_insertar_huesped @dni = 43215678,
						@nombre = 'Luis',
						@apellido = 'Ramirez',
						@fecha_nacimiento = '1999-04-23';
/*		RESULTADO DE LA EJECUCION

SQL Server parse and compile time: 
   CPU time = 2 ms, elapsed time = 2 ms.
SQL Server parse and compile time: 
   CPU time = 0 ms, elapsed time = 0 ms.
 SQL Server Execution Times:
   CPU time = 0 ms,  elapsed time = 0 ms.
   ----------------------------------
SQL Server parse and compile time: 
   CPU time = 0 ms, elapsed time = 1 ms.
 SQL Server Execution Times:
   CPU time = 0 ms,  elapsed time = 0 ms.
 SQL Server Execution Times:
   CPU time = 0 ms,  elapsed time = 1 ms.
 */