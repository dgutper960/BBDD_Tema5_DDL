-- Actividad 5.3
-- Tema: 5
-- Autor: David Gutiérrez Pérez
-- Fecha: 09/10/23

 #1 Borrar base de datos si existe 'tipos_datos'
 DROP DATABASE IF EXISTS tipos_datos;
 
 #2 Crear base de datos si no existe 'tipos_datos'
 CREATE DATABASE IF NOT EXISTS tipos_datos
 CHARACTER SET UTF8MB4 COLLATE UTF8MB4_GENERAL_CI;
 
 #3 Borrar tabla si existe 'tipos_datos_num'
DROP TABLE IF EXISTS tipos_datos_num;

#4 Crear base datos si no existe 'tipos_datos_num'
CREATE TABLE IF NOT EXISTS tipos_datos_num (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
num_camiseta TINYINT UNSIGNED,
diferencia_goles TINYINT,
goles_afavor TINYINT UNSIGNED,
goles_encontra TINYINT UNSIGNED,
num_habitantes INTEGER UNSIGNED,
humedad DECIMAL,
precipitaciones DECIMAL, #por metro cuadrado
temperatura_maxima FLOAT, #2pos dec
temperatura_minima FLOAT, #2pos dec
velocidad_viento SMALLINT UNSIGNED, #max 300km/h
altura SMALLINT UNSIGNED, #de una montaña
precio DECIMAL, #articulo marroquineria
sueldo DECIMAL,
seno FLOAT, #máxima precision
coseno FLOAT #máxima precision
);


 