
-- Crear Base de Datos
DROP DATABASE IF EXISTS ges_futbol; # borra la BBDD
CREATE DATABASE IF NOT EXISTS ges_futbol #
CHARACTER SET UTF8MB4 COLLATE UTF8MB4_GENERAL_CI;

-- Mostrar Base de Datos
SHOW CHARACTER SET; # 

-- Mostrar colecciones disponibles
SHOW COLLATION;

-- Modificar Base de Datos
ALTER DATABASE ges_futbol
CHARACTER SET utf8 collate utf8_general_ci;

-- Eliminar Base de Datos
DROP DATABASE IF EXISTS ges_futbol;