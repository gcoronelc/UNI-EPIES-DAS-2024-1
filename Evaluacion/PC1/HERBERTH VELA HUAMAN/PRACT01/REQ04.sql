USE Northwind

WITH PedidosEmpleado AS (
    SELECT
        e.EmployeeID AS IDEmpleado,
        CONCAT(e.FirstName, ' ', e.LastName) AS Nombre,
        COUNT(DISTINCT o.OrderID) AS TotalPedidos,
        SUM(od.Quantity) AS TotalProductos,
        SUM(od.UnitPrice * od.Quantity) AS TotalVentas,
        SUM(od.UnitPrice * od.Quantity) / SUM(SUM(od.UnitPrice * od.Quantity)) OVER() * 100 AS PorcentajeDelTotal
    FROM
        Employees e
    JOIN
        Orders o ON e.EmployeeID = o.EmployeeID
    JOIN
        [Order Details] od ON o.OrderID = od.OrderID
    GROUP BY
        e.EmployeeID,
        CONCAT(e.FirstName, ' ', e.LastName)
)
SELECT
    Nombre AS Empleado,
    TotalPedidos AS TotalDePedidos,
    TotalProductos AS TotalDeProductos,
    TotalVentas AS ImporteDeVentasTotales,
    PorcentajeDelTotal AS PorcentajeTotal
FROM
    PedidosEmpleado
ORDER BY
    Empleado;
