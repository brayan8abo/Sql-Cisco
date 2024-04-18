/* 1. Calcula el numero total de productos que hay en la tabla productos*/

select count(*) from producto;

/* 2. Calcula el numero total de fabricantes que hay en la tabla fabricantes*/

select count(*) from fabricante;

/* 3. Calcula el numero de valores distintos de identificador de fabricante que aparecen en la tabla productos*/

select count(distinct codigo_fabricante) as "Valores distintos" from producto;

/* 4. Calcula la media del precio de todos los productos*/

select avg(precio) from producto;

/*5. Calcula el precio mas barato de todos los productos*/

select min(precio) as precio_mas_bajo from producto;

/* 6. Calcular el precio mas alto de todos los productos*/

select max(precio) as precio_mas_alto from producto;

/* 7 . Lista el nombre y el precio del producto mas barato*/

select nombre,precio from producto order by precio limit 1;

/*8. Lista el nombre y el precio del producto mas caro*/

select nombre,precio from producto order by precio desc limit 1;

/*9. Calcula la suma de todos los precios de los productos*/

select sum(precio) from producto;

/*10. Calcula el numero de producto que tiene Asus*/

select count(nombre) from producto where codigo_fabricante =1;

/*11. Calcula la media del precio de todos los productos del fabricante asus*/

select avg(precio) from producto where codigo_fabricante =1;

/*12. Calcula el precio mas barato de todos los producto del fabricante asus*/

select min(precio) from producto where codigo_fabricante =1;

/*13. Calcula el precio mas caro de todos los producto del fabricante asus*/

select max(precio) from producto where codigo_fabricante =1;

/* 14. CAlcula la suma de todos los productos del fabricante Asus*/

select sum(precio) from producto where codigo_fabricante= 1;

/*15. Muestra el precio maximo, precio minimo, precio medio y el numero total de producto que tiene el fabricante Crucial*/

select max(precio) as "precio maximo", min(precio) as "precio medio", avg(precio), count(*) from producto where codigo_fabricante=6;

/*16.Muestra el número total de productos que tiene cada uno de los fabricantes. 
El listado también debe incluir los fabricantes que no tienen ningún producto. 
El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. 
Ordene el resultado descendentemente por el número de productos.*/

select fabricante.nombre, count(producto.id) FROM fabricante
left join producto  on fabricante.codigo_fabricante = producto.codigo_fabricante group by fabricante.codigo_fabricante
order by count(producto.nombre) DESC;


/* 17.Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado 
mostrará el nombre del fabricante junto con los datos que se solicitan.*/

select max(precio), min(precio), avg(precio), fabricante.nombre from fabricante join producto on fabricante.codigo_fabricante = producto.codigo_fabricante group by fabricante.nombre;

/*18.Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes 
que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.*/



/* 19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, 
precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.*/


/*20.Calcula el número de productos que tienen un precio mayor o igual a 180€.*/

select count(*) from producto where precio >= 180;

/*21.Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.*/
select count(*) from producto join fabricante on fabricante.codigo_fabricante = producto.codigo_fabricante where precio >=180 group by fabricante.codigo_fabricante;

/*22.Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.*/

select avg(producto.precio), fabricante.codigo_fabricante from producto join fabricante on fabricante.codigo_fabricante= producto.codigo_fabricante group by fabricante.codigo_fabricante;

/*23.Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.*/
select max(producto.precio), fabricante.nombre from producto join fabricante on fabricante.codigo_fabricante= producto.codigo_fabricante group by fabricante.codigo_fabricante;

/*24.Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.*/


/*29. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, 
precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.*/

select producto.nombre, producto.precio,fabricante.nombre from producto join fabricante on  producto.codigo_fabricante =fabricante.codigo_fabricante where (producto.precio, fabricante.nombre) 
in (select max(precio), fabricante.nombre from producto join fabricante on producto.codigo_fabricante = fabricante.codigo_fabricante group by fabricante.nombre) order by fabricante;

alter table fabricante add column id_producto int(4);
alter table fabricante add column id_producto2 int;
alter table fabricante drop id_producto, drop id_producto2;
select * from fabricante;
alter table fabricante add column id_producto2 int first;
alter table fabricante add column id_producto3 int after codigo_fabricante;
alter table fabricante change id_producto3 codigo_fabricante2 int;
alter table fabricante add holamundo int;
alter table fabricante modify column holamundo varchar(42);
insert into fabricante (codigo_fabricante,nombre) values (1000, "Noel");
insert into fabricante values (850,514,1475,"Pablo","Putos");

delete from fabricante where nombre = "Pablo";
delete from fabricante where nombre = "Noel";

select count(codigo_fabricante)  from fabricante group by codigo_fabricante having count (codigo_fabricante) >5;

-- truncate; -- elimina la tabla y vuelve y la crea vacia
