--REQUERIMENTO 5
/*
SE NECESITA UNA CONSULTA QUE REPORTE EL IMPORTE DE LAS VENTAS DPOR TRIMESTRE DE CADA CATEGORIA
SOLO CONSIDERAR AÑO 1997
*/
USE Northwind;

SELECT 
    c.CategoryName AS [NOMBRE CATEGORIA],
    SUM(CASE WHEN DATEPART(QUARTER, o.OrderDate) = 1 THEN od.UnitPrice * od.Quantity ELSE 0 END) AS [TRIMESTRE 1],
    SUM(CASE WHEN DATEPART(QUARTER, o.OrderDate) = 2 THEN od.UnitPrice * od.Quantity ELSE 0 END) AS [TRIMESTRE 2],
    SUM(CASE WHEN DATEPART(QUARTER, o.OrderDate) = 3 THEN od.UnitPrice * od.Quantity ELSE 0 END) AS [TRIMESTRE 3],
    SUM(CASE WHEN DATEPART(QUARTER, o.OrderDate) = 4 THEN od.UnitPrice * od.Quantity ELSE 0 END) AS [TRIMESTRE 4],
    SUM(od.UnitPrice * od.Quantity) AS [IMPORTE TOTAL]
FROM 
    Categories c
JOIN 
    Products p ON c.CategoryID = p.CategoryID
JOIN 
    [Order Details] od ON p.ProductID = od.ProductID
JOIN 
    Orders o ON od.OrderID = o.OrderID
WHERE 
    DATEPART(YEAR, o.OrderDate) = 1997
GROUP BY 
    c.CategoryName;
