-- Ejercicio 2
/**
El producto que mas se ha vendido
en cada pais.
BD: Nortwind
**/

-- Paso 1

select 
	ShipCountry, od.ProductID, sum(od.Quantity) quantity 
from Northwind..Orders o
join Northwind..[Order Details] od
on o.OrderID = od.OrderID
group by ShipCountry, od.ProductID;
go


-- Paso 2

with
t1 as (
	select 
		ShipCountry, od.ProductID, sum(od.Quantity) quantity 
	from Northwind..Orders o
	join Northwind..[Order Details] od
	on o.OrderID = od.OrderID
	group by ShipCountry, od.ProductID
)
select t1.ShipCountry, max(quantity) max_quantity 
from t1
group by t1.ShipCountry;
go

-- Paso 3

with
t1 as (
	select 
		ShipCountry, od.ProductID, sum(od.Quantity) quantity 
	from Northwind..Orders o
	join Northwind..[Order Details] od
	on o.OrderID = od.OrderID
	group by ShipCountry, od.ProductID
),
t2 as (
	select t1.ShipCountry, max(quantity) max_quantity 
	from t1
	group by t1.ShipCountry
)
select 
	t1.ShipCountry, t1.ProductID,
	p.ProductName, t1.quantity
from t1 join t2
on t1.ShipCountry = t2.ShipCountry
and t1.quantity = t2.max_quantity
join Northwind..Products p
on t1.ProductID = p.ProductID
order by 1
go



