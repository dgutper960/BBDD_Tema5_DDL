-- Actividad 5.7
-- Tema 5 - DDL
-- Curso 1DAW
-- Autor David gutiérrez Pérez
-- Fecha 11/01/23

-- Ordenamos el uso de la BBDD test
Use test;

-- Creamos la tabla pacientes
DROP TABLE IF EXISTS pacientes;
CREATE TABLE IF NOT EXISTS pacientes(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    nss CHAR(12) UNIQUE NOT NULL,
    email VARCHAR(255),
    telefono CHAR(13),
    poblacion VARCHAR(20) NOT NULL,
    expediente MEDIUMBLOB NOT NULL,
    dni CHAR(9) UNIQUE NOT NULL,
    historial_clinico LONGBLOB NOT NULL,
    fecha_nac DATE NOT NULL,
    edad TINYINT NOT NULL
);


