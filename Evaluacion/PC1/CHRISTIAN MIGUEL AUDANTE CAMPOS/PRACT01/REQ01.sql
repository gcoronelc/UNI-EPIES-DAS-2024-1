/*
** Pregunta 1
*/

SELECT 
    YEAR(Products.ProductID) AS Año,
    DATEPART(QUARTER, Products.ProductID) AS Trimestre,
    SUM(Quantity * UnitPrice) AS Ventas_Totales
FROM 
    Products.ProductID
JOIN 
    detalle_venta ON venta.id_venta = detalle_venta.id_venta
GROUP BY 
    YEAR(Products.ProductID),
    DATEPART(QUARTER, Products.ProductID)
ORDER BY 
    Año, 
    Trimestre;