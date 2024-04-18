-- Consultas en la tabla pacientes --
 -- 1. Seleccionar todos los pacientes --
 select * from pacientes;

 --  2. Listar solo los nombres y edades de los pacientes --
 select nombre,edad from pacientes;

 --  3. Filtrar pacientes mayores de 40 años --
 select * from pacientes where Edad > 40;

 --  4. Ordenar pacientes por edad de forma descendente --
 select * from pacientes ORDER BY edad DESC;

 --  5. Contar la cantidad total de pacientes --
 select COUNT(*) AS Total_pacientes from pacientes;

 --  6. Mostrar pacientes de genero femenino --
 select * from pacientes where genero = 'Femenino';

 --  7. Obtener el paciente más joven --
 select * from pacientes ORDER BY Edad ASC LIMIT 1;

 --  8. Filtrar pacientes cuyo nombre comienza con "A" --
 select * from pacientes where Nombre LIKE 'A%';

 --  9. Calcular el promedio de edades de los pacientes --
 select AVG(Edad) AS Promedio_Edad from pacientes;

 --  10. Seleccionar pacientes de una franja de edad específica --
 select * from pacientes where Edad BETWEEN 30 and 40;

 --  11. Encontrar pacientes cuyo nombre contiene "a" (mayúsculas o minúsculas) --
 select * from pacientes where Nombre LIKE '%a%';

 --  12. Mostrar pacientes ordenados alfabéticamente por nombre --
 select * from pacientes ORDER BY Nombre ASC;

 --  13. Contar la cantidad de pacientes de genero masculino --
 select COUNT(*) AS Total_Masculinos from pacientes where genero = 'Masculino';

 --  14. Obtener el paciente más anciano --
 select * from pacientes ORDER BY Edad DESC LIMIT 1;

 --  15. Filtrar pacientes que no tienen asignada una cama --
 select * from pacientes left join asignaciones ON pacientes.PacienteID = asignaciones.PacienteID where asignaciones.PacienteID IS NULL;


 --  Consultas con join:
  --  Consultas con join entre varias tablas
 --   1. Listar nombres de pacientes y tipos de cama asignados
 select pacientes.Nombre, camas.Tipo from pacientes
join asignaciones ON pacientes.PacienteID = asignaciones.PacienteID join camas ON asignaciones.CamaID = camas.CamaID; 

 --   2. Mostrar detalles de asignaciones con nombres de pacientes
select asignaciones.*, pacientes.Nombre AS Nombre_Paciente from asignaciones join pacientes ON asignaciones.PacienteID = pacientes.PacienteID;

 --   3. Obtener información completa de las asignaciones con detalles de camas


 --   4. Listar camas asignadas con detalles de pacientes
select camas.*, pacientes.* from camas join asignaciones ON camas.CamaID = asignaciones.CamaID join pacientes ON asignaciones.PacienteID = pacientes.PacienteID;

 --   5. Mostrar pacientes y camas disponibles
select pacientes.*, camas.* from pacientes left join asignaciones ON pacientes.PacienteID = asignaciones.PacienteID left join camas ON asignaciones.CamaID = camas.CamaID where asignaciones.PacienteID IS NULL OR camas.Disponible = false;

 --   6. Obtener la cantidad de camas ocupadas por tipo
 select camas.Tipo, COUNT(asignaciones.CamaID) from camas  join asignaciones ON camas.CamaID = asignaciones.CamaID and camas.disponible = 0 GROUP BY camas.Tipo; 

 --   7. Listar camas disponibles junto con sus tipos
 select camas.* from camas where camas.Disponible = true;

 --   8. Mostrar la edad promedio de los pacientes asignados a camas individuales
 select AVG(pacientes.Edad) from pacientes join asignaciones ON pacientes.PacienteID = asignaciones.PacienteID join camas ON asignaciones.CamaID = camas.CamaID where camas.Tipo = 'Individual';

 --   9. Obtener el nombre del paciente y tipo de cama asignada por cada asignación
 select pacientes.Nombre, camas.Tipo from pacientes join asignaciones ON pacientes.PacienteID = asignaciones.PacienteID join camas ON asignaciones.CamaID = camas.CamaID;

 --   10. Listar camas y la cantidad de veces que han sido asignadas
 select camas.CamaID, camas.Tipo, COUNT(asignaciones.CamaID) as vecesAsignada from camas left join asignaciones ON camas.CamaID = asignaciones.CamaID GROUP BY camas.CamaID, camas.Tipo;

 --   11. Mostrar detalles de asignaciones con nombres de pacientes y tipo de cama
select asignaciones.*, pacientes.Nombre AS Nombre_Paciente, camas.Tipo from asignaciones join pacientes ON asignaciones.PacienteID = pacientes.PacienteID join camas ON asignaciones.CamaID = camas.CamaID;

 --   12. Obtener la cantidad total de camas y la cantidad asignada
 select COUNT(*) AS Total_camas, COUNT(asignaciones.CamaID) from camas left join asignaciones ON camas.CamaID = asignaciones.CamaID; 

 --   13. Listar camas ocupadas con detalles de pacientes
 select camas.*, pacientes.* from camas join asignaciones ON camas.CamaID = asignaciones.CamaID join pacientes ON asignaciones.PacienteID = pacientes.PacienteID;

 --   14. Mostrar pacientes sin asignación de cama
 select pacientes.* from pacientes left join asignaciones ON pacientes.PacienteID = asignaciones.PacienteID where asignaciones.PacienteID IS NULL;

 --   15. Obtener detalles de asignaciones ordenadas por fecha de asignación





 --   Consultas con Composición Interna:
 --   Consultas con composición interna entre varias tablas
 
 -- 1. Listar pacientes y sus camas asignadas
 select pacientes.*, camas.* from pacientes join asignaciones ON pacientes.PacienteID = asignaciones.PacienteID join camas ON asignaciones.CamaID = camas.CamaID;
 
 select pacientes.*, camas.* from pacientes,camas,asignaciones where pacientes.PacienteID = asignaciones.PacienteID group by pacientes;

 -- 2. Obtener detalles de asignaciones con nombres de pacientes y tipo de cama
 select asignaciones.*, pacientes.Nombre,camas.tipo from asignaciones join pacientes ON asignaciones.PacienteID = pacientes.PacienteID join camas ON asignaciones.CamaID = camas.CamaID;

 -- 3. Mostrar la edad promedio de los pacientes asignados a camas individuales
 select AVG(pacientes.Edad) from pacientes join asignaciones ON pacientes.PacienteID = asignaciones.PacienteID join camas ON asignaciones.CamaID = camas.CamaID where camas.Tipo = 'compartida';

 -- 4. Listar camas y la cantidad de veces que han sido asignadas
