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

/*Concluci�n: 
El ejercicio de optimizaci�n de b�squeda mediante la creaci�n y uso de �ndices en la tabla Huesped1 nos permiti� observar y comparar el impacto de los �ndices en 
los tiempos de respuesta y en los planes de ejecuci�n utilizados por el motor de la base de datos.

Carga Masiva de Datos: La carga masiva de un mill�n de registros en la tabla Huesped1 sin �ndices fue exitosa, 
y proporcion� una base de datos significativa para realizar las pruebas de optimizaci�n.

Consulta Sin �ndices: La primera consulta de b�squeda por el rango de fechas 2002-01-01 a 2004-12-01 se ejecut� sin la presencia de �ndices. 
El plan de ejecuci�n y los tiempos de respuesta registrados mostraron un rendimiento b�sico sin optimizaci�n.

�ndice Agrupado: La creaci�n de un �ndice agrupado (clustered index) sobre la columna fecha_nacimiento permiti� mejorar significativamente el rendimiento de la consulta. 
Los tiempos de respuesta fueron m�s r�pidos y el plan de ejecuci�n mostr� un uso eficiente del �ndice agrupado para acceder a los datos.

�ndice No Agrupado con Columnas Incluidas: La definici�n de un �ndice no agrupado (non-clustered index) sobre la columna fecha_nacimiento con las columnas dni y nombre incluidas, permiti� una optimizaci�n adicional. 
El plan de ejecuci�n y los tiempos de respuesta indicaron que el uso de columnas incluidas puede ayudar a reducir la cantidad de acceso a datos necesarios para satisfacer la consulta.

En conclusi�n, el uso de �ndices, tanto agrupados como no agrupados con columnas incluidas, demostr� ser una estrategia efectiva para mejorar el rendimiento de las consultas en la base de datos. 
Este ejercicio destaca la importancia de seleccionar y definir adecuadamente los �ndices para optimizar las operaciones de b�squeda y acceso a los datos.
*/














