SELECT 
    YEAR(o.OrderDate) AS Año,
    DATEPART(quarter, o.OrderDate) AS Trimestre,
    COUNT(o.OrderID) AS [Numero de ventas],
    SUM(od.Quantity) AS [Cantidad vendida],
    SUM(od.Quantity * od.UnitPrice) AS [Importe de las ventas]
FROM 
    Orders o
JOIN 
    [Order Details] od ON o.OrderID = od.OrderID
GROUP BY 
    YEAR(o.OrderDate), DATEPART(quarter, o.OrderDate)
ORDER BY 
    Año, Trimestre;
