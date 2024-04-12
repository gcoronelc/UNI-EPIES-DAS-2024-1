

-- Paso 1: Insumos

select *
from EduTec..CursoProgramado cp
join EduTec..Curso c 
on cp.IdCurso = c.IdCurso;
go

-- Paso 2: Completando consulta

select 
	c.NomCurso curso,
	count(1) Aulas,
	sum(cp.Vacantes + cp.Matriculados) vacantes,
	sum(cp.Matriculados) matriculados
from EduTec..CursoProgramado cp
join EduTec..Curso c 
on cp.IdCurso = c.IdCurso
where cp.IdCiclo =  '2023-03'
group by c.NomCurso;
go


-- PAso 3: Agregando porcentaje

with 
v1 as (
	select 
		c.NomCurso curso,
		count(1) Aulas,
		sum(cp.Vacantes + cp.Matriculados) vacantes,
		sum(cp.Matriculados) matriculados
	from EduTec..CursoProgramado cp
	join EduTec..Curso c 
	on cp.IdCurso = c.IdCurso
	where cp.IdCiclo =  '2023-03'
	group by c.NomCurso
)
select 
	curso, Aulas, vacantes, matriculados,
	cast(matriculados*100.0/vacantes as numeric(10,0)) Porcentaje
from v1;
go






