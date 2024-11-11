												--Optimización de busqueda a traves de índices.
USE gestion_hotel;
SELECT *
INTO Huesped1
FROM Huesped;

/*Realizar una carga masiva de por lo menos un millón de registros sobre alguna tabla que contenga un campo fecha (Sin índices). 
Hacerlo con un script para poder automatizarlo.*/

-- Insertar 100000 registros en la tabla Huesped
DECLARE @i INT = 1;
WHILE @i <= 1000000
BEGIN
    INSERT INTO Huesped1 (dni, nombre, apellido, fecha_nacimiento)
    VALUES (
        @i, 
        'Nombre' + CAST(@i AS VARCHAR(10)),  -- Nombre generado dinámicamente
        'Apellido' + CAST(@i AS VARCHAR(10)),  -- Apellido generado dinámicamente
        DATEADD(YEAR, -20, GETDATE())  -- Fecha de nacimiento (20 años atrás)
    );

    SET @i = @i + 1;
END;

SELECT * 
FROM Huesped1


/*Realizar la búsqueda por periodo y registrar el plan de ejecución utilizados por el motor y los tiempos de respuesta.*/

SET STATISTICS TIME ON;
SET STATISTICS PROFILE ON;

SELECT * 
FROM Huesped1
WHERE fecha_nacimiento BETWEEN '2002-01-01' AND '2004-12-01';

SET STATISTICS TIME OFF;
SET STATISTICS PROFILE OFF;

/*Definir un índice agrupado sobre la columna fecha y repetir la consulta anterior. 
Registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.*/

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

/*Definir otro índice agrupado sobre la columna fecha pero que además incluya las columnas seleccionadas y repetir la consulta anterior. 
Registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.*/

CREATE INDEX idx_fecha_nacimiento ON Huesped1 (fecha_nacimiento) INCLUDE (dni, nombre);

SET STATISTICS TIME ON;
SET STATISTICS PROFILE ON;

SELECT *
FROM Huesped1
WHERE fecha_nacimiento BETWEEN '2002-01-01' AND '2004-12-01';

SET STATISTICS TIME OFF;
SET STATISTICS PROFILE OFF;

/*Conclución: 
El ejercicio de optimización de búsqueda mediante la creación y uso de índices en la tabla Huesped1 nos permitió observar y comparar el impacto de los índices en 
los tiempos de respuesta y en los planes de ejecución utilizados por el motor de la base de datos.

Carga Masiva de Datos: La carga masiva de un millón de registros en la tabla Huesped1 sin índices fue exitosa, 
y proporcionó una base de datos significativa para realizar las pruebas de optimización.

Consulta Sin Índices: La primera consulta de búsqueda por el rango de fechas 2002-01-01 a 2004-12-01 se ejecutó sin la presencia de índices. 
El plan de ejecución y los tiempos de respuesta registrados mostraron un rendimiento básico sin optimización.

Índice Agrupado: La creación de un índice agrupado (clustered index) sobre la columna fecha_nacimiento permitió mejorar significativamente el rendimiento de la consulta. 
Los tiempos de respuesta fueron más rápidos y el plan de ejecución mostró un uso eficiente del índice agrupado para acceder a los datos.

Índice No Agrupado con Columnas Incluidas: La definición de un índice no agrupado (non-clustered index) sobre la columna fecha_nacimiento con las columnas dni y nombre incluidas, permitió una optimización adicional. 
El plan de ejecución y los tiempos de respuesta indicaron que el uso de columnas incluidas puede ayudar a reducir la cantidad de acceso a datos necesarios para satisfacer la consulta.

En conclusión, el uso de índices, tanto agrupados como no agrupados con columnas incluidas, demostró ser una estrategia efectiva para mejorar el rendimiento de las consultas en la base de datos. 
Este ejercicio destaca la importancia de seleccionar y definir adecuadamente los índices para optimizar las operaciones de búsqueda y acceso a los datos.
*/














