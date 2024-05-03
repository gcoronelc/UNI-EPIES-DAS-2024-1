
--INDICAREMOS QUE VAMOS A USAR LA BASE DE DATOS NORTHWIND

USE Northwind;

WITH VentasTrimestrales AS (
    SELECT
        YEAR(OrderDate) AS Año,
        CASE 
            WHEN MONTH(OrderDate) BETWEEN 1 AND 3 THEN 1
            WHEN MONTH(OrderDate) BETWEEN 4 AND 6 THEN 2
			WHEN MONTH(OrderDate) BETWEEN 7 AND 9 THEN 3
            ELSE 4
        END AS Trimestre,
        COUNT(*) AS NumeroVentas,
        SUM(Quantity) AS CantidadVendida,
        SUM(UnitPrice * Quantity) AS ImporteVentas
    FROM
        Orders
    JOIN
        [Order Details] ON Orders.OrderID = [Order Details].OrderID
    GROUP BY
        YEAR(OrderDate),
        CASE 
            WHEN MONTH(OrderDate) BETWEEN 1 AND 3 THEN 1
            WHEN MONTH(OrderDate) BETWEEN 4 AND 6 THEN 2
			WHEN MONTH(OrderDate) BETWEEN 7 AND 9 THEN 3
            ELSE 4
        END
)
SELECT
    Año,
    Trimestre,
    NumeroVentas,
    CantidadVendida,
    ImporteVentas
FROM
    VentasTrimestrales
ORDER BY
    Año,
    Trimestre;
