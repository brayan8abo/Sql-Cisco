/*Consultas multitabla (Composición interna). Resuelva las siguientes
consultas sin usar JOIN de tablas.

1. Devuelve un listado con los empleados y los datos de los
departamentos donde trabaja cada uno.*/

SELECT 
    empleado.*, departamento.*
FROM
    empleado,
    departamento
WHERE
    empleado.id_departamento = departamento.id;


/*2. Devuelve un listado con los empleados y los datos de los
departamentos donde trabaja cada uno. Ordena el resultado, en primer
lugar por el nombre del departamento (en orden alfabético) y en segundo
lugar por los apellidos y el nombre de los empleados.*/


SELECT 
    empleado.id, empleado.nombre, departamento.*
FROM
    empleado,
    departamento
WHERE
    empleado.id_departamento = departamento.id
ORDER BY departamento.nombre , empleado.apellido1 , empleado.apellido2 , empleado.nombre;



/*3. Devuelve un listado con el identificador y el nombre del
departamento, solamente de aquellos departamentos que tienen
empleados.*/


SELECT DISTINCT
    departamento.id, departamento.nombre
FROM
    empleado,
    departamento
WHERE
    empleado.id_departamento = departamento.id;

/*4. Devuelve un listado con el identificador, el nombre del
departamento y el valor del presupuesto actual del que dispone,
solamente de aquellos departamentos que tienen empleados. El valor del
presupuesto actual lo puede calcular restando al valor del presupuesto
inicial (columna presupuesto) el valor de los gastos que ha generado
(columna gastos).*/

SELECT DISTINCT
    departamento.id,
    departamento.nombre,
    departamento.presupuesto - departamento.gastos
FROM
    departamento,
    empleado
WHERE
    empleado.id_departamento = departamento.id;

/*5. Devuelve el nombre del departamento donde trabaja el empleado
que tiene el nif 38382980M.*/

SELECT 
    (SELECT 
            nombre
        FROM
            departamento
        WHERE
            id = empleado.id_departamento) nombreDepto
FROM
    empleado
WHERE
    nif = '38382980M';


/*6. Devuelve el nombre del departamento donde trabaja el empleado
Pepe Ruiz Santana.*/

SELECT 
    (SELECT 
            nombre
        FROM
            departamento
        WHERE
            id = empleado.id_departamento) AS Nombre_Departamento
FROM
    empleado
WHERE
    nombre = 'Pepe' AND apellido1 = 'Ruiz'
        AND apellido2 = 'Santana';

/*7. Devuelve un listado con los datos de los empleados que trabajan en
el departamento de I+D. Ordena el resultado alfabéticamente.*/


select empleado.* from empleado,departamento where empleado.id_departamento = departamento.id and departamento.nombre = "I+D" order by empleado.nombre;


/*8. Devuelve un listado con los datos de los empleados que trabajan en
el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado
alfabéticamente.*/

SELECT 
    empleado.*
FROM
    empleado,
    departamento
WHERE
    empleado.id_departamento = departamento.id
        AND departamento.nombre = 'Sistemas'
        OR 'Contabilidad'
        OR 'I+D'
ORDER BY empleado.nombre;



/*9. Devuelve una lista con el nombre de los empleados que tienen los
departamentos que no tienen un presupuesto entre 100000 y 200000
euros.*/

SELECT DISTINCT
    empleado.nombre
FROM
    empleado,
    departamento
WHERE
    departamento.presupuesto NOT BETWEEN 100000 AND 200000;


/*10. Devuelve un listado con el nombre de los departamentos donde
existe algún empleado cuyo segundo apellido sea NULL. Tenga en cuenta
que no debe mostrar nombres de departamentos que estén repetidos.*/

SELECT DISTINCT
    departamento.nombre
FROM
    empleado,
    departamento
WHERE
    empleado.id_departamento = departamento.id
        AND empleado.apellido2 IS NULL;




/*11. Obtener los departamentos que no tienen un presupuesto entre
100000 y 200000 euros.*/


SELECT 
    departamento.nombre
FROM
    departamento
WHERE
    presupuesto NOT BETWEEN 100000 AND 200000;



/*12. Obtener los departamentos donde los gastos son mayores que el
presupuesto.*/

SELECT 
    departamento.nombre
FROM
    departamento
WHERE
    gastos > presupuesto;


/*13. Obtener los departamentos donde los gastos son iguales al
presupuesto.*/ 

SELECT 
    departamento.nombre
FROM
    departamento
WHERE
    gastos = presupuesto;


/* 14. Obtener todos los datos de los empleados cuyo segundo apellido es
NULL.*/

SELECT 
    empleado.*
FROM
    empleado
WHERE
    apellido2 IS NULL;


/*15. Obtener todos los datos de los empleados cuyo segundo apellido es
Díaz o Moreno.*/

