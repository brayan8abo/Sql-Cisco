create database empresa;
use empresa;
create table CLIENTES (
id_Cliente int not null primary key, 
dni varchar(9) not null unique,
nombre varchar(20)not null,
apellidos varchar(50)not null,
direccion varchar(100)not null,
fecha_nacimiento date);

create table comprar (
id_cliente int not null,
id_codigo int not null,
primary key  (id_cliente, id_codigo),
foreign key  (id_Cliente) references clientes(id_cliente),
foreign key (id_codigo) references productos(id_producto));

create table PRODUCTOS(
id_producto int auto_increment not null primary key ,
nombre_prod varchar(30) not null,
precio_unitario double not null);

create table PROVEEDORES(
id_proveedores int not null primary key auto_increment,
NIF  varchar(9) not null unique,
direccion varchar(100) not null,
nombre_proveedor varchar(50)not null,
productos_id_productos int,
foreign key(productos_id_productos) references productos(id_Producto))

alter table clientesclientes


drop table proveedores;





