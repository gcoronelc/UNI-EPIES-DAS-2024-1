USE Northwind

INSERT INTO Producto_Mas_Solicitado_Por_Cliente (NOMBRE_CLIENTE, NOMBRE_PRODUCTO, CANTIDAD_PEDIDOS, UNIDADES_VENDIDAS)
SELECT 
    c.CompanyName AS NOMBRE_CLIENTE,
    p.ProductName AS NOMBRE_PRODUCTO,
    COUNT(DISTINCT o.OrderID) AS CANTIDAD_PEDIDOS,
    SUM(od.Quantity) AS UNIDADES_VENDIDAS
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    [Order Details] od ON o.OrderID = od.OrderID
JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    c.CompanyName,
    p.ProductName;

WITH ProductosConRanking AS (
    SELECT 
        *,
        DENSE_RANK() OVER (PARTITION BY NOMBRE_CLIENTE ORDER BY UNIDADES_VENDIDAS DESC) AS ranking
    FROM 
        Producto_Mas_Solicitado_Por_Cliente
)

SELECT 
    NOMBRE_CLIENTE,
    NOMBRE_PRODUCTO,
    CANTIDAD_PEDIDOS,
    UNIDADES_VENDIDAS
FROM 
    ProductosConRanking
WHERE 
    ranking = 1;
