/* I. Crea el siguiente esquema de base de datos llamado “El Supermercado” utilizando MySQL Line Command (Valor hasta 4 puntos). */

CREATE DATABASE ELSUPERMERCADO;

USE ELSUPERMERCADO;

CREATE TABLE Cliente (
    RFC CHAR(13),
    Nombre CHAR(50) NOT NULL,
    Ciudad CHAR(50) NOT NULL,
    Estado CHAR(20) NOT NULL,
    Telefono CHAR(10),
    PRIMARY KEY (RFC)
);

CREATE TABLE Producto (
    idProd INT,
    Descripcion CHAR(30) NOT NULL,
    Marca CHAR(30) NOT NULL,
    UnidadMed CHAR(10) NOT NULL,
    Precio FLOAT NOT NULL,
    Existencia FLOAT NOT NULL,
    PRIMARY KEY (idProd)
);

CREATE TABLE Venta (
    idVenta INT,
    RFC CHAR(13),
    idProd INT,
    FechaV DATE NOT NULL,
    Cantidad FLOAT NOT NULL,
    PrecioV FLOAT NOT NULL,
    Importe FLOAT NOT NULL,
    PRIMARY KEY AUTO_INCREMENT (idVenta),
    FOREIGN KEY (RFC)
        REFERENCES Cliente (RFC),
    FOREIGN KEY (idProd)
        REFERENCES Producto (idProd)
);

SHOW TABLES;

DESCRIBE Cliente;
DESCRIBE Producto;
DESCRIBE Venta;



/* II. Inserta los siguientes registros en cada una de las tablas, de acuerdo con la estructura de cada una (Valor hasta 4 puntos) */

INSERT INTO Cliente VALUES ("PEPJ780912ABC", "Juan Pérez", "Martínez de la Torre", "Veracruz", 2323245111);
INSERT INTO Cliente VALUES ("LOAM670913123", "Mario López", "Xalapa", "Veracruz", 2299999999);
INSERT INTO Cliente VALUES ("RUAA901212D34", "Angela Ruiz", "Toluca", "Estado de México", 2323245666);
INSERT INTO Cliente VALUES ("PEHM560707AZ3", "Martha Pérez", "Veracruz","Veracruz",2296789060);
INSERT INTO Cliente VALUES ("MOGJ670201123", "José Luis Montes", "Oaxaca", "Oaxaca", 2289800004);
SELECT * FROM Cliente;


INSERT INTO Producto VALUES (10, "Leche", "Lala", "Pieza", 19.80, 500);
INSERT INTO Producto VALUES (20, "Refresco", "Coca Cola 600 Ml", "Pieza", 14.50, 60);
INSERT INTO Producto VALUES (30, "Agua", "Ciel", "Pieza", 9.00, 60);
INSERT INTO Producto VALUES (40, "Frijol", "Hidalgo", "Kilogramo", 22.50, 33);
INSERT INTO Producto VALUES (50, "Mayonesa", "La Costeña", "Pieza", 41.80, 44);
INSERT INTO Producto VALUES (60, "Arroz", "SOS", "Kilogramo", 18.60, 120);
SELECT * FROM Producto;

INSERT INTO Venta VALUES (1, "PEPJ780912ABC", 10, "2019-01-31", 2.00, 0, 0);
INSERT INTO Venta VALUES (2, "LOAM670913123", 10, "2019-02-10", 3.00, 0, 0);
INSERT INTO Venta VALUES (3, "RUAA901212D34", 10, "2019-02-10", 2.00, 0, 0);
INSERT INTO Venta VALUES (4, "PEHM560707AZ3", 20, "2019-02-10", 4.00, 0, 0);
INSERT INTO Venta VALUES (5, "MOGJ670201123", 10, "2019-02-14", 5.00, 0, 0);
INSERT INTO Venta VALUES (6, "PEPJ780912ABC", 20, "2019-02-14", 6.00, 0, 0);
INSERT INTO Venta VALUES (7, "LOAM670913123", 50, "2019-02-14", 10.00, 0, 0);
INSERT INTO Venta VALUES (8, "RUAA901212D34", 60, "2019-02-15", 2.00, 0, 0);
INSERT INTO Venta VALUES (9, "PEHM560707AZ3", 10, "2019-02-18", 1.00, 0, 0);
INSERT INTO Venta VALUES (10, "MOGJ670201123", 20, "2019-02-18", 2.00, 0, 0);
INSERT INTO Venta VALUES (11, "PEPJ780912ABC", 60, "2019-02-18", 4.00, 0, 0);
INSERT INTO Venta VALUES (12, "LOAM670913123", 10, "2019-02-18", 5.00, 0, 0);
INSERT INTO Venta VALUES (13, "RUAA901212D34", 30, "2019-02-18", 2.00, 0, 0);
INSERT INTO Venta VALUES (14, "PEHM560707AZ3", 20, "2019-02-18", 7.00, 0, 0);
INSERT INTO Venta VALUES (15, "MOGJ670201123", 40, "2019-02-20", 4.00, 0, 0);
INSERT INTO Venta VALUES (16, "PEPJ780912ABC", 10, "2019-02-28", 5.00, 0, 0);
INSERT INTO Venta VALUES (17, "LOAM670913123", 60, "2019-03-01", 6.00, 0, 0);
INSERT INTO Venta VALUES (18, "RUAA901212D34", 60, "2019-03-01", 2.00, 0, 0);
INSERT INTO Venta VALUES (19, "PEHM560707AZ3", 20, "2019-03-01", 1.00, 0, 0);
INSERT INTO Venta VALUES (20, "MOGJ670201123", 50, "2019-03-02", 1.00, 0, 0);
SELECT * FROM Venta;

