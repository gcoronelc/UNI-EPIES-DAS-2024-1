SELECT 
    CategoryName AS 'Nombre Categoria',
    SUM(CASE WHEN DATEPART(QUARTER, OrderDate) = 1 THEN OD.UnitPrice * OD.Quantity ELSE 0 END) AS 'Trimestre 1',
    SUM(CASE WHEN DATEPART(QUARTER, OrderDate) = 2 THEN OD.UnitPrice * OD.Quantity ELSE 0 END) AS 'Trimestre 2',
    SUM(CASE WHEN DATEPART(QUARTER, OrderDate) = 3 THEN OD.UnitPrice * OD.Quantity ELSE 0 END) AS 'Trimestre 3',
    SUM(CASE WHEN DATEPART(QUARTER, OrderDate) = 4 THEN OD.UnitPrice * OD.Quantity ELSE 0 END) AS 'Trimestre 4',
    SUM(OD.UnitPrice * OD.Quantity) AS 'Importe Total'
FROM 
    Northwind..Orders O
JOIN 
    Northwind..[Order Details] OD ON O.OrderID = OD.OrderID
JOIN 
    Northwind..Products P ON OD.ProductID = P.ProductID
JOIN 
    Northwind..Categories C ON P.CategoryID = C.CategoryID
WHERE 
    YEAR(O.OrderDate) = 1997
GROUP BY 
    CategoryName
ORDER BY 
    CategoryName;
