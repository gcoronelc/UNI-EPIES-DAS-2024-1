USE Northwind

WITH VentasPorTrimestre AS (
    SELECT
        YEAR(OrderDate) AS AñoVentas,
        CASE 
            WHEN MONTH(OrderDate) BETWEEN 1 AND 3 THEN 'Primer Trimestre'
            WHEN MONTH(OrderDate) BETWEEN 4 AND 6 THEN 'Segundo Trimestre'
            WHEN MONTH(OrderDate) BETWEEN 7 AND 9 THEN 'Tercer Trimestre'
            ELSE 'Cuarto Trimestre'
        END AS Trimestre,
        COUNT(*) AS NumeroDeVentas,
        SUM(Quantity) AS TotalCantidadVendida,
        SUM(UnitPrice * Quantity) AS ImporteTotalVentas
    FROM
        Orders
    JOIN
        [Order Details] ON Orders.OrderID = [Order Details].OrderID
    GROUP BY
        YEAR(OrderDate),
        CASE 
            WHEN MONTH(OrderDate) BETWEEN 1 AND 3 THEN 'Primer Trimestre'
            WHEN MONTH(OrderDate) BETWEEN 4 AND 6 THEN 'Segundo Trimestre'
            WHEN MONTH(OrderDate) BETWEEN 7 AND 9 THEN 'Tercer Trimestre'
            ELSE 'Cuarto Trimestre'
        END
)
SELECT
    AñoVentas,
    Trimestre,
    NumeroDeVentas,
    TotalCantidadVendida,
    ImporteTotalVentas
FROM
    VentasPorTrimestre
ORDER BY
    AñoVentas,
    Trimestre;

