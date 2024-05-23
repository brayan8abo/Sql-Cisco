create database testExamen;
use testExamen;

/*Escribe las sentencias SQL necesarias para crear una base de datos llamada test, una tabla llamada alumnos, los datos de dichos alumnos se cargaran a través de la tabla incorporada 
al final del ejercicio, usando la función load. La tabla alumnos está formada por las siguientes columnas:

    id (entero sin signo y clave primaria)
    nombre (cadena de caracteres)
    apellido1 (cadena de caracteres)
    apellido2 (cadena de caracteres
    fecha_nacimiento (fecha)*/
    
    
    create table alumnos (id int unsigned primary key,
    nombre varchar (25),
    apeliido1 varchar (25),
    apeliido2 varchar (25),
    fecha_nacimiento date);
    
    /*Una vez creada la tabla se decide añadir una nueva columna a la tabla llamada edad que será un valor calculado a partir de la columna fecha_nacimiento. 
    Escriba la sentencia SQL necesaria para modificar la tabla y añadir la nueva columna.
A continuación escribe una función llamada calcular_edad que reciba una fecha y devuelva el número de años que han pasado desde la fecha actual hasta la fecha pasada como parámetro:*/

alter table alumnos add edad int;

delimiter $$
drop FUNCTION if exists calcular_edad$$
create FUNCTION calcular_edad(anio1 date,anio2 date)
returns INT
deterministic
begin

	declare años int;
    set años = datediff(anio1,anio2)/365;
    RETURN truncate(años,1);


end$$
DELIMITER ;

select calcular_edad("2024-05-23","2000-04-14" ) as mensaje;



/*Para completar la tabla ahora debemos generar un procedimiento que permita calcular la edad de todos los alumnos que ya existen en la tabla.
Para esto será necesario crear un procedimiento llamado actualizar_columna_edad que calcule la edad de cada alumno y actualice la tabla. 
Este procedimiento hará uso de la función calcular_edad que hemos creado en el paso anterior.*/



DELIMITER $$
drop procedure if exists actualizar_columna_edad;
CREATE PROCEDURE actualizar_columna_edad()
BEGIN
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE edad INT;
    
    -- Declarar el cursor
    DECLARE cursor1 CURSOR FOR 
    SELECT edad FROM alumnos;
    
    -- Handler para el fin de los resultados del cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Abrir el cursor
    OPEN cursor1;
    
    leer_alumnos: LOOP
        -- Obtener la siguiente fila
        FETCH cursor1 INTO edad;
        
        -- Salir del bucle si no hay más filas
        IF done THEN
            LEAVE leer_alumnos;
        END IF;
        
        -- Actualizar el salario
        UPDATE alumnos SET edad = (select calcular_edad(now(),fecha_nacimiento)) WHERE edad is null;
    END LOOP leer_alumnos;
    
    -- Cerrar el cursor
    CLOSE cursor1;
END $$

delimiter ;

call actualizar_columna_edad();



/*Ejercicio 2: Valor del ejercicio 4 puntos
Modifica la tabla anterior incluyendo el campo email y escribe un procedimiento que dados los parámetros de entrada: nombre, apellido1, apellido2 y dominio, cree una dirección de email y la devuelva como salida.
    Procedimiento: crear_email
    Entrada:
– nombre (cadena de caracteres)
– apellido1 (cadena de caracteres)
– apellido2 (cadena de caracteres)
– dominio (cadena de caracteres)
    Salida:
– email (cadena de caracteres)


    El primer carácter del parámetro nombre.
    Los tres primeros caracteres del parámetro apellido1.
    Los tres primeros caracteres del parámetro apellido2.
    El carácter @.
    El dominio pasado como parámetro.
*/





alter table alumnos add email varchar(50);


DELIMITER $$

CREATE PROCEDURE crear_email(IN nombre varchar (25),IN apellido1 varchar (25),apellido2 varchar (25), in dominio varchar (10),out email varchar (70))
BEGIN
    set @dominio = "@outlook.es";
    
    SELECT nombre,apellido1,apellido2 FROM alumnos WHERE email is null;
