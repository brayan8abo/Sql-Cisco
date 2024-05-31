create database recuperacion2do;
use recuperacion2do;

CREATE TABLE Autores (AutorID INT PRIMARY KEY,

Nombre VARCHAR(50),

Nacionalidad VARCHAR(50));

-- Creación de la tabla Libros

CREATE TABLE Libros (LibroID INT PRIMARY KEY,

Titulo VARCHAR(100),

AnioPublicacion INT,

Genero VARCHAR(50));

-- Creación de la tabla Escrituras

CREATE TABLE Escrituras (AutorID INT, 

     LibroID INT,

    FOREIGN KEY (AutorID) REFERENCES Autores(AutorID),

    FOREIGN KEY (LibroID) REFERENCES Libros(LibroID));

 

-- Insertar datos de ejemplo en la tabla Autores

INSERT INTO Autores (AutorID, Nombre, Nacionalidad) VALUES

(1, 'Gabriel García Márquez', 'Colombiano'),

(2, 'J.K. Rowling', 'Británico'),

(3, 'Haruki Murakami', 'Japonés'),

(4, 'Jane Austen', 'Británico'),

(5, 'Ernest Hemingway', 'Estadounidense'),

(6, 'Miguel de Cervantes', 'Español'),

(7, 'Isabel Allende', 'Chileno'),

(8, 'Stephen King', 'Estadounidense'),

(9, 'Agatha Christie', 'Británico'),

(10, 'Leo Tolstoy', 'Ruso'),

(11, 'George Orwell', 'Británico'),

(12, 'Terry Pratchett', 'Británico'),

(15, 'Emily Brontë', 'Británico'),

(16, 'Charlotte Brontë', 'Británico');

 

-- Insertar datos de ejemplo en la tabla Libros

INSERT INTO Libros (LibroID, Titulo, AnioPublicacion, Genero) VALUES

(1, 'Cien años de soledad', 1967, 'Realismo mágico'),

(2, 'Harry Potter y la piedra filosofal', 1997, 'Fantasía'),

(3, 'Norwegian Wood', 1987, 'Ficción contemporánea'),

(4, 'Orgullo y prejuicio', 1813, 'Clásico'),

(5, 'El viejo y el mar', 1952, 'Novela'),

(6, 'Don Quijote de la Mancha', 1605, 'Novela picaresca'),

(7, 'La casa de los espíritus', 1982, 'Realismo mágico'),

(8, 'It', 1986, 'Terror'),

(9, 'Asesinato en el Orient Express', 1934, 'Misterio'),

(10, 'Guerra y paz', 1869, 'Novela histórica'),

(11, '1984', 1949, 'Ciencia ficción'),

(12, 'Mansfield Park', 1814, 'Novela'),

(13, 'Mort', 1987, 'Fantasía cómica'),

(14, 'El ingenioso hidalgo Don Quijote de la Mancha (Segunda parte)', 1615, 'Novela picaresca'),

(15, 'La Galatea', 1585, 'Novela pastoril'),

(16, 'Los trabajos de Persiles y Sigismunda', 1617, 'Novela picaresca'),

(17, 'Novelas ejemplares', 1613, 'Colección de novelas cortas'),

(18, 'Cumbres borrascosas', 1847, 'Novela romántica');

 

-- Insertar datos de ejemplo en la tabla Escrituras

INSERT INTO Escrituras (AutorID, LibroID) VALUES

(1, 1), -- Gabriel García Márquez escribió Cien años de soledad

(2, 2), -- J.K. Rowling escribió Harry Potter y la piedra filosofal

(3, 3), -- Haruki Murakami escribió Norwegian Wood

(4, 4), -- Jane Austen escribió Orgullo y prejuicio

(5, 5), -- Ernest Hemingway escribió El viejo y el mar

(6, 6), -- Miguel de Cervantes escribió Don Quijote de la Mancha

(7, 7), -- Isabel Allende escribió La casa de los espíritus

