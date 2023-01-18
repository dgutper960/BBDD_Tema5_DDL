-- Actividad 5.12
-- Tema 5 - DDL
-- Curso 1DAW
-- Autor Davod Gutiérrez Pérez
-- Fecha 16/01/23

DROP DATABASE IF EXISTS videoclub;
CREATE DATABASE IF NOT EXISTS videoclub;

USE videoclub;

-- Creamos la tabla actores

DROP TABLE IF exists actores;
CREATE TABLE IF NOT exists actores(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(20) not null,
    apellidos varchar(40) not null,
    nacionalidad varchar(20),
    sexo ENUM ('H','M','S'),
    fecha_nacimiento DATE,
    num_peliculas smallint unsigned,
    create_at timestamp default current_timestamp,
    update_at timestamp default current_timestamp
);

-- Tabla directores

DROP TABLE IF exists directores;
CREATE TABLE IF NOT exists directores(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(20) not null,
    apellidos varchar(40) not null,
    nacionalidad varchar(20),
    sexo ENUM ('H','M','S'),
    fecha_nacimiento date,
	num_peliculas smallint,
    create_at timestamp default current_timestamp,
    update_at timestamp default current_timestamp
    );
    
    -- Tabla peliculas
DROP TABLE IF exists peliculas;
CREATE TABLE IF NOT EXISTS peliculas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    productora VARCHAR(255),
    nacionalidad VARCHAR(255),
    presupuesto DECIMAL(10.3),
    fecha_estreno DATE,
    anno_produccion YEAR,
    valoracion TINYINT UNSIGNED CHECK (valoracion BETWEEN 0 AND 10),
    premios VARCHAR(255),
    director_id INT UNSIGNED,
    FOREIGN KEY (director_id) REFERENCES directores (id)
	ON DELETE RESTRICT ON UPDATE CASCADE,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla Ejemplares

DROP TABLE IF EXISTS ejemplares;
CREATE TABLE IF NOT EXISTS ejemplares(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    pelicula_id INT UNSIGNED,
    codigo_ejemplar VARCHAR(255) unique,
    formato VARCHAR(255),
    fecha_ejemplar DATE,
    estado ENUM ('Disponible','No Devuelta','Alquilada','Baja'),
    FOREIGN KEY (pelicula_id) REFERENCES peliculas (id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	create_at timestamp default current_timestamp,
    update_at timestamp default current_timestamp
    );
    
    -- Tabla Socios
    
DROP TABLE IF EXISTS socios;
CREATE TABLE IF NOT EXISTS socios(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR (255) NOT NULL,
	direccion VARCHAR (255) NOT NULL,
	poblacion VARCHAR (255) NOT NULL,
	provincia VARCHAR (255) NOT NULL,
	c_postal CHAR(5) NOT NULL,
	telefono CHAR(13) NOT NULL,
	socio_avalista INT UNSIGNED,
	FOREIGN KEY (socio_avalista) REFERENCES socios (id)
	ON DELETE restrict ON UPDATE CASCADE, /*no se puede eliminar a un socio que haya avalado a otro socio*/
	create_at timestamp default current_timestamp,
    update_at timestamp default current_timestamp
    );
    
    
    --  Tabla Participan
    
DROP TABLE IF EXISTS participan;
CREATE TABLE IF NOT EXISTS participan (
    pelicula_id INT UNSIGNED,
    actor_id INT UNSIGNED,
    fecha_inicio DATE,
    fecha_fin DATE,
    papel VARCHAR(255),
    sueldo DECIMAL(10.2),
    premios VARCHAR(255),
    valoracion TINYINT UNSIGNED CHECK (valoracion BETWEEN 0 AND 9),
    PRIMARY KEY (pelicula_id , actor_id),
    FOREIGN KEY (pelicula_id) REFERENCES peliculas (id)
	ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES actores (id)
	ON DELETE RESTRICT ON UPDATE CASCADE,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla Alquila

DROP TABLE IF EXISTS alquilar;
CREATE TABLE IF NOT EXISTS alquilar (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ejemplar_id INT UNSIGNED,
    socio_id INT UNSIGNED,
    fecha_alquiler DATEtime default current_timestamp,
    fecha_devolucion DATEtime default current_timestamp,
    precio DECIMAL(10.2),
    observaciones TEXT,
    FOREIGN KEY (ejemplar_id) REFERENCES ejemplares (id)
	ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (socio_id) REFERENCES socios (id)
	ON DELETE RESTRICT ON UPDATE CASCADE,
	create_at timestamp default current_timestamp,
    update_at timestamp default current_timestamp
);
