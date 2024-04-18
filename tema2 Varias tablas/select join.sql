select * from departamento inner join empleado
on departamento.coddepartamento=empleado.coddepartamento;

select * from empleado inner join departamento
on departamento.coddepartamento=empleado.coddepartamento;

select * from departamento,empleado where departamento.coddepartamento = empleado.coddepartamento;



select * from departamento cross join empleado  using (coddepartamento,nombre);  -- los campos de las tablas deben llamarse igual para poder usarle (using) de lo contrario no funcionaria...

select * from departamento cross join empleado on departamento.coddepartamento=empleado.coddepartamento;

select * from departamento natural join empleado; -- tambien debe usarse cuando todos los campos se llamen igual, por ejemplo aca coddepartamento y nombre, ay que el coddepartamento es el 3 y el 
-- nombre del departamento es RRHH por ende me lo saca por pantalla, ya que coinciden de lo contrario no saldria.

select * from empleado left outer join departamento on departamento.coddepartamento = empleado.coddepartamento; -- me muestra todo lo de la izquierda y la interseccion, igual parasaria
-- con el rigth y con el full, el full me enseñaria todo. incluyendo la interseccion, sin imporatar relacion. lo que no este relacionado me lo muestra nulo.

select * from empleado right outer join departamento on departamento.coddepartamento = empleado.coddepartamento; -- con este solo me saldrian los que tienen relacion, por que estamos empezando con el rigth, si tuviese algo en los departamentos sin improtar si tiene empleado, me saldria el departamento con el empleado a nulo.

select * from empleado left join departamento on departamento.coddepartamento = empleado.coddepartamento
union 
select * from empleado right join departamento on empleado.coddepartamento= departamento.coddepartamento; -- el union sirve para coger todo los datos de varias tablas.

select * from empleado natural left join departamento; -- me saca todo, cuando los campos se llaman igual, en este caso, me muestra los coddepartamento ya que son iguales, si varios columnas tienen el mismo nombre seria otra cosa

select * from empleado as e left join departamento as d on d.coddepartamento = e.coddepartamento
union 
select * from empleado as e right join departamento as d on e.coddepartamento= d.coddepartamento; -- se puede usar el AS para darle nombre a algo y no tener la necesidad de escribir todo

-- 

select * from join1.empleado as empleado inner join join.departamento
on empleado.coddepartamento = departamento.coddepartamento; -- este me sirve para unir dos bases de datos y usar sus tablas
 -- con el inner join si tengo infinidad de tablas solo me sacara la interseccion

