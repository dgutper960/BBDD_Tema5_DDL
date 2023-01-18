-- Actividad 5.11
-- Tema 5 - DDL
-- Curso 1DAW
-- Autor: David Gutiérrez Pérez
-- Fecha 16/01/23

/**Usar la base de datos restricciones_check y añadir las siguientes tablas con requisito de validación
en alguno de los campos indicados

1. Tabla operadorLike

operadorLike(#id, descripcion, nombre, email, password, cpostal, codigo)

id- PK
descripcion. Cadena que tiene que empezar por 'a'
nombre. Cadena donde el nombre ha de empezar por 'ju'
email. Ha de contener '@'
password. Ha de tener al menos 7 caracteres donde el tercero ha de ser la 'M'
cpostal. Cadena de 5 caracteres numéricos donde los dos primeros son '11'
codigo. Es un valor de 7 caracteres donde los dos primeros son 'ES' y el último carácter es el número 9.**/

USE restricciones_check;

DROP TABLE IF EXISTS operadorLike;
CREATE TABLE IF NOT EXISTS operadorLike(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT CHECK (descripcion LIKE 'a%'),
    nombre VARCHAR(20) CHECK (nombre LIKE 'ju%'),
    email VARCHAR(255) CHECK (email LIKE '%@%'),
    clave_acceso VARCHAR(255) CHECK (clave_acceso LIKE '__M____%'),
    cpostal CHAR(5) CHECK (cpostal LIKE '11___'),
    codigo CHAR(7) CHECK (codigo LIKE 'ES____9')
); 

