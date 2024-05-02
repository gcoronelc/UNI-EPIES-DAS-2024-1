
-- REQUERIMIENTO 2

-- Cada empleado recibe 4% de comision de cada venta que realiza. Se necesita una consulta que permita obtener
-- la comision que se le debe pagar a cada empleado por todas sus ventas en cada semestre del año 1997.

USE Northwind

WITH VentasEmpleado AS (SELECT
        E.EmployeeID,
        E.FirstName + ' ' + E.LastName AS NombreEmpleado,
        CASE WHEN DATEPART(MONTH, O.OrderDate) <= 6 THEN 1 ELSE 2 END AS Semestre,
        COUNT(*) AS NumeroVentas,
        SUM(OD.Quantity) AS CantidadVendida,
        SUM(OD.UnitPrice * OD.Quantity) AS ImporteVentas,
        SUM(OD.UnitPrice * OD.Quantity * 0.04) AS ImporteComision
    FROM
        Employees E
    JOIN
        Orders O ON E.EmployeeID = O.EmployeeID
    JOIN
        [Order Details] OD ON O.OrderID = OD.OrderID
    WHERE
        YEAR(O.OrderDate) = 1997
    GROUP BY
        E.EmployeeID,
        E.FirstName,
        E.LastName,
        CASE WHEN DATEPART(MONTH, O.OrderDate) <= 6 THEN 1 ELSE 2 END)

SELECT
    NombreEmpleado,
    Semestre,
    NumeroVentas,
    CantidadVendida,
    ImporteVentas,
    ImporteComision
FROM
    VentasEmpleado
ORDER BY
    NombreEmpleado,
    Semestre;


