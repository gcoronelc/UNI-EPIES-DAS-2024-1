select (E.firstname+E.lastname) [Nombre empleado], count(1) [Cantidad de pedidos], sum(od.quantity) [Cantidad de productos], sum(OD.UnitPrice * OD.Quantity) [Importe de las ventas]
, sum(OD.UnitPrice * OD.Quantity) / (select sum(OD.UnitPrice * OD.Quantity) from [Order Details] OD) * 100 [Porcentaje del total] from orders O
join [order details] OD on OD.orderid = O.orderid
join employees E on E.employeeid = O.employeeid
group by (E.firstname+E.lastname)