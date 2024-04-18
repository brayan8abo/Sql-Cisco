DROP DATABASE HospitalDB;
CREATE DATABASE HospitalDB;
USE HospitalDB;


-- Crear la tabla Pacientes --
CREATE TABLE Pacientes (
    PacienteID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Edad INT,
    Género VARCHAR(10)
);

-- Crear la tabla Camas --
CREATE TABLE Camas (
    CamaID INT PRIMARY KEY,
    Tipo VARCHAR(20),
    Disponible BOOLEAN
);

-- Crear la tabla Asignaciones --
CREATE TABLE Asignaciones (
    AsignacionID INT PRIMARY KEY,
    PacienteID INT,
    CamaID INT,
    FechaAsignacion DATE,
    FOREIGN KEY (PacienteID) REFERENCES Pacientes(PacienteID),
    FOREIGN KEY (CamaID) REFERENCES Camas(CamaID));
    

-- Inserciones en la tabla Pacientes --
INSERT INTO Pacientes VALUES
(1, 'Juan Pérez', 35, 'Masculino'),
(2, 'Ana Gómez', 45, 'Femenino'),
(3, 'Carlos Rodríguez', 28, 'Masculino'),
(4, 'María López', 50, 'Femenino'),
(5, 'Luis Hernández', 40, 'Masculino'),
(6, 'Laura Torres', 35, 'Femenino'),
(7, 'Javier García', 60, 'Masculino'),
(8, 'Elena Martínez', 25, 'Femenino'),
(9, 'Miguel Sánchez', 48, 'Masculino'),
(10, 'Carmen Ruiz', 55, 'Femenino'),
(11, 'Pedro Díaz', 33, 'Masculino'),
(12, 'Sofía Fernández', 42, 'Femenino'),
(13, 'Antonio Jiménez', 38, 'Masculino'),
(14, 'Isabel Castro', 47, 'Femenino'),
(15, 'Raúl Vargas', 29, 'Masculino');



INSERT INTO Camas VALUES
(101, 'Individual', TRUE),
(102, 'Individual', TRUE),
(103, 'Compartida', TRUE),
(104, 'Individual', TRUE),
(105, 'Compartida', TRUE),
(106, 'Individual', TRUE),
(107, 'Compartida', TRUE),
(108, 'Individual', TRUE),
(109, 'Compartida', TRUE),
(110, 'Individual', TRUE),
(111, 'Compartida', TRUE),
(112, 'Individual', TRUE),
(113, 'Compartida', TRUE),
(114, 'Individual', TRUE),
(115, 'Compartida', TRUE),
(116, 'Individual', FALSE),
(117, 'Compartida', FALSE);

-- Inserciones en la tabla Asignaciones --
INSERT INTO Asignaciones VALUES
(1, 1, 101, '2024-01-01'),
(2, 2, 102, '2024-01-02'),
(3, 3, 103, '2024-01-03'),
(4, 4, 104, '2024-01-04'),
(5, 5, 105, '2024-01-05'),
(6, 6, 106, '2024-01-06'),
(7, 7, 107, '2024-01-07'),
(8, 8, 108, '2024-01-08'),
(9, 9, 109, '2024-01-09'),
(10, 10, 110, '2024-01-10'),
(11, 11, 111, '2024-01-11'),
(12, 12, 112, '2024-01-12'),
(13, 13, 113, '2024-01-13'),
(14, 14, 114, '2024-01-14'),
(15, 15, 115, '2024-01-15'),
(16,16,115, '2024-02-03');

-- Consultas en la tabla Pacientes --
 -- 1. Seleccionar todos los pacientes --
 SELECT * FROM Pacientes;

 --  2. Listar solo los nombres y edades de los pacientes --
 SELECT Nombre, Edad FROM Pacientes;

 --  3. Filtrar pacientes mayores de 40 años --
 SELECT * FROM Pacientes WHERE Edad > 40;

 --  4. Ordenar pacientes por edad de forma descendente --
 SELECT * FROM Pacientes ORDER BY Edad DESC;

 --  5. Contar la cantidad total de pacientes --
 SELECT COUNT(*) AS Total_Pacientes FROM Pacientes;

 --  6. Mostrar pacientes de género femenino --
 SELECT * FROM Pacientes WHERE Género = 'Femenino';

 --  7. Obtener el paciente más joven --
 SELECT * FROM Pacientes ORDER BY Edad ASC LIMIT 1;

 --  8. Filtrar pacientes cuyo nombre comienza con "A" --
 SELECT * FROM Pacientes WHERE Nombre LIKE 'A%';

 --  9. Calcular el promedio de edades de los pacientes --
 SELECT AVG(Edad) AS Promedio_Edad FROM Pacientes;

 --  10. Seleccionar pacientes de una franja de edad específica --
 SELECT * FROM Pacientes WHERE Edad BETWEEN 30 AND 40;

 --  11. Encontrar pacientes cuyo nombre contiene "a" (mayúsculas o minúsculas) --
 SELECT * FROM Pacientes WHERE Nombre LIKE '%a%';

 --  12. Mostrar pacientes ordenados alfabéticamente por nombre --
 SELECT * FROM Pacientes ORDER BY Nombre ASC;

 --  13. Contar la cantidad de pacientes de género masculino --
 SELECT COUNT(*) AS Total_Masculinos FROM Pacientes WHERE Género = 'Masculino';

 --  14. Obtener el paciente más anciano --
 SELECT * FROM Pacientes ORDER BY Edad DESC LIMIT 1;

 --  15. Filtrar pacientes que no tienen asignada una cama --
 SELECT * FROM Pacientes LEFT JOIN Asignaciones ON Pacientes.PacienteID = Asignaciones.PacienteID WHERE Asignaciones.PacienteID IS NULL;


 --  Consultas con JOIN:
  --  Consultas con JOIN entre varias tablas
 --   1. Listar nombres de pacientes y tipos de cama asignados
 SELECT Pacientes.Nombre, Camas.Tipo FROM Pacientes
JOIN Asignaciones ON Pacientes.PacienteID = Asignaciones.PacienteID JOIN Camas ON Asignaciones.CamaID = Camas.CamaID; 

 --   2. Mostrar detalles de asignaciones con nombres de pacientes
SELECT Asignaciones.*, Pacientes.Nombre AS Nombre_Paciente FROM Asignaciones JOIN Pacientes ON Asignaciones.PacienteID = Pacientes.PacienteID;

 --   3. Obtener información completa de las asignaciones con detalles de camas
SELECT Asignaciones.*, Camas.* FROM Asignaciones JOIN Camas ON Asignaciones.CamaID = Camas.CamaID;

 --   4. Listar camas asignadas con detalles de pacientes
SELECT Camas.*, Pacientes.* FROM Camas JOIN Asignaciones ON Camas.CamaID = Asignaciones.CamaID JOIN Pacientes ON Asignaciones.PacienteID = Pacientes.PacienteID;

 --   5. Mostrar pacientes y camas disponibles
