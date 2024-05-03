USE Northwind

SELECT 
    YEAR(o.OrderDate) AS AÑO,
    DATEPART(QUARTER, o.OrderDate) AS TRIMESTRE,
    COUNT(DISTINCT o.OrderID) AS NUMERO_DE_VENTAS,
    SUM(od.Quantity) AS CANTIDAD_VENDIDA,
    SUM(od.UnitPrice * od.Quantity) AS IMPORTE_DE_LAS_VENTAS
FROM 
    Orders o
JOIN 
    [Order Details] od ON o.OrderID = od.OrderID
GROUP BY 
    YEAR(o.OrderDate),
    DATEPART(QUARTER, o.OrderDate);
