USE gestion_hotel;


-- Creacion de una Vista
CREATE VIEW VistaReservasHabitaciones AS
SELECT 
    R.id_reserva, 
    R.dni AS 'DNI', 
    R.fecha_entrada, 
    R.fecha_salida,
    H.nro_habitacion, 
    H.id_tipo_habitacion
FROM Reserva R
	INNER JOIN Habitacion_reserva HR ON (R.id_reserva = HR.id_reserva)
	INNER JOIN Habitacion H ON (HR.nro_habitacion = H.nro_habitacion);



-- Insertar de datos en la Vista
-- En la tabla Reserva
INSERT INTO Reserva (id_reserva, dni, fecha_entrada, fecha_salida)
VALUES 
(30001, 10004771, '2024-12-01', '2024-12-05'),
(30002, 10114930, '2024-12-02', '2024-12-06');

-- En la tabla Habitacion_reserva
INSERT INTO Habitacion_reserva (nro_habitacion, id_reserva)
VALUES 
(101, 30001), -- Habitación 101 para la reserva 30001
(102, 30001); -- Habitación 102 para la reserva 30001

-- Verificación de los datos insertados
SELECT * FROM Habitacion_reserva WHERE id_reserva IN (30001, 30002);
SELECT * FROM VistaReservasHabitaciones;



-- Actualiza los registros en la Vista
UPDATE R
SET fecha_salida = '2024-12-10'
FROM Reserva R
	INNER JOIN Habitacion_reserva HR ON R.id_reserva = HR.id_reserva
	INNER JOIN Habitacion H ON HR.nro_habitacion = H.nro_habitacion
WHERE H.nro_habitacion = 101 and R.id_reserva = 30001;

-- Verificacion de los registros actualizados
SELECT * FROM Habitacion_reserva WHERE id_reserva = 101;



-- Borra un registro de la Vista
DELETE FROM Habitacion_reserva
WHERE nro_habitacion = 102 and id_reserva = 30001;

-- Verificacion del registro borrado
SELECT * FROM Habitacion_reserva WHERE id_reserva = 102;



-- Crea una vista indexada

-- Crea la vista con la cláusula SCHEMABINDING
CREATE VIEW VistaHabitacionesReservas
WITH SCHEMABINDING
AS
SELECT 
    R.id_reserva, 
    R.dni AS 'DNI', 
    R.fecha_entrada, 
    R.fecha_salida,
    H.nro_habitacion, 
    H.id_tipo_habitacion
FROM dbo.Reserva R
    INNER JOIN dbo.Habitacion_reserva HR ON (R.id_reserva = HR.id_reserva)
    INNER JOIN dbo.Habitacion H ON (HR.nro_habitacion = H.nro_habitacion);

-- Crear el índice único clusterizado sobre la vista
CREATE UNIQUE CLUSTERED INDEX idx_vista_reservas_id_habitacion 
ON VistaHabitacionesReservas (id_reserva, nro_habitacion);



-- Huespedes que reservaron el tipo de habitación más popular
SELECT DISTINCT *
FROM VistaHabitacionesReservas
WHERE id_tipo_habitacion = (
    SELECT TOP 1 H2.id_tipo_habitacion
    FROM Habitacion H2
		INNER JOIN Habitacion_reserva HR2 ON (H2.nro_habitacion = HR2.nro_habitacion)
    GROUP BY H2.id_tipo_habitacion
    ORDER BY COUNT(HR2.id_reserva) DESC
);


