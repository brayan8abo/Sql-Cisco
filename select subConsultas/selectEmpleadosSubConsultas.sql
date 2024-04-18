-- Subconsultas (En la cláusula WHERE):
-- Con operadores básicos de comparación
-- 1. Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN).

select * from empleado where id_departamento = ( select id from departamento where nombre = "Sistemas");

-- 2. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.

select nombre,presupuesto from departamento where presupuesto = (select max(presupuesto) from departamento);

-- 3. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.

select nombre,presupuesto from departamento where presupuesto = (select min(presupuesto) from departamento);

-- Subconsultas con ALL y ANY
-- 4. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MAX, ORDER BY ni LIMIT.

select nombre,presupuesto from departamento where presupuesto  >= all ( select presupuesto from departamento);

-- 5. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MIN, ORDER BY ni LIMIT.

select nombre,presupuesto from departamento where presupuesto  <= all ( select presupuesto from departamento);

-- 6. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando ALL o ANY).

select nombre
from departamento
where id = any (select id_departamento from empleado);



-- 7. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando ALL o ANY).

select nombre from departamento
where id  <> all (select id_departamento from empleado); -- POR RESOLVER

select nombre from departamento where id <> all (select  id_departamento from empleado where departamento.id = empleado.id_departamento);
-- Subconsultas con IN y NOT IN
-- 8. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando IN o NOT IN).

Select nombre from departamento
where id in (select id_departamento from empleado);

-- 9. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN).

Select nombre from departamento
where id not in (select id_departamento from empleado where departamento.id = empleado.id_departamento);

-- Subconsultas con EXISTS y NOT EXISTS
-- 10. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).

select nombre from departamento
where exists  (select id_departamento from empleado where departamento.id = id_departamento);
-- 11. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).

select nombre from departamento
where not exists  (select id_departamento from empleado where departamento.id = empleado.id_departamento);
