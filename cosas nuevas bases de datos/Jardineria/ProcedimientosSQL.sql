delimiter $$
create function procMaximo(gama varchar (50))
returns int unsigned
deterministic
begin
	declare maximo int unsigned;
	set maximo = (
	select max(precio_venta) from producto
	where producto.gama = gama);
	return maximo;
end
$$
create function procMinimo(gama varchar (50))
returns int unsigned
deterministic
begin
	declare minimo int unsigned;
	set minimo = (
	select min(precio_venta) from producto
	where producto.gama = gama);
	return minimo;
end
$$

delimiter $$
create procedure brayan (in gama varchar (50),out media decimal (15,2), out maximo decimal (15,2), out minimo decimal (15,2))
begin
	set maximo = (select procMaximo(gama)); -- llamo al otro procedimiento para que haga la funcion que esta en ella
	set minimo = (select procMinimo(gama)); -- llamo al otro procedimiento para que haga la funcion que esta en ella
end
$$

call brayan('Herramientas', @brayan1, @stiven2); -- declaro los nombres para llamar
select @brayan1,@stiven2; -- select para ver que se genero

delimiter $$
create function procMedia (gama varchar (50))
returns int unsigned
deterministic
begin
	declare media int unsigned;
    set media = (select avg (precio_venta) from productos where producto.gama = gama);
    return media;
end
$$
call brayan('Herramientas',@media,@brayan1,@stiven2);
select @media,@brayan1,@stiven2;
    
    
DELIMITER $$
DROP PROCEDURE IF EXISTS ejemplo_bucle_loop$$
CREATE PROCEDURE ejemplo_bucle_loop(IN tope INT, OUT suma INT)
BEGIN
	DECLARE contador INT;
	SET contador = 1;
	SET suma = 0;
	bucle: LOOP
	IF contador > tope THEN
	LEAVE bucle;
	END IF;
	SET suma = suma + contador;
	SET contador = contador + 1;
	END LOOP;
END
$$
DELIMITER ;
CALL ejemplo_bucle_loop(10000, @resultado);
SELECT @resultado;

repeat
while do

DELIMITER $$
drop procedure if exists ejemplo_bucle_repeat$$
create procedure ejemplo_bucle_repeat(in tope int, out suma int)
begin
 declare contador int;
 set contador =1 ;
 set suma =0;
 repeat set suma = suma + contador;
 set contador = contador +1;
 until contador > tope
 end repeat;
end
$$

delimiter ;
call ejemplo_bucle_repeat(10,@resultado);
select @resultado;

DELIMITER $$
drop procedure if exists ejemplo_bucle_while$$
create procedure ejemplo_bucle_while(in tope int, out suma int)
begin
declare acumulado int;
set acumulado = 1; -- contador
set suma =0;
while acumulado <= tope do
set suma = suma + acumulado;
set acumulado = acumulado + 1;
end while;
end
$$

delimiter ;
call ejemplo_bucle_while(10, @numero);
select @numero;


-- Paso 1
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;
-- Paso 2
CREATE TABLE test.t (s1 INT, PRIMARY KEY (s1));
-- Paso 3




DELIMITER $$
CREATE PROCEDURE handlerdemo2 ()
BEGIN
DECLARE exit HANDLER FOR SQLSTATE '23000' SET @x = 0; -- el error 23000 se produce y me devuelve el ultimo valor dado a @x que seria 0
SET @x = 1;
INSERT INTO test.t VALUES (2);
SET @x = 2;
INSERT INTO test.t VALUES (2);
SET @x = 3;
END
$$
DELIMITER ;
CALL handlerdemo2();
SELECT @x;
-- ¿Qué valor devolvería la sentencia SELECT @x?



DELIMITER $$
CREATE PROCEDURE handlerdemo ()
BEGIN
DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET @x = 1; -- aca continua asi exista error, y hace todo y al final cuando haga la llamdad me devuelve todos los valores agregadados es decir 3
SET @x = 1;
INSERT INTO test.t VALUES (1);
SET @x = 2;
INSERT INTO test.t VALUES (1);
SET @x = 3;
END
$$
DELIMITER ;
CALL handlerdemo();
SELECT @x;
-- ¿Qué valor devolvería la sentencia SELECT @x?



DELIMITER $$
CREATE PROCEDURE transaccion_en_mysql()
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		set @error1 = 'ESTAS PRINGAOO';
		ROLLBACK;
	END;
	
	START TRANSACTION;
		insert into test.t values (3);
        insert into test.t values (2);
	COMMIT;
END
$$

delimiter ;
call transaccion_en_mysql();
select @error1;

conectate a pabl









-- Paso 1
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;
-- Paso 2
CREATE TABLE t1 (
id INT UNSIGNED PRIMARY KEY,
data VARCHAR(16)
);
CREATE TABLE t2 (
i INT UNSIGNED
);
CREATE TABLE t3 (
data VARCHAR(16),
i INT UNSIGNED
);
INSERT INTO t1 VALUES (1, 'A');
INSERT INTO t1 VALUES (2, 'B');
INSERT INTO t2 VALUES (10);
INSERT INTO t2 VALUES (20);
-- Paso 3
DELIMITER $$
DROP PROCEDURE IF EXISTS curdemo$$
CREATE PROCEDURE curdemo()
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE a CHAR(16);
DECLARE b, c INT;
DECLARE cur1 CURSOR FOR SELECT id,data FROM test.t1;
DECLARE cur2 CURSOR FOR SELECT i FROM test.t2;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN cur1;
OPEN cur2;

read_loop: LOOP
	FETCH cur1 INTO b, a;
	FETCH cur2 INTO c;
	IF done THEN
	LEAVE read_loop;
	END IF;
	IF b < c THEN
	INSERT INTO test.t3 VALUES (a,b);
	ELSE
	INSERT INTO test.t3 VALUES (a,c);
	END IF;
END LOOP;
CLOSE cur1;
CLOSE cur2;
END
$$
-- Paso 4
DELIMITER ;
CALL curdemo();
SELECT * FROM t3;
