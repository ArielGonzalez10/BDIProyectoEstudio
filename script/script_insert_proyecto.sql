-- SCRIPT "nombre del proyecto"
USE GestionHotel;

-- INSERCIÓN DEL LOTE DE DATOS

-- Insertar datos en la tabla Huesped
INSERT INTO Huesped (dni, nombre, apellido)
VALUES
(12345678, 'Juan', 'Pérez'),
(23456789, 'María', 'González'),
(34567890, 'Carlos', 'López'),
(45678901, 'Ana', 'Martínez');

-- Insertar datos en la tabla Reserva
INSERT INTO Reserva (id_reserva, fechaSalida, dni)
VALUES
(1,	NULL, 12345678),
(2, '20241010', 23456789),
(3, '20241001', 34567890),
(4, NULL, 45678901);

-- Insertar datos en la tabla Piso
INSERT INTO Piso (id_piso, nroPiso) 
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
INSERT INTO Metodo_pago (id_metodoPago, tipo, id_pago)
VALUES
(1, 'Debito', 1),
(2, 'Credito', 4),
(3, 'Efectivo', 2),
(4, 'Efectivo', 3);

-- Insertar datos en la tabla Habitacion
INSERT INTO Habitacion (id_habitacion, tipoHabitacion, costo, id_piso)
VALUES
(1, 'Simple' , 100.00, 1),
(2, 'Doble', 150.00, 1),
(3, 'Suit', 200.00, 2),
(4, 'Simple', 100.00, 3);

-- Insertar datos en la tabla Detalle_reserva
INSERT INTO Detalle_reserva (id_reserva, id_pago, totalReserva)
VALUES
(1, 1, 500.00),
(2, 2, 750.00),
(3, 3, 600.00),
(4, 4, 750.00);

-- Insertar datos en la tabla Detalle_habitacion
INSERT INTO Detalle_habitacion (id_habitacion, id_reserva)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

SELECT * FROM Huesped;
SELECT * FROM Reserva;
SELECT * FROM Piso;
SELECT * FROM Pago;
SELECT * FROM Metodo_pago;
SELECT * FROM Habitacion;
SELECT * FROM Detalle_reserva;
SELECT * FROM Detalle_habitacion;