SELECT Pacientes.*, Camas.* FROM Pacientes LEFT JOIN Asignaciones ON Pacientes.PacienteID = Asignaciones.PacienteID LEFT JOIN Camas ON Asignaciones.CamaID = Camas.CamaID WHERE Asignaciones.PacienteID IS NULL OR Camas.Disponible = TRUE;

 --   6. Obtener la cantidad de camas ocupadas por tipo
 SELECT Camas.Tipo, COUNT(Asignaciones.CamaID) FROM Camas LEFT JOIN Asignaciones ON Camas.CamaID = Asignaciones.CamaID AND camas.disponible = 0 GROUP BY Camas.Tipo; 

 --   7. Listar camas disponibles junto con sus tipos
 SELECT Camas.* FROM Camas WHERE Camas.Disponible = TRUE;

 --   8. Mostrar la edad promedio de los pacientes asignados a camas individuales
 SELECT AVG(Pacientes.Edad) FROM Pacientes JOIN Asignaciones ON Pacientes.PacienteID = Asignaciones.PacienteID JOIN Camas ON Asignaciones.CamaID = Camas.CamaID WHERE Camas.Tipo = 'Individual';

 --   9. Obtener el nombre del paciente y tipo de cama asignada por cada asignación
 SELECT Pacientes.Nombre, Camas.Tipo FROM Pacientes JOIN Asignaciones ON Pacientes.PacienteID = Asignaciones.PacienteID JOIN Camas ON Asignaciones.CamaID = Camas.CamaID;

 --   10. Listar camas y la cantidad de veces que han sido asignadas
 SELECT Camas.CamaID, Camas.Tipo, COUNT(Asignaciones.CamaID) FROM Camas LEFT JOIN Asignaciones ON Camas.CamaID = Asignaciones.CamaID GROUP BY Camas.CamaID, Camas.Tipo;

 --   11. Mostrar detalles de asignaciones con nombres de pacientes y tipo de cama
SELECT Asignaciones.*, Pacientes.Nombre AS Nombre_Paciente, Camas.Tipo FROM Asignaciones JOIN Pacientes ON Asignaciones.PacienteID = Pacientes.PacienteID JOIN Camas ON Asignaciones.CamaID = Camas.CamaID;

 --   12. Obtener la cantidad total de camas y la cantidad asignada
 SELECT COUNT(*) AS Total_Camas, COUNT(Asignaciones.CamaID) FROM Camas LEFT JOIN Asignaciones ON Camas.CamaID = Asignaciones.CamaID; 

 --   13. Listar camas ocupadas con detalles de pacientes
 SELECT Camas.*, Pacientes.* FROM Camas JOIN Asignaciones ON Camas.CamaID = Asignaciones.CamaID JOIN Pacientes ON Asignaciones.PacienteID = Pacientes.PacienteID;

 --   14. Mostrar pacientes sin asignación de cama
 SELECT Pacientes.* FROM Pacientes LEFT JOIN Asignaciones ON Pacientes.PacienteID = Asignaciones.PacienteID WHERE Asignaciones.PacienteID IS NULL;

 --   15. Obtener detalles de asignaciones ordenadas por fecha de asignación
SELECT Asignaciones.*, Pacientes.Nombre, Camas.Tipo FROM Asignaciones JOIN Pacientes ON Asignaciones.PacienteID = Pacientes.PacienteID JOIN Camas ON Asignaciones.CamaID = Camas.CamaID ORDER BY Asignaciones.FechaAsignacion;



 --   Consultas con Composición Interna:
 --   Consultas con composición interna entre varias tablas
 
 -- 1. Listar pacientes y sus camas asignadas
 SELECT Pacientes.*, Camas.* FROM Pacientes JOIN Asignaciones ON Pacientes.PacienteID = Asignaciones.PacienteID JOIN Camas ON Asignaciones.CamaID = Camas.CamaID;

 -- 2. Obtener detalles de asignaciones con nombres de pacientes y tipo de cama
 SELECT Asignaciones.*, Pacientes.Nombre FROM Asignaciones JOIN Pacientes ON Asignaciones.PacienteID = Pacientes.PacienteID JOIN Camas ON Asignaciones.CamaID = Camas.CamaID;

 -- 3. Mostrar la edad promedio de los pacientes asignados a camas individuales
 SELECT AVG(Pacientes.Edad) FROM Pacientes JOIN Asignaciones ON Pacientes.PacienteID = Asignaciones.PacienteID JOIN Camas ON Asignaciones.CamaID = Camas.CamaID WHERE Camas.Tipo = 'Individual';

 -- 4. Listar camas y la cantidad de veces que han sido asignadas
SELECT Camas.CamaID, Camas.Tipo, COUNT(Asignaciones.CamaID) FROM Camas JOIN Asignaciones ON Camas.CamaID = Asignaciones.CamaID GROUP BY Camas.CamaID, Camas.Tipo;

 -- 5. Obtener el nombre del paciente y tipo de cama asignada por cada asignación
SELECT Pacientes.Nombre, Camas.Tipo FROM Pacientes JOIN Asignaciones ON Pacientes.PacienteID = Asignaciones.PacienteID JOIN Camas ON Asignaciones.CamaID = Camas.CamaID;

 -- 6. Listar camas ocupadas con detalles de pacientes
SELECT Camas.*, Pacientes.* FROM Camas JOIN Asignaciones ON Camas.CamaID = Asignaciones.CamaID JOIN Pacientes ON Asignaciones.PacienteID = Pacientes.PacienteID;

 -- 7. Mostrar pacientes sin asignación de cama
SELECT Pacientes.* FROM Pacientes LEFT JOIN Asignaciones ON Pacientes.PacienteID = Asignaciones.PacienteID WHERE Asignaciones.PacienteID IS NULL;

 -- 8. Obtener la cantidad total de camas y la cantidad asignada
SELECT COUNT(*) AS Total_Camas, COUNT(Asignaciones.CamaID) FROM Camas JOIN Asignaciones ON Camas.CamaID = Asignaciones.CamaID;

 -- 9. Listar camas asignadas con detalles de pacientes
SELECT Camas.*, Pacientes.* FROM Camas JOIN Asignaciones ON Camas.CamaID = Asignaciones.CamaID JOIN Pacientes ON Asignaciones.PacienteID = Pacientes.PacienteID;

 -- 10. Mostrar detalles de asignaciones con nombres de pacientes
SELECT Asignaciones.*, Pacientes.Nombre FROM Asignaciones JOIN Pacientes ON Asignaciones.PacienteID = Pacientes.PacienteID;

 -- 11. Obtener información completa de las asignaciones con detalles de camas
SELECT Asignaciones.*, Camas.* FROM Asignaciones JOIN Camas ON Asignaciones.CamaID = Camas.CamaID;

 -- 12. Listar camas disponibles junto con sus tipos
SELECT Camas.* FROM Camas WHERE Camas.Disponible = TRUE;

 -- 13. Mostrar pacientes y camas disponibles
SELECT Pacientes.*, Camas.* FROM Pacientes LEFT JOIN Asignaciones ON Pacientes.PacienteID = Asignaciones.PacienteID LEFT JOIN Camas ON Asignaciones.CamaID = Camas.CamaID WHERE Asignaciones.PacienteID IS NULL OR Camas.Disponible = TRUE;

 -- 14. Obtener el nombre del paciente y tipo de cama asignada por cada asignación
