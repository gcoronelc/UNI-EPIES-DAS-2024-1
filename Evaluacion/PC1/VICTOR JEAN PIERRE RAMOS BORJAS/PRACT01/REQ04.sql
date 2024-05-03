
SELECT 
    E.LastName + ', ' + E.FirstName AS 'Nombre Empleado',
    COUNT(O.OrderID) AS 'Cantidad de Pedidos',
	SUM(OD.Quantity) AS 'Cantidad de Productos',
    SUM(OD.UnitPrice * OD.Quantity) AS 'Importe de Ventas',
    CAST(SUM(OD.UnitPrice * OD.Quantity) * 100.0 / SUM(SUM(OD.UnitPrice * OD.Quantity)) OVER() AS DECIMAL(10,2)) AS 'Porcentaje de Ventas'
FROM 
    Northwind..Orders O
JOIN 
    Northwind..[Order Details] OD ON O.OrderID = OD.OrderID
JOIN 
    Northwind..Employees E ON O.EmployeeID = E.EmployeeID
GROUP BY 
    E.EmployeeID, E.FirstName, E.LastName


