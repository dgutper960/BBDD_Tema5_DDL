-- Actividad 5.5
-- Tema 5
-- Curso 1DAW
-- Autor David Gutiérrez Pérez
-- Fecha 10/01/23

USE tipos_datos;

-- Crear tabla tipos_datos_fechas
DROP TABLE IF exists tipos_datos_fechas;
CREATE table IF NOT exists tipos_datos_fechas(
	id INT unsigned AUTO_INCREMENT PRIMARY KEY,
    fecha_nacimiento DATE,
    fecha_hora_nacimiento datetime,
    hora_de_llegada time,
    anno_nacimiento year,
    anno_fundacion year,
    fecha_hora_salida timestamp,
    fecha_hora_llegada timestamp,
    fecha_hora_actual datetime,
    Create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

 