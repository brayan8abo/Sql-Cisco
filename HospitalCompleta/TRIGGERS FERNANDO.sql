create database triggersSoluciones;
use triggersSoluciones;

CREATE TABLE Dept
(Dept_No INT NOT NULL,
DNombre VARCHAR(50) NULL,
Loc VARCHAR(50) NULL);
CREATE TABLE Emp
(Emp_No INT NOT NULL,
Apellido VARCHAR(50) NULL,
Oficio VARCHAR(50) NULL,
Dir INT NULL,
Fecha_Alt DATE NULL,
Salario NUMERIC(9,2) NULL,
Comision NUMERIC(9,2) NULL,
Dept_No INT NULL);

CREATE TABLE Hospital
(Hospital_Cod INT NOT NULL,
Nombre VARCHAR(50) NULL,
Direccion VARCHAR(50) NULL,
Telefono VARCHAR(50) NULL,
Num_Cama INT NULL);
CREATE TABLE Doctor
(
Doctor_No INT NOT NULL,
Hospital_Cod INT NOT NULL,
Apellido VARCHAR(50) NULL,
Especialidad VARCHAR(50) NULL
);

CREATE TABLE Sala
(Sala_Cod INT NOT NULL,
Hospital_Cod INT NOT NULL,
Nombre VARCHAR(50) NULL,
Num_Cam INT NULL
);
CREATE TABLE Plantilla
(Empleado_No INT NOT NULL,
Sala_Cod INT NOT NULL,
Hospital_Cod INT NOT NULL,
Apellido VARCHAR(50) NULL,
Funcion VARCHAR(50) NULL,
T VARCHAR(15) NULL,
Salario NUMERIC(9,2) NULL
);

CREATE TABLE Enfermo
(
Inscripcion INT NOT NULL,
Apellido VARCHAR(50) NULL,
Direccion VARCHAR(50) NULL,
Fecha_Nac VARCHAR(50) NULL,
S VARCHAR(2) NULL,
NSS INT NULL
);


-- Insertar datos en la table Dept
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(10,'CONTABILIDAD','ELCHE');
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(20,'INVESTIGACIÓN','MADRID');
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(30,'VENTAS','BARCELONA');
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(40,'PRODUCCIÓN','SALAMANCA');


-- Insertar datos en la tabla Emp
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No) VALUES
(7369,'SANCHEZ','EMPLEADO',7902,'1980-12-17',10400,0,20),
(7499,'ARROYO','VENDEDOR',7698,'1981-02-22',208000,39000,30),
(7521,'SALA','VENDEDOR',689,'1981-02-22',162500,65000,30),
(7566,'JIMENEZ','DIRECTOR',7839,'1981-04-02',386750,0,20),
(7654,'MARTIN','VENDEDOR',7698,'1981-09-28',182000,182000,30),
(7698,'NEGRO','DIRECTOR',7839,'1981-05-01',370500,0,30),
(7782,'CEREZO','DIRECTOR',7839,'1981-06-09',318500,0,10),
(7788,'NINO','ANALISTA',7566,'1987-03-30',390000,0,20),
(7839,'REY','PRESIDENTE',0,'1981-11-17',650000,0,10),
(7844,'TOVAR','VENDEDOR',7698,'1981-09-08',195000,0,30),
(7876,'ALONSO','EMPLEADO',7788,'1987-05-03',143000,0,20),
(7900,'JIMENO','EMPLEADO',7698,'1981-12-03',123500,0,30),
(7902,'FERNANDEZ','ANALISTA',7566,'1981-12-03',390000,0,20),
(7934,'MUÑOZ','EMPLEADO',7782,'1982-06-23',169000,0,10),
(7119,'SERRA','DIRECTOR',7839,'1983-11-19',225000,39000,20),
(7322,'GARCIA','EMPLEADO',7119,'1982-10-12',129000,0,20);


