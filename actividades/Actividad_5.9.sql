-- Actividad 5.9
-- Tema 5 - DDL
-- Curso 1DAW
-- Autor: David Gutiérrez Pérez
-- Fecha 12/01/23

-- Crear la BBDD RestriccionesDefault
DROP DATABASE IF EXISTS RestriccionesDefault;
CREATE DATABASE IF NOT EXISTS RestriccionesDefault
CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;

USE RestriccionesDefault;

-- Crear tabla ResDAFAULT
DROP TABLE IF EXISTS resdefault;
CREATE TABLE IF NOT EXISTS resdefault(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    poblacion VARCHAR(40) DEFAULT 'Ubrique',
    provincia VARCHAR(40) DEFAULT 'Cádiz',
    nacionaledad VARCHAR(40) DEFAULT 'España',
    precio DECIMAL(10.2) DEFAULT '10.20',
    sueldo DECIMAL(10.2) DEFAULT '1500.20',
    fecha_hora_llegada DATETIME DEFAULT CURRENT_TIMESTAMP,
    hora_llegada TIME DEFAULT CURRENT_TIMESTAMP,
    casado BOOLEAN DEFAULT '1',
    carnet_conducir BOOLEAN DEFAULT '1'
    );
    
USE RestriccionesDefault;
INSERT INTO resdefault VALUES(
	null,
    'Ubrique',
    default,
    'España',
    '51.30',
    '2.300',
    '2022-12-13 23:45:01',
    '1995-03-29 01:36:55',
    '0',
    '1'
),(
	null,
    'San Sebastian',
    'Gipuzkoa',
    'España',
    '1365,50',
    '159300,27',
    '2024-09-15 20:55:00',
    '2024-10-01',
    '0',
    '1'
),(
	null,
    'Oslo',
    'Oslo',
    'Noruega',
    '7560,03',
    '266000,00',
    '2025-01-29 13:29:00',
    '2025-01-29',
    '1',
    '1'
),(
	null,
    'Oslo',
    'Oslo',
    'Noruega',
    '763,15',
    '356531,56',
    '2025-01-29 13:29:00',
    '2025-01-29',
    default,
    default
);