SELECT Pacientes.Nombre, Camas.Tipo FROM Pacientes JOIN Asignaciones ON Pacientes.PacienteID = Asignaciones.PacienteID JOIN Camas ON Asignaciones.CamaID = Camas.CamaID;

 -- 15. Listar camas ocupadas con detalles de pacientes
SELECT Camas.*, Pacientes.* FROM Camas JOIN Asignaciones ON Camas.CamaID = Asignaciones.CamaID JOIN Pacientes ON Asignaciones.PacienteID = Pacientes.PacienteID;



 -- Consultas con Composición Externa:
 -- Consultas con composición externa entre varias tablas
 
-- 1. Listar pacientes y sus camas asignadas (incluso aquellos sin asignación)
SELECT P.Nombre, C.CamaID FROM Pacientes AS P LEFT JOIN Asignaciones AS A ON P.PacienteID = A.PacienteID LEFT JOIN Camas AS C ON A.CamaID = C.CamaID;


-- 2. Obtener detalles de asignaciones con nombres de pacientes y tipo de cama (incluso sin asignación)
SELECT P.Nombre, C.Tipo, A.FechaAsignacion FROM Pacientes AS P LEFT JOIN Asignaciones AS A ON P.PacienteID = A.PacienteID LEFT JOIN Camas AS C ON A.CamaID = C.CamaID;


-- 3. Mostrar la edad promedio de los pacientes asignados a camas individuales (incluso sin asignación)
SELECT AVG(Pacientes.Edad) FROM Pacientes LEFT JOIN Asignaciones ON Pacientes.PacienteID = Asignaciones.PacienteID LEFT JOIN Camas ON Asignaciones.CamaID = Camas.CamaID WHERE Camas.Tipo = 'Individual' OR Asignaciones.CamaID IS NULL;
SELECT AVG(P.Edad) FROM Pacientes AS P LEFT JOIN Asignaciones AS A ON P.PacienteID = A.PacienteID LEFT JOIN Camas AS C ON A.CamaID = C.CamaID WHERE C.Tipo = 'Individual';


-- 4. Listar camas y la cantidad de veces que han sido asignadas (incluso sin asignación)
SELECT C.CamaID, COUNT(A.AsignacionID) AS Asignaciones FROM Camas AS C LEFT JOIN Asignaciones AS A ON C.CamaID = A.CamaID GROUP BY C.CamaID;


-- 5. Obtener el nombre del paciente y tipo de cama asignada por cada asignación (incluso sin asignación)
SELECT Pacientes.Nombre, Camas.Tipo FROM Pacientes LEFT JOIN Asignaciones ON Pacientes.PacienteID = Asignaciones.PacienteID LEFT JOIN Camas ON Asignaciones.CamaID = Camas.CamaID;
SELECT P.Nombre, C.Tipo 
FROM Pacientes AS P LEFT JOIN Asignaciones AS A ON P.PacienteID = A.PacienteID LEFT JOIN Camas AS C ON A.CamaID = C.CamaID;


-- 6. Listar camas ocupadas con detalles de pacientes (solo camas ocupadas)
SELECT Camas.*, Pacientes.* FROM Camas INNER JOIN Asignaciones ON Camas.CamaID = Asignaciones.CamaID INNER JOIN Pacientes ON Asignaciones.PacienteID = Pacientes.PacienteID;

-- 7. Mostrar pacientes sin asignación de cama
SELECT Pacientes.* FROM Pacientes LEFT JOIN Asignaciones ON Pacientes.PacienteID = Asignaciones.PacienteID WHERE Asignaciones.PacienteID IS NULL;


-- 8. Obtener la cantidad total de camas y la cantidad asignada (solo camas asignadas)
SELECT COUNT(*) AS Total_Camas, COUNT(Asignaciones.CamaID) FROM Camas INNER JOIN Asignaciones ON Camas.CamaID = Asignaciones.CamaID; 

-- 9. Listar camas asignadas con detalles de pacientes (solo camas asignadas)
SELECT Camas.*, Pacientes.* FROM Camas INNER JOIN Asignaciones ON Camas.CamaID = Asignaciones.CamaID INNER JOIN Pacientes ON Asignaciones.PacienteID = Pacientes.PacienteID;

-- 10. Mostrar detalles de asignaciones con nombres de pacientes (solo asignaciones con pacientes)
SELECT Asignaciones.*, Pacientes.Nombre FROM Asignaciones INNER JOIN Pacientes ON Asignaciones.PacienteID = Pacientes.PacienteID;


-- 11. Obtener información completa de las asignaciones con detalles de camas (solo asignaciones con camas)
SELECT Asignaciones.*, Camas.* FROM Asignaciones INNER JOIN Camas ON Asignaciones.CamaID = Camas.CamaID;

-- 12. Listar camas disponibles junto con sus tipos (solo camas disponibles)
SELECT Camas.* FROM Camas WHERE Camas.Disponible = TRUE;

-- 13. Mostrar pacientes y camas disponibles (solo pacientes sin asignación)
SELECT Pacientes.*, Camas.* FROM Pacientes LEFT JOIN Asignaciones ON Pacientes.PacienteID = Asignaciones.PacienteID LEFT JOIN Camas ON Asignaciones.CamaID = Camas.CamaID WHERE Asignaciones.PacienteID IS NULL;


-- 14. Obtener el nombre del paciente y tipo de cama asignada por cada asignación (solo asignaciones con pacientes)
SELECT Pacientes.Nombre, Camas.Tipo FROM Pacientes INNER JOIN Asignaciones ON Pacientes.PacienteID = Asignaciones.PacienteID INNER JOIN Camas ON Asignaciones.CamaID = Camas.CamaID;

-- 15. Listar camas ocupadas con detalles de pacientes (solo camas ocupadas)
SELECT Camas.*, Pacientes.* FROM Camas INNER JOIN Asignaciones ON Camas.CamaID = Asignaciones.CamaID INNER JOIN Pacientes ON Asignaciones.PacienteID = Pacientes.PacienteID;



-- Subconsultas de Dos y Tres Tablas:
-- Subconsultas con dos o tres tablas

--  1. Obtener el nombre del paciente y tipo de cama asignada por cada asignación (subconsulta de dos tablas)
SELECT (SELECT Nombre FROM Pacientes WHERE Pacientes.PacienteID = Asignaciones.PacienteID)AS Nombre_Paciente, (SELECT Tipo FROM Camas WHERE Camas.CamaID = Asignaciones.CamaID) AS Tipo_Cama FROM Asignaciones;

--  2. Mostrar detalles de asignaciones con nombres de pacientes y tipo de cama (subconsulta de tres tablas)
SELECT A.*, P.Nombre, C.Tipo FROM Asignaciones A JOIN Pacientes P ON A.PacienteID = P.PacienteID JOIN Camas C ON A.CamaID = C.CamaID;


--  3. Listar camas ocupadas con detalles de pacientes (subconsulta de tres tablas)
SELECT C.*, P.Nombre FROM Camas C JOIN Asignaciones A ON C.CamaID = A.CamaID JOIN Pacientes P ON A.PacienteID = P.PacienteID;