(8, 8), -- Stephen King escribió It

(9, 9), -- Agatha Christie escribió Asesinato en el Orient Express

(10, 10), -- Leo Tolstoy escribió Guerra y paz

(6, 14), -- Miguel de Cervantes escribió Don Quijote de la Mancha

(6, 15), -- Miguel de Cervantes escribió Don Quijote de la Mancha

(6, 16), -- Miguel de Cervantes escribió Don Quijote de la Mancha

(6, 17), -- Miguel de Cervantes escribió Don Quijote de la Mancha

(15, 18), -- Emily Brontë escribió Cumbres borrascosas

(16, 18); -- Charlotte Brontë también escribió Cumbres borrascosas

-- > Consultas multitabla (Composición interna). Resuelva las siguientes consultas sin utilizar las cláusulas JOIN.

-- 1.     Consulta para obtener todos los libros escritos por 'Miguel de Cervantes':

	select titulo from libros where libroid in (select libroid from escrituras where autorid = (select autorid from autores where nombre = "miguel de cervantes"));
    

-- 2.     Consulta para obtener los autores del libro titulado ‘Cumbres borrascosas’

select nombre from autores where autorid in (select autorid from escrituras where libroid = (select libroid from libros where titulo = "cumbres borrascosas"));


-- 3.     Consulta para obtener todos los libros publicados antes del año de publicación del libro ‘Norwegian Wood’:

select libros.titulo,AnioPublicacion from libros where aniopublicacion < (select aniopublicacion from libros where titulo = "Norwegian Wood");

-- 4.     Consulta para obtener los autores que escribieron más de un libro:

select nombre from autores where AutorID in (select autorid from escrituras group by autorid having count(libroid)>1);

-- 5.     Consulta para obtener el título y el autor de los libros en cuyo género literario contenga la palabra ‘Novela’ (Se puede hacer con select a dos tablas sin subconsulta)

select libros.titulo,libros.Genero from libros where Genero = "Novela";

-- 6.     Consulta para obtener los autores que escribieron libros después del año 1980:

select nombre from autores where autorid in (select autorid from escrituras where libroid in (select libroid from libros where aniopublicacion >1980));


-- 7.     Consulta para obtener los libros escritos por autores de nacionalidad ‘Britanico’:

select titulo from libros where libroid in (select libroid from escrituras where autorid in (select autorid from autores where nacionalidad = "Britanico"));


-- 8.     Consulta para obtener los autores que no escribieron ningún libro:


select nombre from autores where AutorID not in (select autorid from escrituras);

-- 9.     Consulta para obtener los libros que no tienen autor registrado:

select titulo from libros where libroid not in (select libroid from escrituras);


-- 10.   Consulta para obtener los libros que tienen más de un autor:

select titulo from libros where libroid in (select libroid from escrituras group by libroid having count(autorid) >1);

-- Consultas multitabla (Composición externa). Resuelva las siguientes consultas utilizando las cláusulas JOIN.

-- 11. Consulta para obtener todos los libros escritos por Miguel de Cervantes.

select libros.titulo from libros join escrituras on libros.libroid = escrituras.libroid
join autores on escrituras.autorid = autores.autorid where autores.nombre = "Miguel de Cervantes";

-- 12.   Consulta para obtener los autores del libro titulado ‘Cumbres borrascosas’

select autores.nombre from autores join escrituras on autores.autorid = escrituras.autorid
join libros on escrituras.libroid = libros.libroid
where libros.titulo = "Cumbres borrascosas";


-- 13.   Consulta para obtener todos los libros publicados antes del año de publicación del libro ‘Norwegian Wood’


select libros.titulo,aniopublicacion from libros join escrituras on libros.LibroID = escrituras.LibroID join autores on
escrituras.AutorID = autores.AutorID where libros.AnioPublicacion < (select aniopublicacion from libros where titulo = "Norwegian Wood");

