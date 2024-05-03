
--REQUERIMENTO 1
/*
SE NECESITA SABER LAS VENTAS TOTALES POR TRIMESTRE, EN CADA A�O
*/
USE Northwind;
SELECT
  YEAR(o.OrderDate) AS A�O,
  DATEPART(QUARTER, o.OrderDate) AS TRIMESTRE,
  COUNT(o.OrderID) AS [NUMERO DE VENTAS],
  SUM(od.Quantity) AS [CANTIDAD VENDIDA],
  SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS [IMPORTE DE VENTAS]
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY
  YEAR(o.OrderDate),
  DATEPART(QUARTER, o.OrderDate)
ORDER BY
  A�O,
  TRIMESTRE;

GO