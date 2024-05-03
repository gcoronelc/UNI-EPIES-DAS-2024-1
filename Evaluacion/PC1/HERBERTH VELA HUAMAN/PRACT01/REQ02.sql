USE Northwind

WITH VentasEmpleado AS (
    SELECT
        E.EmployeeID AS IDEmpleado,
        CONCAT(E.FirstName, ' ', E.LastName) AS Nombre,
        CASE WHEN MONTH(O.OrderDate) <= 6 THEN 'Primer Semestre' ELSE 'Segundo Semestre' END AS Periodo,
        COUNT(*) AS TotalVentas,
        SUM(OD.Quantity) AS TotalCantidadVendida,
        SUM(OD.UnitPrice * OD.Quantity) AS TotalImporteVentas,
        SUM(OD.UnitPrice * OD.Quantity * 0.04) AS TotalComisiones
    FROM
        Employees AS E
    JOIN
        Orders AS O ON E.EmployeeID = O.EmployeeID
    JOIN
        [Order Details] AS OD ON O.OrderID = OD.OrderID
    WHERE
        YEAR(O.OrderDate) = 1997
    GROUP BY
        E.EmployeeID,
        E.FirstName,
        E.LastName,
		CASE WHEN MONTH(O.OrderDate) <= 6 THEN 'Primer Semestre' ELSE 'Segundo Semestre' END
)
SELECT
    Nombre AS Empleado,
    Periodo,
    TotalVentas AS VentasTotales,
    TotalCantidadVendida AS CantidadVendidaTotal,
    TotalImporteVentas AS ImporteTotalVentas,
    TotalComisiones AS ComisionesTotales
FROM
    VentasEmpleado
ORDER BY
    Empleado,
    Periodo;

