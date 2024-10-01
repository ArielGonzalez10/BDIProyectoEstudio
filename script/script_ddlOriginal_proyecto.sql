
--Creacion de base de datos--
CREATE DATABASE GestionHotel;
USE GestionHotel;

--Creacion de las tablas--
CREATE TABLE Piso
(
  id_piso INT NOT NULL,
  nroPiso INT NOT NULL,
  CONSTRAINT PK_piso PRIMARY KEY (id_piso),
  CONSTRAINT CK_nroPiso CHECK (nroPiso >= 0)
);

CREATE TABLE Huesped
(
  dni INT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  CONSTRAINT PK_huesped PRIMARY KEY (dni),
  CONSTRAINT CK_dniHuesped CHECK (dni <= 99999999)
);

CREATE TABLE Reserva
(
  id_reserva INT NOT NULL,
  fechaEntrada DATE NOT NULL,
  fechaSalida INT NOT NULL,
  dni INT NOT NULL,
  CONSTRAINT PK_reserva PRIMARY KEY (id_reserva),
  CONSTRAINT FK_huesped_reseva FOREIGN KEY (dni) REFERENCES Huesped(dni),
  CONSTRAINT CK_fecha CHECK (fechaInicio <= fechaFin),
  CONSTRAINT CK_dniHuesped CHECK (dni <= 99999999)
);

CREATE TABLE Pago
(
  id_pago INT NOT NULL,
  importe FLOAT NOT NULL,
  CONSTRAINT PK_pago PRIMARY KEY (id_pago),
  CONSTRAINT CK_importePago CHECK(importe > 0)
);

CREATE TABLE Metodo_pago
(
  id_metodoPago INT NOT NULL,
  tipo INT NOT NULL,
  id_pago INT NOT NULL,
  CONSTRAINT PK_metodoPago PRIMARY KEY (id_pago),
  CONSTRAINT FK_pago_metodoPago FOREIGN KEY (id_pago) REFERENCES Pago(id_pago),
  CONSTRAINT CK_tipoPago CHECK(tipo in ('Debito', 'Credito', 'Efectivo'))
);

CREATE TABLE Habitacion
(
  id_habitacion INT NOT NULL,
  tipoHabitacion INT NOT NULL,
  costo INT NOT NULL,
  id_reserva INT NOT NULL,
  id_piso INT NOT NULL,
  CONSTRAINT PK_habitacion PRIMARY KEY (id_habitacion),
  CONSTRAINT FK_piso_habitacion FOREIGN KEY (id_piso) REFERENCES Piso(id_piso),
  CONSTRAINT FK_reserva_habitacion FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva),
  CONSTRAINT CK_tipoHabitacion CHECK (tipoHabitacion in ('Simple','Doble','Suit')),
  CONSTRAINT CK_costoHabitacion CHECK(costo > 0)
);

CREATE TABLE Detalle_reserva
(
  totalReserva FLOAT NOT NULL,
  id_pago INT NOT NULL,
  id_reserva INT NOT NULL,
  CONSTRAINT PK_detalle_reserva PRIMARY KEY (id_reserva, id_pago),
  CONSTRAINT FK_reserva_detalle_reserva FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva),
  CONSTRAINT FK_pago_detalle_reserva FOREIGN KEY (id_pago) REFERENCES Pago(id_pago),
  CONSTRAINT CK_totalReserva CHECK (totalReserva > 0)
);