
--INDICAMOS QUE BASE DE DATOS USAREMOS 
USE Northwind;

WITH PedidosEmpleado AS (
    SELECT
        e.EmployeeID,
        CONCAT(e.FirstName, ' ', e.LastName) AS NombreEmpleado,
        COUNT(DISTINCT o.OrderID) AS CantidadPedidos,
        SUM(od.Quantity) AS CantidadProductos,
        SUM(od.UnitPrice * od.Quantity) AS ImporteVentas,
        SUM(od.UnitPrice * od.Quantity) / SUM(SUM(od.UnitPrice * od.Quantity)) OVER() * 100 AS PorcentajeTotalPedidos
    FROM
        Employees e
    JOIN
        Orders o ON e.EmployeeID = o.EmployeeID
    JOIN
        [Order Details] od ON o.OrderID = od.OrderID
    GROUP BY
        e.EmployeeID,
        e.FirstName,
        e.LastName
)
SELECT
    NombreEmpleado,
    CantidadPedidos,
    CantidadProductos,
    ImporteVentas,
    PorcentajeTotalPedidos
FROM
    PedidosEmpleado
ORDER BY
    NombreEmpleado;