/* III. Con las relaciones de la base de datos “El Supermercado” escribe la sentencia SQL que permita realizar la transacción indicada (Valor 1 punto c/u) */

 /*Insertar el cliente Pedro López, que radica en la Ciudad de Martínez de la Torre, Veracruz, con número telefónico 2323240000 y RFC LOPP090879CXY.*/
INSERT INTO Cliente VALUES ("LOPP090879CXY", "Pedro López", "Martínez de la Torre", "Veracruz", 2323240000);
SELECT * FROM Cliente;

 /*Agrega un Refresco de 600 ml de la marca Pepsi con IdProd 70 el cual tiene un precio de $12.00 cuya existencia es de 10 y su Unidad de medida es Pieza.*/
INSERT INTO Producto VALUES (70, "Refresco", "Pepsi", "Pieza", 12.00, 10);
SELECT * FROM Producto;

 /*Modifica el nombre del Cliente, de Angela Ruiz a Angela Ruiz Álvarez.*/
UPDATE Cliente SET Nombre = "Angela Ruiz Álvarez" WHERE RFC = "RUAA901212D34"; 
SELECT * FROM Cliente;

 /*Modifica la existencia a 34 del producto cuya clave es el 10.*/
UPDATE Producto SET Existencia = 32 WHERE idProd = 10;
SELECT * FROM Producto;

 /*Actualiza el PrecioV de la tabla Venta, tomando como referencia el precio de cada producto.*/
UPDATE Venta INNER JOIN Producto ON Venta.idProd = Producto.idProd SET PrecioV = Precio;
SELECT * FROM Venta;

 /*Agregar en la tabla cliente tu nombre (completo), con RFC ALUMNO202006X, Ciudad: Martínez de la Torre, y Estado: Veracruz.*/
INSERT INTO Cliente VALUES ("ALUMNO202006X", "José Manuel Rivera González", "Martínez de la Torre", "Veracruz", NULL);
SELECT * FROM Cliente;

 /*Calcular el importe en la tabla de Venta (PrecioV * Cantidad).*/
UPDATE Venta INNER JOIN Producto ON Venta.idProd = Producto.idProd SET Importe = Precio*Cantidad;
SELECT * FROM Venta;

/* IV. Escribe la sentencia en SQL que permita realizar correctamente lo que te pide (Valor 2 puntos c/u) */

 /*Mostrar el nombre, ciudad y teléfono de cada uno de los clientes que radiquen en Martínez de la Torre, ordenarlos descendentemente por el nombre.*/
SELECT Nombre, Ciudad, Telefono FROM Cliente WHERE Ciudad = "Martínez de la Torre" ORDER BY Nombre DESC;

 /*Mostrar el nombre de los clientes que no tienen registrado teléfono.*/
SELECT Nombre FROM Cliente WHERE Telefono IS NULL;

 /*Mostrar la descripción, marca, unidad, precio y existencia de los productos cuyo precio no sea mayor a 20 pesos.*/
SELECT Descripcion, Marca, UnidadMed, Precio, Existencia FROM Producto WHERE Precio<20;

 /*Mostrar todos los datos de los productos que su unidad de medida sea Pieza.*/
SELECT * FROM Producto WHERE UnidadMed = "Pieza";

 /*Mostrar el nombre del cliente, ciudad, descripción y marca de los productos, precio de venta, cantidad e importe de todos los registros de las ventas.*/
SELECT Nombre, Ciudad, Descripcion, Marca, PrecioV, Cantidad, Importe FROM Cliente INNER JOIN Venta ON Cliente.RFC = Venta.RFC INNER JOIN Producto ON Venta.idProd = Producto.idProd;

 /*Mostrar el nombre del cliente, fecha e importe de cada venta registrada, ordenado los registros del más reciente al más antigua.*/
SELECT Nombre, FechaV, Importe FROM Cliente INNER JOIN Venta Where Cliente.RFC = Venta.RFC ORDER BY FechaV DESC;

 /*Mostrar la cantidad total de productos vendidos en el mes de febrero del año 2019. Mostrar la descripción y marca de cada producto, además de la cantidad total de cada uno durante el mes.*/
SELECT SUM(Cantidad), Descripcion, Marca FROM Venta INNER JOIN Producto ON Venta.idProd = Producto.idProd WHERE MONTH(FechaV) = 2 GROUP BY Descripcion;

 /*Desplegar el promedio de ventas por día durante la segunda quincena de febrero. Mostrar el promedio del importe de las ventas y la fecha.*/
SELECT AVG(Importe), FechaV FROM Venta WHERE FechaV > "2019-02-14" AND FechaV < "2019-03-01" GROUP BY FechaV;

 /*Crea una vista con el nombre MiConsulta, que permita visualizar las ventas registradas, ordenándolas a través del importe de forma descendente. La vista debe mostrar nombre del cliente, ciudad, descripción, marca y unidad de los productos, precio, cantidad e importe de las ventas*/
CREATE VIEW MiConsulta AS SELECT Nombre, Ciudad, Descripcion, Marca, UnidadMed, Precio, Cantidad, Importe FROM Cliente INNER JOIN Venta ON Cliente.RFC = Venta.RFC INNER JOIN Producto ON Venta.idProd = Producto.idProd ORDER BY Importe DESC;
SELECT * FROM MiConsulta;

DROP DATABASE ELSUPERMERCADO;