-- Insertar datos en la tabla Hospital
INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama)
VALUES(19,'Provincial','O Donell 50','964-4256',502);
INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama)
VALUES(18,'General','Atocha s/n','595-3111',987);
INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama) VALUES(22,'La
Paz','Castellana 1000','923-5411',412);
INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama) VALUES(45,'San
Carlos','Ciudad Universitaria','597-1500',845);

 -- Insertar datos en la tabla Doctor
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(22,386,'Cabeza D.','Psiquiatría');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(22,398,'Best D.','Urología');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(19,435,'López A.','Cardiología');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(22,453,'Galo D.','Pediatría');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(45,522,'Adams C.','Neurología');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(18,585,'Miller G.','Ginecología');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(45,607,'Chuki P.','Pediatría');
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(18,982,'Cajal R.','Cardiología');

-- Insertar datos en la tabla Sala
INSERT INTO SALA VALUES(1,22,'Recuperación',10);
INSERT INTO SALA VALUES(1,45,'Recuperación',15);
INSERT INTO SALA VALUES(2,22,'Maternidad',34);
INSERT INTO SALA VALUES(2,45,'Maternidad',24);
INSERT INTO SALA VALUES(3,19,'Cuidados Intensivos',21);
INSERT INTO SALA VALUES(3,18,'Cuidados Intensivos',10);
INSERT INTO SALA VALUES(4,18,'Cardiología',53);
INSERT INTO SALA VALUES(4,45,'Cardiología',55);
INSERT INTO SALA VALUES(6,19,'Psiquiátricos',67);
INSERT INTO SALA VALUES(6,22,'Psiquiátricos',118);

-- Insertar datos en la tabla Plantilla
INSERT INTO Plantilla(Hospital_Cod,Sala_Cod,Empleado_No,Apellido, Funcion, T, Salario)
VALUES
(22,6,1009,'Higueras D.','Enfermera','T',200500),
(45,4,1280,'Amigo R.','Interino','N',221000),
(19,6,3106,'Hernández','Enfermero','T',275000),
(19,6,3754,'Díaz B.','Enfermera','T',226200),
(22,1,6065,'Rivera G.','Enfermera','N',162600),
(18,4,6357,'Karplus W.','Interino','T',337900),
(22,1,7379,'Carlos R.','Enfermera','T',211900),
(22,6,8422,'Bocina G.','Enfermero','M',183800),
(45,1,8526,'Frank H.','Enfermera','T',252200),
(22,2,9901,'Núñez C.','Interino','M',221000);


-- Insertar datos en la tabla Enfermo
INSERT INTO Enfermo(Inscripcion,Apellido,Direccion,Fecha_Nac,S,NSS)
VALUES
(10995,'Laguía M.','Goya 20','16-may-56','M',280862422),
(14024,'Fernández M.','Recoletos 50','21-may-60','F',284991452),
(18004,'Serrano V.','Alcalá 12','23-jun-67','F',321790059),
(36658,'Domin S.','Mayor 71','01-ene-42','M',160654471),
(38702,'Neal R.','Orense 11','18-jun-40','F',380010217),
(39217,'Cervantes M.','Perón 38','29-feb-52','M',440294390),
(59076,'Miller B.','López de Hoyos 2','16-sep-45','F',311969044),
(63827,'Ruiz P.','Ezquerdo 103','26-dic-80','M',100973253),
(64823,'Fraiser A.','Soto 3','10-jul-80','F',285201776),
(74835,'Benítez E.','Argentina','05-oct-57','M',154811767);


-- ----------------------------------------------------------------------------------------------------------------------


/*1) Crear un Trigger que borre en cascada sobre la tabla relacionada cuando borremos una sala.
Mostrar el registro borrado al ejecutar el Trigger.*/

CREATE TABLE Registro_Borrado (
ID INT AUTO_INCREMENT PRIMARY KEY,
Descripcion VARCHAR(255)
);
DELIMITER //
CREATE TRIGGER delete_cascade_sala
AFTER DELETE ON Sala
FOR EACH ROW
BEGIN
DECLARE emp_no INT;
DECLARE done INT DEFAULT FALSE;
-- Cursor para recorrer los empleados que serán borrados
DECLARE cur_emp CURSOR FOR
SELECT Empleado_No FROM Plantilla WHERE Sala_Cod = old.Sala_Cod;
-- Variables para manejar el fin del cursor
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN cur_emp;
-- Inicio del bucle
empleado_loop: LOOP
FETCH cur_emp INTO emp_no;
IF done THEN
LEAVE empleado_loop;
END IF;
-- Insertar en la tabla Registro_Borrado
INSERT INTO Registro_Borrado (Descripcion)
VALUES (CONCAT('Se ha eliminado la sala con código ', old.sala_cod, '.
Número de empleado afectado: ', emp_no));
END LOOP empleado_loop;
CLOSE cur_emp;
-- Borrar los registros de la tabla Plantilla
DELETE FROM Plantilla WHERE Sala_Cod = old.sala_cod;
END//
DELIMITER ;


DELETE FROM SALA WHERE SALA_COD = 2;
SELECT * FROM Registro_Borrado;


-- -------------------------------------------------------------------------------   

/*2) Crear un Trigger que se active cuando Actualicemos alguna sala del hospital, modificando sus
tablas relacionadas. Mostrar el registro Actualizado.*/ 

CREATE TABLE Registro_Actualizado (
ID INT AUTO_INCREMENT PRIMARY KEY,
Descripcion VARCHAR(255));
Drop TRIGGER update_related_tables_sala;
DELIMITER //
CREATE TRIGGER update_related_tables_sala
AFTER UPDATE ON Sala
FOR EACH ROW
BEGIN
DECLARE emp_no INT;
DECLARE done INT DEFAULT FALSE;
-- Cursor para recorrer los empleados que serán borrados
DECLARE cur_emp CURSOR FOR
SELECT Empleado_No FROM Plantilla WHERE Sala_Cod = old.Sala_Cod;
-- Variables para manejar el fin del cursor
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN cur_emp;
-- Inicio del bucle
empleado_loop: LOOP
FETCH cur_emp INTO emp_no;
IF done THEN
LEAVE empleado_loop;
END IF;
-- Insertar en la tabla Registro_Borrado
INSERT INTO Registro_actualizado (Descripcion)
VALUES (CONCAT('Se ha actualizado la sala con código ', old.sala_cod, '.
Número de empleado afectado: ', emp_no));
END LOOP empleado_loop;
CLOSE cur_emp;
-- Actualizar otras tablas relacionadas con Sala si es necesario
UPDATE Plantilla SET Sala_Cod = NEW.Sala_Cod WHERE Sala_Cod =
OLD.Sala_Cod;END;
//DELIMITER ;
UPDATE SALA SET SALA_COD = 2 WHERE SALA_COD = 1;
SELECT * FROM Registro_Actualizado;


-- --------------------------------------------------------------


/*3) Crear un Trigger que se active al eliminar un registro en la tabla hospital y modifique las tablas
correspondientes. OK*/


DROP TRIGGER BORRARHOSPITAL;
DELIMITER $$
CREATE TRIGGER BORRARHOSPITAL
AFTER DELETE ON HOSPITAL
FOR EACH ROW
BEGIN
DELETE FROM PLANTILLA WHERE HOSPITAL_COD = OLD.HOSPITAL_COD;
DELETE FROM SALA WHERE HOSPITAL_COD = OLD.HOSPITAL_COD;
DELETE FROM DOCTOR WHERE HOSPITAL_COD = OLD.HOSPITAL_COD;
END$$
DELIMITER ;
DELETE FROM HOSPITAL WHERE HOSPITAL_COD = 45;


-- ------------------------------------------------------------------


/*4) Crear un Trigger para controlar la inserción de empleados, cuando insertemos un empleado se
copiarán datos sobre la inserción en una tabla llamada Control_BD. Los datos que se copiarán son el
Número de empleado, El usuario que está realizando la operación, la fecha y el tipo de operación.*/


CREATE TABLE Control_BD (
EMP_NO INT, USUARIO VARCHAR(20),
FECHA DATETIME,
OPERACION VARCHAR(15));
DELIMITER //
CREATE TRIGGER DAR_ALTA
AFTER INSERT ON EMP
FOR EACH ROW
BEGIN
INSERT INTO Control_BD (EMP_NO, USUARIO, FECHA, OPERACION)
VALUES (NEW.EMP_NO, USER(), NOW(), 'INSERCION');
END//
DELIMITER ;
INSERT INTO EMP (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, COMISION, DEPT_NO)VALUES (7455, 'GANOZA', 'EMPLEADO', 7902,
'2015-05-29', 15520, 0, 20);

-- -----------------------------------------------------------


/*5) Crear un Trigger que actúe cuando se modifique la tabla hospital y sobre todas las tablas con las
que esté relacionadas.*/ 

DELIMITER $$
CREATE TRIGGER MODIFHOSPITAL
AFTER UPDATE ON HOSPITAL
FOR EACH ROW
BEGIN
UPDATE PLANTILLA
SET PLANTILLA.HOSPITAL_COD = NEW.HOSPITAL_COD
WHERE PLANTILLA.HOSPITAL_COD = OLD.HOSPITAL_COD;
UPDATE SALA
SET SALA.HOSPITAL_COD = NEW.HOSPITAL_COD
WHERE SALA.HOSPITAL_COD = OLD.HOSPITAL_COD;
UPDATE DOCTOR
SET DOCTOR.HOSPITAL_COD = NEW.HOSPITAL_COD
WHERE DOCTOR.HOSPITAL_COD = OLD.HOSPITAL_COD;
END$$
UPDATE HOSPITAL SET HOSPITAL_COD = 90 WHERE HOSPITAL_COD = 18;

-- ------------------------------------------------------------


/*6) Crear un Trigger en la tabla plantilla. Cuando actualicemos la tabla plantilla, debemos comprobar
que el hospital que actualizamos existe, si intentamos actualizar el código de hospital, no podremos
hacerlo si no existe relación con algún código de hospital. Realizar el mismo Trigger para las tablas
relacionadas con Hospital.*/



DELIMITER $$
CREATE TRIGGER ACTUALIZARPLANTILLA
BEFORE UPDATE ON PLANTILLA
FOR EACH ROW
BEGIN
DECLARE HOSPITAL INT;
SELECT I.HOSPITAL_COD INTO HOSPITAL
FROM HOSPITAL AS H
INNER JOIN (SELECT NEW.HOSPITAL_COD AS HOSPITAL_COD) AS I
ON H.HOSPITAL_COD = I.HOSPITAL_COD;
IF (HOSPITAL IS NULL) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO EXISTE EL CÓDIGO DE HOSPITAL';
END IF;
END$$
delimiter ;
UPDATE PLANTILLA SET HOSPITAL_COD = 140 WHERE EMPLEADO_NO = 1009;
UPDATE PLANTILLA SET HOSPITAL_COD = 90 WHERE EMPLEADO_NO = 1009;

-- ----------------------------------------------------------------------------


/*7) Modificar el Trigger del ejercicio 4, utilizando transacciones y control de errores, si la operación
es correcta, mostrará un mensaje positivo, si la operación no es correcta mostrará el error y un
mensaje que indique que no se ha llevado a cabo la operación.*/


DELIMITER //
CREATE TRIGGER DAR_ALTA
AFTER INSERT ON EMP
FOR EACH ROW
BEGIN
DECLARE exit handler for sqlexception
BEGIN
ROLLBACK;
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al insertar
empleado. Operación abortada.';
END;
DECLARE exit handler for sqlwarning
BEGIN
ROLLBACK;
SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Advertencia: Ha
ocurrido una advertencia al insertar el empleado.';
END;
START TRANSACTION;
INSERT INTO Control_BD (EMP_NO, USUARIO, FECHA, OPERACION)
VALUES (NEW.EMP_NO, USER(), NOW(), 'INSERCION');
COMMIT;
END//
DELIMITER ;
INSERT INTO EMP(EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT,
SALARIO, COMISION, DEPT_NO)
VALUES(8741,'ZEGARRA','EMPLEADO',7902,'30/05/2015',15520,0,20)


-- -----------------------------------------------------------------------------------


/*8) Crear un Trigger que guarde los datos en la tabla controlTrigger cuando se realice la baja de un
empleado.*/


DELIMITER $$
CREATE TRIGGER DAR_BAJA
BEFORE DELETE ON EMP
FOR EACH ROW
BEGIN
INSERT INTO Control_BD (EMP_NO, USUARIO, FECHA, OPERACION)
VALUES (OLD.EMP_No, USER(), NOW(), 'BAJA');
END$$
DELIMITER ;
DELETE FROM EMP WHERE EMP_NO = 8741;



-- -------------------------------------------------------------------------------


/*9) Crear un Trigger que guarde los datos en la tabla ControlTrigger cuando se realice una
modificación en un empleado. Guardar la hora de la actualización en un campo aparte en la tabla
ControlTrigger. (Añadir un campo) */

ALTER TABLE Control_BD ADD COLUMN HORA VARCHAR(10);
DELIMITER $$
CREATE TRIGGER MODIFICAREMP
AFTER UPDATE ON EMP
FOR EACH ROW
BEGIN
DECLARE HORA VARCHAR(10);
-- Calcular la hora actual
SET HORA = CONCAT(HOUR(NOW()), ':', MINUTE(NOW()), ':', SECOND(NOW()));
-- Insertar en la tabla Control_BD
INSERT INTO Control_BD (EMP_NO, USUARIO, FECHA, OPERACION, HORA)
SELECT OLD.EMP_NO, USER(), NOW(), 'MODIFICACION', HORA;
END$$
DELIMITER ;
UPDATE EMP SET APELLIDO = 'ARROYO' WHERE EMP_NO = 7499;



-- -------------------------------------------------------------------------------

-- 10) Borrar todos los Triggers creados después de haber sido probados.
DROP Trigger BORRARSALA;
DROP Trigger MODIFICARSALA;
DROP Trigger BORRARHOSPITAL;
DROP Trigger DAR_ALTA;
DROP Trigger MODIFHOSPITAL;
DROP Trigger ACTUALIZARPLANTILLA;
DROP Trigger DAR_BAJA;
DROP Trigger MODIFICAREMP;




