select fabricante.nombre, count(producto.id) from fabricante inner join producto 
on producto.codigo_fabricante = fabricante.codigo_fabricante 
group by fabricante.nombre 
having count(producto.id) 
= (select count(*) from producto 
inner join fabricante 
on producto.codigo_fabricante = fabricante.codigo_fabricante
 where fabricante.nombre ='Asus');
 
 -- Devuelve un listado de todos los productos que tienen un precio mayor o igual al precio medio de todos los productos de su mismo fabricante
 
select * from producto inner join 
(select codigo_fabricante, avg(precio) as media 
from producto group by codigo_fabricante) as t on producto.codigo_fabricante = t.codigo_fabricante where producto.precio >= t.media;


SELECT nombre,precio
FROM producto
WHERE precio = (SELECT MAX(precio) FROM producto);





