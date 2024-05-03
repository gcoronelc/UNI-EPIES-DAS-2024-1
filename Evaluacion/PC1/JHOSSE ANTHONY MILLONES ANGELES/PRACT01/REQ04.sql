--REQUERIMENTO 4
/*
SE NECESITA SABER LA CANTIDAD DE PEDIDOS QUE HA ATENDIDO CADA EMPLEADO, QUE INCLUYA LA
CANTIDAD DE ARTICULOS, EL IMPORTE RESPECTIVO Y EL PORCENTAJE QUE REPRESENTA DEL TOTAL DE PEDIDOS.
*/
USE Northwind;

WITH TotalOrders AS (
    SELECT 
        COUNT(*) AS Total
    FROM 
        Orders
), EmployeeOrders AS (
    SELECT 
        e.FirstName + ' ' + e.LastName AS [NOMBRE EMPLEADO], 
        COUNT(o.OrderID) AS [CANTIDAD PEDIDOS],
        SUM(od.UnitPrice * od.Quantity) AS [IMPORTE DE LAS VENTAS]
    FROM 
        Employees e
    JOIN 
        Orders o ON e.EmployeeID = o.EmployeeID
    JOIN 
        [Order Details] od ON o.OrderID = od.OrderID
    GROUP BY 
        e.FirstName, 
        e.LastName
)
SELECT 
    [NOMBRE EMPLEADO], 
    [CANTIDAD PEDIDOS], 
    [IMPORTE DE LAS VENTAS], 
    CAST([CANTIDAD PEDIDOS] AS FLOAT) / (SELECT Total FROM TotalOrders) * 100 AS [PORCENTAJE DEL TOTAL]
FROM 
    EmployeeOrders;
