-- 1 
select nombre from tblusuarios;

-- 2 
select max(saldo) from tblusuarios where sexo like "%M";

-- 3
select nombre,telefono from tblusuarios where marca IN ('NOKIA', 'BLACKBERRY' ,'SONY');

-- 4
select count(usuario) as 'usuarios inactivos o saldo 0' from tblusuarios where saldo = 0 or activo = 'inactivo';

-- 5
select usuario from tblusuarios where nivel = '1' or nivel = '2' or nivel = 3;

-- 6
select telefono from tblusuarios where saldo  < 300;

-- 7
select concat(saldo) AS 'SALDO' from tblusuarios where compañia = "NEXTEL";

-- 8
select compañia, count(usuario) AS 'cantidad_usuarios' from tblusuarios GROUP BY compañia;

-- 9
select nivel, count(nivel) from tblusuarios group by nivel;

-- 10
select usuario from tblusuarios where nivel = '2';

-- 11
select email from tblusuarios where email like '%gmail%';

-- 12 
select nombre,telefono from tblusuarios where marca in ('LG', 'SAMSUNG', 'MOTOROLA');

-- 13
select nombre,telefono from tblusuarios where  marca != 'LG' and marca != 'SAMSUNG'; 

-- 14
select usuario from tblusuarios where compañia  = 'IUSACELL';

-- 15
select usuario from tblusuarios where not compañia = 'TELCEL';

-- 16
select AVG(saldo) AS saldo_promedio_nokia from tblusuarios where marca = 'NOKIA';

-- 17
select usuario,telefono from tblusuarios where compañia = 'iusacell' or 'axel';

-- 18
select email from tblusuarios where email not like '%yahoo%';

-- 19
select usuario,telefono from tblusuarios where not compañia = 'iusacell' or 'axel';

-- 20
select usuario,telefono from tblusuarios where compañia = 'unefon';

-- 21
select distinct marca from tblusuarios order by marca desc;

-- 22
select distinct compañia from tblusuarios order by rand();

-- 23
select usuario from tblusuarios where nivel = '0' or nivel = '2';

-- 24
select AVG(saldo)  from tblusuarios where marca = 'LG';

-- 25
select usuario from tblusuarios where nivel = '1' or nivel = '3';

-- 26
select nombre,telefono from tblusuarios where marca  != 'blackberry';

-- 27
select usuario from tblusuarios where nivel = '3';

-- 28
select usuario from tblusuarios where nivel = '0';

-- 29 
select usuario from tblusuarios where nivel = '1';

-- 30
select sexo, count(usuario) from tblusuarios  group by sexo;
 
 -- 31
 select usuario,telefono from tblusuarios where compañia = 'at&t';
 
 -- 32
 select distinct compañia from tblusuarios order by compañia desc;
 
 -- 33
 select usuario from tblusuarios where activo = '0';
 
 -- 34
 select telefono from tblusuarios where saldo = '0';
 
 -- 35 
 select min(saldo) from tblusuarios where sexo like "%H";

-- 36
select telefono from tblusuarios where saldo  > 300;

-- 37
select marca, count(usuario) as 'numero usuarios' from tblusuarios  group by marca;


-- 38
select nombre, telefono from tblusuarios where not marca = 'LG';

-- 39
select distinct compañia from tblusuarios order by compañia asc;

-- 40
select usuario, min(saldo)  from tblusuarios where compañia = 'UNEFON' group by usuarios; 

-- 41
select email from tblusuarios where email like "%hotmail%";

-- 42
select nombre from tblusuarios where saldo <= 0 or activo = '0';

-- 43
select usuario, telefono from tblusuarios where compañia in ("iusacell" , "telcel");

-- 44
select distinct marca from tblusuarios order by marca asc;

-- 45
select distinct marca from tblusuarios order by rand();

-- 46
select usuario,telefono from tblusuarios where compañia in("iusacell" , "unefon");

-- 47
select nombre,telefono from tblusuarios where not marca in("motorola" , "nokia");

-- 48
select concat(saldo) from tblusuarios where compañia = "telcel";



















select * from tblusuarios;
 

