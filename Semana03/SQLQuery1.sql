-- Ejercicio 1
-- Cantidad de empleados
-- BD: RH

select 1, *
from RH..empleado;
go

select count(1)
from RH..empleado;
go

-- Ejercicio 2
-- Cantidad de empleados por departamento
-- BD: RH

select 
	iddepartamento, 
	count(1) cant_emp
from RH..empleado
group by iddepartamento;
go

select 
	iddepartamento, 
	count(1) cant_emp
from RH..empleado
group by iddepartamento
having count(1) > 5;
go

