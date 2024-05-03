
WITH ClienteProducto AS (
    SELECT 
        C.CustomerID,
        C.CompanyName AS [Nombre del cliente],
        P.ProductName AS [Nombre Producto],
        COUNT(O.OrderID) AS [Cantidad Pedidos],
        SUM(OD.Quantity) AS [Unidades vendidas],
        ROW_NUMBER() OVER (PARTITION BY C.CustomerID ORDER BY SUM(OD.Quantity) DESC) AS RowNumber
    FROM 
        Customers C
    JOIN 
        Orders O ON C.CustomerID = O.CustomerID
    JOIN 
        [Order Details] OD ON O.OrderID = OD.OrderID
    JOIN 
        Products P ON OD.ProductID = P.ProductID
    GROUP BY 
        C.CustomerID, C.CompanyName, P.ProductName
)
SELECT 
    [Nombre del cliente],
    [Nombre Producto],
    [Cantidad Pedidos],
    [Unidades vendidas]
FROM 
    ClienteProducto
WHERE 
    RowNumber = 1;
