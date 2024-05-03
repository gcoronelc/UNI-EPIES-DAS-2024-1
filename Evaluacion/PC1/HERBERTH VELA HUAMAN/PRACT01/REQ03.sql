USE Northwind

WITH UnidadesVendidasCliente AS (
    SELECT
        c.CustomerID AS IDCliente,
        c.CompanyName AS Nombre,
        od.ProductID,
        p.ProductName AS Producto,
        COUNT(DISTINCT o.OrderID) AS TotalPedidos,
        SUM(od.Quantity) AS TotalUnidadesVendidas,
        RANK() OVER(PARTITION BY c.CustomerID ORDER BY SUM(od.Quantity) DESC) AS Clasificacion
    FROM
        Customers c
    JOIN
        Orders o ON c.CustomerID = o.CustomerID
    JOIN
        [Order Details] od ON o.OrderID = od.OrderID
    JOIN
        Products p ON od.ProductID = p.ProductID
    GROUP BY
        c.CustomerID,
        c.CompanyName,
        od.ProductID,
        p.ProductName
)
SELECT
    Nombre AS Cliente,
    Producto,
    TotalPedidos AS PedidosTotales,
    TotalUnidadesVendidas AS UnidadesVendidasTotales
FROM
    UnidadesVendidasCliente
WHERE
    Clasificacion = 1
ORDER BY
    Cliente;