select camas.CamaID, camas.Tipo, COUNT(asignaciones.CamaID) from camas,asignaciones where camas.CamaID = asignaciones.CamaID GROUP BY camas.CamaID, camas.Tipo;

 -- 5. Obtener el nombre del paciente y tipo de cama asignada por cada asignación
select pacientes.Nombre, camas.Tipo from pacientes join asignaciones ON pacientes.PacienteID = asignaciones.PacienteID join camas ON asignaciones.CamaID = camas.CamaID;

 -- 6. Listar camas ocupadas con detalles de pacientes
select camas.*, pacientes.* from camas join asignaciones ON camas.CamaID = asignaciones.CamaID join pacientes ON asignaciones.PacienteID = pacientes.PacienteID;

 -- 7. Mostrar pacientes sin asignación de cama
select pacientes.* from pacientes left join asignaciones ON pacientes.PacienteID = asignaciones.PacienteID where asignaciones.PacienteID IS NULL;

 -- 8. Obtener la cantidad total de camas y la cantidad asignada
select COUNT(*) AS Total_camas, COUNT(asignaciones.CamaID) from camas join asignaciones ON camas.CamaID = asignaciones.CamaID;

 -- 9. Listar camas asignadas con detalles de pacientes
select camas.*, pacientes.* from camas,asignaciones,pacientes where asignaciones.PacienteID = pacientes.PacienteID;

 -- 10. Mostrar detalles de asignaciones con nombres de pacientes
select asignaciones.*, pacientes.Nombre from asignaciones join pacientes ON asignaciones.PacienteID = pacientes.PacienteID;

 -- 11. Obtener información completa de las asignaciones con detalles de camas
select asignaciones.*, camas.* from asignaciones join camas ON asignaciones.CamaID = camas.CamaID;

 -- 12. Listar camas disponibles junto con sus tipos
select camas.* from camas where camas.Disponible = true;
select camas.camaid,camas.Tipo from camas where camas.CamaID not in (select asignaciones.CamaID from asignaciones);

 -- 13. Mostrar pacientes y camas disponibles
select pacientes.*, camas.* from pacientes left join asignaciones ON pacientes.PacienteID = asignaciones.PacienteID left join camas ON asignaciones.CamaID = camas.CamaID where asignaciones.PacienteID IS NULL OR camas.Disponible = true;

 -- 14. Obtener el nombre del paciente y tipo de cama asignada por cada asignación
select pacientes.Nombre, camas.Tipo from pacientes join asignaciones ON pacientes.PacienteID = asignaciones.PacienteID join camas ON asignaciones.CamaID = camas.CamaID;

 -- 15. Listar camas ocupadas con detalles de pacientes
select camas.*, pacientes.* from camas join asignaciones ON camas.CamaID = asignaciones.CamaID join pacientes ON asignaciones.PacienteID = pacientes.PacienteID;



 -- Consultas con Composición Externa:
 -- Consultas con composición externa entre varias tablas
 
-- 1. Listar pacientes y sus camas asignadas (incluso aquellos sin asignación)
select P.Nombre, C.CamaID from pacientes AS P left join asignaciones AS A ON P.PacienteID = A.PacienteID left join camas AS C ON A.CamaID = C.CamaID;


-- 2. Obtener detalles de asignaciones con nombres de pacientes y tipo de cama (incluso sin asignación)
select P.Nombre, C.Tipo, A.FechaAsignacion from pacientes AS P left join asignaciones AS A ON P.PacienteID = A.PacienteID left join camas AS C ON A.CamaID = C.CamaID;


-- 3. Mostrar la edad promedio de los pacientes asignados a camas individuales (incluso sin asignación)
select AVG(pacientes.Edad) from pacientes left join asignaciones ON pacientes.PacienteID = asignaciones.PacienteID left join camas ON asignaciones.CamaID = camas.CamaID where camas.Tipo = 'Individual' OR asignaciones.CamaID IS NULL;

select AVG(P.Edad) from pacientes AS P left join asignaciones AS A ON P.PacienteID = A.PacienteID left join camas AS C ON A.CamaID = C.CamaID where C.Tipo = 'Individual';


-- 4. Listar camas y la cantidad de veces que han sido asignadas (incluso sin asignación)
select C.CamaID, COUNT(A.AsignacionID) AS asignaciones from camas AS C left join asignaciones AS A ON C.CamaID = A.CamaID GROUP BY C.CamaID;


-- 5. Obtener el nombre del paciente y tipo de cama asignada por cada asignación (incluso sin asignación)
select pacientes.Nombre, camas.Tipo from pacientes left join asignaciones ON pacientes.PacienteID = asignaciones.PacienteID left join camas ON asignaciones.CamaID = camas.CamaID;

select P.Nombre, C.Tipo from pacientes AS P left join asignaciones AS A ON P.PacienteID = A.PacienteID left join camas AS C ON A.CamaID = C.CamaID;


-- 6. Listar camas ocupadas con detalles de pacientes (solo camas ocupadas)
select camas.*, pacientes.* from camas inner join asignaciones ON camas.CamaID = asignaciones.CamaID inner join pacientes ON asignaciones.PacienteID = pacientes.PacienteID;

-- 7. Mostrar pacientes sin asignación de cama
select pacientes.* from pacientes left join asignaciones ON pacientes.PacienteID = asignaciones.PacienteID where asignaciones.PacienteID IS NULL;


-- 8. Obtener la cantidad total de camas y la cantidad asignada (solo camas asignadas)
select COUNT(*) AS Total_camas, COUNT(asignaciones.CamaID) from camas left join asignaciones ON camas.CamaID = asignaciones.CamaID; 

-- 9. Listar camas asignadas con detalles de pacientes (solo camas asignadas)
select camas.*, pacientes.* from camas inner join asignaciones ON camas.CamaID = asignaciones.CamaID inner join pacientes ON asignaciones.PacienteID = pacientes.PacienteID;

-- 10. Mostrar detalles de asignaciones con nombres de pacientes (solo asignaciones con pacientes)
select asignaciones.*, pacientes.Nombre from asignaciones inner join pacientes ON asignaciones.PacienteID = pacientes.PacienteID;


-- 11. Obtener información completa de las asignaciones con detalles de camas (solo asignaciones con camas)
select asignaciones.*, camas.* from asignaciones inner join camas ON asignaciones.CamaID = camas.CamaID;

-- 12. Listar camas disponibles junto con sus tipos (solo camas disponibles)
select camas.* from camas where camas.Disponible = true;

select camas.CamaID,camas.tipo from camas left join asignaciones on camas.camaid = asignaciones.CamaID where asignaciones.AsignacionID is null;

