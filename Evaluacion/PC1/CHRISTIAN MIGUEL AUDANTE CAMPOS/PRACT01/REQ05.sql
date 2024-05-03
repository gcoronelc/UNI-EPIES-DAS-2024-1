/*
** Pregunta 5
*/

importe_total

SELECT 
    YEAR(OrderID) AS Año,
    DATEPART(QUARTER, OrderID) AS Trimestre,
    UnitPrice AS Categoría,
    SUM(ProductID * UnitPrice) AS Importe_Ventas
FROM 
    CategoryID
JOIN 
    ProductID ON venta.id_venta = detalle_venta.id_venta
JOIN 
    producto ON ProductID = [Product Sales for 1997]
GROUP BY 
    YEAR(ProductID),
    DATEPART(QUARTER, ProductID),
    producto.categoria;


	ORDER BY 
    Año, 
    Trimestre_1,
	Trimestre_2,
	Trimestre_3,
	Trimestre_4,
    Categoría;

