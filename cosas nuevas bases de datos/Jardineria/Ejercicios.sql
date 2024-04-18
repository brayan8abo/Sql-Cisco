delimiter $$
create procedure texto ()
begin
declare mensaje varchar(50);
set mensaje = "Hola mundo";
select mensaje as texto;
end
$$
delimiter ;
call texto();



delimiter $$
create procedure numeros(in numero real)
begin
if numero > 0 then 
	select "El numero es positivo" as mensaje;
	elseif numero < 0 then 
	select "El numero es negativo" as mensaje;
	else 
	select "El numero ingresado es [CERO]" as mensaje;
	end if;
end
$$
delimiter ;
call numeros(5);
call numeros(-80);
call numeros(0);

delimiter $$
create procedure numerosV2(in numero int,out mensaje varchar(50))
begin
	if numero < 0 then 
   set  mensaje = "El numero es negativo"; 
   elseif numero > 0 then
   set mensaje = "El numero es positivo";
   else
   set mensaje = "El numero ingresado es [CERO]";
   end if;
end
$$
delimiter ;
call numerosV2(-10,@mensaje);
select @mensaje;


delimiter $$ 
create procedure notasAlumnoV1 (in notas double)
begin
	if notas >= 0 && notas < 5 then
    select "La nota es INSUFICIENTE" as mensajeNotas;
    elseif notas >=5 && notas <=6 then
    select "La nota es APROBADO" as mensajeNotas;
    elseif notas >=6 && notas <=7 then
    select "La nota es BIEN" as mensajeNotas;
    elseif notas >=7 && notas <=9 then 
    select "La nota es NOTABLE" as mensajeNotas;
    elseif notas >=9 && notas <=10 then
    select "La nota es SOBRESALIENTE" as mensajeNotas;
    else 
    select "NOTA INVALIDA" as  mensajeNotas;
    end if;
end 
$$
delimiter ;
call notasAlumnoV1(4.5);
call notasAlumnoV1(5.5);
call notasAlumnoV1(7);
call notasAlumnoV1(9);
call notasAlumnoV1(12);

delimiter $$ 
create procedure notasAlumnoV2 (in notas double,out mensajeNotas varchar(50))
begin
	if notas >= 0 && notas < 5 then
    set mensajeNotas = "La nota es INSUFICIENTE";
    elseif notas >=5 && notas <=6 then
    set mensajeNotas = "La nota es APROBADO";
    elseif notas >=6 && notas <=7 then
    set mensajeNotas = "La nota es BIEN";
    elseif notas >=7 && notas <=9 then 
    set mensajeNotas = "La nota es NOTABLE";
    elseif notas >=9 && notas <=10 then
    set mensajeNotas = "La nota es SOBRESALIENTE";
    else 
    set mensajeNotas = "NOTA INVALIDA";
    end if;
end 
$$
delimiter ;
call notasAlumnov2(4.5,@mensajeNotas);
select @mensajeNotas;
call notasAlumnoV2(5.5,@mensajeNotas);
select @mensajeNotas;
call notasAlumnoV2(7,@mensajeNotas);
select @mensajeNotas;
call notasAlumnoV2(9,@mensajeNotas);
select @mensajeNotas;
call notasAlumnoV2(12,@mensajeNotas);
select @mensajeNotas;

delimiter $$ 
CREATE PROCEDURE verificarNotaCase(in nota REAL)
BEGIN
DECLARE mensaje VARCHAR(50);
SET mensaje = CASE
WHEN nota >=0 and nota <5 THEN 'Insuficiente'
WHEN nota >=5 AND nota < 6 THEN 'Aprobado'
WHEN nota >=6 and nota < 7 THEN 'Bien'
WHEN nota >=7 and nota <9 THEN 'Notable'
WHEN nota >=9 and nota <= 10 THEN 'Sobresaliente'
ELSE 'Nota invalida'
END;
SELECT mensaje AS Nota;
END
$$
delimiter ;
CALL verificarNotaCase(1);

delimiter $$
CREATE PROCEDURE obtenerNombreDia(in numeroDia int)
begin 
case numeroDia
WHEN 1 THEN SELECT 'Lunes';
WHEN 2 THEN SELECT 'Martes';
WHEN 3 THEN SELECT 'Miercoles';
WHEN 4 THEN SELECT 'Jueves';
WHEN 5 THEN SELECT 'Viernes';
WHEN 6 THEN SELECT 'Sabado';
WHEN 7 THEN SELECT 'Domingo';
END CASE;
END
$$
delimiter ;
CALL obtenerNombreDia(3);