-- 13. Mostrar pacientes y camas disponibles (solo pacientes sin asignación)
select pacientes.*, camas.* from pacientes left join asignaciones ON pacientes.PacienteID = asignaciones.PacienteID left join camas ON asignaciones.CamaID = camas.CamaID where asignaciones.PacienteID IS NULL;

select * from pacientes;
select * from asignaciones;
select * from camas;

-- 14. Obtener el nombre del paciente y tipo de cama asignada por cada asignación (solo asignaciones con pacientes)
select pacientes.Nombre, camas.Tipo from pacientes inner join asignaciones ON pacientes.PacienteID = asignaciones.PacienteID inner join camas ON asignaciones.CamaID = camas.CamaID;

-- 15. Listar camas ocupadas con detalles de pacientes (solo camas ocupadas)
select camas.*, pacientes.* from camas inner join asignaciones ON camas.CamaID = asignaciones.CamaID inner join pacientes ON asignaciones.PacienteID = pacientes.PacienteID;



-- Subconsultas de Dos y Tres Tablas:
-- Subconsultas con dos o tres tablas

--  1. Obtener el nombre del paciente y tipo de cama asignada por cada asignación (subconsulta de dos tablas)

--  2. Mostrar detalles de asignaciones con nombres de pacientes y tipo de cama (subconsulta de tres tablas)
select asignaciones.AsignacionID, pacientes.Nombre, (select camas.tipo from camas where camas.camaid = asignaciones.camaid) as TipoCama, asignaciones.FechaAsignacion from asignaciones 
inner join pacientes on asignaciones.pacienteid = pacientes.pacienteid;


--  3. Listar camas ocupadas con detalles de pacientes (subconsulta de tres tablas)
select camas.camaid, (select pacientes.nombre from pacientes where pacientes.pacienteid = asignaciones.PacienteID) as NombrePaciente, asignaciones.FechaAsignacion
from camas inner join asignaciones on camas.camaid = asignaciones.camaid;

--  4. Obtener información completa de las asignaciones con detalles de camas y pacientes (subconsulta de tres tablas)
select asignaciones.asignacionesid,(select pacientes.nombre from pacientes where pacientes.pacienteid = asignaciones.PacienteID) nombrePaciente, (select camas.tipo from camas where camas.camaid = asignaciones.CamaID) 
as tipoCama, asignaciones.FechaAsignacion from asignaciones, (select pacientes.nombre from pacientes where pacientes.PacienteID= asignaciones.PacienteID) as camas;

--  5. Listar camas asignadas con detalles de pacientes y tipo de cama (subconsulta de tres tablas)
select camas.camaid, (select pacientes.nombre from pacientes where pacientes.pacienteid = asignaciones.pacienteid) as nombrePaciente,
(select camas.tipo from camas where camas.camaid = asignaciones.camaid) as tipoCama from camas inner join asignaciones on camas.camaid=asignaciones.camaid;


--  6. Mostrar pacientes y camas disponibles con sus tipos (subconsulta de tres tablas)
select pacientes.*, null as camaid, null as tipoCama from pacientes where not exists (select 1 from asignaciones where asignaciones.PacienteID = pacientes.PacienteID)
union 
select null as pacienteId, null as nombre, null as edad, null as genero, camas.CamaID,camas.tipo as tipoCama from camas where not exists
(select 1 from asignaciones where asignaciones.CamaID = camas.CamaID); 

--  7. Obtener el nombre del paciente y la cantidad de camas asignadas (subconsulta de dos tablas)
select pacientes.Nombre, (select count(*) from asignaciones where asignaciones.PacienteID = pacientes.pacienteid) as cantidadDeCamasAsignadas from pacientes;

--  8. Listar camas con la cantidad de asignaciones y nombres de pacientes (subconsulta de tres tablas)

select camas.camaid, (select count(*) from asignaciones where asignaciones.camaid = camas.camaid) as cantidadAsiganciones,
(select pacientes.nombre from pacientes where pacientes.pacienteid =
(select asignaciones.PacienteID from asignaciones where asignaciones.CamaID = camas.CamaID limit 1)) as nombrePaciente
from camas;

--  9. Mostrar pacientes con asignaciones y su edad promedio (subconsulta de tres tablas)
select pacientes.nombre, 
(select avg(pacientes.Edad) from pacientes where pacientes.PacienteID = asignaciones.PacienteID) as edadPromedio
from pacientes
inner join asignaciones on pacientes.PacienteID = asignaciones.PacienteID;

--  10. Obtener el tipo de cama y la cantidad de pacientes asignados (subconsulta de dos tablas)
select camas.tipo, (select count(distinct asignaciones.PacienteID) from asignaciones where asignaciones.CamaID = camas.CamaID) as CantidadPacientes
from camas;

select camas.tipo as tipoCama, count(distinct asignaciones.PacienteID) as cantidadPacientesAsignados from camas left join asignaciones on camas.camaid = asignaciones.CamaID group by camas.tipo;

select tipocama, (select count(distinct asignaciones.PacienteID) from asignaciones where asignaciones.CamaID in (select camaid from camas where tipocama = camas.tipo))
cantidadPacientesAsignados from 
(select distinct tipo as tipoCama from camas) as tiposCamas;


--  11. Listar camas con asignaciones y pacientes ordenados por fecha de asignación (subconsulta de tres tablas)
select asignaciones.FechaAsignacion, (select camas.camaid from camas where asignaciones.camaid=camas.camaid) camasAsignadas,
(select pacientes.nombre from pacientes where pacientes.PacienteID = asignaciones.PacienteID) as pacienteAsignado from asignaciones order by asignaciones.FechaAsignacion;

select camas.camaid, asignaciones.AsignacionID,pacientes.Nombre,asignaciones.FechaAsignacion from camas
inner join asignaciones on camas.camaid = asignaciones.camaid
inner join pacientes on asignaciones.PacienteID = pacientes.PacienteID
order by asignaciones.FechaAsignacion;


--  12. Mostrar camas individuales y pacientes asignados ordenados alfabéticamente (subconsulta de tres tablas)


 select camas.camaID,  (select nombre from pacientes where pacientes.PacienteID = asignaciones.PacienteID) as nombre,
 (select camas.tipo from camas where camas.camaid = asignaciones.camaid) as tipo
 from camas join asignaciones 
 on camas.CamaID = asignaciones.CamaID where camas.tipo = 'individual' order by nombre ; 
 
 -- por el profe
 
 select camas.CamaID,camas.tipo as tipoCamas, (select pacientes.Nombre from pacientes where pacientes.PacienteID in (select asignaciones.PacienteID from asignaciones where asignaciones.CamaID = camas.CamaID) limit 1)
 as NombrePaciente from camas where camas.Tipo = "Individual" and exists (select 1 from asignaciones where asignaciones.CamaID = camas.CamaID) order by NombrePaciente;