--  4. Obtener información completa de las asignaciones con detalles de camas y pacientes (subconsulta de tres tablas)
SELECT A.*, C.*, P.* FROM Asignaciones A JOIN Camas C ON A.CamaID = C.CamaID JOIN Pacientes P ON A.PacienteID = P.PacienteID;


--  5. Listar camas asignadas con detalles de pacientes y tipo de cama (subconsulta de tres tablas)
SELECT C.*, P.Nombre, C.Tipo FROM Camas C JOIN Asignaciones A ON C.CamaID = A.CamaID JOIN Pacientes P ON A.PacienteID = P.PacienteID;


--  6. Mostrar pacientes y camas disponibles con sus tipos (subconsulta de tres tablas)
SELECT P.*, C.CamaID, C.Tipo FROM Pacientes P LEFT JOIN Asignaciones A ON P.PacienteID = A.PacienteID LEFT JOIN Camas C ON A.CamaID = C.CamaID WHERE C.CamaID IS NULL;

--  7. Obtener el nombre del paciente y la cantidad de camas asignadas (subconsulta de dos tablas)
SELECT (SELECT Nombre FROM Pacientes WHERE PacienteID = A.PacienteID) AS Nombre_Paciente, COUNT(*) AS Cantidad_Camas_Asignadas FROM Asignaciones A GROUP BY A.PacienteID;

--  8. Listar camas con la cantidad de asignaciones y nombres de pacientes (subconsulta de tres tablas)
SELECT C.CamaID, COUNT(A.AsignacionID) AS Cantidad_Asignaciones, P.Nombre FROM Camas C LEFT JOIN Asignaciones A ON C.CamaID = A.CamaID LEFT JOIN Pacientes P ON A.PacienteID = P.PacienteID GROUP BY C.CamaID, P.Nombre;

--  9. Mostrar pacientes con asignaciones y su edad promedio (subconsulta de tres tablas)
SELECT P.Nombre, AVG(P.Edad) AS Edad_Promedio FROM Pacientes P JOIN Asignaciones A ON P.PacienteID = A.PacienteID GROUP BY P.Nombre;

--  10. Obtener el tipo de cama y la cantidad de pacientes asignados (subconsulta de dos tablas)
SELECT (SELECT Tipo FROM HospitalDB.Camas WHERE CamaID = A.CamaID), COUNT(DISTINCT A.PacienteID) FROM HospitalDB.Asignaciones A GROUP BY A.CamaID;


--  11. Listar camas con asignaciones y pacientes ordenados por fecha de asignación (subconsulta de tres tablas)
SELECT C.CamaID, C.Tipo, A.PacienteID, A.FechaAsignacion, (SELECT Nombre FROM HospitalDB.Pacientes WHERE PacienteID = A.PacienteID) FROM HospitalDB.Camas C JOIN HospitalDB.Asignaciones A ON C.CamaID = A.CamaID ORDER BY A.FechaAsignacion;

--  12. Mostrar camas individuales y pacientes asignados ordenados alfabéticamente (subconsulta de tres tablas)
SELECT C.CamaID, C.Tipo, (SELECT Nombre FROM HospitalDB.Pacientes WHERE PacienteID = A.PacienteID) FROM HospitalDB.Camas C JOIN HospitalDB.Asignaciones A ON C.CamaID = A.CamaID WHERE C.Tipo = 'Individual' ORDER BY (SELECT Nombre FROM HospitalDB.Pacientes WHERE PacienteID = A.PacienteID);


--  13. Obtener el nombre del paciente y la fecha de asignación más reciente (subconsulta de tres tablas)
SELECT (SELECT Nombre FROM HospitalDB.Pacientes WHERE PacienteID = A.PacienteID), MAX(A.FechaAsignacion) FROM HospitalDB.Asignaciones A GROUP BY A.PacienteID;

--  14. Listar camas con asignaciones y pacientes de género femenino (subconsulta de tres tablas)
SELECT C.CamaID, C.Tipo, (SELECT Nombre FROM HospitalDB.Pacientes WHERE PacienteID = A.PacienteID) FROM HospitalDB.Camas C JOIN HospitalDB.Asignaciones A ON C.CamaID = A.CamaID WHERE (SELECT Género FROM HospitalDB.Pacientes WHERE PacienteID = A.PacienteID) = 'Femenino';

--  15. Mostrar pacientes sin asignación de cama y su edad promedio (subconsulta de dos tablas)
SELECT Pacientes.*, (SELECT AVG(Edad) FROM Pacientes WHERE Pacientes.PacienteID = Asignaciones.PacienteID) AS Edad_Promedio FROM Pacientes LEFT JOIN Asignaciones ON Pacientes.PacienteID = Asignaciones.PacienteID WHERE Asignaciones.PacienteID IS NULL;




--  Subconsultas de Dos y Tres Tablas sin JOIN explícito:
--  Subconsultas sin JOIN explícito entre dos o tres tablas

--  1. Obtener el nombre del paciente y tipo de cama asignada por cada asignación
SELECT (SELECT Nombre FROM Pacientes WHERE PacienteID = Asignaciones.PacienteID) AS Nombre_Paciente,(SELECT Tipo FROM Camas WHERE CamaID = Asignaciones.CamaID) AS Tipo_Cama FROM Asignaciones;


--  2. Mostrar detalles de asignaciones con nombres de pacientes y tipo de cama
SELECT Asignaciones.*, (SELECT Nombre FROM Pacientes WHERE PacienteID = Asignaciones.PacienteID) AS Nombre_Paciente,(SELECT Tipo FROM Camas WHERE CamaID = Asignaciones.CamaID) AS Tipo_Cama FROM Asignaciones;

--  3. Listar camas ocupadas con detalles de pacientes
SELECT C.*, (SELECT P.Nombre FROM HospitalDB.Pacientes P WHERE P.PacienteID = A.PacienteID) FROM HospitalDB.Camas C, HospitalDB.Asignaciones A WHERE C.CamaID = A.CamaID;


--  4. Obtener información completa de las asignaciones con detalles de camas y pacientes
SELECT A.*, (SELECT CONCAT(P.Nombre, ', ', P.Edad, ', ', P.Género) FROM HospitalDB.Pacientes P WHERE P.PacienteID = A.PacienteID) AS Detalles_Paciente, (SELECT CONCAT(C.Tipo, ', ', C.Disponible) FROM HospitalDB.Camas C WHERE C.CamaID = A.CamaID) AS Detalles_Cama FROM HospitalDB.Asignaciones A;

--  5. Listar camas asignadas con detalles de pacientes y tipo de cama
SELECT (SELECT P.Nombre FROM HospitalDB.Pacientes P WHERE P.PacienteID = A.PacienteID), COUNT(*) AS Cantidad_Camas_Asignadas FROM HospitalDB.Asignaciones A GROUP BY A.PacienteID;


--  6. Mostrar pacientes y camas disponibles con sus tipos
SELECT C.CamaID, COUNT(A.AsignacionID) AS Cantidad_Asignaciones, (SELECT P.Nombre FROM HospitalDB.Pacientes P WHERE P.PacienteID = A.PacienteID) AS Nombre_Paciente FROM HospitalDB.Camas C, HospitalDB.Asignaciones A WHERE C.CamaID = A.CamaID GROUP BY C.CamaID, A.PacienteID;


