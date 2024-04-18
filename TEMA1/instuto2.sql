DROP DATABASE IF EXISTS instituto;
CREATE DATABASE instituto CHARACTER SET utf8mb4;
USE instituto;
CREATE TABLE alumno (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100),
fecha_nacimiento DATE NOT NULL,
es_repetidor ENUM('sí', 'no') NOT NULL,
teléfono VARCHAR(9)
);
INSERT INTO alumno VALUES(1, 'María', 'Sánchez', 'Pérez', '1990-12-01', 'no',
NULL);
INSERT INTO alumno VALUES(2, 'Juan', 'Sáez', 'Vega', '1998-04-02',
'no',618253876);
INSERT INTO alumno VALUES(3, 'Pepe', 'Ramírez', 'Gea', '1988-01-03', 'no',
NULL);
INSERT INTO alumno VALUES(4, 'Lucía', 'Sánchez', 'Ortega', '1993-06-13',
'sí',678516294);
INSERT INTO alumno VALUES(5, 'Paco', 'Martínez', 'López', '1995-11-24',
'no',692735409);
INSERT INTO alumno VALUES(6, 'Irene', 'Gutiérrez', 'Sánchez', '1991-03-28',
'sí',NULL);
INSERT INTO alumno VALUES(7, 'Cristina', 'Fernández', 'Ramírez', '1996-09-17',
'no', 628349590);
INSERT INTO alumno VALUES(8, 'Antonio', 'Carretero', 'Ortega', '1994-05-20',
'sí',612345633);
INSERT INTO alumno VALUES(9, 'Manuel', 'Domínguez', 'Hernández', '1999-07-08', 'no', NULL);
INSERT INTO alumno VALUES(10, 'Daniel', 'Moreno', 'Ruiz', '1998-02-03', 'no',NULL);
INSERT INTO alumno VALUES(11, 'Antonio', 'Fernandez_Garcia', 'Ortega', '1998-02-03', 'no',NULL);
INSERT INTO alumno VALUES(12, 'Antonio', 'Fernandez%Rodriguez', 'Peranito' ,'1998-02-03', 'no',NULL);
INSERT INTO alumno VALUES(13, 'Antonio', 'Fernandez-Garcia', 'Tantico', '1998-02-03', 'no',NULL);

select * from alumno where id = 1;
select * from alumno where teléfono = 692735409;
select * from alumno where es_repetidor = "si";
select * from alumno where es_repetidor = "no";
select * from alumno where fecha_nacimiento < '19930101';
select * from alumno where fecha_nacimiento > '19940101';

select concat_ws(' ',nombre,apellido1,apellido2)as "Nombres y Apellidos" ,(fecha_nacimiento) as fecha , (es_repetidor) from alumno where fecha_nacimiento > '19940101' and es_repetidor = 'no';

select concat_ws(' ',nombre,apellido1,apellido2)as "Nombres y Apellidos" ,(fecha_nacimiento) as fecha , (es_repetidor) from alumno where fecha_nacimiento > '19940101' and es_repetidor = 'si';

select * from alumno where year (fecha_nacimiento) = '1998';
select * from alumno where year (fecha_nacimiento) != '1998';



select * from alumno where apellido1 in ('Sánchez','Martinez'); -- me saca todos los que tengan apellido1 como sanchez o martinez
select * from alumno where apellido1 like 'S%'; -- todos los que tengan apellidos que empiecen con la S
-- o se puede poner S%z por que el apellido empieza con S y termina con Z 
select * from alumno where apellido1 like 'S___';  -- sirve para sacar los los que comienzan con S pero tocaria especificar los digitos con el _ en este caso Sáez tiene 4 caracteres por ende ____ 4 rayas al pisop
select * from alumno where apellido1 like '%z'; -- me saldran todos los datos que estoy pidiendo los que terminen una z
select * from alumno where apellido1 like '%z%'; -- me saldra el dato que pedi y tiene una z entre medio o en cualquier parte de los caracteres
select * from alumno where nombre like 'A$%BC%' escape '$'; -- el comodin es %  y tiene el dolar por que estoy buscando direcamente algo  es decir estoy buscando en un texto que es: A%BC% nos va buscar donde este el %


							
select * from alumno where apellido1 like 'Fernandez_%';
select * from alumno where apellido1 like 'Fernandez€_%' escape '€'; 

select char_length('Fernández Garcia'); -- solo cuantas posicion
select length('Fernández Garcia'); -- para contar posiciones y acentos, por ejemplo en la Ñ me cuenta dos
select length('Cigüeña');
select char_length('Cigüeña en casa');

select * from alumno where length(apellido1) = 9;
select * from alumno where char_length(apellido1) = 9;


 alter table alumno add email varchar(50);



