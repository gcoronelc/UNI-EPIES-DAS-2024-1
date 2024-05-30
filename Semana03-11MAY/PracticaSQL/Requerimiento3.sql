/*
Se necesita saber el importe de las ventas 
de cada producto y que porcentaje representa 
del total de las ventas.
Base de datos: Northwind
*/

use Northwind;
go

-- Paso 1

select * 
from Northwind..[Order Details] od
join Northwind..Products p
on od.ProductID = p.ProductID;
GO

-- Paso 2

select 
	p.ProductName,
	sum(od.Quantity*od.UnitPrice) Importe
from Northwind..[Order Details] od
join Northwind..Products p
on od.ProductID = p.ProductID
group by p.ProductName;
GO


-- Paso 3
-- Aplicando CTE

WITH 
V1 AS (
	select 
		p.ProductName,
		sum(od.Quantity*od.UnitPrice) Importe
	from Northwind..[Order Details] od
	join Northwind..Products p
	on od.ProductID = p.ProductID
	group by p.ProductName
)
SELECT SUM(Importe) TOTAL FROM V1;
GO

-- Paso 4
-- Consulta Final

WITH 
V1 AS (
	select 
		p.ProductName,
		sum(od.Quantity*od.UnitPrice) Importe
	from Northwind..[Order Details] od
	join Northwind..Products p
	on od.ProductID = p.ProductID
	group by p.ProductName
),
V2 AS (SELECT SUM(Importe) TOTAL FROM V1)
SELECT 
	V1.ProductName,
	V1.Importe,
	CAST(V1.Importe*100.0/V2.TOTAL AS NUMERIC(10,5)) PORCENTAJE
FROM V1 CROSS JOIN V2
ORDER BY 1;
GO


