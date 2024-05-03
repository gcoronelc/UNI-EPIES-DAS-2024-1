Use Northwind;
--NOMBRE: CARLOS MANUEL SUVIETA MOYEHUARA
--CODIGO: 20212106A
WITH CustomerProductRank AS (
    SELECT 
        c.CompanyName AS Nombre_Cliente,
        p.ProductName AS Nombre_Producto,
        COUNT(o.OrderID) AS Cantidad_de_Pedidos,
        SUM(od.Quantity) AS Unidades_Vendidas,
        RANK() OVER(PARTITION BY c.CustomerID ORDER BY SUM(od.Quantity) DESC) AS Ranking_Producto
    FROM 
        Customers c
    INNER JOIN 
        Orders o ON c.CustomerID = o.CustomerID
    INNER JOIN 
        OrderDetails od ON o.OrderID = od.OrderID
    INNER JOIN 
        Products p ON od.ProductID = p.ProductID
    GROUP BY 
        c.CustomerID, c.CompanyName, p.ProductID, p.ProductName
)
SELECT 
    Nombre_Cliente,
    Nombre_Producto,
    Cantidad_de_Pedidos,
    Unidades_Vendidas
FROM 
    CustomerProductRank
WHERE 
    Ranking_Producto = 1;