--  7. Obtener el nombre del paciente y la cantidad de camas asignadas
SELECT (SELECT Nombre FROM Pacientes WHERE PacienteID = Asignaciones.PacienteID) AS Nombre_Paciente,COUNT(*) AS Cantidad_Camas_Asignadas FROM Asignaciones GROUP BY PacienteID;

--  8. Listar camas con la cantidad de asignaciones y nombres de pacientes
SELECT C.CamaID, COUNT(A.AsignacionID) AS Cantidad_Asignaciones, (SELECT P.Nombre FROM HospitalDB.Pacientes P WHERE P.PacienteID = A.PacienteID) AS Nombre_Paciente FROM HospitalDB.Camas C, HospitalDB.Asignaciones A WHERE C.CamaID = A.CamaID GROUP BY C.CamaID, A.PacienteID;


--  9. Mostrar pacientes con asignaciones y su edad promedio
SELECT (SELECT P.Nombre FROM HospitalDB.Pacientes P WHERE P.PacienteID = A.PacienteID), AVG((SELECT P.Edad FROM HospitalDB.Pacientes P WHERE P.PacienteID = A.PacienteID)) AS Edad_Promedio FROM HospitalDB.Asignaciones A GROUP BY A.PacienteID;

--  10. Obtener el tipo de cama y la cantidad de pacientes asignados
SELECT (SELECT Tipo FROM Camas WHERE CamaID = Asignaciones.CamaID) AS Tipo_Cama, COUNT(DISTINCT PacienteID) AS Cantidad_Pacientes_Asignados FROM Asignaciones GROUP BY CamaID;


--  11. Listar camas con asignaciones y pacientes ordenados por fecha de asignación
SELECT C.CamaID, (SELECT C.Tipo FROM HospitalDB.Camas C WHERE C.CamaID = A.CamaID), (SELECT CONCAT(P.Nombre, ', ', P.Edad, ', ', P.Género) FROM HospitalDB.Pacientes P WHERE P.PacienteID = A.PacienteID) AS Detalles_Paciente, A.FechaAsignacion FROM HospitalDB.Camas C, HospitalDB.Asignaciones A WHERE C.CamaID = A.CamaID ORDER BY A.FechaAsignacion;

--  12. Mostrar camas individuales y pacientes asignados ordenados alfabéticamente
SELECT C.CamaID, (SELECT C.Tipo FROM HospitalDB.Camas C WHERE C.CamaID = A.CamaID), (SELECT CONCAT(P.Nombre, ', ', P.Edad, ', ', P.Género) FROM HospitalDB.Pacientes P WHERE P.PacienteID = A.PacienteID) AS Detalles_Paciente FROM HospitalDB.Camas C, HospitalDB.Asignaciones A WHERE C.CamaID = A.CamaID AND C.Tipo = 'Individual' ORDER BY (SELECT P.Nombre FROM HospitalDB.Pacientes P WHERE P.PacienteID = A.PacienteID);

--  13. Obtener el nombre del paciente y la fecha de asignación más reciente
SELECT (SELECT P.Nombre FROM HospitalDB.Pacientes P WHERE P.PacienteID = A.PacienteID), MAX(A.FechaAsignacion) FROM HospitalDB.Asignaciones A GROUP BY A.PacienteID;

--  14. Listar camas con asignaciones y pacientes de género femenino
SELECT C.CamaID, (SELECT C.Tipo FROM HospitalDB.Camas C WHERE C.CamaID = A.CamaID), (SELECT CONCAT(P.Nombre, ', ', P.Edad, ', ', P.Género) FROM HospitalDB.Pacientes P WHERE P.PacienteID = A.PacienteID) AS Detalles_Paciente FROM HospitalDB.Camas C, HospitalDB.Asignaciones A WHERE C.CamaID = A.CamaID AND (SELECT P.Género FROM HospitalDB.Pacientes P WHERE P.PacienteID = A.PacienteID) = 'Femenino';

--  15. Mostrar pacientes sin asignación de cama y su edad promedio
SELECT Pacientes.*, (SELECT AVG(Edad) FROM Pacientes WHERE PacienteID NOT IN (SELECT PacienteID FROM Asignaciones)) AS Edad_Promedio FROM Pacientes;


--  Subconsultas con ANY, ALL y EXISTS:
--   1. Mostrar pacientes con asignaciones de camas de tipo "Individual"
SELECT * FROM HospitalDB.Pacientes WHERE EXISTS (SELECT 1 FROM HospitalDB.Asignaciones A INNER JOIN HospitalDB.Camas C ON A.CamaID = C.CamaID WHERE A.PacienteID = Pacientes.PacienteID AND C.Tipo = 'Individual');

--   2. Listar camas con asignaciones donde todas las asignaciones tienen pacientes mayores de 25 años
SELECT * FROM HospitalDB.Camas WHERE NOT EXISTS (SELECT 1 FROM HospitalDB.Asignaciones A INNER JOIN HospitalDB.Pacientes P ON A.PacienteID = P.PacienteID WHERE A.CamaID = Camas.CamaID AND P.Edad <= 25);

--   3. Obtener el tipo de cama de las camas asignadas a pacientes mayores de 30 años
SELECT DISTINCT Camas.Tipo FROM Camas WHERE EXISTS (SELECT * FROM Asignaciones INNER JOIN Pacientes ON Asignaciones.PacienteID = Pacientes.PacienteID WHERE Asignaciones.CamaID = Camas.CamaID AND Pacientes.Edad > 30);

--   4. Mostrar camas asignadas a pacientes de género femenino
SELECT * FROM HospitalDB.Camas WHERE EXISTS (SELECT 1 FROM HospitalDB.Asignaciones A INNER JOIN HospitalDB.Pacientes P ON A.PacienteID = P.PacienteID WHERE A.CamaID = Camas.CamaID AND P.Género = 'Femenino');

--   5. Listar camas donde todas las asignaciones tienen pacientes con al menos 2 asignaciones
SELECT * FROM HospitalDB.Camas WHERE NOT EXISTS (SELECT 1 FROM HospitalDB.Asignaciones A INNER JOIN HospitalDB.Pacientes P ON A.PacienteID = P.PacienteID WHERE A.CamaID = Camas.CamaID GROUP BY P.PacienteID HAVING COUNT(*) < 2);


--   6. Obtener camas asignadas donde existe al menos un paciente menor de 25 años
SELECT * FROM Camas WHERE EXISTS (SELECT * FROM Asignaciones INNER JOIN Pacientes ON Asignaciones.PacienteID = Pacientes.PacienteID WHERE Asignaciones.CamaID = Camas.CamaID AND Pacientes.Edad < 25);

--   7. Mostrar pacientes con asignaciones de camas donde todas las camas son de tipo "Doble"
SELECT * FROM HospitalDB.Pacientes WHERE NOT EXISTS (SELECT 1 FROM HospitalDB.Asignaciones A INNER JOIN HospitalDB.Camas C ON A.CamaID = C.CamaID WHERE A.PacienteID = Pacientes.PacienteID AND C.Tipo != 'Doble');

