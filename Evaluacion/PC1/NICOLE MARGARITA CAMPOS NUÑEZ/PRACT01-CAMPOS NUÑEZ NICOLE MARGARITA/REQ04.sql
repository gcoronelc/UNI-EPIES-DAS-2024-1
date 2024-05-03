WITH PedidosEmpleado AS (
    SELECT 
        E.EmployeeID,
        CONCAT(E.FirstName, ' ', E.LastName) AS [Nombre empleado],
        COUNT(O.OrderID) AS [Cantidad pedidos],
        SUM(OD.Quantity) AS [Cantidad Productos],
        SUM(OD.UnitPrice * OD.Quantity) AS [Importe de las ventas],
        CAST(COUNT(O.OrderID) * 100.0 / (SELECT COUNT(*) FROM Orders) AS DECIMAL(10,2)) AS [Porcentaje del total]
    FROM 
        Employees E
    LEFT JOIN 
        Orders O ON E.EmployeeID = O.EmployeeID
    LEFT JOIN 
        [Order Details] OD ON O.OrderID = OD.OrderID
    GROUP BY 
        E.EmployeeID, E.FirstName, E.LastName
)
SELECT 
    [Nombre empleado],
    [Cantidad pedidos],
    [Cantidad Productos],
    [Importe de las ventas],
    [Porcentaje del total]
FROM 
    PedidosEmpleado
ORDER BY 
    [Nombre empleado];
