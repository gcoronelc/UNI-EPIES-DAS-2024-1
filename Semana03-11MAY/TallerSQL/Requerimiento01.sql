
-- Paso 1: Los insumos

select * 
from RH..empleado e
join RH..departamento d
on e.iddepartamento = d.iddepartamento;
go


-- Paso 2: Completando la consulta

select 
	d.nombre departamento,
	count(1) empleados,
	sum(e.sueldo) Importe,
	sum(isnull(e.comision,0)) comision,
	sum(e.sueldo + isnull(e.comision,0)) total
from RH..empleado e
join RH..departamento d
on e.iddepartamento = d.iddepartamento
group by d.nombre;
go








