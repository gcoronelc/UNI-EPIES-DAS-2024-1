Use Northwind;
--NOMBRE: CARLOS MANUEL SUVIETA MOYEHUARA
--CODIGO: 20212106A
SELECT 
    YEAR(Orders.OrderDate) AS AÑO,
    DATEPART(QUARTER, Orders.OrderDate) AS TRIMESTRE,
    COUNT(Orders.OrderID) AS NUMERO_DE_VENTAS,
    SUM(OrderDetails.Quantity) AS CANTIDAD_VENDIDA,
    SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) AS IMPORTE_DE_LAS_VENTAS
FROM 
    Orders
JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY 
    YEAR(Orders.OrderDate),
    DATEPART(QUARTER, Orders.OrderDate)
ORDER BY 
    AÑO, TRIMESTRE;