--Proyecto Gestion Hotel
--Integrantes: Barrios Enzo, Bret Fatima, Bongiovanni Iara, Gonzalez Ariel

--Creacion de base de datos--
CREATE DATABASE gestion_hotel;
use gestion_hotel;

--Creacion de tablas--
-- Tabla Piso
CREATE TABLE Piso
(
  id_piso INT NOT NULL,
  nro_piso INT NOT NULL,
  CONSTRAINT PK_id_piso PRIMARY KEY (id_piso)
);

CREATE TABLE Tipo_habitacion
(
  id_tipo_habitacion INT NOT NULL,
  nombre_tipo VARCHAR(50) NOT NULL,
  costo FLOAT NOT NULL,
  CONSTRAINT PK_id_tipo_habitacion PRIMARY KEY (id_tipo_habitacion),
  CONSTRAINT CK_nombre_tipo_habitacion CHECK (nombre_tipo in ('Simple','Doble','Triple')), -- Los tipos de habitaciones pueden ser Simple, doble o triple
  CONSTRAINT CK_costo_habitacion CHECK(costo > 0) -- El costo de la habitacion debe ser mayor a 0
);

--Tabla Habitacion
CREATE TABLE Habitacion
(
  nro_habitacion INT NOT NULL,
  id_piso INT NOT NULL,
  id_tipo_habitacion INT NOT NULL,
  CONSTRAINT PK_habitacion PRIMARY KEY (nro_habitacion),
  CONSTRAINT FK_piso_habitacion FOREIGN KEY (id_piso) REFERENCES Piso(id_piso),
  CONSTRAINT FK_id_tipo_habitacion FOREIGN KEY (id_tipo_habitacion)REFERENCES Tipo_Habitacion(id_tipo_habitacion),
  
);

-- Tabla Huesped
CREATE TABLE Huesped
(
  dni INT NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  apellido VARCHAR(30) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  CONSTRAINT PK_huesped PRIMARY KEY (dni),
  CONSTRAINT CK_dni_huesped CHECK (dni BETWEEN 1 and 99999999), -- El dni del huesped no puede ser un valor negativo ni mayor a 8 digitos
  CONSTRAINT CK_edad_huesped CHECK (DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) >= 18) -- La edad del huesped debe ser mayor o igual a 18 años
);

-- Tabla Reserva
CREATE TABLE Reserva
(
  id_reserva INT NOT NULL,
  fecha_entrada DATE NOT NULL CONSTRAINT DF_fecha_entrada DEFAULT GETDATE(), -- La fecha de entrada del huésped se establece por defecto como la fecha actual
  fecha_salida DATE NULL, -- La fecha de salida del huesped es opcional, si es que el huesped no reservo la habitación por un tiempo fijo
  dni INT NOT NULL,
  CONSTRAINT PK_reserva PRIMARY KEY (id_reserva),
  CONSTRAINT FK_huesped_reserva FOREIGN KEY (dni) REFERENCES Huesped(dni),
  CONSTRAINT CK_fecha CHECK (fecha_salida IS NULL OR fecha_entrada <= fecha_salida) -- La fecha de salida debe ser posterior o igual a la fecha de entrada
);

-- Tabla Pago
CREATE TABLE Pago
(
  id_pago INT NOT NULL,
  importe FLOAT NOT NULL,
  CONSTRAINT PK_pago PRIMARY KEY (id_pago),
  CONSTRAINT CK_importe_pago CHECK(importe > 0)-- El importe del pago debe ser mayor a 0
);

--Tabla Metodo Pago
CREATE TABLE Metodo_pago
(
  id_metodo INT NOT NULL,
  tipo_metodo VARCHAR(30) NOT NULL,
  id_pago INT NOT NULL,
  CONSTRAINT PK_id_metodo PRIMARY KEY (id_metodo),
  CONSTRAINT FK_id_pago FOREIGN KEY (id_pago) REFERENCES Pago(id_pago)
);

--Tabla Habitacion Reserva
CREATE TABLE Habitacion_reserva
(
  nro_habitacion INT NOT NULL,
  id_reserva INT NOT NULL,
  CONSTRAINT PK_nro_habitacion_id_reserva PRIMARY KEY (nro_habitacion, id_reserva),
  CONSTRAINT FK_nro_habitacion FOREIGN KEY (nro_habitacion) REFERENCES Habitacion(nro_habitacion),
  CONSTRAINT FK_id_reserva FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva)
);

--Tabla Detalle Reserva
CREATE TABLE Detalle_reserva
(
  total_reserva FLOAT NOT NULL,
  id_pago INT NOT NULL,
  id_reserva INT NOT NULL,
  CONSTRAINT PK_id_pago_id_reserva PRIMARY KEY (id_pago, id_reserva),
  CONSTRAINT FK_id_pago FOREIGN KEY (id_pago) REFERENCES Pago(id_pago),
  CONSTRAINT FK_id_reserva FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva)
);