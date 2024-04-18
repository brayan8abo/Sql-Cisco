DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;
CREATE TABLE fabricante (
codigo_fabricante INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);
CREATE TABLE producto (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DOUBLE NOT NULL,
codigo_fabricante INT UNSIGNED NOT NULL,
FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo_fabricante)
);
INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);
select nombre from producto;
select nombre , precio from producto;
select * from producto;
select nombre , precio , precio * 1.09 from producto;
select nombre , precio as 'Precio Euros €' , precio * 1.09 as 'Precios en dolares'
from producto;
select upper(nombre), precio from producto;
select lower(nombre), precio from producto;
select nombre , upper(substr(nombre,1,2)) from fabricante;
select nombre , round(precio) from producto;
select nombre , truncate(precio,0) from producto;
select codigo_fabricante from producto where id;
select distinct codigo_fabricante from producto;
select nombre from fabricante order by nombre ASC;
select nombre from fabricante order by nombre DESC;
select nombre, precio from producto order by nombre ASC, precio DESC ;
select * from fabricante limit 5;
select * from fabricante limit 2 offset 3;
select nombre , precio from producto order by precio asc limit 1;
select nombre , precio from producto order by precio desc limit 1;
select nombre from producto where codigo_fabricante = 2;
select nombre from producto where precio <= 120;
select nombre from producto where precio >= 400;
select nombre from producto where precio <= 400;
select * from producto where precio >= 80 and precio <= 300;
select * from producto where precio between 60 and 200;
select nombre from producto where precio > 200 and codigo_fabricante = 6;
select * from producto where codigo_fabricante = 1 or codigo_fabricante = 3 or
codigo_fabricante = 5;
select * from producto where codigo_fabricante in (1,3,5);
select nombre , precio * 100 as 'CENTIMOS' from producto;
select nombre from fabricante where nombre like "S%" ;
select nombre from fabricante where nombre like "%E";
select nombre from fabricante where nombre like "%W%";
select nombre from fabricante where nombre like "____";
select nombre from producto where nombre like "%Portatil%";
select nombre from producto where nombre like "%monitor%" && precio < 215;
select nombre, precio from producto where precio >= 180 order by precio desc,
nombre asc;