--  13. Obtener el nombre del paciente y la fecha de asignación más reciente (subconsulta de tres tablas)

select pacientes.Nombre, (select max(asignaciones.FechaAsignacion) from asignaciones where asignaciones.PacienteID = pacientes.pacienteid) as fechaAsigancionesReciente from pacientes;

-- POR NOEL

select pacientes.Nombre, (select max(asignaciones.FechaAsignacion) from asignaciones where asignaciones.PacienteID = pacientes.PacienteID) as Fecha from pacientes
where (select FechaAsignacion from asignaciones order by FechaAsignacion desc limit 1) = (select max(asignaciones.FechaAsignacion) 
from asignaciones where asignaciones.PacienteID = pacientes.PacienteID);


--  14. Listar camas con asignaciones y pacientes de genero femenino (subconsulta de tres tablas)
select pacientes.nombre, ( select camas.camaid from camas where camas.CamaID = asignaciones.CamaID) as camasID
from asignaciones join pacientes on pacientes.PacienteID = asignaciones.pacienteid where genero = "femenino";



--  15. Mostrar pacientes sin asignación de cama y su edad promedio (subconsulta de dos tablas)
select pacientes.*, (select AVG(Edad) from pacientes where pacientes.PacienteID = asignaciones.PacienteID) AS Edad_Promedio from pacientes 
  join asignaciones ON pacientes.PacienteID = asignaciones.PacienteID where asignaciones.PacienteID is null;
  

select pacientes.nombre,pacientes.edad, (select avg(pacientes.edad) from pacientes where pacientes.pacienteid = pacientes.pacienteid) as edadPromedio from pacientes where pacientes.pacienteid
not in (select distinct pacienteid from asignaciones);

select pacientes.nombre, pacientes.edad, (select avg(pacientes.edad) from pacientes where pacientes.pacienteid not in (select distinct pacienteid from asignaciones)) as EdadPromedio 
from pacientes where pacientes.pacienteid not in 
(select distinct pacienteid from asignaciones);




--  Subconsultas de Dos y Tres Tablas sin join explícito:
--  Subconsultas sin join explícito entre dos o tres tablas

--  1. Obtener el nombre del paciente y tipo de cama asignada por cada asignación
select (select Nombre from pacientes where PacienteID = asignaciones.PacienteID) AS Nombre_Paciente,(select Tipo from camas where CamaID = asignaciones.CamaID) AS Tipo_Cama from asignaciones;


--  2. Mostrar detalles de asignaciones con nombres de pacientes y tipo de cama
select asignaciones.*, (select Nombre from pacientes where PacienteID = asignaciones.PacienteID) AS Nombre_Paciente,(select Tipo from camas where CamaID = asignaciones.CamaID) AS Tipo_Cama from asignaciones;

--  3. Listar camas ocupadas con detalles de pacientes
select Camas.*, (select Pacientes.Nombre from pacientes  where Pacientes.PacienteID = Asignaciones.PacienteID) from camas,asignaciones where Camas.CamaID = Asignaciones.CamaID;


--  4. Obtener información completa de las asignaciones con detalles de camas y pacientes
select asignaciones.AsignacionID, (select pacientes.nombre from pacientes where pacientes.pacienteid = asignaciones.PacienteID) as nombrePaciente,
(select camas.tipo from camas where camas.CamaID = Asignaciones.camaid) as tipoCama, asignaciones.fechaAsignacion from asignaciones;

--  5. Listar camas asignadas con detalles de pacientes y tipo de cama
select (select Pacientes.Nombre from pacientes where Pacientes.PacienteID = Asignaciones.PacienteID), COUNT(*) AS Cantidad_camas_Asignadas 
from asignaciones  GROUP BY Asignaciones.PacienteID;


--  6. Mostrar pacientes y camas disponibles con sus tipos
select Camas.CamaID,camas.disponible,camas.tipo, COUNT(Asignaciones.AsignacionID) AS Cantidad_asignaciones, (select Pacientes.Nombre from pacientes  where Pacientes.PacienteID = Asignaciones.PacienteID) 
AS Nombre_Paciente from camas,asignaciones  where Camas.CamaID = Asignaciones.CamaID GROUP BY Camas.CamaID, Asignaciones.PacienteID;

select
(select pacientes.nombre from pacientes where pacientes.pacienteid =asignaciones.pacienteid) Nombre,
asignaciones.camaid CamaAsignada, null as CamaDisponible,
(select camas.tipo from camas where camas.camaid = asignaciones.camaid) TipoCamaAsignada
from asignaciones

UNION
select
pacientes.nombre,
null as CamaAsignada,
null as CamaDisponible,
null as TipoCamaAsignada from pacientes 
where pacientes.pacienteid not in (select distinct pacienteid from asignaciones) 

UNION
select 
null as Nombre,
null as CamaAsignada,
camas.camaid CamaDisponible,
camas.tipo TipoCamaDisponible
from camas where camas.camaid not in (select camaID from asignaciones where camaid is not null);



--  7. Obtener el nombre del paciente y la cantidad de camas asignadas
select (select Nombre from pacientes where PacienteID = asignaciones.PacienteID) AS Nombre_Paciente,COUNT(*) AS Cantidad_camas_Asignadas from asignaciones GROUP BY PacienteID;

select pacientes.nombre, (select count(*) from asignaciones where asignaciones.PacienteID= pacientes.PacienteID) as CantidadAsignada from pacientes; -- buena

--  8. Listar camas con la cantidad de asignaciones y nombres de pacientes
select Camas.CamaID, COUNT(Asignaciones.AsignacionID) AS Cantidad_asignaciones, (select Pacientes.Nombre from pacientes where Pacientes.PacienteID = Asignaciones.PacienteID) AS Nombre_Paciente 
from camas, asignaciones  where Camas.CamaID = Asignaciones.CamaID GROUP BY Camas.CamaID, Asignaciones.PacienteID;




--  9. Mostrar pacientes con asignaciones y su edad promedio
select (select Pacientes.Nombre from pacientes where Pacientes.PacienteID = Asignaciones.PacienteID), AVG((select Pacientes.Edad 
from pacientes where Pacientes.PacienteID = Asignaciones.PacienteID)) AS Edad_Promedio from asignaciones GROUP BY Asignaciones.PacienteID;

select 
	(select pacientes.nombre from pacientes where pacientes.PacienteID = asignaciones.PacienteID) Nombre,
    (select pacientes.edad from pacientes where pacientes.PacienteID = asignaciones.PacienteID) Edad,
    asignaciones.CamaID camaAsignada,
    (select avg(pacientes.edad) from pacientes where pacientes.PacienteID in 
    (select pacienteid from asignaciones)) EdadPromedio
    from asignaciones;

