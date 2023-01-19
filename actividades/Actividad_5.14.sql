-- Actividad 5.14
-- Tema 5 - DDL
-- Curso 1DAW
-- Autor David Gutiérrez Pérez
-- Fecha 19/01/23

# Crear la base de datos empleados_taller a partir del siguiente Modelo Relacional.

DROP DATABASE IF EXISTS empleados_taller;
CREATE database IF not exists empleados_taller;

USE empleados_taller;

drop table if exists Clientes;
create table if not exists Clientes(
	id int unsigned auto_increment primary key,
    nombre varchar(20),
    nif char(9) unique
);

drop table if exists TelefonosEmpleados;
create table if not exists TelefonosEmpleados(
	id_empleado int unsigned,
    telefono int unsigned,
    primary key (id_empleado, telefono),
    foreign key id_empleado references Empleados (id)
    on delete cascade on update cascade
);

drop table if exists TelefonosClientes;
create table if not exists TelefonosClientes(
	id_cliente int unsigned,
    telefono int unsigned,
    primary key (id_cliente, telefono),
    foreign key id_cliente references CLientes (id)
    on delete cascade on update cascade
);

drop table if exists ProyectosEmpleados;
create table if not exists ProyectosEmpleados(
	id_proyecto int unsigned,
    id_empleado int unsigned,
    horas smallint unsigned,
    f_inicio datetime default current_timestamp,
    f_fin date default current_timestamp,
    valoracion tinyint,
    primary key (id_proyecto, id_empleado),
    foreign key id_proyecto references Proyectos (id)
    on delete restrict on update cascade,
    foreign key id_empleados references Empleados (id)
    on delete restrict on update cascade
);

drop table if exists Proyectos;
create table if not exists Proyectos(
	id int unsigned auto_increment primary key,
    proyecto varchar(255) not null,
    descripcion text,
    presupuesto float unsigned,
    id_empleado_jefe int unsigned,
    id_cliente int unsigned,
    foreign key (id_empleado_jefe) references Empleados (id)
    on delete restrict on update cascade,
    foreign key (id_cliente) references Clientes (id)
    on delete restrict on update cascade
);

drop table if exists Beneficiarios;
create table if not exists Beneficiarios(
	id int unsigned auto_increment primary key,
    nombre varchar(255),
    fechaNac date,
    id_empleado int unsigned,
    foreign key (id_empleado) references Empleados (id)
    on delete cascade on update cascade
);

drop table if exists Empleados;
create table if not exists Empleados(
	id int unsigned auto_increment primary key,
    dni char(9) unique,
    nombre varchar(255),
    id_proyecto int unsigned,
    id_empleado_sup int unsigned,
    foreign key (id_proyecto) references Proyectos (id)
    on delete restrict on update cascade,
    foreign key (id_empleado_sup) references Empleados (id)
    on delete restrict on update cascade
);