SELECT 
    empleado.*
FROM
    empleado
WHERE
    apellido2 = 'Díaz' OR 'Moreno';

/* 16. Obtener los nombres de los empleados cuyo segundo apellido es
Díaz o Moreno utilizando el operador IN.*/

SELECT 
    empleado.*
FROM
    empleado
WHERE
    apellido2 IN ('Díaz' , 'Moreno');

/* 17. Obtener los nombres, apellidos y nif de los empleados que trabajan
en los departamentos 2, 4 o 5.*/

SELECT DISTINCT
    empleado.nombre,
    empleado.apellido1,
    empleado.apellido2,
    empleado.nif
FROM
    empleado,
    departamento
WHERE
    departamento.id = 2 OR 4 OR 5;



/*18. Obtener el nombre del departamento donde trabaja el empleado
con nif 38382980M.*/

SELECT 
    (SELECT 
            nombre
        FROM
            departamento
        WHERE
            id = empleado.id_departamento) nombreDepto
FROM
    empleado
WHERE
    nif = '38382980M';


/*19. Obtener el nombre del departamento donde trabaja el empleado
"Pepe Ruiz Santana".*/

SELECT 
    (SELECT 
            nombre
        FROM
            departamento
        WHERE
            id = empleado.id_departamento) nombreDepto
FROM
    empleado
WHERE
    empleado.nombre = 'Pepe'
        AND apellido1 = 'Ruiz'
        AND apellido2 = 'Santana';
    
/*20. Obtener los datos de los empleados que trabajan en el
departamento de I+D ordenados alfabéticamente.*/

SELECT 
    empleado.*
FROM
    empleado,
    departamento
WHERE
    empleado.id_departamento = departamento.id
        AND departamento.nombre = 'I+D'
ORDER BY empleado.nombre;



/*Consultas multitabla (Composición externa). Resuelva las siguientes
consultas utilizando las cláusulas JOIN.*


1. Devuelve un listado con todos los empleados junto con los datos de
los departamentos donde trabajan. Este listado también debe incluir los
empleados que no tienen ningún departamento asociado.*/

SELECT 
    empleado.id, empleado.nombre, departamento.nombre
FROM
    empleado
        LEFT JOIN
    departamento ON departamento.id = empleado.id_departamento;


/*2. Devuelve un listado donde sólo aparezcan aquellos empleados que
no tienen ningún departamento asociado.*/

SELECT 
    empleado.nombre
FROM
    empleado
        LEFT JOIN
    departamento ON departamento.id = empleado.id_departamento
WHERE
    departamento.id IS NULL;



/*3. Devuelve un listado donde sólo aparezcan aquellos departamentos
que no tienen ningún empleado asociado.*/

SELECT 
    departamento.nombre
FROM
    departamento
        LEFT JOIN
    empleado ON departamento.id = empleado.id_departamento
WHERE
    empleado.id_departamento IS NULL;



/*4. Devuelve un listado con todos los empleados junto con los datos de
los departamentos donde trabajan. El listado debe incluir los empleados
que no tienen ningún departamento asociado y los departamentos que no
tienen ningún empleado asociado. Ordene el listado alfabéticamente por
el nombre del departamento.*/

SELECT 
    empleado.nombre AS Nombre_Empleado,
    empleado.nif AS NIF,
    departamento.nombre AS Nombre_Departamento
FROM 
    empleado
LEFT JOIN 
    departamento ON empleado.id_departamento = departamento.id

UNION

SELECT 
    NULL AS Nombre_Empleado,
    NULL AS NIF,
    departamento.nombre AS Nombre_Departamento
FROM 
    departamento
LEFT JOIN 
    empleado ON departamento.id = empleado.id_departamento

WHERE 
    empleado.id_departamento IS NULL

ORDER BY 
    Nombre_Departamento;




/*5. Devuelve un listado con los empleados que no tienen ningún
departamento asociado y los departamentos que no tienen ningún
empleado asociado. Ordene el listado alfabéticamente por el nombre del
departamento.*/

select empleado.id,empleado.nombre
from empleado right join departamento on empleado.id_departamento = departamento.id
union
select null as nombre_empleado, null as id_empleado, departamento.nombre
from departamento
right join empleado on departamento.id =  empleado.id_departamento
where empleado.id_departamento is null
order by departamento.nombre;


/*6. Consulta para obtener un listado con los empleados y los datos de
los departamentos donde trabajan cada uno.*/


SELECT 
    empleado.id, empleado.nombre, departamento.*
FROM
    empleado
        JOIN
    departamento ON empleado.id_departamento = departamento.id;



/*7. Consulta para obtener un listado con los empleados y los datos de
los departamentos donde trabajan cada uno. Ordena el resultado
alfabéticamente por el nombre del departamento y por los apellidos y el
nombre de los empleados.*/

