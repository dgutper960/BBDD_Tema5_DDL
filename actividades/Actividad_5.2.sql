-- Práctica 5.2
-- Autor: David Gutiérrz Pérez
-- Tema: 5
-- Fecha 09/01/23

-- Borrar Base de Datos ajedrez si existe
DROP DATABASE IF EXISTS ajedrez;

-- Crear Base de Datos ajedrez si no existe
CREATE DATABASE IF NOT EXISTS ajedrez;

-- Editar Base de Datos ajedrez, 
ALTER DATABASE ajedrez
CHARACTER SET UTF8 COLLATE Utf8_general_ci;

-- Borrar la Base de Datos ajedrez
DROP DATABASE IF EXISTS ajedrez;

-- Crear la BAse de Datos Futbol
DROP DATABASE IF EXISTS futbol;
CREATE DATABASE IF NOT EXISTS futbol
CHARACTER SET UTF16 COLLATE utf16_general_ci;

-- Modificar la Base de Datos futbol
ALTER DATABASE futbol
CHARACTER SET UTF8 COLLATE utf8mb4_general_ci;

-- Borrar la BAse de Datos futbol
DROP DATABASE IF EXISTS futbol;


