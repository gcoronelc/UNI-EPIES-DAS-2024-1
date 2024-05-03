SELECT 
    CONCAT(E.FirstName, ' ', E.LastName) AS [Nombre de empleado],
    CASE
        WHEN MONTH(O.OrderDate) BETWEEN 1 AND 6 THEN 'Primer Semestre'
        ELSE 'Segundo Semestre'
    END AS [Semestre],
    COUNT(DISTINCT O.OrderID) AS [Numero de ventas],
    SUM(OD.Quantity) AS [Cantidad vendida],
    SUM(OD.UnitPrice * OD.Quantity) AS [Importe de ventas],
    SUM(OD.UnitPrice * OD.Quantity * 0.04) AS [Importe de comision]
FROM 
    Orders O
INNER JOIN 
    [Order Details] OD ON O.OrderID = OD.OrderID
INNER JOIN 
    Employees E ON O.EmployeeID = E.EmployeeID
WHERE 
    YEAR(O.OrderDate) = 1997
GROUP BY 
    CONCAT(E.FirstName, ' ', E.LastName),
    CASE
        WHEN MONTH(O.OrderDate) BETWEEN 1 AND 6 THEN 'Primer Semestre'
        ELSE 'Segundo Semestre'
    END
ORDER BY 
    [Nombre de EMPLEADO],
    [SEMESTRE];