--   8. Listar camas con asignaciones de pacientes que existen en la tabla de asignaciones
SELECT * FROM Camas WHERE EXISTS (SELECT * FROM Asignaciones WHERE Asignaciones.CamaID = Camas.CamaID);


--   9. Obtener camas asignadas a pacientes donde al menos una asignación tiene una fecha anterior a '2024-01-01'
SELECT * FROM Camas WHERE EXISTS (SELECT * FROM Asignaciones WHERE Asignaciones.CamaID = Camas.CamaID AND Asignaciones.FechaAsignacion < '2024-01-01');

--   10. Mostrar pacientes con asignaciones en todas las camas de tipo "Individual"
SELECT * FROM HospitalDB.Pacientes WHERE NOT EXISTS (SELECT * FROM HospitalDB.Camas C WHERE C.Tipo = 'Individual' AND NOT EXISTS (SELECT 1 FROM HospitalDB.Asignaciones A WHERE A.CamaID = C.CamaID AND A.PacienteID = Pacientes.PacienteID));


--   11. Listar camas con asignaciones de pacientes donde al menos un paciente tiene asignaciones en todas las camas
SELECT * FROM HospitalDB.Camas WHERE EXISTS (SELECT 1 FROM HospitalDB.Asignaciones A INNER JOIN HospitalDB.Pacientes P ON A.PacienteID = P.PacienteID WHERE A.CamaID = Camas.CamaID GROUP BY P.PacienteID HAVING COUNT(DISTINCT A.CamaID) = (SELECT COUNT(*) FROM HospitalDB.Camas));

--   12. Obtener camas asignadas a pacientes donde todas las asignaciones tienen una fecha de asignación posterior a '2024-01-01'
SELECT * FROM HospitalDB.Camas WHERE NOT EXISTS (SELECT 1 FROM HospitalDB.Asignaciones A WHERE A.CamaID = Camas.CamaID AND A.FechaAsignacion <= '2024-01-01');

--   13. Mostrar pacientes con asignaciones en todas las camas
SELECT * FROM Pacientes WHERE (SELECT COUNT(*) FROM Asignaciones WHERE Asignaciones.PacienteID = Pacientes.PacienteID) = (SELECT COUNT(*) FROM Camas);
SELECT * FROM HospitalDB.Pacientes WHERE EXISTS (SELECT 1 FROM HospitalDB.Camas C WHERE NOT EXISTS (SELECT 1 FROM HospitalDB.Asignaciones A WHERE A.CamaID = C.CamaID AND A.PacienteID = Pacientes.PacienteID));
-- no entendí el enunciado --


--   14. Listar camas con asignaciones de pacientes que no existen en la tabla de asignaciones
SELECT * FROM Camas WHERE NOT EXISTS (SELECT * FROM Asignaciones WHERE Asignaciones.CamaID = Camas.CamaID);

--   15. Obtener camas asignadas a pacientes donde al menos una asignación tiene una fecha de asignación igual a la fecha máxima de asignación
SELECT * FROM Camas WHERE EXISTS (SELECT * FROM Asignaciones WHERE Asignaciones.CamaID = Camas.CamaID AND Asignaciones.FechaAsignacion = (SELECT MAX(FechaAsignacion) FROM Asignaciones));




-- 1. Subconsulta con NOT ANY: Obtener pacientes que no tienen asignaciones en camas individuales.
SELECT * FROM Pacientes WHERE PacienteID NOT IN (SELECT PacienteID FROM Asignaciones WHERE CamaID IN ( SELECT CamaID FROM Camas WHERE Tipo = 'Individual'));

-- 2. Subconsulta con NOT ALL: Listar camas con asignaciones donde no todas las asignaciones tienen pacientes mayores de 25 años.
SELECT * FROM HospitalDB.Camas WHERE CamaID IN (SELECT CamaID FROM HospitalDB.Asignaciones A INNER JOIN HospitalDB.Pacientes P ON A.PacienteID = P.PacienteID WHERE P.Edad <= 25);

-- 3. Subconsulta con NOT EXISTS: Mostrar pacientes sin asignaciones en ninguna cama.
SELECT * FROM Pacientes WHERE NOT EXISTS (SELECT 1 FROM Asignaciones WHERE Asignaciones.PacienteID = Pacientes.PacienteID);

-- 4. Subconsulta combinando NOT EXISTS y NOT ANY: Obtener camas sin asignaciones de pacientes menores de 30 años.
SELECT * FROM HospitalDB.Camas WHERE CamaID NOT IN (SELECT CamaID FROM HospitalDB.Asignaciones A WHERE A.PacienteID IN (SELECT PacienteID FROM HospitalDB.Pacientes WHERE Edad < 30));


-- 5. Subconsulta combinando NOT EXISTS y NOT ALL: Listar camas con asignaciones de pacientes donde no todas las asignaciones tienen una fecha de asignación posterior a '2024-01-01'.
SELECT * FROM HospitalDB.Camas WHERE CamaID IN (SELECT CamaID FROM HospitalDB.Asignaciones A WHERE NOT EXISTS (SELECT 1 FROM HospitalDB.Asignaciones WHERE CamaID = A.CamaID AND FechaAsignacion <= '2024-01-01'));


-- Ejercicios de Update:
-- 1. Actualizar la edad de todos los pacientes mayores de 50 años:
UPDATE HospitalDB.Pacientes SET Edad = Edad + 1 WHERE Edad > 50;

-- 2. Modificar el tipo de cama de todas las camas individuales:
UPDATE HospitalDB.Camas SET Tipo = 'Compartida' WHERE Tipo = 'Individual';

-- 3. Actualizar la fecha de asignación de todas las asignaciones a una fecha específica:
UPDATE HospitalDB.Asignaciones SET FechaAsignacion = '2024-02-04';

-- 4. Incrementar la cantidad de camas disponibles en un determinado piso:
UPDATE HospitalDB.Camas SET Disponible = TRUE WHERE Tipo = 'Individual' AND Disponible = FALSE;

-- 5. Cambiar el género de todos los pacientes femeninos a masculino:
UPDATE Pacientes SET Género = 'Masculino' WHERE Género = 'Femenino';

-- 6. Marcar todas las camas ocupadas como no disponibles:
UPDATE Camas SET Disponible = FALSE WHERE Disponible = TRUE;

-- 7. Actualizar la fecha de asignación de las asignaciones más recientes:
UPDATE Asignaciones SET FechaAsignacion = '2024-02-05' WHERE AsignacionID = (SELECT AsignacionID FROM (SELECT MAX(AsignacionID) AS MaxAsignacionID FROM Asignaciones) AS MaxAsignacion);

-- 8. Modificar el tipo de cama para asignaciones de pacientes menores de 30 años:
UPDATE Camas SET Tipo = 'Compartida' WHERE CamaID IN (SELECT CamaID FROM Asignaciones WHERE PacienteID IN (SELECT PacienteID FROM Pacientes WHERE Edad < 30));

-- 9. Actualizar la cantidad máxima de camas permitidas por tipo:
UPDATE HospitalDB.Camas SET Disponible = 20 WHERE Tipo = 'Individual';

