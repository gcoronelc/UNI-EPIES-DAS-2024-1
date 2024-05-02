Use Northwind;
--NOMBRE: CARLOS MANUEL SUVIETA MOYEHUARA
--CODIGO: 20212106A
SELECT 
    E.FirstName + ' ' + E.LastName AS NOMBRE_EMPLEADO,
    CASE 
        WHEN MONTH(O.OrderDate) <= 6 THEN '1er Semestre'
        ELSE '2do Semestre'
    END AS SEMESTRE,
    COUNT(O.OrderID) AS NUMERO_DE_VENTAS,
    SUM(OD.Quantity) AS CANTIDAD_VENDIDA,
    SUM(OD.UnitPrice * OD.Quantity) AS IMPORTE_DE_VENTAS,
    SUM(OD.UnitPrice * OD.Quantity * 0.04) AS IMPORTE_DE_COMISION
FROM 
    Orders O
JOIN 
    OrderDetails OD ON O.OrderID = OD.OrderID
JOIN 
    Employees E ON O.EmployeeID = E.EmployeeID
WHERE 
    YEAR(O.OrderDate) = 1997
GROUP BY 
    E.FirstName, E.LastName,
    CASE 
        WHEN MONTH(O.OrderDate) <= 6 THEN '1er Semestre'
        ELSE '2do Semestre'
    END;