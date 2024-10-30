-- SCRIPT "nombre del proyecto"
USE gestion_hotel;

-- INSERCIÓN DEL LOTE DE DATOS

-- Insertar datos en la tabla Huesped
INSERT INTO Huesped (dni, nombre, apellido, fecha_nacimiento)
VALUES
(12345678, 'Juan', 'Pérez', '1985-04-23'),
(23456789, 'María', 'González', '1990-08-12'),
(34567890, 'Carlos', 'López', '1983-02-17'),
(45678901, 'Ana', 'Martínez', '1995-11-30');


-- Insertar datos en la tabla Reserva
INSERT INTO Reserva (id_reserva, fecha_salida, dni)
VALUES
(1, NULL, 12345678),
(2, '2024-10-10', 23456789),
(3, '2024-10-01', 34567890),
(4, NULL, 45678901);


-- Insertar datos en la tabla Piso
INSERT INTO Piso (id_piso, nro_piso) 
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);


-- Insertar datos en la tabla Pago
INSERT INTO Pago (id_pago, importe)
VALUES
(1, 500.00),
(2, 750.00),
(3, 600.00),
(4, 750.00);


-- Insertar datos en la tabla Metodo_pago
INSERT INTO Metodo_pago (id_metodo, tipo_metodo, id_pago)
VALUES
(1, 'Debito', 1),
(2, 'Credito', 4),
(3, 'Efectivo', 2),
(4, 'Efectivo', 3);


-- Insertar datos en la tabla Habitacion
INSERT INTO Habitacion (nro_habitacion, id_tipo_habitacion, id_piso)
VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 1, 3);


-- Insertar datos en la tabla Detalle_reserva
INSERT INTO Detalle_reserva (id_reserva, id_pago, total_reserva)
VALUES
(1, 1, 500.00),
(2, 2, 750.00),
(3, 3, 600.00),
(4, 4, 750.00);


-- Insertar datos en la tabla Detalle_habitacion
INSERT INTO Habitacion_reserva (nro_habitacion, id_reserva)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

SELECT * FROM Huesped;
SELECT * FROM Reserva; --no carga
SELECT * FROM Piso;
SELECT * FROM Pago;
SELECT * FROM Metodo_pago;
SELECT * FROM Habitacion; --no carga
SELECT * FROM Detalle_reserva; -- no carga
SELECT * FROM Habitacion_reserva; --no carga