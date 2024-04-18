create database BIBLIOTECA;
use BIBLIOTECA;

create table libros(
id_libros int not null primary key unique,
titulo varchar(45) not null,
editorial varchar(45) not null,
paginas int not null,
resumen blob not null,
cantidad int not null,
ISBN varchar (20)
);

create table PrestamosLibros(
libros_id_libros int not null unique,
socios_id_socios int not null unique,
estado varchar(45) not null,
fecha_prestamo date not null,
fecha_devolucion date not null,
multa double not null,
primary key(libros_id_libros, socios_id_socios),
foreign key (libros_id_libros) references libros(id_libros),
foreign key(socios_id_socios) references socios(id_socios)
);

create table socios(
id_socios int not null unique primary key auto_increment,
nombre_socios varchar(35) not null,
apellido_socios varchar(35) not null,
nacimiento_socios date,
direccion_socios varchar(50) not null,
e_mail varchar(50) not null
);

create table autores(
id_autores int not null primary key unique,
nombre_autores varchar(45) not null,
apellidos_autores varchar(45) not null,
nacionalidad varchar(45) not null,
nacimiento date,
biografia blob not null
);

create table LibrosAutores(
libros_id_libros int not null unique,
autores_id_autores int not null unique,
primary key(libros_id_libros, autores_id_autores),
foreign key (libros_id_libros) references libros(id_libros),
foreign key (autores_id_autores) references autores(id_autores)
);

create table SociosTelefonos(
socios_id_socios int not null,
telefonos_N_telefonos int not null,
primary key(socios_id_socios, telefonos_N_telefonos),
foreign key(socios_id_socios) references socios(id_socios),
foreign key(telefonos_N_telefonos) references telefonos(N_telefonos)
);

/*--SE USA EL ALTER PARA MODIFICAR, AGREGAR, BORRAR O CAMBIAR ALGO DENTRO DE UNA TABLA*/

alter table socios add DNI varchar(9);
alter table socios change column DNI DNI varchar(9) not null;
alter table socios drop DNI;


create table telefonos(
N_telefonos int not null primary key unique
);
