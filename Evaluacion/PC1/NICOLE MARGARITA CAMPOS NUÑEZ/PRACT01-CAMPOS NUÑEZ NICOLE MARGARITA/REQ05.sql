SELECT 
    C.CategoryName AS [Nombre de LA CATEGORIA],
    SUM(CASE WHEN DATEPART(quarter, O.OrderDate) = 1 THEN OD.UnitPrice * OD.Quantity ELSE 0 END) AS [trimestre 1],
    SUM(CASE WHEN DATEPART(quarter, O.OrderDate) = 2 THEN OD.UnitPrice * OD.Quantity ELSE 0 END) AS [trimestre 2],
    SUM(CASE WHEN DATEPART(quarter, O.OrderDate) = 3 THEN OD.UnitPrice * OD.Quantity ELSE 0 END) AS [trimestre 3],
    SUM(CASE WHEN DATEPART(quarter, O.OrderDate) = 4 THEN OD.UnitPrice * OD.Quantity ELSE 0 END) AS [trimestre 4],
    SUM(OD.UnitPrice * OD.Quantity) AS [Importe Total]
FROM 
    Orders O
INNER JOIN 
    [Order Details] OD ON O.OrderID = OD.OrderID
INNER JOIN 
    Products P ON OD.ProductID = P.ProductID
INNER JOIN 
    Categories C ON P.CategoryID = C.CategoryID
WHERE 
    YEAR(O.OrderDate) = 1997
GROUP BY 
    C.CategoryName
ORDER BY 
    C.CategoryName;
