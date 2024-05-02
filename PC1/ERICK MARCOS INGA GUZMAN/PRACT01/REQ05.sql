
-- REQUERIMIENTO 5

-- Se necesita una consulta que reporte el importe de las ventas por trimestre de cada categoria,
-- solo considerar el año 1997.

USE Northwind

WITH Ventas_por_Trimestre AS (SELECT
        YEAR(OrderDate) AS Anio,
        DATEPART(QUARTER, OrderDate) AS Trimestre,
        c.CategoryName AS Nombre_Categoria,
        SUM(od.UnitPrice * od.Quantity) AS Importe_Ventas

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
        c.CategoryName)


SELECT
    Nombre_Categoria,
    SUM(CASE WHEN Trimestre = 1 THEN Importe_Ventas ELSE 0 END) AS Trimestre_1,
    SUM(CASE WHEN Trimestre = 2 THEN Importe_Ventas ELSE 0 END) AS Trimestre_2,
    SUM(CASE WHEN Trimestre = 3 THEN Importe_Ventas ELSE 0 END) AS Trimestre_3,
    SUM(CASE WHEN Trimestre = 4 THEN Importe_Ventas ELSE 0 END) AS Trimestre_4,
    SUM(Importe_Ventas) AS Importe_Total
FROM
    Ventas_por_Trimestre
GROUP BY
    Nombre_Categoria;