/*Escribe un procedimiento que reciba el nombre de un país como parámetro de entrada y realice
una consulta sobre la tabla cliente para obtener todos los clientes que existen en la tabla de ese
país.*/

delimiter $$
CREATE PROCEDURE ObtenerClientesPorPais(IN Lugares VARCHAR(50))
BEGIN
    -- Consulta para obtener los clientes del país dado
    SELECT cliente.nombre_cliente
    FROM cliente
    WHERE pais = Lugares;
END $$
DELIMITER ;
CALL ObtenerClientesPorPais("United Kingdom");



/*2. Escribe un procedimiento que reciba como parámetro de entrada una forma de pago, que será una cadena de caracteres (Ejemplo: PayPal, Transferencia, etc). 
Y devuelva como salida el pago de máximo valor realizado para esa forma de pago.
 Deberá hacer uso de la tabla pago de la base de datos jardinería*/
 
 delimiter $$
 create procedure pagos(in metodoPago varchar(50),out pagoMaximo int)
 begin
 SELECT MAX(pago.total) into pagoMaximo
	FROM pago
	WHERE pago.forma_pago = metodoPago;
 end
 $$
 delimiter ;
 
 call pagos("PayPal", @pagoMaximo);
SELECT @pagoMaximo;

-- 3. Escribe un procedimiento que reciba como parámetro de entrada 
-- una forma de pago, que será una cadena de caracteres (Ejemplo: 
-- PayPal, Transferencia, etc). Y devuelva como salida los 
-- siguientes valores teniendo en cuenta la forma de pago 
-- seleccionada como parámetro de entrada:

--    el pago de máximo valor,
--    el pago de mínimo valor,
--    el valor medio de los pagos realizados,
--    la suma de todos los pagos,
--    el número de pagos realizados para esa forma de pago.

delimiter $$
create procedure pago2(in metodoPago varchar(30), out max_pago int,
						out min_pago int, out avg_pago int,
						out sum_pago int, out count_pago int)
begin
	SELECT MAX(pago.total) into max_pago FROM pago
	WHERE pago.forma_pago = metodoPago;
	SELECT MIN(pago.total) into min_pago FROM pago
	WHERE pago.forma_pago = metodoPago;
	SELECT AVG(pago.total) into avg_pago FROM pago 
	WHERE pago.forma_pago = metodoPago;
	SELECT SUM(pago.total) into sum_pago FROM pago
	WHERE pago.forma_pago = metodoPago;
	SELECT COUNT(pago.total) into count_pago FROM pago 
	WHERE pago.forma_pago = metodoPago;
end
$$
delimiter ;
call pago2("Cheque", @max_pago, @min_pago, @avg_pago, @sum_pago,
					@count_pago);
                    call pago2("Paypal", @max_pago, @min_pago, @avg_pago, @sum_pago,
					@count_pago);
                    call pago2("Transferencia", @max_pago, @min_pago, @avg_pago, @sum_pago,
					@count_pago);
                    
SELECT @max_pago;
SELECT @min_pago;
SELECT @avg_pago;
SELECT @sum_pago;
SELECT @count_pago;

-- 4. Crea una base de datos llamada procedimientos que contenga una 
-- tabla llamada cuadrados. La tabla cuadrados debe tener dos 
-- columnas de tipo INT UNSIGNED, una columna llamada número y 
-- otra columna llamada cuadrado.

DROP DATABASE IF EXISTS Procedimientos;
CREATE DATABASE Procedimientos;
USE Procedimientos;

CREATE TABLE cuadros (
    numero INT UNSIGNED,
    cuadrado INT UNSIGNED
);

