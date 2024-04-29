drop database pruebas;
create database pruebas;
use pruebas;

create table Productos(
codigo int primary key,
nombre varchar(20),
precio double,
importador boolean);
truncate productos;