END 
$$

DELIMITER ;



/*Ejercicio 3: Valor del ejercicio 1 punto

Realizar los siguientes procedimientos y funciones sobre la base de datos jardinería.

Escriba una función llamada cantidad_total_de_productos_vendidos que reciba como parámetro de entrada el código de un producto y devuelva la cantidad total de productos que se han vendido con ese código*/


DELIMITER $$
DROP PROCEDURE IF EXISTS cantidad_total_de_productos_vendidos$$
CREATE PROCEDURE cantidad_total_de_productos_vendidos(IN codigo_producto VARCHAR(15), OUT total INT UNSIGNED)
BEGIN
SET total = (
SELECT sum(cantidad)
FROM detalle_pedido
WHERE detalle_pedido.codigo_producto = codigo_producto);
END
$$


DELIMITER ;
CALL cantidad_total_de_productos_vendidos('11679', @total);
select @total;
-- ---------------------------------
CALL cantidad_total_de_productos_vendidos('OR-127', @total);
select @total;




/*Crea una tabla que se llame productos_vendidos que tenga las siguientes columnas:

    id (entero sin signo, auto incremental y clave primaria)
    codigo_producto (cadena de caracteres)
    cantidad_total (entero)*/
    
    
    create table productos_vendidos (id int unsigned auto_increment primary key,
    codigo_producto varchar (50),
    cantidad_total int);




/*Escribe un procedimiento llamado estadísticas_productos_vendidos que para cada uno de los productos de la tabla 
producto calcule la cantidad total de unidades que se han vendido y almacene esta información en la tabla productos_vendidos.*/
delimiter $$

drop procedure if exists estadisticas_productos_vendidos$$
create procedure estadisticas_productos_vendidos()
begin

-- select count(cantidad) from detalle_pedido;

insert into productos_vendidos (cantidad_total) (select count(cantidad) from detalle_pedido);


end
$$
delimiter ;

call estadisticas_productos_vendidos();


/*Escribe un procedimiento llamado estadísticas_productos_vendidos que para cada uno de los productos de la tabla producto calcule la cantidad total de unidades que se han vendido y almacene esta información en la tabla productos_vendidos.

El procedimiento tendrá que realizar las siguientes acciones:
    Borrar el contenido de la tabla productos_vendidos.
    Recorrer cada uno de los productos de la tabla producto. Será necesario usar un cursor.
    Calcular la cantidad total de productos vendidos. En este paso será necesario utilizar la función cantidad_total_de_productos_vendidos desarrollada en el ejercicio 3.
    Insertar en la tabla productos_vendidos los valores del código de producto y la cantidad total de unidades que se han vendido para ese producto en concreto.

*/
delimiter $$

drop procedure if exists estadísticas_productos_vendidosV2$$
create procedure estadísticas_productos_vendidosV2()
begin
DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE nombre VARCHAR(100);
    
    -- Declarar el cursor
    DECLARE cursor1 CURSOR FOR 
    SELECT nombre FROM producto;
    
    -- Handler para el fin de los resultados del cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Abrir el cursor
    OPEN cursor1;
    
    leerProductos: LOOP
        -- Obtener la siguiente fila
        FETCH cursor1 INTO nombre;
        
        -- Salir del bucle si no hay más filas
        IF done THEN
            LEAVE leerProductos;
        END IF;
        
        -- Aquí puedes realizar alguna operación con empNombre
        SELECT nombre;
    END LOOP leerProductos;
    
    -- Cerrar el cursor
    CLOSE cursor1;
    
    truncate productos_vendidos;
    
    CALL cantidad_total_de_productos_vendidos('11679', @total);
    
   insert into productos_vendidos (codigo_producto,cantidad_total) (select codigo_producto,cantidad from pedido);
end
$$
delimiter ;

call estadísticas_productos_vendidosV2();