-- 14.   Consulta para obtener los autores que escribieron más de un libro:

select titulo from libros join escrituras on libros.libroid = escrituras.LibroID
join autores on escrituras.autorid = autores.AutorID group by libros.libroid having COUNT(escrituras.autorid) >1;

-- 15.   Consulta para obtener el título y el autor de los libros en cuyo género literario contenga la palabra ‘Novela’:

select libros.titulo,autores.nombre from libros  join escrituras on libros.libroid = escrituras.libroid join autores on escrituras.autorid = autores.autorid where libros.genero = 'Novela'; -- deberian salir dos

-- 16.   Consulta para obtener los autores que escribieron libros después del año 1980:

select nombre from autores join escrituras on escrituras.autorid = autores.AutorID join libros on libros.LibroID =escrituras.LibroID where AnioPublicacion > 1980;

-- 17.   Consulta para obtener los libros escritos por autores de nacionalidad ‘Britanico’:

select libros.titulo from libros join escrituras on libros.libroid = escrituras.libroid 
join autores on escrituras.autorid = autores.autorid where autores.nacionalidad = "Britanico";


-- 18.   Consulta para obtener los autores que no escribieron ningún libro:

select autores.nombre from autores left join escrituras on  autores.AutorID = escrituras.autorid where escrituras.autorid is null;

-- 19.   Consulta para obtener los libros que no tienen autor registrado:


select libros.titulo  from libros left join escrituras on  libros.libroID = escrituras.LibroID where escrituras.libroid is null;


-- 20.   Consulta para obtener los libros que tienen más de un autor:

select libros.titulo from libros join escrituras on libros.libroid = escrituras.libroid group by libros.libroid, libros.titulo having count(escrituras.autorid) >1;


-- Updates con condición: Resolver los siguientes updates utilizando en todos ellos consultas multitablas (subconsultas select y/o Join)

-- 21.   Actualizar el año de publicación a 2020 de todos los libros de un ‘Gabriel García Márquez’:

update libros set aniopublicacion = 2020
where libroid in (select escrituras.libroid from escrituras join autores on escrituras.autorid = autores.autorid
where autores.nombre = 'Gabriel garcia marquez');

SELECT *
FROM libros
WHERE aniopublicacion = 2020;

-- 22.   Actualizar el género del libro de  'Haruki Murakami' y ponerle como género 'Ciencia Ficción':

update libros set genero = "Ciencia Ficción" where libroid in (select escrituras.libroid from escrituras join autores on escrituras.autorid = autores.autorid
where autores.nombre = "Haruki Murakami");

select * from libros where genero = "Ciencia Ficcion";

-- 23.   Actualizar la nacionalidad de todos los autores que escribieron libros en un género específico:

update autores set nacionalidad = 'Panchitos' where autorid in ( select escrituras.autorid from escrituras join libros on escrituras.libroid = libros.libroid where libros.genero = "Novela");


-- 24.   Actualizar el título del libro escrito por un 'Isabel Allende' poniéndole 'La casa de los espíritus I':

update libros set titulo = "La casa de los espíritus I" where libroid in (select escrituras.libroid from escrituras join autores on escrituras.autorid = autores.autorid where autores.nombre = "Isabel Allende");

-- 25.   Actualizar el nombre de un autor para todos sus libros:

update autores set nombre = 'Fernandiño' where autorid in (select autorid from (select escrituras.autorid from escrituras where libroid in (select libroid from libros where autorid in (select autorid from autores where nombre = "Miguel de Cervantes"))) as consulta );


UPDATE autores
SET nombre = 'Antonio Machado Ruiz'
WHERE id IN (
    SELECT autor_id
    FROM (
        SELECT escrituras.autor_id
        FROM escrituras
        WHERE libro_id IN (
            SELECT id
            FROM libros
            WHERE autor_id IN (
                SELECT id
                FROM autores
                WHERE nombre = 'Antonio Machado'
            )
        )
    ) AS subconsulta
);