--USAR BASE DE DATOS
USE Northwind;

WITH VentasEmpleado AS (
    SELECT
        E.EmployeeID,
        E.FirstName + ' ' + E.LastName AS NombreEmpleado,
        CASE WHEN MONTH(O.OrderDate) <= 6 THEN 1 ELSE 2 END AS Semestre,
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
        CASE WHEN MONTH(O.OrderDate) <= 6 THEN 1 ELSE 2 END
)
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
