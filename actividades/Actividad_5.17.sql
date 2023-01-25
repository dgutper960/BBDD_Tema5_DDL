-- Actividad 5.17
-- Tema 5 - DDL
-- Curso 1DAW
-- Autor: David Gutiérrez Pérez
-- Fecha 23/01/23

USE libros_almacen;

# 1. Tabla Autores 
# Añadir tabla autores a partir de los siguientes requisitos.

DROP TABLE IF EXISTS autores;
CREATE TABLE IF NOT EXISTS autores (
	id int unsigned auto_increment primary key,
    nombre VARCHAR(255) NOT NULL,
    nacionalidad VARCHAR(255),
    fechaNac DATE,
    estilo VARCHAR(255)
);

# 2. Tabla Libros
# Sobre la tabla libros se van a realizar las siguientes modificaciones.

ALTER TABLE libros
	drop column autor,
    add column autor_id int unsigned,
    add column ISBN CHAR(13) unique NOT NULL,
    ADD COLUMN EAN CHAR(13) unique NULL,
    ADD column categorias SET('DRAMA','NOVELA','COMEDIA'), -- SI HAY POSIBLILIDAD DE QUE LA LISTA CAMBIE, MEJOR USAMOS CHECK
    ADD COLUMN tipo_lector ENUM('infantil','juvenil','adulto','mayor'),
    ADD COLUMN fecha_edicion DATE;
    
ALTER TABLE libros
    add constraint fk_autor_id foreign key (autor_id) references autores (id)
    on delete restrict on update cascade;


# 3. Tabla Socios

ALTER TABLE socios
	ADD constraint un_telefono_socio unique (telefono),
    ADD COLUMN direccion VARCHAR(255) NOT NULL,
    ADD COLUMN poblacion VARCHAR(255) NOT NULL,
    ADD COLUMN c_postal CHAR(5) NOT NULL,
    ADD COLUMN provincia VARCHAR(255),
    ADD COLUMN nacionalidad VARCHAR(255),
    ADD COLUMN valoracion TINYINT CHECK (valoracion BETWEEN '0' AND '10'),
    CHANGE COLUMN nombre socio VARCHAR(255) NOT NULL; 
    
    # 4. Tabla LibrosPedidos
    
ALTER TABLE libros_pedidos
		ADD COLUMN descuento FLOAT(4,3) CHECK (descuento BETWEEN '0.000' AND '1.000'), -- EXAMEN
        ADD COLUMN importe DECIMAL(10.2) unsigned;
        

# 5. Ficheros índices

CREATE INDEX InTitulo ON libros (titulo); 
CREATE INDEX Infecha ON pedidos (fecha);
CREATE INDEX InNombreAlmacenes ON almacenes (nombre); -- Nombre indice modificado para no tener nombres de indices repetidos
CREATE INDEX InNomSocios ON socios (socio); -- Nombre de columna sobre la que se crea el indice debe ser socio y no nombre

