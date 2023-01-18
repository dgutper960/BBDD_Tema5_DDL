USE TEST;
DROP TABLE IF EXISTS Matricula;
CREATE TABLE IF NOT EXISTS Matricula(
NumMatricula Int AUTO_INCREMENT PRIMARY KEY,
FechaMatricula TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Apellidos Varchar(45),
Nombre Varchar(20),
DniAlumno Char (9) UNIQUE,
Email Varchar(50) CHECK (Email Like '%@%'),
CiclEducativo Varchar(20),
Curso TINYINT UNSIGNED REFERENCES Curso(Curso)
ON DELETE RESTRICT ON UPDATE CASCADE
);
-- Automáticamente se han creado los índices:
-- PRIMARY - de la restricción PRIMARY KEY 
-- DniAlumno - de la restricción UNIQUE(DniAlumno)
-- Curso – procedente de la restricción FOREIGN KEY sobre Curso
-- Además se crean los siguientes índices: --

CREATE INDEX InNombreMatricula ON Matricula(Apellidos, Nombre);
CREATE INDEX InFechaMatricula ON Matricula(FechaMatricula);

show INDEX FROM matricula;
