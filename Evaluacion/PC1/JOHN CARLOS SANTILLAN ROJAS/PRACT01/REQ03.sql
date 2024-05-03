
--indicra que base de datos se usara
USE Northwind;
WITH UnidadesVendidasCliente AS (
    SELECT
        c.CustomerID,
        c.CompanyName AS NombreCliente,
        od.ProductID,
        p.ProductName AS NombreProducto,
        COUNT(DISTINCT o.OrderID) AS CantidadPedidos,
        SUM(od.Quantity) AS UnidadesVendidas,
        RANK() OVER(PARTITION BY c.CustomerID ORDER BY SUM(od.Quantity) DESC) AS Ranking
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
    NombreCliente,
    NombreProducto,
    CantidadPedidos,
    UnidadesVendidas
FROM
    UnidadesVendidasCliente
WHERE
    Ranking = 1
ORDER BY
    NombreCliente;
