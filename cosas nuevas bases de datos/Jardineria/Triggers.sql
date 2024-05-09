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
    
    
    delimiter $$ -- NO SE PUEDE HACER UN TRIGER QUE HAGA UNA MODIFICACION SOBRE UNA MISMA TABLA
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
    
    
    delimiter $$
    create procedure aumento_salario(in dni char(9),in salario_nuevo double)
    
    create table socios (
    id int auto_increment,
    nombre varchar(100) not null,
    email varchar (255),
    anonacimiento date,
    primary key (id)
    );
    
    
    create table recordatorios (
    id int auto_increment,
    idsocio int,
    mensaje varchar(255) not null,
    primary key (id,idsocio));

    
    insert into socios values (1,'Pepito Perez','pepito@outlook.es','2000-8-11');
    
    insert into recordatorios values (1,1,'El pedido que usted ha realizado se a efectuado correctamente, esperamos verlo nuevamente por nuestras instalaciones');
    
    
    -- borrar un socio se borra recordatorio asocuiado
    delimiter $$
    drop trigger if exists recordatorio$$
    create trigger recordatorio after delete on socios
    for each row
    begin
    delete from recordatorios where idsocio = old.id;
    end
    $$
    
    delete from socios where id = 1;
    
    
    delimiter $$
    drop trigger if exists socio_nuevo;
    create trigger socio_nuevo before insert on socios
    for each row
    begin
    
    declare edad int;
    
  SET edad = year(curdate()) - year (new.anonacimiento); -- se le resta al año
  SET edad = TIMESTAMPDIFF(YEAR, NEW.anonacimiento, CURDATE());

    -- Verificar si el nuevo socio es mayor de 18 años
    IF edad < 18 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nuevo socio debe ser mayor de 18 años';
    END IF;
END$$

delimiter ;
    insert into socios values (1,'Noel','Noeldomse#gmail.com','2000-02-02');
    
    drop table if exists registro_socios;
    create table registro_socios(
    id int auto_increment,
    idsocio int,
    nombre_anterior varchar (100),
    nombre_nuevo varchar (100), 
    email_anterior varchar (250),
    email_nuevo varchar (250),
    anonacimiento_anterior date,
    anonacimiento_nuevo date,
    fecha_actualizacion date,
    primary key (id,idsocio))
    ;
    

delimiter $$
drop trigger if exists actualizar_registro;
create trigger actualizar_registro after update on socios
for each row
begin
if old.nombre != new.nombre or old.email != new.email or old.anonacimiento != new.anonacimiento then
	insert registro_socios (idsocio,nombre_anterior,nombre_nuevo,email_anterior,email_nuevo,anonacimiento_anterior,anonacimiento_nuevo,fecha_actualizacion) 
	values (old.id,old.nombre,new.nombre,old.email,new.email,old.anonacimiento,new.anonacimiento,now());
end if;
end $$
    
    update socios set nombre = "Pepito";
    
    update socios set nombre = "Pepito", email = "pepito@outlook.es", anonacimiento = '2020-05-4';
    
    
    
    delimiter $$
    drop trigger if exists actualizar_recordatorio$$
    create trigger actualizar_recordatorio after update on socios
    for each row
    begin
    
    insert into recordatorios (idsocio,mensaje) values (old.id,concat('Se ha cambiado el nombre a: ',new.nombre, ', antes era: ', old.nombre));
    end
    $$
    
    update socios set nombre = "Carlitos";
    
    
    create table recordatorios_backup(
    id int auto_increment,
    idsocio int,
    mensaje varchar (255),
    primary key (id,idsocio));
    
    
    delimiter $$
    drop trigger if exists recordatorios$$
    create trigger recordatorios before delete on socios
    for each row
    begin
    
    insert into  recordatorios_backup (idsocio, mensaje)
    select idsocio, mensaje
    from recordatorios
    where idsocio = old.id;
    

    end
    $$
    
   delimiter ;
   

delete from socios where id = 1;

delete from socios where id =2;
delete from socios where id =3;


create table historico_recordatorios (
id int auto_increment primary key,
fecha_traspaso date,
idsocio int,
mensaje varchar (255),
fecha_creacion date
);


delimiter $$
    drop trigger if exists arecordatorios_lleno$$
    create trigger arecordatorios_lleno before insert on recordatorios
    for each row
    begin
    
    declare conteo int default ( select count(*) from recordatorios);
    
    if conteo > 5 then
    
    INSERT INTO historico_recordatorios (fecha_traspaso, idsocio, mensaje, fecha_creacion)
	SELECT curdate(), idsocio, mensaje, fecha_recordatorio FROM recordatorios;

	END IF;
    end
    $$
    
   delimiter ;
   
   update socios set nombre = "PerroSetenta";
   
   insert into recordatorios(idsocio,mensaje,fecha_recordatorio) values (7,'jjejsadljfhkjsdhfsdfsdfsdfsdfsdfsdejejej',curdate());


   