-- Una vez creada la base de datos y la tabla deberá crear un 
-- procedimiento llamado calcular_cuadrados con las siguientes 
-- características. El procedimiento recibe un parámetro de entrada 
-- llamado tope de tipo INT UNSIGNED y calculará el valor de los 
-- cuadrados de los primeros números naturales hasta el valor 
-- introducido como parámetro. El valor del números y de sus 
-- cuadrados deberán ser almacenados en la tabla cuadrados que 
-- hemos creado previamente.
-- Tenga en cuenta que el procedimiento deberá eliminar el 
-- contenido actual de la tabla antes de insertar los nuevos valores de los cuadrados que va a calcular.
truncate table cuadros;
-- Utilice un bucle WHILE para resolver el procedimiento.
delimiter $$
create procedure calcular_cuadrados(tope INT UNSIGNED)
begin
	DECLARE contador INTEGER DEFAULT 1;
    declare cuadrado int unsigned;
	delete from cuadros; -- truncate tambien se podria usar ya que borra todo, el delete se demora mas
	while (cuadrado <= tope) DO
		insert into cuadros values (contador, cuadrado*cuadrado);
		set contador = cuadrado+1;
	end while;
end
$$
delimiter ;
call calcular_cuadrados(2);

-- 5. Utilice un bucle REPEAT para resolver el procedimiento del 
-- ejercicio anterior.

delimiter $$
create procedure calcular_cuadrados_REPEAT(tope INT UNSIGNED)
begin
	DECLARE contador INTEGER DEFAULT 1;
    declare cuadrado int unsigned;
	DELETE FROM cuadros;
	REPEAT
		INSERT INTO  cuadros VALUES (contador, cuadrado*cuadrado);
		SET contador = cuadrado+1;
	UNTIL (cuadrado > tope)
	END REPEAT;
end
$$

delimiter ;
call calcular_cuadrados_REPEAT(10);

-- 6. Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.

delimiter $$
drop procedure if exists cuadrados_LOOP;
create procedure cuadrados_LOOP(tope INT UNSIGNED)
begin
	DECLARE contador INTEGER DEFAULT 1;
	TRUNCATE cuadros;
	inicio: LOOP
		IF (contador > tope) THEN
			LEAVE inicio;
		END IF;
		INSERT INTO  cuadros VALUES (contador, contador*contador);
		SET contador = contador+1;
	END LOOP;
end
$$

delimiter ;
call cuadrados_LOOP(7);
select * from cuadros;

-- 7. Crea una base de datos llamada procedimientos que contenga una 
-- tabla llamada ejercicio. La tabla debe tener una única columna 
-- llamada número y el tipo de dato de esta columna debe ser INT 
-- UNSIGNED.
-- Una vez creada la base de datos y la tabla deberá crear un 
-- procedimiento llamado calcular_números con las siguientes 
-- características. El procedimiento recibe un parámetro de 
-- entrada llamado valor_inicial de tipo INT UNSIGNED y 
-- deberá almacenar en la tabla ejercicio toda la secuencia 
-- de números desde el valor inicial pasado como entrada hasta 
-- el 1.

-- Tenga en cuenta que el procedimiento deberá eliminar el contenido 
-- actual de las tablas antes de insertar los nuevos valores.

-- Utilice un bucle WHILE para resolver el procedimiento.

CREATE TABLE ejercicios (
    numero INT UNSIGNED
);

delimiter $$
drop procedure if exists calcular_numeros;
create procedure calcular_numeros(valor_inicial INT UNSIGNED)
begin
	DECLARE contador INT DEFAULT valor_inicial;
	DELETE FROM ejercicios;
	while (contador >= 1) DO
		INSERT INTO  ejercicios VALUES (contador);
		SET contador = contador - 1;
	end while;
end
$$
delimiter ; 

call calcular_numeros(15);
select * from ejercicios;

-- 8. Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.
delimiter $$
create procedure calcularNumerosRepeat(valor_inicial int unsigned)
begin 
declare contador int default valor_inicial;
truncate ejercicios;
repeat 
insert into ejercicios values (contador);
set contador = contador - 1;
until (contador < 1)
end repeat;
end
$$
delimiter ;
call calcularNumerosRepeat(15);

-- 9. Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.

delimiter $$
drop procedure if exists calcularNumerosLoop;
create procedure calcularNumerosLoop(valor_inicial int unsigned)
begin
declare contador int default valor_inicial;
truncate ejercicios;
inicio_Loop:loop
IF (contador < 1) THEN
			LEAVE inicio_Loop;
		END IF;
		INSERT INTO  ejercicios VALUES (contador);
		SET contador = contador - 1;
	END LOOP;
end
$$

delimiter ;

call calcularNumerosLoop(20);
select * from ejercicios;

