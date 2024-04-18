create database transportista;

create table camioneros(
DNI varchar(9) not null primary key,
nombre varchar(100) not null,
telefono varchar(13) not null,
direccion varchar(100) not null,
salario decimal(5,2),
poblacion varchar(45) not null);

create table camiones(
matricula varchar(7) not null primary key,
modelo varchar(45) not null,
potencia int);

drop table provincias;

create table paquetes(
id_paquete int not null primary key,
descripcion_paq varchar(45) not null,
destinatario varchar(45) not null,
direccion_destino varchar(45) not null,
pronvicias_id_provincia int,
foreign key (id_paquete) references provincias (id_provincia));

create table provincias (
id_provincia int not null primary key,
nombre varchar(45) not null);



