SELECT 
    E.LastName + ', ' + E.FirstName AS 'Nombre Empleado',
    CASE WHEN MONTH(O.OrderDate) <= 6 THEN '1' ELSE '2' END AS 'Semestre',
    COUNT(O.OrderID) AS 'Numero de Ventas',
    SUM(OD.Quantity) AS 'Cantidad Vendida',
    SUM(OD.UnitPrice * OD.Quantity) AS 'Importe de Ventas',
    SUM(OD.UnitPrice * OD.Quantity * 0.04) AS 'Importe de Comision'
FROM 
    Northwind..Orders O
JOIN 
    Northwind..[Order Details] OD ON O.OrderID = OD.OrderID
JOIN 
    Northwind..Employees E ON O.EmployeeID = E.EmployeeID
WHERE 
    YEAR(O.OrderDate) = 1997
GROUP BY 
    E.EmployeeID, E.FirstName, E.LastName, 
    CASE WHEN MONTH(O.OrderDate) <= 6 THEN '1' ELSE '2' END
ORDER BY 
    'Nombre Empleado', 'Semestre';
