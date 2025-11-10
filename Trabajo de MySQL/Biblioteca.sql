-- Creación de la base de datos para el esquema de Biblioteca
CREATE DATABASE IF NOT EXISTS biblioteca_db;
-- Voy a utilizar la base de datos creada
USE biblioteca_db;

-- 1. Crear la tabla independiente USUARIO
CREATE TABLE IF NOT EXISTS usuario(
    NumUsuario INT UNIQUE NOT NULL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(255)
);

-- 2. Crear la tabla independiente LIBRO
CREATE TABLE IF NOT EXISTS libro(
    Codigo INT UNIQUE NOT NULL PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    Autor VARCHAR(100),
    AnioPublicacion INT
);

-- 3. Crear la tabla de relación PRESTAMO
CREATE TABLE IF NOT EXISTS prestamo(
    IDPrestamo INT UNIQUE NOT NULL PRIMARY KEY,
    NumUsuario INT NOT NULL, -- Clave Foránea a USUARIO
    CodigoLibro INT NOT NULL, -- Clave Foránea a LIBRO
    FechaPrestamo DATE NOT NULL,
    FechaDevolucion DATE,

    -- Definición de las Claves Foráneas
    CONSTRAINT fk_prestamo_usuario FOREIGN KEY (NumUsuario) REFERENCES usuario (NumUsuario),
    CONSTRAINT fk_prestamo_libro FOREIGN KEY (CodigoLibro) REFERENCES libro (Codigo)
);
INSERT INTO usuario (NumUsuario, Nombre, Direccion) VALUES
(1, 'Carlos Ruiz', 'Av. Central 456'),
(2, 'Maria López', 'Carrera 10 #5-20'),
(3, 'Pedro Gómez', 'Calle 25 #8-10');

INSERT INTO libro (Codigo, Titulo, Autor, AnioPublicacion) VALUES
(1001, 'Cien Años de Soledad', 'Gabriel García Márquez', 1967),
(1002, 'El Principito', 'Antoine de Saint-Exupéry', 1943),
(1003, 'Don Quijote de la Mancha', 'Miguel de Cervantes', 1605);

INSERT INTO prestamo (IDPrestamo, NumUsuario, CodigoLibro, FechaPrestamo, FechaDevolucion) VALUES
(501, 1, 1001, '2025-10-01', '2025-10-15'), -- Carlos presta Cien Años
(502, 2, 1002, '2025-10-05', NULL);        -- Maria presta El Principito (pendiente)