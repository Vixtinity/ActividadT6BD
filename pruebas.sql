--PAGINA 35--
-- 1) Crea una función que devuelva el número de alumnos matriculados en GBD en el curso 12-13
BEGIN
    dbms_output.put_line(contarGBD);
END;
-- 2
select * from alumno where Codal=1;

--Prueba

select Alumnos.* from alumnos.matricula where alumnos.Codal=matricula.Codal and Codas='GBD';

-- Mostrar cuántas matrículas hay en cada curso académico en orden desc
select count(Curso) total from matricula group by Curso order by total desc;

-- Imprimir los datos de los profesores que no son de informática
select * from profesores where DEPARTAMENTO<>'Informática';
-- 3)Crea un cursor para imprimir los datos de los alumnos y la materia en la que están suspensos
select a.*, s.*, Nota from alumnos a
inner join notas n on a.Codal=n.Codal
inner join asignaturas s on s.Codas=n.Codas
where Nota<5;


--
select a.*, trunc(MONTHS_BETWEEN(sysdate, FECHANACIMIENTO)/12) Edad from alumnos a order by Edad desc;

-- 2)Listar los alumnos cuyo nombre comienza con una letra como parámetro.
select * from alumnos where Nombre like 'A' || '%';

select Codas.avg(Nota) from notas, asignaturas
where notas.Codas=asignaturas.Codas
group by Codas;
