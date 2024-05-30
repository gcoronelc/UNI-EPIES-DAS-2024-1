-- SUBCONSULTA ESCALAR
-- Retorna un solo valor.

-- Ejercicio 1
/**
Hacer una consulta que muestre los empleados
que su sueldo es mayor al sueldo promedio.
BD: 
**/

-- Paso 1
-- El sueldo promedio es un valor unico.

select avg(sueldo) sueldo_prom 
from rh..empleado; 
go

-- Paso 2
select 
	e.*,
	(select avg(sueldo) from rh..empleado) sueldo_prom
from rh..empleado e
where sueldo > (select avg(sueldo) from rh..empleado);
go


-- Otra solucion aplicando CTE.
WITH
T1 AS (
	select avg(sueldo) sueldo_prom 
	from rh..empleado
)
select e.*,t1.sueldo_prom
from rh..empleado e
join t1 on e.sueldo > t1.sueldo_prom
go









