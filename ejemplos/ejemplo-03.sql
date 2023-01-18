-- Ejemplo 03
-- Tema 5 - DDL
-- Tipos de datos numéricos

-- Usamos la base de de datos de testeo
USE test;
DROP TABLE IF EXISTS t_numericos;
CREATE TABLE IF NOT EXISTS t_numericos(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    edad int,
    mayor_edad boolean,
    valor float(10.5)
);
INSERT INTO t_numericos value
(null, 255, false, 23455.9999),
(null, 256, true, 12.9999999);
