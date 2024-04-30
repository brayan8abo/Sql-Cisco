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
    
    
    delimiter $$
drop trigger if exists before_jefeSIGNAL$$
create trigger before_jefeSIGNAL
before insert on empleados 
for each row
begin
declare supervisa integer;
declare error1 varchar (100);
	select count(*)into supervisa from empleados where mgr = new.mgr;
    if(supervisa >= 4) then 
	set @msg =concat(new.mgr," ", 'No se puede supervisar mas de 4');
    signal sqlstate '45000' set message_text = @msg;
    end if;
    
    end
    $$
    delimiter ;
    
    
    
insert into empleados values('41000','Jose','1234',1000,2500,'2025-04-29');
insert into empleados values('1222','Pepino','1234',1000,2500,'2025-04-29');
insert into empleados values('121','Torta','1234',1000,2500,'2025-04-29');
insert into empleados values('333','Josuee','1234',1000,2500,'2025-04-29');
insert into empleados values('4444','Jeso','1234',1000,2500,'2025-04-29');
    select @msg;
    
    
    
    
    
    
    
    
    
    
    delimiter $$
    drop trigger if exists aumentoSalario$$
    create trigger aumentoSalario
    before update on empleados for each row
    begin
    declare calculoSalario double default old.salario*20/100;
    declare salarioNuevo double default old.salario+calculoSalario;
    
    if salarioNuevo > new.salario then
    set @msg = concat(new.salario, " " , 'No puede ser aumentado en un 20% el salario');
    signal sqlstate  '45000' set message_text = @msg;
    end if;
    end$$
    
    delimiter ;
    
    update empleados set salario = 10400000;
    
    
    delimiter $$
    drop trigger if exists sueldoJefe$$
    create trigger sueldoJefe after update on empleados
    for each row 
    begin
    
    declare salarioJefe double;
    
    set salarioJefe = (select max(salario) from empleados where mgr = old.mgr);
    
    if new.salario >= salarioJefe then
    
    update empleados set  salario = new.salario where dni = old.mgr;
    end if;
    end
    
    
    delimiter ;
    
    update empleados set salario = 1300 where dni = '51754822s';
    insert into empleados values ('51754822s','Mary','123',1000,789,'2022-2-2');
    
    
    