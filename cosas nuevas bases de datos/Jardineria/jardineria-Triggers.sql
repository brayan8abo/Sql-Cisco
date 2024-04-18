set @pepe =(select 1+2); -- le doy valor a pepe
select @pepe;

select 1+2 into @paco; -- le doy valor a paco
select @paco;

select '1+2' into @paco; -- concateno 1+2, no me suma sino que me pone 1+3 como tal
select @paco;
 
 select @@log_bin_trust_function_creators;





DELIMITER $$
DROP PROCEDURE IF EXISTS listar_productos$$
CREATE PROCEDURE listar_productos(IN gama VARCHAR(50))
BEGIN
SELECT *
FROM producto
WHERE producto.gama = gama;
END
$$

DELIMITER ;
CALL listar_productos('Herramientas');
SELECT * FROM producto;

DELIMITER $$
DROP PROCEDURE IF EXISTS contar_productos$$
CREATE PROCEDURE contar_productos(IN gama VARCHAR(50), OUT total INT UNSIGNED)
BEGIN
SET total = (
SELECT COUNT(*)
FROM producto
WHERE producto.gama = gama);
END
$$


DELIMITER ;
CALL contar_productos('Herramientas', @pepe);
SELECT @pepe;  -- SIEMPRE QUE SE CAMBIE SE DEBE EJECUTAR DESDE EL DELIMITER, QUE ESTE SIRVE PARA DEFINIR EL CARACTER QUE SE ESTA USANDO PARA SEPARAR


DELIMITER $$
DROP PROCEDURE IF EXISTS calcular_max_min_media$$
CREATE PROCEDURE calcular_max_min_media(IN gama VARCHAR(50), OUT precio_maximo DECIMAL(15, 2), OUT precio_minimo DECIMAL(15, 2), OUT media DECIMAL(15, 2))
BEGIN
SET precio_maximo = (
SELECT MAX(precio_venta)
FROM producto
WHERE producto.gama = gama);
SET precio_minimo = (
SELECT MIN(precio_venta)
FROM producto
WHERE producto.gama = gama);
SET media = (
SELECT AVG(precio_venta)
FROM producto
WHERE producto.gama = gama);
END
$$
DELIMITER ;
CALL calcular_max_min_media('Herramientas', @maximo, @minimo, @media);
SELECT @maximo, @minimo, @media;


DELIMITER $$
DROP PROCEDURE IF EXISTS calcular_max_min_media$$
CREATE PROCEDURE calcular_max_min_media(
IN gama VARCHAR(50),
OUT maximo DECIMAL(15, 2),
OUT minimo DECIMAL(15, 2),
OUT media DECIMAL(15, 2)
)
BEGIN
SELECT
MAX(precio_venta),
MIN(precio_venta),
AVG(precio_venta)
FROM producto
WHERE producto.gama = gama
INTO maximo, minimo, media;
END
$$
DELIMITER ;
CALL calcular_max_min_media('Herramientas', @maximo, @minimo, @media);
SELECT @maximo, @minimo, @media;


DELIMITER $$
DROP FUNCTION IF EXISTS contar_productos$$
CREATE FUNCTION contar_productos(gama VARCHAR(50))
RETURNS INT UNSIGNED
reads sql data
-- deterministic
-- acá se debe poner la funcion, deterministic, no sql, reads sql data
BEGIN
-- Paso 1. Declaramos una variable local
 DECLARE total INT UNSIGNED; -- se declara la variable donde se va almacenar
 declare pepe int unsigned;
-- Paso 2. Contamos los productos
set pepe = 1;
SET total = ( -- hago sel set con la variable y luego el select para la operacion deseada
SELECT COUNT(*)
FROM producto
WHERE producto.gama = gama)+pepe; -- si aca pongo +pepe,deberia sumar lo que vale pepe
-- Paso 3. Devolvemos el resultado
RETURN total; -- me devuelve el valor dado con el set en el select,aqui tambien puedo poner total+pepe, y me suma ambos valores para devolverlo
END
$$
DELIMITER ;
set @resultado = (SELECT contar_productos('Herramientas')); -- a resultado le estoy dando el valor en la funcion
select @resultado; -- variable, con el resultado de la funcion











