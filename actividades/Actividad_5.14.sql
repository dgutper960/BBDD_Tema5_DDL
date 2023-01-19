-- Actividad 5.14
-- Tema 5 - DDL
-- Curso 1DAW
-- Autor David Gutiérrez Pérez
-- Fecha 19/01/23

# Crear la base de datos empleados_taller a partir del siguiente Modelo Relacional.
DROP DATABASE IF EXISTS empleados_taller;
CREATE DATABASE IF NOT EXISTS empleados_taller CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

# Creamos la tabla clientes
USE empleados_taller;
DROP TABLE IF EXISTS clientes;
CREATE TABLE IF NOT EXISTS clientes(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (30) NOT NULL,
    nif CHAR(9) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS telefonosClientes;
CREATE TABLE IF NOT EXISTS telefonosClientes(
	id_cliente INT UNSIGNED,
    telefono CHAR (12),
    PRIMARY KEY (id_cliente, telefono),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS empleados;
CREATE TABLE IF NOT EXISTS empleados (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    dni CHAR(9) UNIQUE NOT NULL,
    nombre VARCHAR (20) NOT NULL,
    id_proyecto INT UNSIGNED,
    id_empleado_sup INT UNSIGNED,
    FOREIGN KEY (id_empleado_sup) REFERENCES empleados (id) ON DELETE SET NULL ON UPDATE CASCADE
    -- foreign key id_proyecto al final
);

DROP TABLE IF EXISTS beneficiarios;
CREATE TABLE IF NOT EXISTS beneficiarios (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (15) NOT NULL,
    fechaNac DATE NOT NULL,
    id_empleado INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_empleado) REFERENCES empleados (id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS telefonosEmpleados;
CREATE TABLE IF NOT EXISTS telefonosEmpleados(
	id_empleado INT UNSIGNED,
    telefono CHAR (12),
    PRIMARY KEY (id_empleado, telefono),
    FOREIGN KEY (id_empleado) REFERENCES empleados (id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS proyectos;
CREATE TABLE IF NOT EXISTS proyectos(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    proyecto VARCHAR (50) NOT NULL,
    descripcion TINYTEXT NOT NULL,
    presupesto DECIMAL (10,2) NOT NULL,
    id_empleado_jefe INT UNSIGNED,
    id_cliente INT UNSIGNED,
    FOREIGN KEY (id_empleado_jefe) REFERENCES empleados (id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id) ON DELETE SET NULL ON UPDATE CASCADE
);

DROP TABLE IF EXISTS proyectoEmpleados;
CREATE TABLE IF NOT EXISTS proyectoEmpleados(
	id_proyecto INT UNSIGNED,
    id_empleado INT UNSIGNED,
    horas TIME DEFAULT '00:00:00'NOT NULL,
    f_inicio DATE NOT NULL,
    f_fin DATE NOT NULL,
    valoracion TINYINT UNSIGNED CHECK (valoracion BETWEEN 0 AND 10),
    PRIMARY KEY (id_proyecto, id_empleado),
    FOREIGN KEY (id_proyecto) REFERENCES proyectos (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_empleado) REFERENCES empleados (id) ON DELETE RESTRICT ON UPDATE CASCADE
);


# Modificamos las referencias (FOREIGN KEYS), ya que al ejecutar el scrip daría error
ALTER TABLE empleados
	ADD CONSTRAINT FOREIGN KEY (id_proyecto) REFERENCES proyectos (id) ON DELETE SET NULL ON UPDATE CASCADE;
     






