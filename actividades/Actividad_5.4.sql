-- Actividad: 5,4
-- tema: 5 - DDL
-- autor: David Gutiérrez Pérez
-- fecha: 09/01/2023

-- creación base de datos

DROP DATABASE IF EXISTS tipo_datos_string;
CREATE DATABASE IF NOT EXISTS tipo_datos_string;

-- Creación tablas
USE tipo_datos_string;
DROP TABLE IF EXISTS tipo_datos;
CREATE TABLE IF NOT EXISTS tipo_datos(
	id INT unsigned AUTO_INCREMENT PRIMARY KEY,
    codigo_postal CHAR(5),
    telefono CHAR(13),
    apellidos VARCHAR(40),
    nombre VARCHAR(12),
    nombreAcronimo CHAR(3),
    historial BLOB,
    direccion TINYTEXT,
    provincia VARCHAR(10),
    observaciones TINYBLOB,
    contenidoLibro MEDIUMBLOB,
    categoria ENUM('Primera','Segunda', 'Tercera', 'Regional')
    );
