/* 1: Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los
productos de la base de datos.*/ -- los de abajo me valen los tres para hacer la misma consulta
select producto.nombre, precio, fabricante.nombre  from producto,fabricante where producto.codigo_fabricante= fabricante.codigo_fabricante; -- se puede poner en el from producto as p para solo llamar p.nombre ( llamamos la tabla producto y la columna nombre)

select producto.nombre as nombre_producto , precio, fabricante.nombre as nombre_fabricante  from producto INNER JOIN fabricante on producto.codigo_fabricante= fabricante.codigo_fabricante; -- con el inner join hago lo mismo, sin usar el where

select producto.nombre as nombre_producto , precio, fabricante.nombre as nombre_fabricante  from producto JOIN fabricante on producto.codigo_fabricante= fabricante.codigo_fabricante; --  se puede poner solo join funciona igual

select producto.nombre as nombre_producto , precio, fabricante.nombre as nombre_fabricante  from producto right JOIN fabricante on producto.codigo_fabricante= fabricante.codigo_fabricante;

select producto.nombre as nombre_producto , precio, fabricante.nombre as nombre_fabricante  from producto left JOIN producto on producto.codigo_fabricante= fabricante.codigo_fabricante;

select producto.nombre as nombre_producto , precio, fabricante.nombre as nombre_fabricante  from producto left join fabricante on producto.codigo_fabricante= fabricante.codigo_fabricante
union 
select producto.nombre as nombre_producto , precio, fabricante.nombre as nombre_fabricante  from producto right join fabricante on producto.codigo_fabricante= fabricante.codigo_fabricante;

/*2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los
productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden
alfabético.*/

select producto.nombre, precio, fabricante.nombre  from producto,fabricante where producto.codigo_fabricante= fabricante.codigo_fabricante order by fabricante.nombre;

select fabricante.nombre,producto.nombre, precio  from fabricante,producto where producto.codigo_fabricante= fabricante.codigo_fabricante order by fabricante.nombre;

select fabricante.nombre, producto.nombre, precio from fabricante inner join producto on producto.codigo_fabricante= fabricante.codigo_fabricante order by fabricante.nombre;

/*3. Devuelve una lista con el identificador del producto, nombre del producto, identificador del
fabricante y nombre del fabricante, de todos los productos de la base de datos.*/

select producto.id, producto.nombre, fabricante.codigo_fabricante,fabricante.nombre from producto join fabricante on producto.codigo_fabricante=fabricante.codigo_fabricante;

/*4. Devuelve el nombre del producto, su precio y el nombre del fabricante, del producto más barato*/

select producto.nombre, precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo_fabricante order by producto.precio asc limit 1;

/* 5. Devuelve el nombre del producto, su precio y el nombre de su favricante, del producto más caro*/

select producto.nombre, precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo_fabricante order by producto.precio desc limit 1;

/* 6. Devuelve una lista de todos los productos del fabricante Lenovo*/

select producto.nombre, producto.precio from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo_fabricante where fabricante.nombre = "LENOVO";

/* 7. Devuelve una lista de todos los producto del fabricante Crucial que tengan un precio mayor de 200€*/

select producto.nombre, producto.precio from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo_fabricante where fabricante.nombre =  "Crucial" and producto.precio > 200;

/* 8.Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y
Seagate. Sin utilizar el operador IN*/

select producto.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo_fabricante where fabricante.nombre = "Asus"  or fabricante.nombre = "Hewlett-Packard" or fabricante.nombre = "Seagate";

/* 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y
Seagate. Utilizando el operador IN.*/

select producto.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo_fabricante where fabricante.nombre in ("Asus","Hewlett-Packard","Seagate");

/*10.Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes
cuyo nombre termine por la vocal e*/

select producto.nombre, producto.precio from producto join fabricante on producto.codigo_fabricante = fabricante.codigo_fabricante where fabricante.nombre like "%e";

/*11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de
fabricante contenga el carácter w en su nombre*/

select producto.nombre, producto.precio from producto join fabricante on producto.codigo_fabricante = fabricante.codigo_fabricante where fabricante.nombre like "%w%";

/*12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos
los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar
por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)*/

select producto.nombre, precio, fabricante.nombre from producto join fabricante on producto.codigo_fabricante = fabricante.codigo_fabricante where producto.precio >= 180 order by producto.precio desc, producto.nombre asc;
-- select producto.nombre, precio, fabricante.nombre from producto join fabricante on producto.codigo_fabricante = fabricante.codigo_fabricante where producto.nombre >= 180 order by producto.precio;


/*13. Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos
fabricantes que tienen productos asociados en la base de datos*/


select distinct fabricante.codigo_fabricante, fabricante.nombre from producto join fabricante on producto.codigo_fabricante=fabricante.codigo_fabricante;

select  fabricante.codigo_fabricante, fabricante.nombre from producto join fabricante on producto.codigo_fabricante=fabricante.codigo_fabricante group by codigo_fabricante,fabricante.nombre;


/*1.Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los
productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes
que no tienen productos asociados*/

select fabricante.nombre, producto.nombre from fabricante left JOIN producto on producto.codigo_fabricante= fabricante.codigo_fabricante;


/*2. Devuelve un listado donde sólo aparezan aquellos fabricantes que no tienen ningun producto asociado*/


select fabricante.nombre, producto.nombre from fabricante left JOIN producto on producto.codigo_fabricante= fabricante.codigo_fabricante where producto.nombre IS NULL;

select fabricante.nombre, producto.nombre from producto right JOIN fabricante on producto.codigo_fabricante= fabricante.codigo_fabricante where producto.codigo_fabricante IS NULL;

/* 3. ¿Pueden existir productos que no estén relacionados con un fabricante? Explica el por que*/
-- No por que tienen que estar relacinados, no existe ninguna foreing key





