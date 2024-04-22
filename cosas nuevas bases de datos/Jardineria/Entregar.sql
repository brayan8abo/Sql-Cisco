delimiter $$
drop procedure if exists comprar_entrada $$
create procedure comprar_entrada(nif VARCHAR(9),idCuenta INT UNSIGNED,idButaca INT UNSIGNED,out error int)
BEGIN

	DECLARE EXIT HANDLER FOR SQLSTATE '23000' -- '1062'
	BEGIN

		SET error = 1;
		ROLLBACK;
        END ;
	DECLARE EXIT HANDLER FOR SQLSTATE '22003'-- '1264'
	BEGIN
		SET  error = 1;
		ROLLBACK;
	END;

    START TRANSACTION;
   		SET error = 0;
		UPDATE cuentas SET cuentas.saldo = cuentas.saldo - 5 WHERE cuentas.id_cuenta = idCuenta;
		INSERT INTO entradas VALUES (idButaca, nif);
	COMMIT;
END $$
delimiter ;

INSERT INTO cuentas VALUES (1,50);
INSERT INTO cuentas VALUES (2,5);

-- llamada
call comprar_entrada('12345678Q', 1, 2,@error);
select @error;
call comprar_entrada('12345678P', 2, 3,@error);
select @error;


/*2. ¿Qué ocurre cuando intentamos comprar una entrada y le pasamos como parámetro un
número de cuenta que no existe en la tabla cuentas? ¿Ocurre algún error o podemos comprar la
entrada?*/
call comprar_entrada('123JÑ', 3, 5,@error);
select @error;

-- No , no ocurre ningun error.
-- Se crea en la tabla entradas una fila para : comprar_entrada('123JÑ', 3, 5,@error);



En caso de que exista algún error, ¿cómo podríamos resolverlo?.
Triggers, procedimientos y funciones en
MySQL1.8.7 Cursores

-- Para poder solucionar un error , debemos de cambiar el procedimiento a :

delimiter $$
drop procedure if exists comprar_entrada $$
create procedure comprar_entrada(nif VARCHAR(9), idCuenta INT UNSIGNED, idButaca INT UNSIGNED, out error int)
BEGIN

    DECLARE cuenta_existente INT DEFAULT 0;

    -- select para verificar si la cuenta existe
    SELECT COUNT(*) INTO cuenta_existente FROM cuentas WHERE id_cuenta = idCuenta;

    -- Si la cuenta existe, proceder con el procedimiento
    IF cuenta_existente = 1 THEN
        BEGIN
            DECLARE EXIT HANDLER FOR SQLSTATE '23000' -- '1062'
            BEGIN
                SET error = 1;
                ROLLBACK;
            END;

            DECLARE EXIT HANDLER FOR SQLSTATE '22003'-- '1264'
            BEGIN
                SET  error = 1;
                ROLLBACK;
            END;

            START TRANSACTION;
				SET error = 0;
				UPDATE cuentas SET saldo = saldo - 5 WHERE id_cuenta = idCuenta;
				INSERT INTO entradas VALUES (idButaca, nif);
				COMMIT;
        END;
    ELSE
        -- si la cuenta no existe o hay mas de una : error 1
        SET error = 1;
    END IF;
END $$
delimiter ;

call comprar_entrada('12345678Y', 4, 11,@error);
select @error;