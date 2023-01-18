-- Actividad 5.10
-- Tema 5 - DDL
-- Curso 1DAW
-- Autor: David Gutiérrez Pérez
-- Fecha 15-01-23
 
 -- Crea BBDD restricciones_check; UTF8_GENERAL_CI
 
 DROP DATABASE IF EXISTS restricciones_chek;
 CREATE DATABASE IF NOT EXISTS restricciones_chek
 CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;
 
 USE restricciones_chek;
 
 DROP TABLE IF EXISTS comparacion;
 CREATE TABLE IF NOT EXISTS comparacion(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    importe DECIMAL(10.2) CHECK (importe > 400.00),
    saldo DECIMAL (10.2) CHECK (saldo > 0),
    nombre VARCHAR(255) CHECK (nombre IS NOT NULL),
    apellidos  VARCHAR(255) CHECK (nombre IS NOT NULL),
    NBeneficiarios TINYINT UNSIGNED CHECK (NBeneficiarios <= 5),
    NAsignaturas TINYINT CHECK (NAsignaturas <= 5),
    beca BOOLEAN CHECK (beca IS TRUE),
    importe_beca DECIMAL(10.2) CHECK (importe_beca < 2500.00),
    Ngoles TINYINT UNSIGNED CHECK (Ngoles <= 20),
    anno_nacimiento YEAR CHECK (anno_nacimiento <= 1970),
    fec_nacimiento DATE CHECK (fec_nacimiento < 2000/02/21),
    hora_llegada TIME CHECK (hora_llegada >= 12.00)
 );

DROP TABLE IF EXISTS comparacionBetween;
CREATE TABLE IF NOT EXISTS comparacionBetween(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Ngoles TINYINT UNSIGNED CHECK (Ngoles BETWEEN 20 AND 30),
    Sueldo DECIMAL (10.2) CHECK (Sueldo BETWEEN 2000 AND 3000),
    Importe DECIMAL (10.2) CHECK (Importe BETWEEN 400 AND 600),
    Cantidad TINYINT UNSIGNED CHECK (Cantidad BETWEEN 5 AND 20),
    Valor TINYINT UNSIGNED CHECK (Valor NOT BETWEEN 4 AND 7),
    TipoDescuento FLOAT (5.4) CHECK (TipoDescuento BETWEEN 0.525 AND 0.2050), -- Los valores en porcentaje son entre 0 y 1
    Precio DECIMAL (10.2) CHECK (Precio BETWEEN 20 AND 30)
);

DROP TABLE IF EXISTS cheking;
CREATE TABLE IF NOT EXISTS cheking(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Provincia VARCHAR (8) CHECK (Provincia IN ('Cádiz','Málaga','Sevilla')),
    Poblacion VARCHAR (20) CHECK (Poblacion IN ('Ubrique','Villamartín','Prado del Rey','Olvera')),
    CicloEstudios VARCHAR (15) CHECK (CicloEstudios IN ('ESO','BACH','MEDIO','SUPERIOR','ADULTOS')),
    Valores TINYINT UNSIGNED CHECK (Valores IN ('1','2','5','8','9')),
    Nacionalidad VARCHAR (25) CHECK (Nacionalidad IN ('España','Brasil','Portugal','Argentina','Italia')),
    CodEmpleado VARCHAR (255) CHECK (CodEmpleado LIKE '_AB%'),
    NRP CHAR(15) CHECK (NRP LIKE '%Z'),
    DNI CHAR (9) CHECK (DNI LIKE '25%')
);

 
 
 