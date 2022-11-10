create database Escuela

use Escuela

create table Alumnos(
Id varchar (10) not null,
Nombre varchar (40) not null,
Apellido varchar (40) not null,
Domicilio text,
Fecha_Nacimiento datetime
);