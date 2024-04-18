use escuela;

insert into profesores values("12345678A","Juan Orozco Salas", "Calle Egipto 28", "617289159");
insert into profesores values("23456789B","Federico Gutierrez", "Calle Zubieta 6","622588472");
insert into profesores values("34567891C","Luis Perez Guiterrez", "Calle Condado 8", "614479159");
insert into profesores values("45678912D","Juan Carlos Upegui", "Calle Egipto 28", "617289159");
insert into profesores values("56789123E","Alvaro Uribe Velez", "Calle Marquesa 74", "647845175");

select * from profesores;

insert into modulos values("01","Programación","12345678A");
insert into modulos values("02","Orientacion Laboral","23456789B");
insert into modulos values("03","Bases de Datos","34567891C");
insert into modulos values("04","Lenguaje de Marcas","45678912D");
insert into modulos values("05","Sistemas Informaticos","56789123E");

insert into alumnos values("1","Brayan Stiven","Ochoa Botero","20000811","01","1");
insert into alumnos (expediente,nombre,apellidos,fecha_nacimiento,curso)values("2","Sara","Londoño","20010203","02");
insert into alumnos (expediente,nombre,apellidos,fecha_nacimiento,curso)values("3","Paula Andrea","Ramirez Suarez","19800524","03");
insert into alumnos (expediente,nombre,apellidos,fecha_nacimiento,curso)values("4","Carlos Mario","Ochoa Perez","19731224","04");
insert into alumnos (expediente,nombre,apellidos,fecha_nacimiento,curso)values("5","Erick David","Colorado Botero","20140202","05");

drop table alumnos;

select * from alumnos;




select lower(concat_ws(" ",nombre,apellidos)) from alumnos;
select upper(concat_ws(' ', nombre,apellidos)) from alumnos;
select concat_ws(" ",nombre,apellidos) from alumnos;
select concat_ws(' ',nombre,apellidos) from alumnos;


select distinct (apellidos) from alumnos;
select distinct apellidos from alumnos; -- me muestra todo

select  * from alumnos order by nombre,apellidos desc; -- por orden alfabetifo asc o desc pero puede ser por todos si es desc debe ir acompañando acada campo para que pueda funcionar 

-- si hago el select * from, me saca toda la tabla y todos los atributos, si hago select y los atributos que quiera sacar from la tabla me saca solo lo que yo quiera o tenga especificado


select concat_ws(" ",nombre, apellidos)as concatenacion , fecha_nacimiento from alumnos order by fecha_nacimiento DESC;



select * from alumnos limit 3,2;

select * from alumnos where apellidos = "Ochoa Botero" or nombre = "Carlos";