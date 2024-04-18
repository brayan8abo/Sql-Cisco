-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema empleados
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema empleados
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `empleados` DEFAULT CHARACTER SET utf8 ;
USE `empleados` ;

-- -----------------------------------------------------
-- Table `empleados`.`departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleados`.`departamentos` (
  `codDepto` VARCHAR(4) NOT NULL,
  `nombreDepto` VARCHAR(20) NOT NULL,
  `ciudad` VARCHAR(15) NULL,
  `codDirector` VARCHAR(12) NULL,
  PRIMARY KEY (`codDepto`),
  UNIQUE INDEX `codDepto_UNIQUE` (`codDepto` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empleados`.`empleados`
-- -----------------------------------------------------
DROP TABLE empleados;
			CREATE TABLE IF NOT EXISTS `empleados`.`empleados` (
			  `nDIEmp` VARCHAR(15) NOT NULL,
			  `nomEmp` VARCHAR(30) NOT NULL,
			  `sexEmp` CHAR(1) NOT NULL,
			  `fecNac` DATE NOT NULL,
			  `fecIncorporacion` DATE NOT NULL,
			  `salEmp` FLOAT NOT NULL,
			  `comisionE` FLOAT NOT NULL,
			  `cargoE` VARCHAR(15) NOT NULL,
			  `jefeID` VARCHAR(15) NULL,
			  `codDepto` VARCHAR(4) NOT NULL,
			  PRIMARY KEY (`nDIEmp`),
			  INDEX `fk_empleados_empleados_idx` (`jefeID` ASC) VISIBLE,
			  INDEX `fk_empleados_departamentos1_idx` (`codDepto` ASC) VISIBLE,
			  CONSTRAINT `fk_empleados_empleados`
				FOREIGN KEY (`jefeID`)
				REFERENCES `empleados`.`empleados` (`nDIEmp`)
				ON DELETE NO ACTION
				ON UPDATE NO ACTION,
			  CONSTRAINT `fk_empleados_departamentos1`
				FOREIGN KEY (`codDepto`)
				REFERENCES `empleados`.`departamentos` (`codDepto`)
				ON DELETE CASCADE
				ON UPDATE CASCADE)
			ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
INSERT INTO `departamentos` VALUES ('1000','GERENCIA','CIUDAD REAL','31.840.269');
INSERT INTO `departamentos` VALUES ('1500','PRODUCCIÓN','CIUDAD REAL','16.211.383');
INSERT INTO `departamentos` VALUES ('2000','VENTAS','CIUDAD REAL','31.178.144');
INSERT INTO `departamentos` VALUES ('2100','VENTAS','BARCELONA','16.211.383');
INSERT INTO `departamentos` VALUES ('2200','VENTAS','VALENCIA','16.211.383');
INSERT INTO `departamentos` VALUES ('2300','VENTAS','MADRID','16.759.060');
INSERT INTO `departamentos` VALUES ('3000','INVESTIGACIÓN','CIUDAD REAL','16.759.060');
INSERT INTO `departamentos` VALUES ('3500','MERCADEO','CIUDAD REAL','22.222.222');
INSERT INTO `departamentos` VALUES ('4000','MANTENIMIENTO','CIUDAD REAL','333.333.333');
INSERT INTO `departamentos` VALUES ('4100','MANTENIMIENTO','BARCELONA','16.759.060');
INSERT INTO `departamentos` VALUES ('4200','MANTENIMIENTO','VALENCIA','16.759.060');
INSERT INTO `departamentos` VALUES ('4300','MANTENIMIENTO','MADRID','16.759.060');
select * from departamentos;
select * from empleados;
INSERT INTO `empleados` VALUES ('1.130.222','José Giraldo','M','1985-01-20','2000-11-01',1200000,400000,'Asesor','22.222.222','3500'); --
INSERT INTO `empleados` VALUES ('1.130.333','Pedro Blanco','M','1987-10-28','2000-10-01',800000,3000000,'Vendedor','31.178.144','2000');-- 
INSERT INTO `empleados` VALUES ('1.130.444','Jesús Alfonso','M','1988-03-14','2000-10-01',800000,3500000,'Vendedor','31.178.144','2000');-- 
INSERT INTO `empleados` VALUES ('1.130.555','Julián Mora','M','1989-07-03','2000-10-01',800000,3100000,'Vendedor','31.178.144','2200');--
INSERT INTO `empleados` VALUES ('1.130.666','Manuel Millán','M','1990-12-08','2004-06-01',800000,3700000,'Vendedor','31.178.144','2300');--
INSERT INTO `empleados` VALUES ('1.130.777','Marcos Cortez','M','1986-06-23','2000-04-16',2550000,500000,'Mecánico','333.333.333','4000');--
INSERT INTO `empleados` VALUES ('1.130.782','Antonio Gil','M','1980-01-23','2010-04-16',850000,1500000,'Técnico','16.211.383','1500');--
INSERT INTO `empleados` VALUES ('1.751.219','Melissa Roa','F','1960-06-19','2001-03-16',2250000,2500000,'Vendedor','31.178.144','2100');--
INSERT INTO `empleados` VALUES ('11.111.111','Irene Díaz','F','1979-09-28','2004-06-01',1050000,200000,'Mecánico','333.333.333','4200');--
INSERT INTO `empleados` VALUES ('16.211.383','Luis Pérez','M','1956-02-25','2000-01-01',5050000,0,'Director','31.840.269','1500'); --
INSERT INTO `empleados` VALUES ('16.759.060','Darío Casas','M','1960-04-05','1992-11-01',4500000,500000,'Investigador','31.840.269','3000'); --
INSERT INTO `empleados` VALUES ('19.709.802','William Daza','M','1982-10-09','1999-12-16',2250000,1000000,'Investigador','16.759.060','3000'); --
INSERT INTO `empleados` VALUES ('22.222.222','Carla López','F','1975-05-11','2005-07-16',4500000,500000,'Jefe Mercadeo','31.840.269','3500'); --
INSERT INTO `empleados` VALUES ('22.222.333','Carlos Rozo','M','1975-05-11','2001-09-16',750000,500000,'Vigilante','31.840.269','3500');--
INSERT INTO `empleados` VALUES ('31.174.099','Diana Solarte','F','1957-11-19','1990-05-16',1250000,500000,'Secretaria','31.840.269','1000'); --
INSERT INTO `empleados` VALUES ('31.178.144','Rosa Angulo','F','1957-03-15','1998-08-16',3250000,3500000,'Jefe Ventas','31.840.269','2000'); --
INSERT INTO `empleados` VALUES ('31.840.269','María Rojas','F','1959-01-15','1990-05-16',6250000,1500000,'Gerente',NULL,'1000'); -- 
INSERT INTO `empleados` VALUES ('333.333.333','Elisa Rojas','F','1979-09-28','2004-06-01',3000000,1000000,'Jefe Mecánicos','31.840.269','4000'); -- 
INSERT INTO `empleados` VALUES ('333.333.334','Marisol Pulido','F','1979-10-01','1990-05-16',3250000,1000000,'Investigador','16.759.060','3000');--
INSERT INTO `empleados` VALUES ('333.333.335','Ana Moreno','F','1992-01-05','2004-06-01',1200000,400000,'Secretaria','16.759.060','3000');--
INSERT INTO `empleados` VALUES ('333.333.336','Carolina Ríos','F','1992-02-15','2000-10-01',1250000,500000,'Secretaria','16.211.383','1500');--
INSERT INTO `empleados` VALUES ('333.333.337','Edith Muñoz','F','1992-03-31','2000-10-01',800000,3600000,'Vendedor','31.178.144','2100');--
INSERT INTO `empleados` VALUES ('444.444','Abel Gómez','M','1939-12-24','2000-10-01',1050000,200000,'Mecánico','333.333.333','4300');--
INSERT INTO `empleados` VALUES ('737.689','Mario Llano','M','1945-08-30','1990-05-16',2250000,2500000,'Vendedor','31.178.144','2300');--
INSERT INTO `empleados` VALUES ('768.782','Joaquín Rosas','M','1947-07-07','1990-05-16',2250000,2500000,'Vendedor','31.178.144','2200');--
INSERT INTO `empleados` VALUES ('888.888','Iván Duarte','M','1955-08-12','1998-05-16',1050000,200000,'Mecánico','333.333.333','4100');--
