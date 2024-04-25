drop database if exists testTriggers;
create database testTriggers;
use testTriggers;

create table alumnos(
id int primary key, 
nombre varchar (30),
apellido1 varchar (30),
apellido2 varchar (30),
edad int,
nota real
);

create table empleados(
dni char(9) primary key,
nomemp varchar(100),
mgr char(4),
salario integer default 1000,
usuario integer default 1000,
fecha date);


delimiter $$
drop trigger if exists trigger_check_nota_before_insert$$
create trigger trigger_check_nota_before_insert
before insert 
on alumnos for each row
begin
	if NEW.nota < 0 then
	set new.nota =0;
	elseif NEW.nota > 10 then 
    set NEW.nota = 10;
end if;
end $$
delimiter ;


delimiter $$
drop trigger if exists trigger_check_nota_before_udpate$$
create trigger trigger_check_nota_before_update
before update 
on alumnos for each row
begin	
	if new.nota <0 then
    set new.nota = 10;
    elseif new.nota > 10 then 
    set new.nota = 10;
end if;
end $$
delimiter ;


delimiter $$
drop trigger if exists before_jefe$$
create trigger before_jefe
before insert on empleados 
for each row
begin
declare supervisa integer;
declare error1 varchar (100);
	select count(*)into supervisa from empleados where mgr = new.mgr;
    if(supervisa > 4) then 
	set error1 =concat(new.mgr,'No se puede supervisar mas de 5');
    rollback;
    end if;
    commit;
    end
    $$
    
    select @error1;
    