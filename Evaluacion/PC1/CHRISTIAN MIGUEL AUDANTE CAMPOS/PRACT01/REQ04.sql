/*
** Pregunta 4
*/

SELECT 
    empleado.id_empleado,
    Nombre AS Nombre_Empleado,
    COUNT(ProductID) AS Cantidad_Pedidos,
    SUM(UnitPrice.cantidad) AS Cantidad_Productos,
    SUM(UnitPrice.cantidad * UnitPrice) AS Importe_Total
FROM 
    empleado
JOIN 
    ProductID ON empleado.id_empleado = pedido.id_empleado
JOIN 
    ProductID ON pedido.id_pedido = detalle_pedido.id_pedido
GROUP BY 
    empleado.id_empleado,
    empleado.nombre;

