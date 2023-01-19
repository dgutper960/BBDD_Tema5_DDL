-- Actividad 5.13
-- Tema 5 -DDL
-- Curso 1DAW
-- Autor: David Guiérrez Pérez
-- Fecha 18/01/23

USE videoclub;

# Ejercicio 1. Alter table actores.

ALTER TABLE actores
	ADD column edad tinyint unsigned,
    ADD column telefono CHAR(13) unique,
    ADD COLUMN email VARCHAR(255) CHECK (email LIKE '%@%'),
    ADD COLUMN instagram VARCHAR(255),
    ADD COLUMN facebook VARCHAR(255),
    ADD COLUMN ticktock VARCHAR(255);
    
# Ejercicio 2. Alter table actores

ALTER TABLE actores
	MODIFY COLUMN nacionalidad VARCHAR(20) DEFAULT 'Estados Unidos';
    
# Ejercicio 3. Alter table directores

ALTER TABLE directores
	ADD COLUMN pais VARCHAR(255),
    ADD COLUMN telefono CHAR(13) unique,
    ADD COLUMN email VARCHAR(255) CHECK (email LIKE '%@%'),
    ADD COLUMN edad TINYINT unsigned;
    
# 4. Alter table peliculas

ALTER TABLE peliculas
	ADD COLUMN recaudacion float UNSIGNED,
    MODIFY COLUMN presupuesto float UNSIGNED check (presupuesto > 500000),
    MODIFY COLUMN valoracion TINYINT UNSIGNED CHECK (valoracion BETWEEN '0' AND '10'),
    MODIFY COLUMN nacionalidad VARCHAR(20) DEFAULT 'Estados Unidos';
    
# Ejercicio 5. Alter table socios

ALTER TABLE socios
	ADD COLUMN apellidos VARCHAR(100),
    ADD COLUMN nacionalidad VARCHAR(100) DEFAULT 'España',
    CHANGE COLUMN provincia region VARCHAR(255),
    ADD COLUMN tipo_socio TINYINT UNSIGNED CHECK (tipo_socio between 0 and 9);
    
# Ejercicio 6. Alter table participan

ALTER TABLE participan
	CHANGE premios premios_conseguidos VARCHAR(255);
    
    
# Ejercicio 7. Índices

CREATE INDEX InActoresApeNom ON actores (apellidos, nombre);
CREATE INDEX InDorectoresApeNom ON directores (apellidos, nombre);
CREATE INDEX InPeliculaTitulo ON peliculas (titulo);
CREATE INDEX InSociosApeNom ON socios (apellidos, nombre);

    
    
    
    


	
    
    




