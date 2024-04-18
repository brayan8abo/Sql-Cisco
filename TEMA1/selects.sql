

select  apellidos, nombre from clientes;
/*SE PUEDE USAR EL SELECT Y DIRECTAMENTE LO QUE QUIERO Y FROM PARA INDICAR QUE TABLA QUIERO USAR*/
  -- CONCAT (DENTRO DEL PARENTESIS LO QUE DESEO USAR Y SI HAY UN ESPACIO USO " ", PARA QUE HAGA EL ESPACIO
select concat (nombre, " ", apellidos) as nombre, direccion from clientes;

select id_Producto, nombre_prod, precio_unitario, 10*precio_unitario as  total from productos;

-- se usa AS para agregar un nombre a una colunma si es que genero algo y quiero que tenga un nombre 

select concat_ws(" ",nombre, apellidos, direccion) as nombre, direccion from clientes;

-- CON EL CONCAT_WS SE PUEDE USAR PARA CONCATENAR PERO TAMBIEN USAR ALGO EN ESPECIAL POR SI QUEREMOS SEPARAR ALGUNAS FRASES

select LOWER(nombre) as nombre, direccion from clientes;
select upper(nombre) as nombre, direccion from clientes;

-- LOWER PARA MINUSCULAS Y UPPER PARA MAYUSCULAS

#  SELECT NUNCA CAMBIA INFORMACION EN LA BASE DE DATOS, SOLO PARA IMPRIMIR POR PANTALLA Y VERLO DE UNA MEJOR MANERA

select substr(apellidos,1,5), apellidos from clientes;

select substr(concat_ws(" ", nombre,apellidos),1,10) as nombre15  from clientes;
select upper(substr(concat_ws(" ", nombre,apellidos),1,15)) as "nombre en mayuscula"  from clientes; -- upper para poner en masyucula
select lower(substr(concat_ws(" ", nombre,apellidos),1,15)) as "nombre en minuscula"  from clientes; -- lower para poner en miniscula

select pow(PRECIO_UNITARIO,2) FROM PRODUCTOS; -- POW PARA POTENCIAS

select 2+2; -- se puede usar para calculardora tambien

select pi();

select round(123.564,2);  -- para redondear encima de 5 es al siguiente numero debajo de 5 el mismo
select truncate(123.999999018,2); -- despues de los numeros ingresados se pone , y un numero para la cantidad de decimales que deseemos
select now();
select curtime();
select current_user();
select 3 DIV 2;

select distinct (apellido1) from alumnos, -- este me devulve todo lo que no sea repetido en la fila apellido1, es decir si tengo dos de apellido sanchez solo me sale 1