--  10. Obtener el tipo de cama y la cantidad de pacientes asignados
select (select Tipo from camas where CamaID = asignaciones.CamaID) AS Tipo_Cama, COUNT(DISTINCT PacienteID) AS Cantidad_pacientes_Asignados from asignaciones GROUP BY CamaID;

select camas.tipo, (select count(distinct asignaciones.PacienteID) from asignaciones where asignaciones.CamaID = camas.CamaID) as cantidadPacientes from camas;


--  11. Listar camas con asignaciones y pacientes ordenados por fecha de asignación
select Camas.CamaID, (select Camas.Tipo from camas where Camas.CamaID = Asignaciones.CamaID), (select CONCAT(Pacientes.Nombre, ', ', Pacientes.Edad, ', ', Pacientes.genero) from pacientes  
where Pacientes.PacienteID = Asignaciones.PacienteID) AS Detalles_Paciente, Asignaciones.FechaAsignacion from camas, asignaciones  
where Camas.CamaID = Asignaciones.CamaID ORDER BY Asignaciones.FechaAsignacion;

--  12. Mostrar camas individuales y pacientes asignados ordenados alfabéticamente
select camas.camaid,(select pacientes.nombre from pacientes where pacientes.nombre = asignaciones.pacienteid) as nombrePaciente, camas.tipo from camas,asignaciones
where camas.camaid = asignaciones.CamaID and camas.tipo = 'Compartida' 
order by (select pacientes.Nombre from pacientes where pacientes.PacienteID= asignaciones.PacienteID);  


--  13. Obtener el nombre del paciente y la fecha de asignación más reciente
select pacientes.nombre, (select max(asignaciones.FechaAsignacion) from asignaciones where asignaciones.pacienteid = pacientes.PacienteID) FechaAsignacionReciente from pacientes;

--  14. Listar camas con asignaciones y pacientes de genero femenino
select Camas.CamaID, (select Camas.Tipo from camas  where camas.CamaID = Asignaciones.CamaID), (select CONCAT(Pacientes.Nombre, ', ', Pacientes.Edad, ', ', Pacientes.genero) from pacientes
 where Pacientes.PacienteID = Asignaciones.PacienteID) AS Detalles_Paciente from camas, asignaciones where Camas.CamaID = Asignaciones.CamaID and (select Pacientes.genero from pacientes
 where Pacientes.PacienteID = Asignaciones.PacienteID) = 'Femenino';

--  15. Mostrar pacientes sin asignación de cama y su edad promedio


select pacientes.Nombre,
pacientes.edad, 
(select avg(edad) from pacientes where pacientes.pacienteid not in
(select distinct pacienteid from asignaciones )) edadPromedio
from pacientes
where pacientes.PacienteID not in (select distinct pacienteid from asignaciones);




--  Subconsultas con any, all y EXISTS:
--   1. Mostrar pacientes con asignaciones de camas de tipo "Individual"
select * from pacientes where EXISTS (select 1 from asignaciones  inner join camas ON Asignaciones.CamaID = Camas.CamaID where Asignaciones.PacienteID = pacientes.PacienteID 
and Camas.Tipo = 'Individual');

select * from pacientes where pacienteid = all (select asignaciones.pacienteid from asignaciones where asignaciones.camaid = any 
(select camas.camaid from camas where tipo = "Indivudual"));

select 
	(select nombre from pacientes where pacientes.pacienteid = asignaciones.pacienteid) NombrePaciente,
    (select camas.tipo from camas where camas.camaid = asignaciones.camaid and camas.tipo = "Individual") tipoCama
    from asignaciones where asignaciones.camaid = any  ((select camas.camaid from camas where camas.camaid = asignaciones.camaid and camas.tipo = "Individual"));

--   2. Listar camas con asignaciones donde todas las asignaciones tienen pacientes mayores de 25 años


select * from camas where camas.CamaID = any
(select asignaciones.CamaID from asignaciones 
where asignaciones.PacienteID >= any (select pacientes.Nombre from pacientes where edad > 25));

select camaid from asignaciones
where camaid = any (select camaid from pacientes where edad >25);

select * from asignaciones where pacienteid = any (select pacientes.PacienteID from pacientes where pacientes.PacienteID = asignaciones.PacienteID and edad > 25);



--   3. Obtener el tipo de cama de las camas asignadas a pacientes mayores de 30 años
select  camas.Tipo from camas where EXISTS (select * from asignaciones inner join pacientes ON asignaciones.PacienteID = pacientes.PacienteID 
where asignaciones.CamaID = camas.CamaID and pacientes.Edad > 30);

select camas.Tipo from camas where camas.CamaID = any
(select asignaciones.camaid from asignaciones 
where asignaciones.PacienteID = any (select pacientes.PacienteID from pacientes where pacientes.edad >= 30));

select tipo from camas where camas.camaid = any
(select asignaciones.camaid from asignaciones where PacienteID = any
(select pacientes.PacienteID from pacientes where edad > 30));

select camas.tipo from camas where exists (select * from asignaciones left join pacientes on asignaciones.PacienteID = pacientes.PacienteID 
where asignaciones.CamaID = camas.CamaID and pacientes.Edad >30);

select distinct camas.Tipo from camas where exists (select pacientes.PacienteID from pacientes where edad >=30 );


delete asignaciones from hospital;
--   4. Mostrar camas asignadas a pacientes de genero femenino

select camaid from asignaciones where pacienteid = any
(select pacienteid from pacientes where pacientes.genero = "Femenino"); -- correcto
 
--   5. Listar camas donde todas las asignaciones tienen pacientes con al menos 2 asignaciones


select camas.camaid, camas.tipo from camas where camas.camaid in (select asignaciones.camaid  from asignaciones group by asignaciones.camaid 
having count(distinct asignaciones.PacienteID) > 0 and min((select count(asignacionid) from asignaciones where camaid =  camas.camaid and pacienteid = asignaciones.pacienteid)) >=2); 


--   6. Obtener camas asignadas donde existe al menos un paciente menor de 25 años

select camaid from asignaciones where PacienteID = any
(select pacienteid from pacientes where edad >26);

select camaid, (select nombre from pacientes where pacientes.PacienteID=asignaciones.pacienteid),
(select edad from pacientes where pacientes.PacienteID= asignaciones.PacienteID)
from asignaciones where pacienteid = any (select PacienteID from pacientes where edad <26);


--   7. Mostrar pacientes con asignaciones de camas donde todas las camas son de tipo "Compartida"
select * from pacientes where NOT EXISTS (select 1 from asignaciones inner join camas  
ON Asignaciones.CamaID = Camas.CamaID where Asignaciones.PacienteID = pacientes.PacienteID and Camas.Tipo != 'Compartida');

select camas.tipo from camas where tipo = 'compartida';

