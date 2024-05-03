
-- REQUERIMIENTO 1

-- Se necesita saber las ventas por trimestre, en cada año

USE Northwind
WITH VentasTrimestrales AS (
    SELECT
        YEAR(OrderDate) AS Año,
        DATEPART(QUARTER, OrderDate) AS Trimestre,
        COUNT(*) AS NumeroVentas,
        SUM(Quantity) AS CantidadVendida,
        SUM(UnitPrice * Quantity) AS ImporteVentas
    FROM
        Orders
    JOIN
        [Order Details] ON Orders.OrderID = [Order Details].OrderID
    GROUP BY
        YEAR(OrderDate),
        DATEPART(QUARTER, OrderDate)
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
