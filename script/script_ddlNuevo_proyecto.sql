--Creacion de base de datos--
CREATE DATABASE GestionHotel;
GO
USE GestionHotel;
GO

--Creacion de tablas--

-- Tabla Huesped
CREATE TABLE Huesped
(
  dni INT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  CONSTRAINT PK_huesped PRIMARY KEY (dni),
  CONSTRAINT CK_dniHuesped CHECK (dni BETWEEN 1 and 99999999) -- El dni del huesped no puede ser un valor negativo ni mayor a 8 digitos
);

-- Tabla Reserva
CREATE TABLE Reserva
(
  id_reserva INT NOT NULL,
  fechaEntrada DATE NOT NULL CONSTRAINT DF_fechaEntrada DEFAULT GETDATE(), -- -- La fecha de entrada del huésped se establece por defecto como la fecha actual
  fechaSalida DATE, -- La fecha de salida del huesped es opcional, si es que el huesped no reservo la habitación por un tiempo fijo
  dni INT NOT NULL,
  CONSTRAINT PK_reserva PRIMARY KEY (id_reserva),
  CONSTRAINT FK_huesped_reserva FOREIGN KEY (dni) REFERENCES Huesped(dni),
  CONSTRAINT CK_fecha CHECK (fechaEntrada <= fechaSalida)
);

-- Tabla Piso
CREATE TABLE Piso
(
  id_piso INT NOT NULL,
  nroPiso INT NOT NULL,
  CONSTRAINT PK_piso PRIMARY KEY (id_piso),
  CONSTRAINT CK_nroPiso CHECK (nroPiso >= 0)
);

-- Tabla Pago
CREATE TABLE Pago
(
  id_pago INT NOT NULL,
  importe FLOAT NOT NULL,
  CONSTRAINT PK_pago PRIMARY KEY (id_pago),
  CONSTRAINT CK_importePago CHECK(importe > 0)
);

-- Tabla Metodo_pago
CREATE TABLE Metodo_pago
(
  id_metodoPago INT NOT NULL,
  tipo VARCHAR(50) NOT NULL,
  id_pago INT NOT NULL,
  CONSTRAINT PK_metodoPago PRIMARY KEY (id_pago),
  CONSTRAINT FK_pago_metodoPago FOREIGN KEY (id_pago) REFERENCES Pago(id_pago),
  CONSTRAINT CK_tipoPago CHECK(tipo in ('Debito', 'Credito', 'Efectivo'))
);

-- Tabla Habitacion
CREATE TABLE Habitacion
(
  id_habitacion INT NOT NULL,
  tipoHabitacion VARCHAR(50) NOT NULL,
  costo FLOAT NOT NULL,
  id_piso INT NOT NULL,
  CONSTRAINT PK_habitacion PRIMARY KEY (id_habitacion),
  CONSTRAINT FK_piso_habitacion FOREIGN KEY (id_piso) REFERENCES Piso(id_piso),
  CONSTRAINT CK_tipoHabitacion CHECK (tipoHabitacion in ('Simple','Doble','Suit')),
  CONSTRAINT CK_costoHabitacion CHECK(costo > 0)
);

-- Tabla Detalle_reserva
CREATE TABLE Detalle_reserva
(
  id_reserva INT NOT NULL,
  id_pago INT NOT NULL,
  totalReserva INT NOT NULL,
  CONSTRAINT PK_detalle_reserva PRIMARY KEY (id_reserva, id_pago),
  CONSTRAINT FK_reserva_detalle_reserva FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva),
  CONSTRAINT FK_pago_detalle_reserva FOREIGN KEY (id_pago) REFERENCES Pago(id_pago),
  CONSTRAINT CK_totalReserva CHECK (totalReserva > 0)
);

-- Tabla Detalle_habitacion
CREATE TABLE Detalle_habitacion
(
  id_habitacion INT NOT NULL,
  id_Reserva INT NOT NULL,
  PRIMARY KEY (id_habitacion, id_Reserva),
  FOREIGN KEY (id_habitacion) REFERENCES Habitacion(id_habitacion),
  FOREIGN KEY (id_Reserva) REFERENCES Reserva(id_reserva)
);
