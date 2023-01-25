-- Actividad 5.16
-- Tema 5 - DDL
-- Curso 1DAW
-- Autor: David Gutiérrez Pérez
-- Fecha: 22/01/23

 # Crear la BBDD libros_almacen
 
 DROP DATABASE IF EXISTS libros_almacen;
 CREATE DATABASE IF NOT EXISTS libros_almacen;
 
 # Indicamos el uso de la BBDD libros_almacen
 USE libros_almacen;
 
 # Creamos las tablas especificadas
 
 # Tabla libros
 DROP TABLE IF EXISTS libros;
 CREATE TABLE IF NOT EXISTS libros(
	id INT UNSIGNED auto_increment PRIMARY KEY,
    titulo varchar(255),
    autor VARCHAR(255) NOT NULL,
    precio DECIMAL(10.2) NOT NULL,
    asignatura VARCHAR(255) NOT NULL,
    create_at timestamp default current_timestamp,
    update_at timestamp default current_timestamp
 );
 
  
# Tabla almacenes
DROP TABLE IF EXISTS almacenes;
CREATE TABLE IF NOT EXISTS almacenes(
	id INT UNSIGNED auto_increment PRIMARY KEY,
    nombre varchar(255) not null,
    fecha date not null,
    id_provincia int unsigned,
 	create_at timestamp default current_timestamp,
    update_at timestamp default current_timestamp
);

 
 # Tabla provincias
DROP TABLE IF EXISTS provincias;
CREATE TABLE IF NOT EXISTS provincias(
	id INT UNSIGNED auto_increment PRIMARY KEY,
    nombre varchar(255) NOT NULL,
    id_almacen INT unsigned,
    foreign key (id_almacen) references almacenes (id)
    on delete restrict on update cascade,
 	create_at timestamp default current_timestamp,
    update_at timestamp default current_timestamp
);
    
# Tabla poblaciones
DROP TABLE IF EXISTS poblaciones;
CREATE TABLE IF NOT EXISTS poblaciones(
	id INT UNSIGNED auto_increment PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    habitantes int unsigned not null,
    id_provincia INT unsigned,
    foreign key (id_provincia) references provincias (id)
    on delete restrict on update cascade,
 	create_at timestamp default current_timestamp,
    update_at timestamp default current_timestamp
);
    
 
 
# Tabla socios
DROP TABLE IF EXISTS socios;
CREATE TABLE IF NOT EXISTS socios(
	id INT UNSIGNED auto_increment PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    codsocio VARCHAR(255) unique NOT NULL,
    telefono char(13) not null,
    dni char(9) unique not null,
    id_poblacion int unsigned,
    id_socio_avalista int unsigned,
    foreign key (id_poblacion) references poblaciones (id)
    on delete restrict on update cascade,
    foreign key (id_socio_avalista) references socios (id)
    on delete restrict on update cascade,
 	create_at timestamp default current_timestamp,
    update_at timestamp default current_timestamp
);

 # Tabla educacion
 DROP TABLE IF EXISTS educacion;
 CREATE TABLE IF NOT EXISTS educacion(
	id_libro INT unsigned,
	curso VARCHAR(255) NOT NULL,
    asignatura VARCHAR(255) NOT NULL,
    primary key (id_libro),
    foreign key (id_libro) references libros (id)
    on delete cascade on update cascade,
	create_at timestamp default current_timestamp,
    update_at timestamp default current_timestamp
 );
 
 # Tabla lectura
DROP TABLE IF EXISTS lectura;
CREATE TABLE IF NOT EXISTS lectura(
	id_libro INT unsigned,
    tipo VARCHAR(255) NOT NULL,
    genero VARCHAR(255) NOT NULL,
	primary key (id_libro),
    foreign key (id_libro) references libros (id)
    on delete cascade on update cascade,
	create_at timestamp default current_timestamp,
    update_at timestamp default current_timestamp
 );

# Tabla pedidos
DROP TABLE IF EXISTS pedidos;
CREATE TABLE IF NOT EXISTS pedidos(
	id INT UNSIGNED auto_increment PRIMARY KEY,
    fecha date not null,
    envio VARCHAR(255) NOT NULL,
    id_socio int unsigned,
    foreign key (id_socio) references socios (id)
    on delete restrict on update cascade,
 	create_at timestamp default current_timestamp,
    update_at timestamp default current_timestamp
);

# Tabla libros_pedidos
DROP TABLE IF EXISTS libros_pedidos;
CREATE TABLE IF NOT EXISTS libros_pedidos(
	id_pedido int unsigned,
    id_libro int unsigned,
    unidades mediumint unsigned not null,
    precio date not null,
    foreign key (id_pedido) references pedidos (id)
    on delete restrict on update cascade,
    foreign key (id_libro) references libros (id)
    on delete restrict on update cascade,
 	create_at timestamp default current_timestamp,
    update_at timestamp default current_timestamp
);

# Tabla almacenes_libros
DROP TABLE IF EXISTS almacenes_libros;
CREATE TABLE IF NOT EXISTS almacenes_libros(
	id_almacen int unsigned,
    id_libro int unsigned,
    stock smallint unsigned not null,
    foreign key (id_almacen) references almacenes (id)
    on delete restrict on update cascade,
    foreign key (id_libro) references libros (id)
    on delete restrict on update cascade,
 	create_at timestamp default current_timestamp,
    update_at timestamp default current_timestamp
);

ALTER TABLE almacenes
	ADD constraint fk_provincia foreign key (id_provincia) references provincias (id)
    on delete restrict on update cascade;




    


 