CREATE TABLE pares (
    numero INT UNSIGNED
);

CREATE TABLE impares (
    numero INT UNSIGNED
);

-- Una vez creada la base de datos y las tablas deberá crear un 
-- procedimiento llamado calcular_pares_impares con las 
-- siguientes características. El procedimiento recibe un 
-- parámetro de entrada llamado tope de tipo INT UNSIGNED y 
-- deberá almacenar en la tabla pares aquellos números pares 
-- que existan entre el número 1 el valor introducido como 
-- parámetro. Habrá que realizar la misma operación para 
-- almacenar los números impares en la tabla impares.

-- Tenga en cuenta que el procedimiento deberá eliminar el 
-- contenido actual de las tablas antes de insertar los nuevos 
-- valores.

delimiter $$
drop procedure if exists calcular_pares_impares$$
create procedure calcular_pares_impares(in tope int unsigned)
begin
declare contador int unsigned default 1;
truncate pares;
truncate impares;
while contador <= tope do
	if contador%2 = 0 then 
    insert into pares values (contador);
    else 
    insert into impares values(contador);
    end if;
    set contador = contador +1 ;
    end while;
end
$$
delimiter ;
call calcular_pares_impares(100);
select * from pares;
select * from impares;

-- 11. Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.

delimiter $$
drop procedure if exists calcular_pares_impares_repeat$$
create procedure calcular_pares_impares_repeat(in tope int unsigned)
begin
declare contador int unsigned default 1;
truncate impares;
truncate pares;
repeat
if contador%2 =0 then
insert into pares values (contador);
else 
insert into impares values (contador);
end if;
set contador = contador +1;
until contador > tope
end repeat;
end;
$$ 
delimiter ;
call calcular_pares_impares_repeat(10);
select * from pares;
select * from impares;

delimiter $$
drop procedure if exists calcular_pares_impares_loop$$
create procedure calcular_pares_impares_loop(in tope int unsigned)
begin
declare contador int unsigned default 1;
truncate pares;
truncate impares;
InicioLoop:loop
if contador > tope then 
leave inicioLoop;
end if;
if contador%2=0 then
insert into pares values (contador);
else 
insert into impares values (contador);
end if;
set contador = contador +1;
end loop;
end
$$

delimiter ;
call calcular_pares_impares_loop(10);
select * from impares;
select * from pares;

/*1.8.3 Funciones sin sentencias SQL
1. Escribe una función que reciba un número entero de entrada y devuelva TRUE si el número es par o FALSE en caso contrario.*/

set global log_bin_trust_function_creators=1;

delimiter $$
drop function if exists calcular_pares_impares$$
create function calcular_pares_impares(numero int)
returns boolean 
begin
if numero%2=0 then
return true;
else 
return false;
end if;
end
$$

delimiter ;
select calcular_pares_impares(10);

delimiter $$
drop FUNCTION if exists hipotenusa $$
create FUNCTION hipotenusa(hipotenusa1 INT UNSIGNED, hipotenusa2 int unsigned)
returns double 
begin


	RETURN sqrt((hipotenusa1*hipotenusa1) + (hipotenusa2*hipotenusa2));


end$$
DELIMITER ;



select hipotenusa(3,5);

/*3. Escribe una función que reciba como parámetro de entrada un valor numérico que
represente un día de la semana y que devuelva una cadena de caracteres con el nombre del
día de la semana correspondiente.
Por ejemplo, para el valor de entrada 1 debería devolver la cadena lunes.*/



delimiter $$
drop FUNCTION if exists dia_semana $$
create FUNCTION dia_semana(dia INT UNSIGNED)
returns VARCHAR(30) 
begin

	case
		when dia = 1 then return "lunes";
        when dia = 2 then return "martes";
        when dia = 3 then return "miercoles";
        when dia = 4 then return "jueves";
        when dia = 5 then return "viernes";
        when dia = 6 then return "sabado";
        when dia = 7 then return "domingo";
        when dia < 1 or dia > 7 then return "parametro entrada no valido";
    end case;
end$$
DELIMITER ;



select dia_semana(1),dia_semana(2),dia_semana(3),dia_semana(4),dia_semana(5),dia_semana(6),dia_semana(7);

/*4. Escribe una función que reciba tres números reales como parámetros de entrada y
devuelva el mayor de los tres.*/


