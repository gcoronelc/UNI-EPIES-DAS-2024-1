SELECT 
    YEAR(O.OrderDate) AS 'Año',
    DATEPART(QUARTER, O.OrderDate) AS 'Trimestre',
    COUNT(O.OrderID) AS 'Numero de Ventas',
    SUM(OD.Quantity) AS 'Cantidad Vendida',
    SUM(OD.UnitPrice * OD.Quantity) AS 'Importe de las Ventas'
FROM 
    Northwind..Orders O
JOIN 
    Northwind..[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY 
    YEAR(O.OrderDate), DATEPART(QUARTER, O.OrderDate)
ORDER BY 
    'Año', 'Trimestre' ASC;
