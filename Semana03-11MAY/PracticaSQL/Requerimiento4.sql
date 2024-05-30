
with
v1 as (
	select 
		u.ciudad,
		count(1) Personas
	from RH..empleado e
	join RH..departamento d 
	on e.iddepartamento = d.iddepartamento
	join RH..ubicacion u
	on d.idubicacion = u.idubicacion
	group by u.ciudad
),
v2 as (select sum(personas) total from v1)
select 
	v1.ciudad, v1.personas,
	v1.personas*100.0/v2.total porcentaje
from v1 cross join v2;
go



