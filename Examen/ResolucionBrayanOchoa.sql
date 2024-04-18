-- 1.	Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
 
 select empleado.nombre,departamento.* from empleado,departamento;

-- 2.	Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre del departamento 
-- (en orden alfabético) y en segundo lugar por los apellidos y el nombre de los empleados.

select empleado.nombre, departamento.* from empleado,departamento order by departamento.nombre asc;

select empleado.nombre, departamento.* from empleado,departamento order by empleado.nombre;

-- 3.	Devuelve un listado con el identificador y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.

select departamento.id,departamento.nombre from empleado,departamento where empleado.id_departamento = departamento.id group by departamento.id;

-- 4.	Devuelve un listado con el identificador, el nombre del departamento y el valor del presupuesto actual del que dispone, solamente de aquellos departamentos que tienen empleados. 
-- El valor del presupuesto actual lo puede calcular restando al valor del presupuesto inicial (columna presupuesto) el valor de los gastos que ha generado (columna gastos).

select departamento.id,departamento.nombre,departamento.presupuesto from empleado,departamento where empleado.id_departamento = departamento.id group by departamento.id;

-- 5.	Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
select distinct departamento.nombre from departamento,empleado where id_departamento = departamento.id =
(select distinct id_departamento from empleado where empleado.nif = '38382980M');


-- 6.	Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
select departamento.nombre from departamento,
(select nombre,apellido1,apellido2 from empleado where nombre = "Pepe" and apellido1 = "Ruiz" and apellido2 = "Santana") ;

-- 7.	Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.


-- 8.	Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.

(select id from departamento where nombre = "Sistemas" or nombre = "Contabilidad" or nombre = "I+D");

-- 9.	Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
-- 10.	Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea NULL. Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.
-- 11.	Obtener los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
select departamento.nombre,presupuesto from departamento where presupuesto between 100000 and 200000;
-- 12.	Obtener los departamentos donde los gastos son mayores que el presupuesto.
select departamento.nombre,presupuesto,gastos from departamento where gastos > presupuesto;
-- 13.	Obtener los departamentos donde los gastos son iguales al presupuesto.
select departamento.nombre,gastos,presupuesto from departamento where gastos = presupuesto;
-- 14.	Obtener todos los datos de los empleados cuyo segundo apellido es NULL.
select empleado.* from empleado where empleado.apellido2 is null;
-- 15.	Obtener todos los datos de los empleados cuyo segundo apellido es Díaz o Moreno.
select empleado.* from empleado where apellido2 = "Díaz" or apellido2 = "Moreno";
-- 16.	Obtener los nombres de los empleados cuyo segundo apellido es Díaz o Moreno utilizando el operador IN.
select empleado.nombre from empleado where apellido2 in("Díaz","Moreno");
-- 17.	Obtener los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
select empleado.nombre,apellido1,apellido2,nif from empleado,departamento where id_departamento in(2,4,5);
-- 18.	Obtener el nombre del departamento donde trabaja el empleado con nif 38382980M.
select  departamento.nombre from empleado,departamento where empleado.nif = '38382980M';
-- 19.	Obtener el nombre del departamento donde trabaja el empleado "Pepe Ruiz Santana".
-- 20.	Obtener los datos de los empleados que trabajan en el departamento de I+D ordenados alfabéticamente



-- Consultas multitabla (Composición externa). Resuelva las siguientes consultas utilizando las cláusulas JOIN.
-- 1.	Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. Este listado también debe incluir los empleados que no tienen 
-- ningún departamento asociado --

SELECT empleado.nombre,departamento.nombre as departamentos
FROM empleado
LEFT JOIN departamento ON empleado.id_departamento = departamento.id;

-- 2.	Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.

select distinct empleado.nombre from empleado join departamento on empleado.id_departamento = departamento.id is null;
-- 3.	Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.

select departamento.nombre from departamento left join empleado on departamento.id = empleado.id_departamento where empleado.id_departamento is null;

-- 4.	Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. El listado debe incluir los empleados que no tienen 
-- ningún departamento asociado y los departamentos que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.

SELECT empleado.nombre,departamento.nombre,departamento.presupuesto,departamento.gastos
FROM empleado
LEFT JOIN departamento ON empleado.id_departamento = departamento.id order by departamento.nombre;

-- 5.	Devuelve un listado con los empleados que no tienen ningún departamento asociado y los departamentos que no tienen ningún empleado asociado. 
-- Ordene el listado alfabéticamente por el nombre del departamento.
select empleado.nombre, departamento.nombre from departamento right join empleado on empleado.id_departamento = departamento.id 
where empleado.id_departamento is null order by departamento.nombre;
 
-- 6. 	Consulta para obtener un listado con los empleados y los datos de los departamentos donde trabajan cada uno.
select distinct departamento.*, empleado.nombre from departamento join empleado;
-- 7.	Consulta para obtener un listado con los empleados y los datos de los departamentos donde trabajan cada uno. Ordena el resultado alfabéticamente por el nombre del departamento y por los apellidos y el nombre de los empleados.
-- 8.	Consulta para obtener un listado con el identificador y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
-- 9.	Consulta para obtener un listado con el identificador, el nombre del departamento y el valor del presupuesto actual del que dispone, solamente de aquellos departamentos que tienen empleados.
-- 1 0.	Consulta para obtener el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
-- 11.	Consulta para obtener el nombre del departamento donde trabaja el empleado "Pepe Ruiz Santana".
-- 12. 	Consulta para obtener un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente por nombre, apellido1 y apellido2.
-- 13.	Consulta para obtener un listado con los datos de los empleados que trabajan en los departamentos de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente por nombre, apellido1 y apellido2.
-- 14.	Consulta para obtener una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.

select presupuesto,departamento.nombre from departamento where presupuesto not between 100000 and 200000;
-- 15.	Consulta para obtener un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea NULL. Ten en cuenta que no se deben mostrar nombres de departamentos que estén repetidos

-- Updates con condición: Resolver los siguientes updates utilizando en todos ellos consultas multitablas (subconsultas select y/o Join) 
-- 1.	Actualizar el presupuesto de todos los departamentos duplicando el presupuesto actual si los gastos superan los 20000 euros.

-- 2.	Cambiar el segundo apellido de los empleados en el departamento de 'Recursos Humanos' a 'Rodríguez' si actualmente es NULL.

-- 3.	Asignar el departamento con id 2 a los empleados cuyo apellido1 sea 'Salas' y el nombre del departamento actual sea distinto de 'Sistemas'.
-- 4. 	Asignar el departamento con id 4 a los empleados que actualmente trabajan en el departamento de 'Desarrollo' y tienen más de 3 años de antigüedad.
-- 5.	Cambiar el presupuesto de los departamentos que tienen más de 10 empleados asignados, reduciéndolo en un 10%.
-- 6.	Incrementar el presupuesto en un 8% para los departamentos donde el promedio de gastos por empleado sea mayor a 15000 euros.

