select idempleado,empleado.nombre, cliente.nombre,importe from empleado inner join cliente on empleado.codcliente=idcliente 
inner join pagos
on pagos.codcliente=idcliente;


select  alumno.nombre, delegado.nombre from alumno inner join alumno as delegado on alumno.idalumno =delegado.iddelegado;
 -- me saca el nombre del delegado de todos los alumnos 