delimiter $$
drop FUNCTION if exists numero_mayor $$
create FUNCTION numero_mayor(num1 real,num2 real, num3 real)
returns real
begin

	if num1>num2 and num1>num3 then return num1;
    ELSEIF num2>num1 and num2>num3 then return num2;
    ELSE  return num3;

    end if;
end$$
DELIMITER ;

select numero_mayor(5,2,4);
select numero_mayor(2,6,3);
select numero_mayor(2,1,3);

/*5. Escribe una función que devuelva el valor del área de un círculo a partir del valor del radio
que se recibirá como parámetro de entrada.
Triggers, procedimientos y funciones en
MySQL1.8.3 Funciones sin sentencias SQL*/

delimiter $$
drop FUNCTION if exists area_circulo $$
create FUNCTION area_circulo(radio float)
returns real
begin

	return (PI()*(radio*radio));
    -- return (PI()*(pow(radio,2)))


end$$
DELIMITER ;

select area_circulo(10);

/*6. Escribe una función que devuelva como salida el número de años que han transcurrido
entre dos fechas que se reciben como parámetros de entrada. Por ejemplo, si pasamos como
parámetros de entrada las fechas 2018-01-01 y 2008-01-01 la función tiene que devolver que
@@ -590,15 +670,70 @@ Para realizar esta función puede hacer uso de las siguientes funciones que nos
MySQL:
• DATEDIFF
• TRUNCATE*/


delimiter $$
drop FUNCTION if exists diferencia_años $$
create FUNCTION diferencia_años(anio1 date,anio2 date)
returns INT
begin

	declare anio int;
    set anio = datediff(anio1,anio2)/365;
    RETURN truncate(anio,1);


end$$
DELIMITER ;

select diferencia_años("2018-01-01" , "2008-01-01");


/*7. Escribe una función que reciba una cadena de entrada y devuelva la misma cadena pero
sin acentos. La función tendrá que reemplazar todas las vocales que tengan acento por la
misma vocal pero sin acento.
Por ejemplo, si la función recibe como parámetro de entrada la cadena María la función debe
devolver la cadena Maria.
Triggers, procedimientos y funciones en
MySQL1.8.4 Funciones con sentencias SQL*/


delimiter $$
drop FUNCTION if exists sin_acentos $$
create FUNCTION sin_acentos(cadena varchar(50))
returns varchar(50)
begin

	declare texto varchar(50);
    set texto = cadena;


    SET texto = replace(texto, 'á', 'a');
	SET texto = replace(texto, 'é', 'e');
	SET texto = replace(texto, 'í', 'i');
	SET texto = replace(texto, 'ó', 'o');
	SET texto = replace(texto, 'ú', 'u');

    SET texto = replace(texto, 'Á', 'A');
	SET texto = replace(texto, 'É', 'E');
	SET texto = replace(texto, 'Í', 'I');
	SET texto = replace(texto, 'Ó', 'O');
	SET texto = replace(texto, 'Ú', 'U');

	RETURN texto;



end$$
DELIMITER ;

select sin_acentos("ÁéÍóÚ");

/*1.8.4 Funciones con sentencias SQL
1. Escribe una función para la base de datos tienda que devuelva el número total de productos que hay en la tabla productos.*/

delimiter $$
drop function if exists total_productos;
create function total_productos()
returns int
begin
declare total int;
set total = (select count(id) from producto); 
return total;
end$$
delimiter ;

select total_productos();

/*2. Escribe una función para la base de datos tienda que devuelva el valor medio del precio de los productos de un determinado fabricante que se recibirá como parámetro de entrada. 
El parámetro de entrada será el nombre del fabricante.*/

delimiter $$
drop function if exists valor_medio$$
create function valor_medio(fabricante varchar(100))
returns double
begin
DECLARE media double;
	SET media = (
	    SELECT AVG(producto.precio)
	    FROM producto, fabricante 
	    WHERE producto.codigo_fabricante = fabricante.codigo_fabricante
	   		  AND fabricante.nombre = fabricante);
   RETURN media;
end $$
delimiter ;
select valor_medio('Asus');



/*3. Escribe una función para la base de datos tienda que devuelva el valor máximo del precio de los productos de un determinado fabricante que se recibirá como parámetro de entrada. 
El parámetro de entrada será el nombre del fabricante.*/


