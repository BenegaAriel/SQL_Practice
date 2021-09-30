-- Ver todas las ordenes de compra.

SELECT * FROM Compras.dbo.ord_comp

-- Todas las ordenes de compra de Laminas Termocontaribles.

SELECT Purchasing_Doc, Doc_Date, Vendor, Short_Text, Order_Qty
FROM Compras.dbo.ord_comp
WHERE Short_Text LIKE '%Termoco%';

-- Todas las ordenes de compra de Laminas Termocontaribles del año 2017.

SELECT Purchasing_Doc, Doc_Date, Vendor, Short_Text, Order_Qty
FROM Compras.dbo.ord_comp
WHERE YEAR(Doc_Date)='2017'AND Short_Text LIKE '%TERMOCON%';


-- Total de unidades de Laminas Termocontaribles compradas en el año 2017.

SELECT SUM(Order_Qty) AS Cantidad
FROM Compras.dbo.ord_comp
WHERE YEAR(Doc_Date)='2017'AND Short_Text LIKE '%TERMOCON%';


-- Cantidad de kg de papel 78 cm comprados en 2020 y 2021 separado por proveedor.

SELECT Purchasing_Doc, Vendor, Doc_Date, SUM(Order_qty) AS Total_KG
FROM Compras.dbo.ord_comp
WHERE YEAR(Doc_Date)>'2019'AND Short_Text LIKE '%78cm%'
GROUP BY Purchasing_Doc, Vendor, Doc_Date;



-- Cuantas ordenes de compra se hicieron por proveedor desde el 2013 hasta el 2021 ordenado de menor a mayor.

SELECT vendor, COUNT ( DISTINCT Purchasing_Doc ) AS "Number of POs" 
FROM Compras.dbo.ord_comp
GROUP BY Vendor
ORDER BY "Number of POs" DESC;



--SELECT YEAR(Doc_Date), vendor, COUNT ( DISTINCT Purchasing_Doc ) AS "Number of POs" 
--FROM Compras.dbo.ord_comp
--GROUP BY YEAR(Doc_Date),Vendor
--ORDER BY "Number of POs" DESC;



-- Total de ordenes de compra.
SELECT COUNT ( DISTINCT Purchasing_Doc ) AS "Number of POs" 
FROM Compras.dbo.ord_comp;



-- Total de ordenes de compra por año.
SELECT YEAR(Doc_Date), COUNT ( DISTINCT Purchasing_Doc ) AS "Number of POs" 
FROM Compras.dbo.ord_comp
GROUP BY YEAR(Doc_Date);




-- Cantidad de ordenes de compra por mes en un año especifico.
SELECT YEAR(Doc_Date), MONTH(Doc_Date), COUNT ( DISTINCT Purchasing_Doc ) AS "Number of POs" 
FROM Compras.dbo.ord_comp
WHERE YEAR(Doc_Date) = 2017
GROUP BY YEAR(Doc_Date), MONTH(Doc_Date);


-- PARA SOX 
-- Todas las OC que tienen una descripcion de "IIBB"

SELECT Doc_Date, Purchasing_Doc, Vendor, Item, Short_Text AS Sox
FROM Compras.dbo.ord_comp
WHERE YEAR(Doc_Date)='2021'AND MONTH(Doc_Date)>'7'AND Short_Text LIKE '%IIBB%';



--SELECT Doc_Date, Purchasing_Doc, Vendor, Item, Short_Text AS Sox
--FROM Compras.dbo.ord_comp
--WHERE Short_Text LIKE '%IIBB%';



-- Cuales son las ordenes de compra del ano 2021 que estan pendientes de entrega.
SELECT Purchasing_Doc, Doc_Date, Vendor, Short_Text, Order_Qty, [Still_to_be_delivered_(qty)]
FROM Compras.dbo.ord_comp
WHERE YEAR(Doc_Date)='2021'AND [Still_to_be_delivered_(qty)] > 0;


-- Cuales son las ordenes de compra del ano 2021 que estan pendientes de ingresar la factura.
SELECT Purchasing_Doc, Doc_Date, Vendor, Short_Text, Order_Qty, [Still_to_be_delivered_(qty)]
FROM Compras.dbo.ord_comp
WHERE YEAR(Doc_Date)='2021'AND [Still_to_be_invoiced_(val#)] > 0 ;










-- Ver los datos de la Base de datos de Dolares
SELECT Fecha, BNA_Venta FROM Practica_SQL.dbo.Dolar_BNA_BLUE_2013_2021;


-- AGREGAR COLUMNA DE DOLARES DE OTRA BASE DE DATOS
-- Revisar si hay que usar LEFT INNER JOIN



SELECT * FROM Compras.dbo.ord_comp INNER JOIN Practica_SQL.dbo.Dolar_BNA_BLUE_2013_2021
    ON (Compras.dbo.ord_comp.Doc_Date = Practica_SQL.dbo.Dolar_BNA_BLUE_2013_2021.Fecha);



SELECT  * FROM Compras.dbo.ord_comp
LEFT JOIN Departamentos D
ON E.DepartamentoId = D.Id











-- Buscar un proveedor especifico con algunas letras del nombre.

SELECT Doc_Date, Purchasing_Doc, Vendor, Item, Short_Text
FROM Compras.dbo.ord_comp
WHERE Vendor LIKE '%MPS%';