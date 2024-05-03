USE Northwind
SELECT 
    c.CategoryName AS NOMBRE_CATEGORIA,
    SUM(CASE WHEN MONTH(o.OrderDate) BETWEEN 1 AND 3 THEN od.UnitPrice * od.Quantity ELSE 0 END) AS TRIMESTRE_1,
    SUM(CASE WHEN MONTH(o.OrderDate) BETWEEN 4 AND 6 THEN od.UnitPrice * od.Quantity ELSE 0 END) AS TRIMESTRE_2,
    SUM(CASE WHEN MONTH(o.OrderDate) BETWEEN 7 AND 9 THEN od.UnitPrice * od.Quantity ELSE 0 END) AS TRIMESTRE_3,
    SUM(CASE WHEN MONTH(o.OrderDate) BETWEEN 10 AND 12 THEN od.UnitPrice * od.Quantity ELSE 0 END) AS TRIMESTRE_4,
    SUM(od.UnitPrice * od.Quantity) AS IMPORTE_TOTAL
FROM 
    Orders o
JOIN 
    [Order Details] od ON o.OrderID = od.OrderID
JOIN 
    Products p ON od.ProductID = p.ProductID
JOIN 
    Categories c ON p.CategoryID = c.CategoryID
WHERE 
    YEAR(o.OrderDate) = 1997
GROUP BY 
    c.CategoryName;

