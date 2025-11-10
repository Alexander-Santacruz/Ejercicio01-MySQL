-- Creación de la base de datos para el esquema Médico/Hospital
CREATE DATABASE IF NOT EXISTS hospital_db;
-- Voy a utilizar la base de datos creada
USE hospital_db;

-- 1. Crear la tabla independiente PACIENTE
CREATE TABLE IF NOT EXISTS paciente(
    NumHistoria INT UNIQUE NOT NULL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(255),
    Telefono VARCHAR(15)
);

-- 2. Crear la tabla independiente MEDICO
CREATE TABLE IF NOT EXISTS medico(
    NumColegiatura INT UNIQUE NOT NULL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Especialidad VARCHAR(100)
);

-- 3. Crear la tabla de relación ATENCION (Tabla que relaciona al Médico y al Paciente)
CREATE TABLE IF NOT EXISTS atencion(
    IDAtencion INT UNIQUE NOT NULL PRIMARY KEY AUTO_INCREMENT, -- PK para la cita/atención
    NumHistoriaPaciente INT NOT NULL, -- Clave Foránea a PACIENTE
    NumColegiaturaMedico INT NOT NULL, -- Clave Foránea a MEDICO
    FechaAtencion DATE NOT NULL,

    -- Definición de las Claves Foráneas
    CONSTRAINT fk_atencion_paciente FOREIGN KEY (NumHistoriaPaciente) REFERENCES paciente (NumHistoria),
    CONSTRAINT fk_atencion_medico FOREIGN KEY (NumColegiaturaMedico) REFERENCES medico (NumColegiatura)
);

INSERT INTO paciente (NumHistoria, Nombre, Direccion, Telefono) VALUES
(5001, 'Javier Soto', 'Calle Luna 15', '555-1234'),
(5002, 'Carla Díaz', 'Av. Sol 28', '555-5678'),
(5003, 'Ricardo Peña', 'Carrera 7 #1-50', '555-9012');

INSERT INTO medico (NumColegiatura, Nombre, Especialidad) VALUES
(100, 'Dra. Patricia Reyes', 'Cardiología'),
(200, 'Dr. Miguel Torres', 'Pediatría'),
(300, 'Dra. Ana Bolívar', 'Medicina General');

INSERT INTO atencion (NumHistoriaPaciente, NumColegiaturaMedico, FechaAtencion) VALUES
(5001, 100, '2025-11-05'), -- Javier atendido por Dra. Reyes (Cardiología)
(5002, 300, '2025-11-08'), -- Carla atendida por Dra. Bolívar (General)
(5001, 300, '2025-11-09'); -- Javier atendido nuevamente por Dra. Bolívar (General)