SELECT 
    empleado.id, empleado.nombre, departamento.*
FROM
    empleado
        JOIN
    departamento ON departamento.id = empleado.id_departamento
ORDER BY departamento.nombre , apellido2 , apellido1 , empleado.nombre;



/*8. Consulta para obtener un listado con el identificador y el nombre
del departamento, solamente de aquellos departamentos que tienen
empleados.*/

SELECT DISTINCT
    departamento.id, departamento.nombre
FROM
    departamento
        JOIN
    empleado ON departamento.id = empleado.id_departamento;

/*9. Consulta para obtener un listado con el identificador, el nombre del
departamento y el valor del presupuesto actual del que dispone,
solamente de aquellos departamentos que tienen empleados.*/

SELECT DISTINCT
    departamento.id,
    departamento.nombre,
    departamento.presupuesto - departamento.gastos AS presupuestoActual
FROM
    departamento
        JOIN
    empleado ON empleado.id_departamento = departamento.id;


/*10. Consulta para obtener el nombre del departamento donde trabaja
el empleado que tiene el nif 38382980M.*/

SELECT 
    departamento.nombre
FROM
    departamento
        JOIN
    empleado ON departamento.id = empleado.id_departamento
WHERE
    empleado.nif = '38382980M';


/*11. Consulta para obtener el nombre del departamento donde trabaja
el empleado "Pepe Ruiz Santana".*/

SELECT 
    departamento.nombre
FROM
    departamento
        JOIN
    empleado ON departamento.id = empleado.id_departamento
WHERE
    empleado.nombre = 'Pepe'
        AND apellido1 = 'Ruiz'
        AND apellido2 = 'Santana';
        
        
        
/*12. Consulta para obtener un listado con los datos de los empleados
que trabajan en el departamento de I+D. Ordena el resultado
alfabéticamente por nombre, apellido1 y apellido2.*/

SELECT 
    empleado.*
FROM
    empleado
        JOIN
    departamento ON departamento.id = empleado.id_departamento
WHERE
    departamento.nombre = 'I+D'
ORDER BY empleado.nombre , apellido1 , apellido2;


/*13. Consulta para obtener un listado con los datos de los empleados
que trabajan en los departamentos de Sistemas, Contabilidad o I+D.
Ordena el resultado alfabéticamente por nombre, apellido1 y apellido2.*/


SELECT 
    empleado.*
FROM
    empleado
        RIGHT JOIN
    departamento ON departamento.id = empleado.id_departamento
WHERE
    departamento.nombre = 'Sistemas'
        OR departamento.nombre = 'Contabilidad'
        OR departamento.nombre = 'I+D';


/*14. Consulta para obtener una lista con el nombre de los empleados
que tienen los departamentos que no tienen un presupuesto entre
100000 y 200000 euros.*/


SELECT 
    empleado.nombre, departamento.nombre
FROM
    empleado
        JOIN
    departamento ON departamento.id = empleado.id_departamento
WHERE
    departamento.presupuesto NOT BETWEEN 100000 AND 200000;

/*15. Consulta para obtener un listado con el nombre de los
departamentos donde existe algún empleado cuyo segundo apellido sea
NULL. Ten en cuenta que no se deben mostrar nombres de
departamentos que estén repetidos.*/



SELECT 
    departamento.nombre,
    departamento.id,
    empleado.id_departamento
FROM
    departamento
        JOIN
    empleado ON empleado.id_departamento = departamento.id
WHERE
    empleado.apellido2 IS NULL;
    
    
/*Updates con condición: Resolver los siguientes updates utilizando en
todos ellos consultas multitablas (subconsultas select y/o Join)
1. Actualizar el presupuesto de todos los departamentos duplicando el
presupuesto actual si los gastos superan los 20000 euros.*/

UPDATE departamento
SET 
    presupuesto = presupuesto * 2
WHERE
    (SELECT 
            departamento.presupuesto as Modificacion
        FROM
            departamento as modi
        WHERE
            gastos > 20000);
            
		

select count(departamento.presupuesto) from departamento where presupuesto > 20000;


2. Cambiar el segundo apellido de los empleados en el departamento
de 'Recursos Humanos' a 'Rodríguez' si actualmente es NULL.
3. Asignar el departamento con id 2 a los empleados cuyo apellido1
sea 'Salas' y el nombre del departamento actual sea distinto de 'Sistemas'.
4. Asignar el departamento con id 4 a los empleados que actualmente
trabajan en el departamento de 'Desarrollo' y tienen más de 3 años de
antigüedad.
5. Cambiar el presupuesto de los departamentos que tienen más de 10
empleados asignados, reduciéndolo en un 10%.
6. Incrementar el presupuesto en un 8% para los departamentos
donde el promedio de gastos por empleado sea mayor a 15000 euros.