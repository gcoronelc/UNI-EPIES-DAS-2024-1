--REQUERIMENTO 2
USE Northwind;
/*
CADA EMPLEADO RECIBE 4% DE COMISION DE CADA VENTA QUE REALIZA. SE NECESITA UNA CONSULTA QUE PERMITA OBTENER LA COMISION QUE SE LE DEBE PAGAR
A CADA EMPLEADO POR TODAS SUS VENTAS EN CADA SEMESTRE DEL AÑO 1997
*/
WITH VentasPorEmpleado AS (
    SELECT
        e.EmployeeID,
        e.FirstName + ' ' + e.LastName AS [NOMBRE EMPLEADO],
        CASE 
            WHEN MONTH(o.OrderDate) <= 6 THEN 'Primer Semestre'
            ELSE 'Segundo Semestre'
        END AS SEMESTRE,
        COUNT(o.OrderID) AS [NUMERO DE VENTAS],
        SUM(od.Quantity) AS [CANTIDAD VENDIDA],
        SUM(od.UnitPrice * od.Quantity) AS [IMPORTE DE VENTAS]
    FROM
        Northwind..Employees e
        INNER JOIN Northwind..Orders o ON e.EmployeeID = o.EmployeeID
        INNER JOIN Northwind..[Order Details] od ON o.OrderID = od.OrderID
    WHERE
        YEAR(o.OrderDate) = 1997
    GROUP BY
        e.EmployeeID,
        e.FirstName,
        e.LastName,
        CASE 
            WHEN MONTH(o.OrderDate) <= 6 THEN 'Primer Semestre'
            ELSE 'Segundo Semestre'
        END
)
SELECT
    [NOMBRE EMPLEADO],
    SEMESTRE,
    [NUMERO DE VENTAS],
    [CANTIDAD VENDIDA],
    [IMPORTE DE VENTAS],
    [IMPORTE DE VENTAS] * 0.04 AS [IMPORTE DE COMISION]
FROM
    VentasPorEmpleado
ORDER BY
    [NOMBRE EMPLEADO],
    SEMESTRE;
GO
