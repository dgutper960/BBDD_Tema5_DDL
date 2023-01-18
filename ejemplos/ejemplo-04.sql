-- Ejemplo: Tipo carácter
-- Tema %: DDL

DROP DATABASE IF EXISTS tipo_datos_string;
CREATE DATABASE IF NOT EXISTS tipo_datos_string;

#Creamos una nueva tabla
DROP TABLE IF EXISTS ejemplo1;
CREATE TABLE IF NOT EXISTS ejemplo1 (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    matricula CHAR(7) unique,
    dni CHAR(9),
    movil CHAR(9),
    cPostal CHAR(5),
    nombre VARCHAR(48),
    apellidos VARCHAR(40),
    observaciones TEXT,
    libro mediumtext,
    enciclopedia longtext,
    sexo set('H', 'M', 'S'),
    curso ENUM('1DAW', '2DAW')
    );
    
    USE tipo_datos_string;
    
    DROP TABLE IF EXISTS tipo_fecha_hora;
    CREATE TABLE IF NOT EXISTS tipo_fecha_hora(
		id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        fechaNacini DATE,
        llegada DATETIME,
        hora TIME,
        anno_nacimiento YEAR,
        create_at DATETIME DEFAULT CURRENT_TIMESTAMP, # Añade información sobre la fecha/hora de creación
        user_create_at varchar(50),
        update_at DATETIME DEFAULT CURRENT_TIMESTAMP, # Añade información sobre la fecha/hora de modificación
        user_update_at varchar(60)
        );
        
	insert into tipo_fecha_hora values
    (null, '2010-12-24', '2010-12-24 23:50:10', now(), '20:20:12', '1975'),
    (null, '2010/12/24', '2010/12/24 23:55:10', now(), '20:20:12', '1975');
    
