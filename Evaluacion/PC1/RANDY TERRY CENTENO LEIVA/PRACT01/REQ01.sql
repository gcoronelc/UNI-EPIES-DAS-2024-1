alter table Orders
add Trimestre int

update Orders 
set Trimestre = CASE WHEN MONTH(OrderDate) <= 3 THEN 1 WHEN MONTH(OrderDate) <= 6 THEN 2 WHEN MONTH(OrderDate) <= 9 THEN 3 ELSE 4 END

select year(O.OrderDate) Año, O.Trimestre, count(1) [Numero de ventas], sum(OD.Quantity) [Cantidad vendida], sum(OD.UnitPrice * OD.Quantity) [Importe de ventas] from Orders O
inner join [order details] OD on O.orderid = OD.orderid
group by Trimestre, year(O.orderdate)