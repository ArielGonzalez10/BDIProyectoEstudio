												--Optimizaci�n de busqueda a traves de �ndices.
USE gestion_hotel;
SELECT *
INTO Huesped1
FROM Huesped;

/*Realizar una carga masiva de por lo menos un mill�n de registros sobre alguna tabla que contenga un campo fecha (Sin �ndices). 
Hacerlo con un script para poder automatizarlo.*/

-- Insertar 100000 registros en la tabla Huesped
DECLARE @i INT = 1;
WHILE @i <= 1000000
BEGIN
    INSERT INTO Huesped1 (dni, nombre, apellido, fecha_nacimiento)
    VALUES (
        @i, 
        'Nombre' + CAST(@i AS VARCHAR(10)),  -- Nombre generado din�micamente
        'Apellido' + CAST(@i AS VARCHAR(10)),  -- Apellido generado din�micamente
        DATEADD(YEAR, -20, GETDATE())  -- Fecha de nacimiento (20 a�os atr�s)
    );

    SET @i = @i + 1;
END;

SELECT * 
FROM Huesped1


/*Realizar la b�squeda por periodo y registrar el plan de ejecuci�n utilizados por el motor y los tiempos de respuesta.*/

SET STATISTICS TIME ON;
SET STATISTICS PROFILE ON;

SELECT * 
FROM Huesped1
WHERE fecha_nacimiento BETWEEN '2002-01-01' AND '2004-12-01';

SET STATISTICS TIME OFF;
SET STATISTICS PROFILE OFF;

/*Definir un �ndice agrupado sobre la columna fecha y repetir la consulta anterior. 
Registrar el plan de ejecuci�n utilizado por el motor y los tiempos de respuesta.*/

SET STATISTICS TIME ON;
SET STATISTICS PROFILE ON;

CREATE CLUSTERED INDEX idx_fecha_nacimiento ON Huesped1(fecha_nacimiento);

SELECT * 
FROM Huesped1 
WHERE fecha_nacimiento BETWEEN '2002-01-01' AND '2004-12-01';

SET STATISTICS TIME OFF;
SET STATISTICS PROFILE OFF;

/*Borrar indice creado*/
DROP INDEX  idx_fecha_nacimiento ON Huesped1;

/*Definir otro �ndice agrupado sobre la columna fecha pero que adem�s incluya las columnas seleccionadas y repetir la consulta anterior. 
Registrar el plan de ejecuci�n utilizado por el motor y los tiempos de respuesta.*/

CREATE INDEX idx_fecha_nacimiento ON Huesped1 (fecha_nacimiento) INCLUDE (dni, nombre);

SET STATISTICS TIME ON;
SET STATISTICS PROFILE ON;

SELECT *
FROM Huesped1
WHERE fecha_nacimiento BETWEEN '2002-01-01' AND '2004-12-01';

SET STATISTICS TIME OFF;
SET STATISTICS PROFILE OFF;