--   8. Listar camas con asignaciones de pacientes que existen en la tabla de asignaciones
select * from camas where EXISTS (select * from asignaciones where asignaciones.CamaID = camas.CamaID);

insert into camas values
(208,'Doble',false);
ALTER TABLE camas MODIFY COLUMN tipo ENUM ('Individual', 'Compartida','Doble');
alter table camas change column tipo1 tipo enum('Individual', 'Compartida','Doble');



--   9. Obtener camas asignadas a pacientes donde al menos una asignación tiene una fecha anterior a '2024-01-01'
select * from camas where EXISTS (select * from asignaciones where asignaciones.CamaID = camas.CamaID and asignaciones.FechaAsignacion < '2024-01-01');

--   10. Mostrar pacientes con asignaciones en todas las camas de tipo "Individual"
select * from pacientes where NOT EXISTS (select * from camas where Camas.Tipo = 'Individual' and NOT EXISTS (select 1 from asignaciones where Asignaciones.CamaID = Camas.CamaID and Asignaciones.PacienteID = pacientes.PacienteID));


--   11. Listar camas con asignaciones de pacientes donde al menos un paciente tiene asignaciones en todas las camas
select * from camas where EXISTS (select 1 from asignaciones  inner join pacientes  ON Asignaciones.PacienteID = Pacientes.PacienteID where Asignaciones.CamaID = camas.CamaID GROUP BY Pacientes.PacienteID HAVING COUNT(DISTINCT Asignaciones.CamaID) = (select COUNT(*) from camas));

--   12. Obtener camas asignadas a pacientes donde todas las asignaciones tienen una fecha de asignación posterior a '2024-01-01'
select * from camas where NOT EXISTS (select 1 from asignaciones where Asignaciones.CamaID = camas.CamaID and Asignaciones.FechaAsignacion <= '2024-01-01');

--   13. Mostrar pacientes con asignaciones en todas las camas
select * from pacientes where (select COUNT(*) from asignaciones where asignaciones.PacienteID = pacientes.PacienteID) = (select COUNT(*) from camas);

select * from pacientes where EXISTS (select 1 from camas  where NOT EXISTS (select 1 from asignaciones  where Asignaciones.CamaID = Camas.CamaID and Asignaciones.PacienteID = pacientes.PacienteID));
-- no entendí el enunciado --


--   14. Listar camas con asignaciones de pacientes que no existen en la tabla de asignaciones
select * from camas where NOT EXISTS (select * from asignaciones where asignaciones.CamaID = camas.CamaID);

--   15. Obtener camas asignadas a pacientes donde al menos una asignación tiene una fecha de asignación igual a la fecha máxima de asignación
select * from camas where EXISTS (select * from asignaciones where asignaciones.CamaID = camas.CamaID and asignaciones.FechaAsignacion = (select MAX(FechaAsignacion) from asignaciones));




-- 1. Subconsulta con NOT any: Obtener pacientes que no tienen asignaciones en camas individuales.
select * from pacientes where PacienteID NOT IN (select PacienteID from asignaciones where CamaID IN ( select CamaID from camas where Tipo = 'Individual'));


-- 2. Subconsulta con NOT all: Listar camas con asignaciones donde no todas las asignaciones tienen pacientes mayores de 25 años.
select * from camas where CamaID IN (select CamaID from asignaciones inner join pacientes  ON Asignaciones.PacienteID = Pacientes.PacienteID where Pacientes.Edad <= 25);

-- 3. Subconsulta con NOT EXISTS: Mostrar pacientes sin asignaciones en ninguna cama.
select * from pacientes where NOT EXISTS (select 1 from asignaciones where asignaciones.PacienteID = pacientes.PacienteID);

-- 4. Subconsulta combinando NOT EXISTS y NOT any: Obtener camas sin asignaciones de pacientes menores de 30 años.
select * from camas where not exists (select CamaID from asignaciones where Asignaciones.PacienteID IN (select PacienteID from pacientes where Edad < 30));


-- 5. Subconsulta combinando NOT EXISTS y NOT all: Listar camas con asignaciones de pacientes donde no todas las asignaciones tienen una fecha de asignación posterior a '2024-01-01'.
select * from camas where CamaID IN (select CamaID from asignaciones  where NOT EXISTS (select 1 from asignaciones where CamaID = Asignaciones.CamaID and FechaAsignacion <= '2024-01-01'));


-- Ejercicios de update:
-- 1. Actualizar la edad de todos los pacientes mayores de 50 años:
update pacientes set Edad = Edad + 1 where pacienteid in(select pacientes.PacienteID from pacientes where Edad > 50);

update pacientes set edad = edad +1 where pacienteid in (select * from (select pacienteid from pacientes where edad > 50) subConsulta); -- NOEL

update pacientes join (select pacienteid from pacientes where edad > 50 ) pacientesFiltrados on pacientes.pacienteid = pacientesFiltrados.pacienteid set pacientes.edad = pacientes.edad +1; -- FERNANDO


-- 2. Modificar el tipo de cama de todas las camas individuales:
update camas set Tipo = 'Compartida' where Tipo = 'Individual';

update camas join (select camas.tipo from camas where camas.tipo = 'Mixta') as cambioCamas on camas.tipo = cambioCamas.tipo set camas.tipo = "Doble";


-- 3. Actualizar la fecha de asignación de todas las asignaciones a una fecha específica:
update asignaciones set FechaAsignacion = '2024-01-01';


update asignaciones join (select asignaciones.FechaAsignacion from asignaciones) as asignacionesfecha on asignaciones.FechaAsignacion = asignacionesfecha.FechaAsignacion
 set asignaciones.FechaAsignacion = '2024-09-10';

-- 4. Incrementar la cantidad de camas disponibles en un determinado piso:
update camas set Disponible = true where Tipo = 'Individual' and Disponible = false;

select camaid from camas where camaid like "2__" and camas.Disponible =0;





-- 5. Cambiar el genero de todos los pacientes femeninos a masculino:
update pacientes set genero = 'Masculino' where genero = 'Femenino';

-- 6. Marcar todas las camas ocupadas como no disponibles:
update camas set Disponible = false where Disponible = true;

update camas join(select camas.Disponible from camas where camas.Disponible = true) as camasNuevas on camas.Tipo = camas.disponible set camas.Disponible = false;

-- 7. Actualizar la fecha de asignación de las asignaciones más recientes:
update asignaciones set FechaAsignacion = '2024-12-22' where AsignacionID = (select min(AsignacionID) from (select (AsignacionID) from asignaciones) AS MaxAsignacion);

-- 8. Modificar el tipo de cama para asignaciones de pacientes menores de 30 años:
update camas set Tipo = 'NIÑOS' where CamaID IN (select CamaID from asignaciones where PacienteID IN (select PacienteID from pacientes where Edad < 30));

