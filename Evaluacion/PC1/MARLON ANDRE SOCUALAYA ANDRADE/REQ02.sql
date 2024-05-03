use Northwind

SELECT 
    e.FirstName + ' ' + e.LastName AS NOMBRE_EMPLEADO,
    CASE 
        WHEN MONTH(o.OrderDate) <= 6 THEN 1
        ELSE 2
    END AS SEMESTRE,
    COUNT(DISTINCT o.OrderID) AS NUMERO_DE_VENTAS,
    SUM(od.Quantity) AS CANTIDAD_VENDIDA,
    SUM(od.UnitPrice * od.Quantity) AS IMPORTE_DE_VENTAS,
    SUM(od.UnitPrice * od.Quantity * 0.04) AS IMPORTE_DE_COMISION
FROM 
    Employees e
JOIN 
    Orders o ON e.EmployeeID = o.EmployeeID
JOIN 
    [Order Details] od ON o.OrderID = od.OrderID
WHERE 
    YEAR(o.OrderDate) = 1997
GROUP BY 
    e.FirstName,
    e.LastName,
    CASE 
        WHEN MONTH(o.OrderDate) <= 6 THEN 1
        ELSE 2
    END;