-- 10. Cambiar la fecha de asignación de pacientes en camas individuales:
UPDATE HospitalDB.Asignaciones SET FechaAsignacion = '2024-02-04' WHERE CamaID IN (SELECT CamaID FROM HospitalDB.Camas WHERE Tipo = 'Individual');

-- 11. Incrementar la cantidad de camas asignadas para pacientes con más de 2 asignaciones:
UPDATE Camas SET Disponible = FALSE WHERE CamaID IN (SELECT CamaID FROM (SELECT CamaID, COUNT(*) AS asignaciones FROM Asignaciones GROUP BY CamaID) AS asignaciones_count WHERE asignaciones > 2);

-- 12. Actualizar la fecha de asignación para todas las asignaciones de un paciente específico:
UPDATE MaxCamasPermitidas SET CantidadMaxima = CantidadMaxima + 5 WHERE Tipo IN ('Individual', 'Compartida');

-- 13. Modificar el tipo de cama para asignaciones de pacientes mayores de 40 años:
UPDATE Camas SET Tipo = 'Compartida' WHERE CamaID IN (SELECT CamaID FROM Asignaciones WHERE PacienteID IN (SELECT PacienteID FROM Pacientes WHERE Edad > 40));

-- 14. Cambiar la disponibilidad de camas individuales a no disponibles:
UPDATE Camas SET Disponible = FALSE WHERE Tipo = 'Individual';

-- 15. Actualizar la fecha de asignación de las asignaciones más antiguas:


-- Ejercicios de Update:
-- 1. Incrementar la edad de todos los pacientes asignados a camas individuales en 2 años:
UPDATE Pacientes SET Edad = Edad + 2 WHERE PacienteID IN (SELECT PacienteID FROM Asignaciones WHERE CamaID IN (SELECT CamaID FROM Camas WHERE Tipo = 'Individual'));

-- 2. Marcar como no disponible todas las camas asignadas a pacientes menores de 25 años:
UPDATE Camas SET Disponible = FALSE WHERE CamaID IN (SELECT CamaID FROM Asignaciones WHERE PacienteID IN (SELECT PacienteID FROM Pacientes WHERE Edad < 25));

-- 3. Actualizar la fecha de asignación de las asignaciones realizadas en camas del piso 3:
UPDATE Asignaciones SET FechaAsignacion = 'fecha_nueva' WHERE CamaID IN (SELECT CamaID FROM Camas WHERE Tipo = 'Compartida' AND CamaID BETWEEN 301 AND 350);

-- 4. Cambiar el tipo de cama para asignaciones de pacientes mayores de 30 años:
UPDATE Asignaciones SET CamaID = (SELECT CamaID FROM Camas WHERE Tipo = 'Individual' LIMIT 1) WHERE PacienteID IN (SELECT PacienteID FROM Pacientes WHERE Edad > 30);


-- 5. Incrementar la cantidad de camas disponibles en un piso específico en 3 unidades:
UPDATE Camas SET Disponible = TRUE WHERE CamaID BETWEEN 301 AND 350;

-- 6. Actualizar la fecha de asignación de las asignaciones de camas individuales a la fecha actual:
UPDATE Asignaciones SET FechaAsignacion = CURDATE() WHERE CamaID IN (SELECT CamaID FROM Camas WHERE Tipo = 'Individual');

-- 7. Modificar el tipo de cama para asignaciones de pacientes femeninas a 'Individual':
UPDATE Asignaciones SET CamaID = 'Individual' WHERE PacienteID IN (SELECT PacienteID FROM Pacientes WHERE Género = 'Femenino');

-- 8. Actualizar la fecha de asignación para todas las asignaciones de camas del piso 4:
UPDATE Asignaciones SET FechaAsignacion = 'fecha_nueva' WHERE CamaID IN (SELECT CamaID FROM Camas WHERE CamaID BETWEEN 401 AND 450);

-- 9. Cambiar el tipo de cama para asignaciones de pacientes con más de 2 asignaciones a 'Individual':
UPDATE Asignaciones SET CamaID = 'Individual' WHERE PacienteID IN (SELECT PacienteID FROM (SELECT PacienteID, COUNT(*) AS asignaciones FROM Asignaciones GROUP BY PacienteID) AS asignaciones_count WHERE asignaciones > 2);

-- 10. Incrementar la cantidad de camas disponibles en un 5%:
SELECT COUNT(*) AS TotalCamas FROM Camas; -- hay 15 camas y no se puede asignar una fragcion de camas

-- 11. Actualizar la fecha de asignación para las asignaciones realizadas en camas con más de 1 asignación:
SELECT CamaID FROM Asignaciones GROUP BY CamaID HAVING COUNT(*) > 1; -- no hay camas con más de una asignación

-- 12. Cambiar el tipo de cama para asignaciones de pacientes masculinos mayores de 40 años a 'Individual':


-- 13. Actualizar la fecha de asignación para todas las asignaciones de pacientes con más de 3 asignaciones:
UPDATE Asignaciones
SET FechaAsignacion = 'fecha_nueva'
WHERE PacienteID IN (SELECT PacienteID FROM (SELECT PacienteID, COUNT(*) AS asignaciones FROM Asignaciones GROUP BY PacienteID) AS asignaciones_count WHERE asignaciones > 3);

-- 14. Modificar el tipo de cama para asignaciones de pacientes con más de 1 asignación a 'Doble':
UPDATE Asignaciones SET CamaID = 'Doble' WHERE PacienteID IN (SELECT PacienteID FROM (SELECT PacienteID, COUNT(*) AS asignaciones FROM Asignaciones GROUP BY PacienteID) AS asignaciones_count WHERE asignaciones > 1);

-- 15. Actualizar la cantidad máxima de camas permitidas por tipo y piso:

-- 1. Consulta con JOIN y GROUP BY: Obtener la cantidad de asignaciones por tipo de cama.
SELECT c.Tipo, COUNT(a.AsignacionID) AS CantidadAsignaciones FROM Asignaciones a JOIN Camas c ON a.CamaID = c.CamaID GROUP BY c.Tipo;

-- 2. Consulta con Subconsulta correlacionada y Agregación: Mostrar la edad promedio de pacientes con más de 2 asignaciones.
SELECT AVG(p.Edad) AS EdadPromedio FROM Pacientes p WHERE (SELECT COUNT(*) FROM Asignaciones WHERE PacienteID = p.PacienteID) > 2;

-- 3. Consulta con JOIN y ORDER BY: Listar camas asignadas con detalles de pacientes, ordenadas por fecha de asignación.
SELECT c.CamaID, c.Tipo, a.FechaAsignacion, p.Nombre, p.Edad, p.Género FROM Asignaciones a JOIN Camas c ON a.CamaID = c.CamaID JOIN Pacientes p ON a.PacienteID = p.PacienteID ORDER BY a.FechaAsignacion;

-- 4. Consulta con Subconsulta y DISTINCT: Obtener la lista de géneros únicos de pacientes asignados.
SELECT DISTINCT p.Género FROM Pacientes p JOIN Asignaciones a ON p.PacienteID = a.PacienteID;

