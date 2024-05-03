select (E.firstname+E.lastname) [Nombre empleado], 
CASE WHEN MONTH(o.orderdate) < 7 THEN 1 ELSE 2 END Semestre
, sum(OD.quantity) [Cantidad vendida], sum(OD.UnitPrice * OD.Quantity) [Importe de ventas], sum(OD.UnitPrice * OD.Quantity)*.04*count(1) Comision from orders O
join [order details] OD on OD.orderid = O.orderid
join employees E on E.employeeid = O.employeeid
where year(o.orderdate) = 1997
group by (E.firstname+E.lastname), (CASE WHEN MONTH(o.orderdate) < 7 THEN 1 ELSE 2 END)