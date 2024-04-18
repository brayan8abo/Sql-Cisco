-- 1
select * from empleados;

-- 2
select * from departamentos;

-- 3
select * from empleados where cargoE = 'Secretaria';

-- 4
select nomEmp, salEmp from empleados;

-- 5
select * from empleados where cargoE = 'vendedor'  order by nomEmp asc;

-- 6
select distinct nombreDepto from departamentos;

-- 7
select nomEmp , cargoE, salEmp from empleados order by salEmp;

-- 8
select salEmp, comisionE from empleados where codDepto = '2000' ;

-- 9
select comisionE from empleados;

-- 10
select nomEmp, salEmp, (salEmp + 500000) as 'Pago Estimado' from empleados where codDepto = '3000' order by nomEmp;

-- 11
select nomemp,salemp,comisione  from empleados where comisionE > salEmp;

-- 12
select nomemp,salemp,comisione  from empleados where comisionE <= (salEmp*0.3);

-- 13
select nomEmp as 'Nombre' , cargoE as 'Cargo' from empleados;

-- 14
select salEmp, comisionE from empleados where nDIEmp > '19.709.802';

-- 15
select nomEmp, cargoE from empleados where (nomEmp) > 'j' and (nomEmp) < 'z' order by nomEmp;

-- 16
select salEmp, nomEmp, comisionE , nDIEmp ,(salEmp+comisionE) as ' pago total' from empleados where comisionE > '1.000.000' order by nDIEmp;

-- 17
select salEmp, nomEmp, comisionE , nDIEmp ,(salEmp+comisionE) as ' pago total' from empleados where comisionE = '0' order by nDIEmp;

-- 18
select * from empleados where nomEmp not like "%MA%";

-- 19
select nombreDepto from departamentos where nombreDepto not in ('ventas', 'investigacion','mantenimiento');

-- 20
select nomEmp as empleados,codDepto from empleados where codDepto != '1500' and salEmp = '10000000' and cargoE = 'secretaria' or cargoE = 'vendedor' order by fecIncorporacion; 

-- 21
select * from empleados where length(nomEmp) = 11;

-- 22
select * from empleados where length(nomEmp) >= 11;

-- 23
select * from empleados where nomEmp like 'M%' and (salEmp > '800000' or comisionE > '1') and cargoE = 'Vendedor';
select * from empleados where codDepto like '2___' and (comisionE >0 or salEmp > 800000); -- corecta se usa empleados.empleados para llamar la tabla empleados de la base de datos empleado
select * from empleados where nomEmp like 'M%' and (comisionE >0 or salEmp >800000) and codDepto like '2%';-- corecta se usa empleados.empleados para llamar la tabla empleados de la base de datos empleado
select * from empleados where nomEmp like 'M%' and (salEmp > '800000' or comisionE > '1') and codDepto >= '2000' or codDepto <=2300;-- corecta se usa empleados.empleados para llamar la tabla empleados de la base de datos empleado


-- 24
select nomEmp, salEmp, comisionE from empleados where salEmp between comisionE / 2 and comisionE; 

-- 25
select max(salEmp) from empleados;

-- 26
select comisionE, count(*) as 'numero de empleados' from empleados where comisionE is not null group by comisionE;

-- 27
select nomEmp from empleados order by nomEmp desc limit 1;
 
 -- 28
 select max(salEmp) as 'Salario Maximo', min(salEmp) as 'Salario minimo' from empleados;
 
-- 29
select codDepto, sum(if(sexEmp = 'F', 1,0)) as 'Femenino', sum(if(sexEmp = 'M', 1,0)) as 'Masculino' from empleados group by codDepto;

select codDepto , sexEmp, count(*) from empleados group by codDepto, sexEmp;

-- 30
select codDepto, avg(salEmp) as 'Salario promedio' from empleados group by codDepto;

-- 31
select nomEmp from empleados where salEmp >= (select avg(salEmp) from empleados) order by codDepto;

-- 32
select codDepto, count(codDepto) as 'número de empleados' from empleados group by codDepto having count(codDepto) > '3';
select nomEmp, jefeID from empleados group by jefeID; 


-- 33
select nomEmp, jefeID, count(jefeid) as empleados from empleados group by jefeid having count(jefeid) >=2; -- no funciono

-- 34
select codDepto , count(codDepto) as 'empleados' from empleados group by codDepto having count(codDepto) = '0';

-- 35
select codDepto, sum(salEmp) as 'Suma total' from empleados group by codDepto order by sum(salEmp) desc limit 1;







 select * from empleados;