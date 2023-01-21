-- Actividad 5.15
-- Tema 5 - DDL
-- Curso 1 DAW
-- Autor David Gutiérrez Pérez
-- Fecha 19/01/23

USE empleados_taller;

# 1. Tabla Clientes
# Añadir las siguientes columnas con tipo de datos y restricciones a vuestro criterio

ALTER TABLE clientes
	ADD COLUMN apellidos VARCHAR(255),
    ADD COLUMN poblacion VARCHAR(255),
    ADD COLUMN nacionalidad VARCHAR(255),
    ADD COLUMN email VARCHAR(255) NOT NULL CHECK (email LIKE '%@%'),
    ADD column direccion VARCHAR(25),
    ADD COLUMN cod_cliente CHAR(7) UNIQUE CHECK (cod_cliente LIKE '__/____') ,
    ADD COLUMN tipo_cliente TINYINT UNSIGNED CHECK (tipo_cliente BETWEEN '0' AND '10');
    
    
# Realizar las siguientes modificaciones sobre columnas

ALTER TABLE clientes  
	MODIFY COLUMN nombre VARCHAR(25) NOT NULL,
    modify COLUMN apellidos VARCHAR(45) NOT NULL,
    ALTER nacionalidad SET default 'España',
	modify column direccion VARCHAR(100),
    change column email correo_electronico VARCHAR(255);

	
# Añadir a la tabla las siguientes restricciones:

ALTER TABLE clientes
	ADD constraint CH_correo_electronico check (correo_electronico LIKE '%@%'),
    ADD constraint CH_tipo_cliente CHECK (tipo_cliente between '0' and '10');
    
    # Crear índice:
    
    create index InNombreApellidos on clientes (nombre, apellidos);

	
    
    
    
    
    
    
    
    