-- 9. Actualizar la cantidad máxima de camas permitidas por tipo:
update camas set Disponible = 20 where Tipo = 'Individual';

-- 10. Cambiar la fecha de asignación de pacientes en camas individuales:
update asignaciones set FechaAsignacion = '2024-02-04' where CamaID IN (select CamaID from camas where Tipo = 'Individual');

-- 11. Incrementar la cantidad de camas asignadas para pacientes con más de 2 asignaciones:
update camas set Disponible = false where CamaID IN (select CamaID from (select CamaID, COUNT(*) AS asignaciones from asignaciones GROUP BY CamaID) AS asignaciones_count where asignaciones > 2);

-- 12. Actualizar la fecha de asignación para todas las asignaciones de un paciente específico:
update MaxcamasPermitidas set CantidadMaxima = CantidadMaxima + 5 where Tipo IN ('Individual', 'Compartida');

update asignaciones join
(select pacientes.PacienteID from pacientes where pacientes.nombre = "Brayan") as pesado on asignaciones.PacienteID = pesado.pacienteID set
asignaciones.FechaAsignacion = "2025-01-01";
 


-- 13. Modificar el tipo de cama para asignaciones de pacientes mayores de 40 años:
update camas set Tipo = 'adultos' where CamaID IN (select CamaID from asignaciones where PacienteID IN (select PacienteID from pacientes where Edad > 40));

-- 14. Cambiar la disponibilidad de camas individuales a no disponibles:
update camas set Disponible = false where Tipo = 'Niños';



-- 15. Actualizar la fecha de asignación de las asignaciones más antiguas:
update asignaciones join 
(select min(asignaciones.FechaAsignacion) fecha from asignaciones)as fechaAntigua on asignaciones.fechaAsignacion = fechaAntigua.fecha
set asignaciones.fechaasignacion = '2070-03-13'; 


-- Ejercicios de update:
-- 1. Incrementar la edad de todos los pacientes asignados a camas individuales en 2 años:
update pacientes set Edad = Edad + 2 where PacienteID IN (select PacienteID from asignaciones where CamaID IN (select CamaID from camas where Tipo = 'Individual'));

-- 2. Marcar como no disponible todas las camas asignadas a pacientes menores de 25 años:
update camas set Disponible = false where CamaID IN (select CamaID from asignaciones where PacienteID IN (select PacienteID from pacientes where Edad < 25));

-- 3. Actualizar la fecha de asignación de las asignaciones realizadas en camas del piso 3:
update asignaciones set FechaAsignacion = 'fecha_nueva' where CamaID IN (select CamaID from camas where Tipo = 'Compartida' and CamaID BETWEEN 301 and 350);

-- 4. Cambiar el tipo de cama para asignaciones de pacientes mayores de 30 años:
update asignaciones set CamaID = (select CamaID from camas where Tipo = 'Individual' LIMIT 1) where PacienteID IN (select PacienteID from pacientes where Edad > 30);


-- 5. Incrementar la cantidad de camas disponibles en un piso específico en 3 unidades:
update camas set Disponible = true where CamaID BETWEEN 301 and 350;

-- 6. Actualizar la fecha de asignación de las asignaciones de camas individuales a la fecha actual:
update asignaciones set FechaAsignacion = CURDATE() where CamaID IN (select CamaID from camas where Tipo = 'Individual');

-- 7. Modificar el tipo de cama para asignaciones de pacientes femeninas a 'Individual':
update asignaciones set CamaID = 'Individual' where PacienteID IN (select PacienteID from pacientes where genero = 'Femenino');

-- 8. Actualizar la fecha de asignación para todas las asignaciones de camas del piso 4:
update asignaciones set FechaAsignacion = 'fecha_nueva' where CamaID IN (select CamaID from camas where CamaID BETWEEN 401 and 450);

-- 9. Cambiar el tipo de cama para asignaciones de pacientes con más de 2 asignaciones a 'Individual':
update asignaciones set CamaID = 'Individual' where PacienteID IN (select PacienteID from (select PacienteID, COUNT(*) AS asignaciones from asignaciones GROUP BY PacienteID) AS asignaciones_count where asignaciones > 2);

-- 10. Incrementar la cantidad de camas disponibles en un 5%:
select COUNT(*) AS Total_camas from camas; 
-- hay 15 camas y no se puede asignar una fragcion de camas

-- 11. Actualizar la fecha de asignación para las asignaciones realizadas en camas con más de 1 asignación:
select CamaID from asignaciones GROUP BY CamaID HAVING COUNT(*) > 1; -- no hay camas con más de una asignación

-- 12. Cambiar el tipo de cama para asignaciones de pacientes masculinos mayores de 40 años a 'Individual':

-- POR HACER --


-- 13. Actualizar la fecha de asignación para todas las asignaciones de pacientes con más de 3 asignaciones:
update asignaciones
set FechaAsignacion = 'fecha_nueva'
where PacienteID IN (select PacienteID from (select PacienteID, COUNT(*) AS asignaciones from asignaciones GROUP BY PacienteID) AS asignaciones_count where asignaciones > 3);

-- 14. Modificar el tipo de cama para asignaciones de pacientes con más de 1 asignación a 'Doble':
update asignaciones set CamaID = 'Doble' where PacienteID IN (select PacienteID from (select PacienteID, COUNT(*) AS asignaciones from asignaciones GROUP BY PacienteID) AS asignaciones_count where asignaciones > 1);

-- 15. Actualizar la cantidad máxima de camas permitidas por tipo y piso:

-- 1. Consulta con join y GROUP BY: Obtener la cantidad de asignaciones por tipo de cama.
select c.Tipo, COUNT(a.AsignacionID) AS Cantidadasignaciones from asignaciones a join camas c ON a.CamaID = c.CamaID GROUP BY c.Tipo;

-- 2. Consulta con Subconsulta correlacionada y Agregación: Mostrar la edad promedio de pacientes con más de 2 asignaciones.
select AVG(p.Edad) AS EdadPromedio from pacientes p where (select COUNT(*) from asignaciones where PacienteID = p.PacienteID) > 2;

-- 3. Consulta con join y ORDER BY: Listar camas asignadas con detalles de pacientes, ordenadas por fecha de asignación.
select c.CamaID, c.Tipo, a.FechaAsignacion, p.Nombre, p.Edad, p.genero from asignaciones a join camas c ON a.CamaID = c.CamaID join pacientes p ON a.PacienteID = p.PacienteID ORDER BY a.FechaAsignacion;

-- 4. Consulta con Subconsulta y DISTINCT: Obtener la lista de generos únicos de pacientes asignados.
select DISTINCT p.genero from pacientes p join asignaciones a ON p.PacienteID = a.PacienteID;

