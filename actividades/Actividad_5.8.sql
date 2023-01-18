-- Actividad 5.8
-- Tema 5 - DDL
-- Curso 1DAW
-- Autor David Gutiérrez Pérez
-- Fecha 11/01/23

-- Crear BBDD cotejamiento

DROP DATABASE IF EXISTS cotejamiento;
CREATE DATABASE IF NOT EXISTS cotejamiento
CHARACTER SET UTF8MB4 COLLATE UTF8MB4_GENERAL_CI;

-- Tabla departamentos

DROP TABLE IF EXISTS departamentos;
CREATE TABLE IF NOT EXISTS departamentos(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    cod_dept CHAR(3) UNIQUE NOT NULL
);

-- Tabla Profesor

DROP TABLE IF EXISTS profesor;
CREATE TABLE IF NOT EXISTS profesor(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    email VARCHAR(255),
    fecha_ingreso DATE,
    especialidad VARCHAR(25),
    nrp CHAR(15) UNIQUE NOT NULL,
    departamento_id INT UNSIGNED REFERENCES departamentos (id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tabla Asignatura
DROP TABLE IF EXISTS asignatura;
CREATE TABLE IF NOT EXISTS asignatura(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    nivel CHAR(4) NOT NULL,
    cod_asignatura CHAR(7) UNIQUE NOT NULL,
    horas TINYINT UNSIGNED,
    departamento_id INT UNSIGNED REFERENCES departamentos (id)
    ON DELETE RESTRICT ON UPDATE CASCADE
    

);

-- Tabla Horario

DROP TABLE IF EXISTS Horario;
CREATE TABLE IF NOT EXISTS Horario(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    profesor_id INT UNSIGNED NOT NULL REFERENCES profesor (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    dia CHAR(1),
    tramo CHAR(1),
    turno ENUM ('Mañana', 'Tarde'),
    asignatura_id INT UNSIGNED NOT NULL REFERENCES asignatura (id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    horas TINYINT
    );
