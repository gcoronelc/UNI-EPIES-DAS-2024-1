Use Northwind; 
--NOMBRE: CARLOS MANUEL SUVIETA MOYEHUARA
--CODIGO: 20212106A
WITH EmployeeOrderSummary AS (
    SELECT 
        CONCAT(E.FirstName, ' ', E.LastName) AS Nombre_Empleado,
        COUNT(O.OrderID) AS Cantidad_de_Pedidos,
        SUM(OD.Quantity) AS Cantidad_de_Productos,
        SUM(OD.UnitPrice * OD.Quantity) AS Importe_de_las_Ventas,
        SUM(OD.UnitPrice * OD.Quantity) / SUM(SUM(OD.UnitPrice * OD.Quantity)) OVER() * 100 AS Porcentaje_del_Total
    FROM 
        Employees E
    LEFT JOIN 
        Orders O ON E.EmployeeID = O.EmployeeID
    LEFT JOIN 
        OrderDetails OD ON O.OrderID = OD.OrderID
    GROUP BY 
        E.EmployeeID, E.FirstName, E.LastName
)
SELECT 
    Nombre_Empleado,
    Cantidad_de_Pedidos,
    Cantidad_de_Productos,
    Importe_de_las_Ventas,
    Porcentaje_del_Total
FROM 
    EmployeeOrderSummary;