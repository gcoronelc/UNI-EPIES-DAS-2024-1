-- Ejemplo 03
/*
Cada empleado recibe 3% de comisión de cada venta. 
Se necesita una consulta que permita obtener la 
comisión que se le debe pagar a cada empleado por 
todas sus ventas.
Base de datos: Northwind
- NOMBRE EMPLEADO 
- CANTIDAD DE VENTAS 
- IMPORTE DE VENTAS 
- IMPORTE COMISION
*/

-- Paso 1

select 
	EmployeeID,
	count(o.OrderID) ventas,
	sum(od.UnitPrice*od.Quantity) importe
from Northwind..Orders o
join Northwind..[Order Details] od
on o.OrderID = od.OrderID
group by EmployeeID;
go

-- Paso 2

with 
t1 as (
	select 
		EmployeeID,
		count(o.OrderID) ventas,
		sum(od.UnitPrice*od.Quantity) importe
	from Northwind..Orders o
	join Northwind..[Order Details] od
	on o.OrderID = od.OrderID
	group by EmployeeID
)
select 
	concat(e.FirstName,', ',e.LastName) Empleado,
	t1.ventas, t1.importe,
	t1.importe*0.03 Comision
from t1 join Northwind..Employees e
on t1.EmployeeID = e.EmployeeID;
go











