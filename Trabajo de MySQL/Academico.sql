-- Creación de la base de datos para el esquema Académico
CREATE DATABASE IF NOT EXISTS academico_db;
-- Voy a utilizar la base de datos creada
USE academico_db;

-- 1. Crear la tabla independiente PROFESOR
CREATE TABLE IF NOT EXISTS profesor(
    CodProfesor INT UNIQUE NOT NULL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Especialidad VARCHAR(100)
);

-- 2. Crear la tabla CURSO (Dependiente de Profesor por la relación 'Dicta')
CREATE TABLE IF NOT EXISTS curso(
    CodCurso INT UNIQUE NOT NULL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Creditos INT,
    CodProfesor INT, -- Clave Foránea a PROFESOR

    -- Definición de la Clave Foránea
    CONSTRAINT fk_curso_profesor FOREIGN KEY (CodProfesor) REFERENCES profesor (CodProfesor)
);

-- 3. Crear la tabla independiente ESTUDIANTE
CREATE TABLE IF NOT EXISTS estudiante(
    NumMatricula INT UNIQUE NOT NULL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Correo VARCHAR(100)
);
INSERT INTO profesor (CodProfesor, Nombre, Especialidad) VALUES
(10, 'Dr. Alberto Sánchez', 'Bases de Datos'),
(20, 'Msc. Laura Jiménez', 'Programación Avanzada'),
(30, 'Ing. Roberto Fuentes', 'Redes de Comunicación');

INSERT INTO curso (CodCurso, Nombre, Creditos, CodProfesor) VALUES
(101, 'Fundamentos de SQL', 4, 10),       -- Dictado por el Dr. Alberto Sánchez (CodProfesor 10)
(102, 'Estructura de Datos', 3, 20),     -- Dictado por la Msc. Laura Jiménez (CodProfesor 20)
(103, 'Sistemas Operativos', 5, 30),     -- Dictado por el Ing. Roberto Fuentes (CodProfesor 30)
(104, 'Análisis de Algoritmos', 3, 20);  -- También dictado por la Msc. Laura Jiménez (CodProfesor 20)

INSERT INTO estudiante (NumMatricula, Nombre, Correo) VALUES
(2001, 'Sofía Rodríguez', 'sofia.r@uni.edu'),
(2002, 'Andrés Montoya', 'andres.m@uni.edu'),
(2003, 'Elena Vargas', 'elena.v@uni.edu');