delimiter $$
drop function if exists valor_max$$
create function valor_max(fabricante varchar(100))
returns double
begin
DECLARE max double;
	SET max = (
	    SELECT max(producto.precio)
	    FROM producto, fabricante 
	    WHERE producto.codigo_fabricante = fabricante.codigo_fabricante
	   		  AND fabricante.nombre = fabricante);
   RETURN max;
end $$
delimiter ;
select valor_max('Asus');

/*4. Escribe una función para la base de datos tienda que devuelva el valor mínimo del precio de los productos de un determinado fabricante que se recibirá como parámetro de entrada. 
El parámetro de entrada será el nombre del fabricante.*/


delimiter $$
drop function if exists valor_min$$
create function valor_min(fabricante varchar(100))
returns double
begin
DECLARE min double;
	SET min = (
	    SELECT min(producto.precio)
	    FROM producto, fabricante 
	    WHERE producto.codigo_fabricante = fabricante.codigo_fabricante
	   		  AND fabricante.nombre = fabricante);
   RETURN min;
end $$
delimiter ;
select valor_min('Asus');


CREATE TABLE alumno (
    id INT UNSIGNED,
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    PRIMARY KEY(id)
);

-- Una vez creada la base de datos y la tabla deberá crear un 
-- procedimiento llamado insertar_alumno con las siguientes 
-- características. El procedimiento recibe cuatro parámetros de 
-- entrada (id, nombre, apellido1, apellido2) y los insertará en 
-- la tabla alumno. El procedimiento devolverá como salida un 
-- parámetro llamado error que tendrá un valor igual a 0 si la 
-- operación se ha podido realizar con éxito y un valor igual a 
-- 1 en caso contrario.
-- Deberá manejar los errores que puedan ocurrir cuando se intenta
-- insertar una fila que contiene una clave primaria repetida.


delimiter $$
drop procedure if exists insertar_alumno$$
create procedure insertar_alumno(id int unsigned,nombre varchar(50),apellido1 varchar(50),apellido2 varchar(50))
begin
declare error int;
declare exit handler for sqlstate '23000'
begin 
set error =1;
select error;
end ;
insert into alumno values (id,nombre,apellido1,apellido2);
set error =0;
select error;
end
$$
delimiter ;
call insertar_alumno(3,"Pepito","Perez","Locos");


/*TRANSACIONES*/
-- Crea una base de datos llamada cine que contenga dos tablas 
-- con las siguientes columnas.

DROP DATABASE IF EXISTS cine;
CREATE DATABASE cine;
USE cine;

-- Tabla cuentas:
-- 	id_cuenta: entero sin signo (clave primaria).
-- 	saldo: real sin signo.

CREATE TABLE cuentas (
    id_cuenta INT UNSIGNED,
    saldo REAL UNSIGNED,
    PRIMARY KEY(id_cuenta)
);

-- Tabla entradas:
-- 	id_butaca: entero sin signo (clave primaria).
-- 	nif: cadena de 9 caracteres.

CREATE TABLE entradas (
    id_butaca INT UNSIGNED,
    nif VARCHAR(9),
    PRIMARY KEY(id_butaca)
);

/*Una vez creada la base de datos y las tablas deberá crear un procedimiento llamado comprar_entrada con las siguientes características. 
El procedimiento recibe 3 parámetros de entrada (nif, id_cuenta, id_butaca) y devolverá como salida un parámetro llamado error que tendrá un valor igual a 0 si 
la compra de la entrada se ha podido realizar con éxito y un valor igual a 1 en caso contrario.*/



delimiter $$ 
drop procedure if exists comprar_entrada$$
create procedure comprar_entrada(nif varchar(9),id_cuenta int unsigned,id_butaca int unsigned)
begin
declare error int;
declare exit handler for sqlexception, sqlwarning
begin 
set error =1;
SELECT error;
rollback;
start transaction;
set error =0;
UPDATE cuentas 
SET 
    cuenta.saldo = cuenta.saldo - 5
WHERE
    cuenta.id_cuenta = id_cuenta;
insert into entradas values (id_butaca,nif);
SELECT error;
commit;
end;
end;
$$
delimiter ;


call comprar_entrada('73026258Q', 1, 2);
call comprar_entrada('73024558Q', 2, 3);

INSERT INTO cuentas VALUES (1,50);
INSERT INTO cuentas VALUES (2,5);


