-- 5. Consulta con join y SUM: Mostrar la suma total de la cantidad de camas disponibles por piso.
select SUM(CASE WHEN c.Tipo = 'Individual' THEN 1 ELSE 0 END) AS TotalIndividual, SUM(CASE WHEN c.Tipo = 'Compartida' THEN 1 ELSE 0 END) AS TotalCompartida from camas c where c.Disponible = true;

-- 6. Consulta con join, where y ORDER BY: Listar camas asignadas con detalles de pacientes, solo para camas en el piso 3, ordenadas por fecha de asignación.
select c.CamaID, c.Tipo, a.FechaAsignacion, p.Nombre, p.Edad, p.genero from asignaciones a join camas c ON a.CamaID = c.CamaID join pacientes p ON a.PacienteID = p.PacienteID where c.Piso = 3 ORDER BY a.FechaAsignacion;
-- POR HACER -- 
-- 7. Consulta con join, GROUP BY y HAVING: Obtener la cantidad de asignaciones por paciente, solo para aquellos con más de 3 asignaciones.
select a.PacienteID, COUNT(*) AS Cantidadasignaciones from asignaciones a GROUP BY a.PacienteID HAVING COUNT(*) > 3;

-- 8. Consulta con Subconsulta y MAX: Encontrar la fecha más reciente de asignación para cada paciente.
select a.PacienteID, MAX(a.FechaAsignacion) AS UltimaAsignacion from asignaciones a GROUP BY a.PacienteID;

-- 9. Consulta con join, where y COUNT: Contar la cantidad de pacientes asignados en camas de tipo 'Individual' en el piso 2.

-- POR HACER -- git diff HEAD~2..HEAD

/* POR CONSULTAR YA QUE NO TENGO PISO QUE SEA 2*/ 

select COUNT(DISTINCT a.PacienteID) AS Cantidadpacientes from asignaciones a join camas c ON a.CamaID = c.CamaID where c.Piso = 2 and c.Tipo = 'Individual'; 

-- 10. Consulta con join, GROUP BY, y AVG: Obtener la edad promedio de pacientes asignados por tipo de cama.
select c.Tipo, AVG(p.Edad) AS EdadPromedio from asignaciones a join camas c ON a.CamaID = c.CamaID join pacientes p ON a.PacienteID = p.PacienteID GROUP BY c.Tipo;

-- 11. Consulta con join, ORDER BY y LIMIT: Listar las camas asignadas a pacientes, ordenadas por fecha de asignación, y limitar los resultados a 10.
select c.CamaID, c.Tipo, a.FechaAsignacion, p.Nombre, p.Edad, p.genero from asignaciones a join camas c ON a.CamaID = c.CamaID join pacientes p ON a.PacienteID = p.PacienteID ORDER BY a.FechaAsignacion LIMIT 10;

-- 12. Consulta con join, where y COUNT con Distinción: Contar la cantidad de camas ocupadas por pacientes femeninas mayores de 25 años.
select COUNT(DISTINCT a.CamaID) AS camasOcupadas from asignaciones a join pacientes p ON a.PacienteID = p.PacienteID where p.genero = 'Femenino' and p.Edad > 25;

-- 13. Consulta con Subconsulta y MIN: Encontrar la fecha de asignación más antigua para cada cama.
select c.CamaID, MIN(a.FechaAsignacion) AS FechaAsignacionMasAntigua from asignaciones a join camas c ON a.CamaID = c.CamaID GROUP BY c.CamaID;

-- 14. Consulta con join, GROUP BY, y Funciones de Ventana: Obtener la lista de pacientes junto con la cantidad total de asignaciones y el número de asignaciones por paciente.
select p.PacienteID, p.Nombre, COUNT(*) AS Totalasignaciones, ROW_NUMBER() OVER(ORDER BY COUNT(*) DESC) AS NumeroasignacionesPorPaciente from pacientes p join asignaciones a ON p.PacienteID = a.PacienteID GROUP BY p.PacienteID, p.Nombre;

-- 15. Consulta con join, where y Funciones de Ventana: Listar camas asignadas a pacientes junto con el número de asignaciones por paciente, ordenadas por el número de asignaciones en orden descendente.
select a.PacienteID, p.Nombre, a.CamaID, ROW_NUMBER() OVER(PARTITION BY a.PacienteID ORDER BY a.FechaAsignacion DESC) AS NumeroasignacionesPorPaciente from asignaciones a join pacientes p ON a.PacienteID = p.PacienteID ORDER BY NumeroasignacionesPorPaciente DESC;


-- 1. Consulta con Subconsulta y Agregación: Obtener el número total de camas, la cantidad de camas ocupadas y la proporción de ocupación.
select COUNT(*) AS Totalcamas, COUNT(CASE WHEN Disponible = false THEN 1 END) AS camasOcupadas, ROUND(COUNT(CASE WHEN Disponible = false THEN 1 END) / COUNT(*) * 100, 2) AS ProporcionOcupacion from camas;

-- 2. Consulta con Subconsulta correlacionada y Agregación: Mostrar la lista de pacientes con la cantidad total de asignaciones.
select p.PacienteID,p.Nombre,(select COUNT(*) from asignaciones where PacienteID = p.PacienteID) AS Totalasignaciones from pacientes p;

-- 3. Consulta con CTE (Common Table Expression) y join: Listar camas junto con la edad promedio de los pacientes asignados.
WITH EdadPromedioPorCama AS (select c.CamaID,AVG(p.Edad) AS EdadPromedio from camas c join asignaciones a ON c.CamaID = a.CamaID join pacientes p ON a.PacienteID = p.PacienteID GROUP BY c.CamaID)select c.CamaID, c.Tipo,ep.EdadPromedio from camas c left join EdadPromedioPorCama ep ON c.CamaID = ep.CamaID;

-- 4. Consulta con Funciones de Ventana: Obtener la lista de camas con el nombre del paciente más joven y más viejo asignado a cada cama.
select DISTINCT c.CamaID, c.Tipo, FIRST_VALUE(p.Nombre) OVER (PARTITION BY c.CamaID ORDER BY p.Edad ASC) AS PacienteMasJoven, FIRST_VALUE(p.Nombre) OVER (PARTITION BY c.CamaID ORDER BY p.Edad DESC) AS PacienteMasViejo from camas c join asignaciones a ON c.CamaID = a.CamaID join pacientes p ON a.PacienteID = p.PacienteID;

-- 5. Consulta con Pivoteo Dinámico: Mostrar la cantidad de camas ocupadas por tipo de cama en una tabla pivote.
select Tipo, COUNT(CASE WHEN Disponible = false THEN 1 END) AS camasOcupadas from camas GROUP BY Tipo;	
