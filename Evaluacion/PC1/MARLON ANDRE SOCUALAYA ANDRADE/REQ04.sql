USE Northwind
SELECT 
    CONCAT(e.FirstName, ' ', e.LastName) AS NOMBRE_EMPLEADO,
    COUNT(o.OrderID) AS CANTIDAD_PEDIDOS,
    SUM(od.Quantity) AS CANTIDAD_PRODUCTOS,
    SUM(od.Quantity * od.UnitPrice) AS IMPORTE_DE_VENTAS,
    CAST(COUNT(o.OrderID) * 100.0 / (SELECT COUNT(*) FROM Orders) AS DECIMAL(5,2)) AS PORCENTAJE_DEL_TOTAL
FROM 
    Employees e
LEFT JOIN 
    Orders o ON e.EmployeeID = o.EmployeeID
LEFT JOIN 
    [Order Details] od ON o.OrderID = od.OrderID
GROUP BY 
    e.FirstName, e.LastName;
