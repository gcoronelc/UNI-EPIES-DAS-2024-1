WITH ProductosMasSolicitados AS (
    SELECT 
        C.CustomerID AS CustomerID,
        P.ProductName AS ProductoMasSolicitado,
        COUNT(O.OrderID) AS CantidadPedidos,
        SUM(OD.Quantity) AS UnidadesVendidas,
        ROW_NUMBER() OVER(PARTITION BY C.CustomerID ORDER BY COUNT(O.OrderID) DESC) AS Ranking
    FROM 
        Northwind..Orders O
    JOIN 
        Northwind..[Order Details] OD ON O.OrderID = OD.OrderID
    JOIN 
        Northwind..Customers C ON O.CustomerID = C.CustomerID
    JOIN 
        Northwind..Products P ON OD.ProductID = P.ProductID
    GROUP BY 
        C.CustomerID, P.ProductName
    )
SELECT 
    C.ContactName AS 'Nombre Cliente',
    PMS.ProductoMasSolicitado AS 'Nombre Producto',
    PMS.CantidadPedidos AS 'Cantidad Pedidos',
    PMS.UnidadesVendidas AS 'Unidades Vendidas'
FROM 
    ProductosMasSolicitados PMS
JOIN 
    Northwind..Customers C ON PMS.CustomerID = C.CustomerID
WHERE 
    PMS.Ranking = 1
ORDER BY 
    'Unidades Vendidas' DESC;
