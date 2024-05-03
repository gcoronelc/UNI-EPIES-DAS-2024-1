Use Northwind; 
--NOMBRE: CARLOS MANUEL SUVIETA MOYEHUARA
--CODIGO: 20212106A
SELECT 
    C.CategoryName AS NOMBRE_CATEGORIA,
    SUM(CASE WHEN DATEPART(QUARTER, O.OrderDate) = 1 THEN OD.UnitPrice * OD.Quantity ELSE 0 END) AS TRIMESTRE_1,
    SUM(CASE WHEN DATEPART(QUARTER, O.OrderDate) = 2 THEN OD.UnitPrice * OD.Quantity ELSE 0 END) AS TRIMESTRE_2,
    SUM(CASE WHEN DATEPART(QUARTER, O.OrderDate) = 3 THEN OD.UnitPrice * OD.Quantity ELSE 0 END) AS TRIMESTRE_3,
    SUM(CASE WHEN DATEPART(QUARTER, O.OrderDate) = 4 THEN OD.UnitPrice * OD.Quantity ELSE 0 END) AS TRIMESTRE_4,
    SUM(OD.UnitPrice * OD.Quantity) AS IMPORTE_TOTAL
FROM 
    Orders O
JOIN 
    OrderDetails OD ON O.OrderID = OD.OrderID
JOIN 
    Products P ON OD.ProductID = P.ProductID
JOIN 
    Categories C ON P.CategoryID = C.CategoryID
WHERE 
    YEAR(O.OrderDate) = 1997
GROUP BY 
    C.CategoryName;