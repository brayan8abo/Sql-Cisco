-- 1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
select * from producto
WHERE codigo_fabricante = (SELECT codigo_fabricante FROM fabricante WHERE nombre = 'Lenovo');

-- 2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).

select * from producto where precio = 
(select max(precio) FROM producto where codigo_fabricante = 
(SELECT codigo_fabricante FROM fabricante WHERE nombre = 'Lenovo'));

-- 3. Lista el nombre del producto más caro del fabricante Lenovo.

select nombre from producto where precio =
(select max(precio) from producto where codigo_fabricante = 
(select codigo_fabricante from fabricante where nombre = 'Lenovo'));

-- 4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.

select * from producto where precio =
(select min(precio) from producto where codigo_fabricante = 
(select codigo_fabricante from fabricante where nombre = 'Hewlett-Packard'));

-- 5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.

select * from producto where precio >= 
(select max(precio) from producto where codigo_fabricante = 
(select codigo_fabricante from fabricante where nombre = 'Lenovo'));

select nombre, min(precio) from producto
where codigo_fabricante = (select codigo_fabricante from fabricante where nombre = 'Hewlett-Packard');

-- 6. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.

select * from producto where precio >
(select avg(precio) from producto where codigo_fabricante =
(select codigo_fabricante from fabricante where fabricante.nombre = 'Asus')) and 
producto.codigo_fabricante =(select fabricante.codigo_fabricante from fabricante where nombre = 'Asus');

-- Subconsultas (En la cláusula HAVING)

-- 7. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo

select nombre from fabricante
where codigo_fabricante in (select codigo_fabricante from producto group by codigo_fabricante 
having count(*) = (select count(*) from producto where codigo_fabricante = 
(select codigo_fabricante from fabricante where nombre = 'Lenovo')));

select f.nombre from fabricante f
join producto on f.codigo_fabricante = producto.codigo_fabricante 
group by f.nombre
having count(*) = (select count(*) from producto where codigo_fabricante = 
(select codigo_fabricante from fabricante where nombre = 'Lenovo'));

-- Subconsultas con ALL y ANY
-- 8. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.

select * from  producto
where precio > all (select precio from producto);

-- 9. Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.

select * from  producto
where precio <= all (select precio from producto);

-- 10. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).

select nombre from fabricante
where codigo_fabricante <> all (select  codigo_fabricante from producto);

select nombre from fabricante
where codigo_fabricante = some (select  codigo_fabricante from producto);

select nombre from fabricante
where codigo_fabricante <> all(select  codigo_fabricante from producto);


-- 11. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
select nombre from fabricante
where codigo_fabricante  >= all (select codigo_fabricante from producto where codigo_fabricante >=0);

select nombre
from fabricante 
where codigo_fabricante = all (select codigo_fabricante FROM producto);


-- Subconsultas (En la cláusula WHERE):

-- Subconsultas con IN y NOT IN

-- 12. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).

select nombre from fabricante
where codigo_fabricante in (select codigo_fabricante from producto);

-- 13. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
select nombre from fabricante
where codigo_fabricante not in (select codigo_fabricante from producto);


-- Subconsultas con EXISTS y NOT EXISTS

-- 14. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

select nombre from fabricante
where exists  (select codigo_fabricante from producto where fabricante.codigo_fabricante = producto.codigo_fabricante);

-- 15. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
select nombre from fabricante
where not exists  (select codigo_fabricante from producto where fabricante.codigo_fabricante = producto.codigo_fabricante);

-- Subconsultas correlacionadas

-- 16. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.

select nombre from fabricante where codigo_fabricante=
(select nombre,max(precio) from producto where codigo_fabricante>=0);


SELECT fabricante.nombre, producto.nombre, producto.precio from fabricante join
    producto on fabricante.codigo_fabricante = producto.codigo_fabricante where
    producto.precio = (select MAX(precio) from producto where codigo_fabricante = fabricante.codigo_fabricante);


-- 17. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.

SELECT fabricante.nombre, producto.nombre, producto.precio from fabricante join
    producto on fabricante.codigo_fabricante = producto.codigo_fabricante where
    producto.precio = (select MAX(precio) from producto where codigo_fabricante = fabricante.codigo_fabricante);

-- 18. Lista el nombre del producto más caro del fabricante Lenovo.

















