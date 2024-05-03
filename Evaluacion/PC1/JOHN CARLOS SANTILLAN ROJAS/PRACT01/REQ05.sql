--SE INDICA QUE BASE DE DATOS SE USARA
USE Northwind;

WITH VentasPorTrimestre AS (
    SELECT
        YEAR(OrderDate) AS Anio,
        DATEPART(QUARTER, OrderDate) AS Trimestre,
        c.CategoryName AS NombreCategoria,
        SUM(od.UnitPrice * od.Quantity) AS ImporteVentas
    FROM
        Orders o
    JOIN
        [Order Details] od ON o.OrderID = od.OrderID
    JOIN
        Products p ON od.ProductID = p.ProductID
    JOIN
        Categories c ON p.CategoryID = c.CategoryID
    WHERE
        YEAR(OrderDate) = 1997
    GROUP BY
        YEAR(OrderDate),
        DATEPART(QUARTER, OrderDate),
        c.CategoryName
)
SELECT
    NombreCategoria,
    SUM(CASE WHEN Trimestre = 1 THEN ImporteVentas ELSE 0 END) AS Trimestre1,
    SUM(CASE WHEN Trimestre = 2 THEN ImporteVentas ELSE 0 END) AS Trimestre2,
    SUM(CASE WHEN Trimestre = 3 THEN ImporteVentas ELSE 0 END) AS Trimestre3,
    SUM(CASE WHEN Trimestre = 4 THEN ImporteVentas ELSE 0 END) AS Trimestre4,
    SUM(ImporteVentas) AS ImporteTotal
FROM
    VentasPorTrimestre
GROUP BY
    NombreCategoria;
