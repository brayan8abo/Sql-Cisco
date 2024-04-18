-- Subconsultas (En la cláusula WHERE):
-- Con operadores básicos de comparación
-- 1. Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).

select  *
FROM pedido
where id_cliente = (select id from cliente where nombre = 'Adela');

-- 2. Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)

select  *
FROM pedido
where id_comercial = (select id from comercial where nombre = 'Daniel' and apellido1 = "Saez" and apellido2 = "Vega");


-- 3. Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)

select * from cliente 
where id = (select id_cliente from pedido where total = (select max(total) from pedido where year (fecha) =   "2019"));


-- 4. Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.

select fecha, total from pedido where id_cliente =
(select id from cliente where nombre = "Pepe" and apellido1 = "Ruiz" and apellido2 = "Santana") ORDER BY total asc limit 1; -- funciona igual

select * from cliente
where id = (select id_cliente from pedido where total = (select min(total) from pedido where id_cliente =( select id from cliente where nombre = "Pepe" and apellido1 = "Ruiz" and apellido2 = "Santana")));

select fecha, total from pedido where total = (select min(total) from pedido where id_cliente =(select id from cliente where nombre = "Pepe" and apellido1 = "Ruiz" and apellido2 = "Santana")); -- correcta

-- 5. Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un 
-- pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.

select * from cliente join pedido on pedido.id_cliente = cliente.id where year (pedido.fecha) = (2017) and total >= (select avg(total) from pedido);


-- Subconsultas con ALL y ANY
-- 6. Devuelve el pedido más caro que existe en la tabla pedido si hacer uso de MAX, ORDER BY ni LIMIT.

select * from  pedido
where total > any (select total from pedido where total > total);

select * from pedido p1 where total >= ANY 
(select total from pedido p2 where p2.total IS NOT NULL AND NOT EXISTS (select 1 from pedido p3 where p3.total >p2.total));

-- EL 1 EN ESTE SELECT HACE UNA BUSQUEDA PARA SABER QUE EXISTE LA CONDICIÓN 





select max(total) from pedido;




-- 7. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando ANY o ALL).

select nombre from cliente
where id <> all (select id_cliente from pedido);

select nombre from cliente
where id > all (select id_cliente from pedido);

select * from cliente
where id <> all (select id_cliente from pedido);

-- 8. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando ANY o ALL).

select * from comercial  where id != all (select id_comercial from pedido);

-- Subconsultas con IN y NOT IN

-- 9. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).

select * from cliente
where id not in (select id_cliente from pedido);

-- 10. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
select * from comercial
where id not in (select id_comercial from pedido);

-- Subconsultas con EXISTS y NOT EXISTS

-- 11. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).

select * from cliente where not exists (select * from pedido where pedido.id_cliente = cliente.id);

-- 12. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).

select * from comercial where not exists (select * from pedido where pedido.id_comercial = comercial.id);