-- 5. Consulta con JOIN y SUM: Mostrar la suma total de la cantidad de camas disponibles por piso.
SELECT SUM(CASE WHEN c.Tipo = 'Individual' THEN 1 ELSE 0 END) AS TotalIndividual, SUM(CASE WHEN c.Tipo = 'Compartida' THEN 1 ELSE 0 END) AS TotalCompartida FROM Camas c WHERE c.Disponible = TRUE;

-- 6. Consulta con JOIN, WHERE y ORDER BY: Listar camas asignadas con detalles de pacientes, solo para camas en el piso 3, ordenadas por fecha de asignación.
SELECT c.CamaID, c.Tipo, a.FechaAsignacion, p.Nombre, p.Edad, p.Género FROM Asignaciones a JOIN Camas c ON a.CamaID = c.CamaID JOIN Pacientes p ON a.PacienteID = p.PacienteID WHERE c.Piso = 3 ORDER BY a.FechaAsignacion;

-- 7. Consulta con JOIN, GROUP BY y HAVING: Obtener la cantidad de asignaciones por paciente, solo para aquellos con más de 3 asignaciones.
SELECT a.PacienteID, COUNT(*) AS CantidadAsignaciones FROM Asignaciones a GROUP BY a.PacienteID HAVING COUNT(*) > 3;

-- 8. Consulta con Subconsulta y MAX: Encontrar la fecha más reciente de asignación para cada paciente.
SELECT a.PacienteID, MAX(a.FechaAsignacion) AS UltimaAsignacion FROM Asignaciones a GROUP BY a.PacienteID;

-- 9. Consulta con JOIN, WHERE y COUNT: Contar la cantidad de pacientes asignados en camas de tipo 'Individual' en el piso 2.
SELECT COUNT(DISTINCT a.PacienteID) AS CantidadPacientes FROM Asignaciones a JOIN Camas c ON a.CamaID = c.CamaID WHERE c.Piso = 2 AND c.Tipo = 'Individual';

-- 10. Consulta con JOIN, GROUP BY, y AVG: Obtener la edad promedio de pacientes asignados por tipo de cama.
SELECT c.Tipo, AVG(p.Edad) AS EdadPromedio FROM Asignaciones a JOIN Camas c ON a.CamaID = c.CamaID JOIN Pacientes p ON a.PacienteID = p.PacienteID GROUP BY c.Tipo;

-- 11. Consulta con JOIN, ORDER BY y LIMIT: Listar las camas asignadas a pacientes, ordenadas por fecha de asignación, y limitar los resultados a 10.
SELECT c.CamaID, c.Tipo, a.FechaAsignacion, p.Nombre, p.Edad, p.Género FROM Asignaciones a JOIN Camas c ON a.CamaID = c.CamaID JOIN Pacientes p ON a.PacienteID = p.PacienteID ORDER BY a.FechaAsignacion LIMIT 10;

-- 12. Consulta con JOIN, WHERE y COUNT con Distinción: Contar la cantidad de camas ocupadas por pacientes femeninas mayores de 25 años.
SELECT COUNT(DISTINCT a.CamaID) AS CamasOcupadas FROM Asignaciones a JOIN Pacientes p ON a.PacienteID = p.PacienteID WHERE p.Género = 'Femenino' AND p.Edad > 25;

-- 13. Consulta con Subconsulta y MIN: Encontrar la fecha de asignación más antigua para cada cama.
SELECT c.CamaID, MIN(a.FechaAsignacion) AS FechaAsignacionMasAntigua FROM Asignaciones a JOIN Camas c ON a.CamaID = c.CamaID GROUP BY c.CamaID;

-- 14. Consulta con JOIN, GROUP BY, y Funciones de Ventana: Obtener la lista de pacientes junto con la cantidad total de asignaciones y el número de asignaciones por paciente.
SELECT p.PacienteID, p.Nombre, COUNT(*) AS TotalAsignaciones, ROW_NUMBER() OVER(ORDER BY COUNT(*) DESC) AS NumeroAsignacionesPorPaciente FROM Pacientes p JOIN Asignaciones a ON p.PacienteID = a.PacienteID GROUP BY p.PacienteID, p.Nombre;

-- 15. Consulta con JOIN, WHERE y Funciones de Ventana: Listar camas asignadas a pacientes junto con el número de asignaciones por paciente, ordenadas por el número de asignaciones en orden descendente.
SELECT a.PacienteID, p.Nombre, a.CamaID, ROW_NUMBER() OVER(PARTITION BY a.PacienteID ORDER BY a.FechaAsignacion DESC) AS NumeroAsignacionesPorPaciente FROM Asignaciones a JOIN Pacientes p ON a.PacienteID = p.PacienteID ORDER BY NumeroAsignacionesPorPaciente DESC;


-- 1. Consulta con Subconsulta y Agregación: Obtener el número total de camas, la cantidad de camas ocupadas y la proporción de ocupación.
SELECT COUNT(*) AS TotalCamas, COUNT(CASE WHEN Disponible = FALSE THEN 1 END) AS CamasOcupadas, ROUND(COUNT(CASE WHEN Disponible = FALSE THEN 1 END) / COUNT(*) * 100, 2) AS ProporcionOcupacion FROM Camas;

-- 2. Consulta con Subconsulta correlacionada y Agregación: Mostrar la lista de pacientes con la cantidad total de asignaciones.
SELECT p.PacienteID,p.Nombre,(SELECT COUNT(*) FROM Asignaciones WHERE PacienteID = p.PacienteID) AS TotalAsignaciones FROM Pacientes p;

-- 3. Consulta con CTE (Common Table Expression) y JOIN: Listar camas junto con la edad promedio de los pacientes asignados.
WITH EdadPromedioPorCama AS (SELECT c.CamaID,AVG(p.Edad) AS EdadPromedio FROM Camas c JOIN Asignaciones a ON c.CamaID = a.CamaID JOIN Pacientes p ON a.PacienteID = p.PacienteID GROUP BY c.CamaID)SELECT c.CamaID, c.Tipo,ep.EdadPromedio FROM Camas c LEFT JOIN EdadPromedioPorCama ep ON c.CamaID = ep.CamaID;

-- 4. Consulta con Funciones de Ventana: Obtener la lista de camas con el nombre del paciente más joven y más viejo asignado a cada cama.
SELECT DISTINCT c.CamaID, c.Tipo, FIRST_VALUE(p.Nombre) OVER (PARTITION BY c.CamaID ORDER BY p.Edad ASC) AS PacienteMasJoven, FIRST_VALUE(p.Nombre) OVER (PARTITION BY c.CamaID ORDER BY p.Edad DESC) AS PacienteMasViejo FROM Camas c JOIN Asignaciones a ON c.CamaID = a.CamaID JOIN Pacientes p ON a.PacienteID = p.PacienteID;

-- 5. Consulta con Pivoteo Dinámico: Mostrar la cantidad de camas ocupadas por tipo de cama en una tabla pivote.
SELECT Tipo, COUNT(CASE WHEN Disponible = FALSE THEN 1 END) AS CamasOcupadas FROM Camas GROUP BY Tipo;	
