create database transportistas;

create table camioneros(
DNI varchar(9) not null primary key,
nombre varchar(100) not null,
telefono varchar(13) not null,
direccion varchar(100) not null,
salario decimal(5,2),
poblacion varchar(45) not null);
drop table conducir;

create table conducir(
camiones_matricula varchar(7) not null,
camioneros_DNI varchar(9) not null,
foreign key (camioneros_DNI) references camioneros(DNI),
foreign key (camiones_matricula) references camiones(matricula));

create table camiones(
matricula varchar(7) not null primary key,
modelo varchar(45) not null,
potencia int);


create table paquetes(
id_paquete int auto_increment not null primary key,
descripcion_paq varchar(45) not null,
destinatario varchar(45) not null,
direccion_destino varchar(45) not null,
DNI_camionero varchar(9),
id_provincia int,
foreign key(id_provincia) references provincias(id_provincia),
foreign key(DNI_camioneros) references provincias(id_provincia));

create table provincias(
id_provincia int not null primary key,
nombre varchar(45) not null);
