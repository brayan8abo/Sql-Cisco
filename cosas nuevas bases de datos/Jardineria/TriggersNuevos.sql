delimiter $$
    drop trigger if exists usuarioNuevo$$
    create trigger usuarioNuevo
	before insert on empleados for each row -- con after no  se puede usar new, ni insert 
		begin
			set NEW.usuario = 9999; -- valor predeterminado para todos los usuarios nuevos
		end
$$
    
    insert into empleados values('51754s','Jose','1234',1000,2500,'2024-04-29');
    
    
    delimiter $$
    drop trigger if exists fechaActualizada$$
    create trigger fechaActualizada before insert on empleados for each row -- o or update tambien funcionaria por que funcionaria con uno de los dos
    begin
		set new.fecha = current_date();
        end 
        $$
        
insert into empleados values('51754s','Jose','1234',1000,2500,'2025-04-29');

 delimiter $$
    drop trigger if exists fechaActualizada1$$
    create trigger fechaActualizada1 before update on empleados for each row -- o or update tambien funcionaria por que funcionaria con uno de los dos
    begin
		set new.fecha = current_date();
        end 
        $$
        
        delimiter $$
        drop trigger if exists cambiosRealizados$$
        create trigger cambiosRealizados after update on empleados for each row
        begin
        
       /* if old.salario != new.salario then
        if exists (select * from information_schema.tables where table_schema = database() and tables.name = 'registros_empleados') then 
        create table registros_empleados(
        id int auto_increment primary key,
        dni char (9),
        salario_anterior int,
        salario_nuevo int,
        fecha_modificacion date);
        end if;
        */
        insert into registros_empleados(dni,salario_anterior,salario_nuevo,fecha_modificacion)
        values (new.dni,old.salario,new.salario,now());
       -- end if;
        
        
        end
        $$


update empleados set salario = 10000;
select * from registros_empleados;



truncate registros_empleados;
        
        