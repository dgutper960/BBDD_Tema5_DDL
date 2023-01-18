-- Actividad 5.6
-- Tema 6
-- Curso: 1DAW 22/23
-- Autor: David Gutiérrez Pérez
-- Fecha: 10/01/23

-- Para que use la Base de datos test
USe test;

DRop tAble iF eXists alumnos;
create table if not exists alumnos (
	id int unsigned auto_increment primary key,
    nombre varchar(15),
    apellidos varchar(40),
    dni char(9) unique,
    fecha_nac date,
    edad tinyint unsigned,
    poblacion varchar(20),
    direccion varchar(255),
    cpostal char(5),
    provincia varchar(20),
    nacionalidad varchar(20),
    telefono char(13),
    email varchar(60) unique
);

DRop tAble iF eXists articulos;
CReate tAble iF nOt exists articulos (
	id int unsigned auto_increment primary key,
    descripcion varchar(255),
    referencia varchar(20),
    precio_coste decimal(10,2),
    precio_venta decimal(10,2),
    descuento float(3,2) unsigned,
    imagen varchar(255), -- Se suele poner la ruta de la imagen
    categoria varchar(15),
    stock int,
    stok_min int,
    stok_max int
    );
    
DRop tAble iF eXists registro_llegadas;
CReate tAble iF nOt exists registro_llegadas (
	id int unsigned auto_increment primary key,
    fecha_hora_salida datetime,
    fecha_hora_llegadas datetime,
    tiempo_realizado time,
    id_corredor int unsigned
    );
    
    
    -- Para ingresar registros
    
    insert into alumnos value
    (
    null,
    'David',
    'Gutiérrez Pérez',
    '35648562Y',
    '1984-10-28',
    '39',
    'Ubrique',
    'C.Paseo del Prado',
    '11600',
    'Español',
    '665026052',
    'gutperda90@gamil.com'
    )
    
