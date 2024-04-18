/*--SE USA EL INSERT INTO PARA AÑADIR INFORMACION DIRECTA EN LAS TABLAS ACOMPAÑADAS SIEMPRE DEL NOMBRE DE LA TABLA Y LOS VALORES QUE LLEVA*/
insert into clientes values(1,'12345678A' ,'Brayan' ,'Ochoa Botero', 'Calle egipto 28' , '20000811');
insert into clientes values(2,'Y6052262X' ,'Sara' ,'Londoño Ramirez', 'Calle egipto 28' , '20010302');
insert into clientes (id_cliente,dni,nombre,apellidos,fecha_nacimiento) values (3,'57154822S', 'Mariluz', 'Ramirez Suarez', '19821029');
insert into clientes (id_cliente,nombre,apellidos,fecha_nacimiento,dni) values (4, 'Paula', 'Ramirez Suarez', '19831029','Y6052261D');
insert into clientes (id_cliente,nombre,apellidos,fecha_nacimiento,dni) values (5, 'Fabiola', 'Suarez Mancipe', '19831029','Y6052261F');

select * from clientes;

delete from clientes;
select * from productos;


insert into productos values(1,'Caja',9.99);
insert into productos values(2,'Pegante',15.99);
insert into productos values(3,'Destornillador',3.99);
insert into productos values(4,'Guantes',6.99);
insert into productos values(5,'Aerosol',13.99);



insert into proveedores values(1, '12345678A', 'Calle Pravia 8', 'Cartones LTDA',1);
insert into proveedores values(2, '23456789B', 'Calle Pedro Texeira 3', 'Quimicos Ibericos',2);
insert into proveedores values(3, '34567891C', 'Calle Zubieta 6', 'Ferreteria Cano',3);
insert into proveedores values(4, '45678912D', 'Calle Garcia Noblejas 32', 'Latex España S.A',4);
insert into proveedores values(5, '56789123E', 'Calle Florencia 2', 'Pinturas El Borrego',5);

insert into comprar values(1,2);
insert into comprar values(1,4);
insert into comprar values(1,5);
insert into comprar values(2,1);
insert into comprar values(2,3);
insert into comprar values(3,5);
insert into comprar values(3,2);
insert into comprar values(4,1);
insert into comprar values(4,5);
insert into comprar values(5,1);
insert into comprar values(5,3);
insert into comprar values(5,2);




/*--delele from proveedores where id=1

Es para eliminar cosas en concreto el where es DONDE, para indicar lo que deseo borrar*/







drop schema escuela;