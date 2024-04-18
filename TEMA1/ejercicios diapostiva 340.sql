select * from alumno;

-- 1
select nombre , reverse (nombre) as 'Nombre Invertido' from alumno; -- para sacar primer nombre y en otra colunmna el nombre invertido

-- 2 
select concat_ws(" ",nombre,apellido1,apellido2) as "Nombres y apellidos" , concat(reverse(nombre), ' ', reverse(apellido1), ' ', reverse(apellido2)) as 'Nombre Completo Invertido' from alumno;
-- NOMBRE Y APELLIDOS, Y NOMBRES Y APELLIDOS INVERTIDOS
 
-- 3
select concat(upper(nombre), ' ', upper(apellido1) , ' ', upper(apellido2)) as 'Nombre y Apellidos en Mayúscula', reverse(concat(lower(nombre), ' ', lower(apellido1) , ' ', lower(apellido2))) as 'Nombre y Apellidos Invertidos en Minúscula' from alumno;
-- para sacar informacion en mayuscula y minuscula en dos columnas

-- 4 --
 select concat_ws(' ',nombre,apellido1,apellido2) as 'Nombres y apellidos', char_length(concat_ws(" ",nombre,apellido1,apellido2)) as 'Cantidad de caracteres', length(concat_ws(" ", nombre,apellido1,apellido2)) as 'Cantidad de Bytes' from alumno;


-- 5

select concat_ws(' ',nombre,apellido1,apellido2) as 'Nombres y apellido' , lower(concat(nombre, '.', apellido1, "@fpccc.es")) as correo from alumno;



-- 6
 select concat_ws(' ',nombre,apellido1,apellido2) as 'Nombres y apellido' , lower(concat(nombre, '.', apellido1, "@fpccc.es")) as 'correo' , concat(reverse(apellido2), year(fecha_nacimiento)) as contraseña from alumno;

-- 7

select dayname(19731224) as 'fecha nacimiento brayan';

SET lc_time_names = 'es_ES';

SET GLOBAL lc_time_names = 'es_ES';

 SHOW VARIABLES;
 
 set global time_zone ='Europe/Madrid';
 
 
 
 
 
 
 
 
 select fecha_nacimiento , day(fecha_nacimiento) as ' ´Día de nacimiento' , month(fecha_nacimiento) as 'Mes', year(fecha_nacimiento) as " Año" from alumno;
 
 select fecha_nacimiento, dayname(fecha_nacimiento) as ' Día de nacimiento' , monthname(fecha_nacimiento) as 'Mes' from alumno;

 -- select year(fecha_nacimiento) , dayname(fecha_nacimiento) as ' Día de nacimiento' , monthname(fecha_nacimiento) as 'Mes' from alumno;
 
 select date_format(fecha_nacimiento, "%W/%M/%Y") as "Fecha formateada" , dayname(fecha_nacimiento) as " Día de nacimiento", monthname(fecha_nacimiento) as "Mes de nacimiento" from alumno;
 
select fecha_nacimiento, DATEDIFF(NOW(), fecha_nacimiento) as "Días trasncurridos" from alumno;
 
 select fecha_nacimiento, truncate(DATEDIFF(NOW(), fecha_nacimiento)/ 365.25,0) "Años aproximados" from alumno; -- se pone el ,0 por que necesita saber cuantos decimales que queramos que salga
 select fecha_nacimiento, round(DATEDIFF(NOW(), fecha_nacimiento)/ 365.25) "Años aproximados" from alumno;
 
 
 
 update alumno set email=(select lower(concat(nombre, '.', apellido1, "@fpccc.es"))); -- agregar datos masivamente
 
 update alumno set email = null;
 
 delete email from alumno;
  
  select * from alumno;
 