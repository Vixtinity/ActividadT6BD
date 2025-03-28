--SQL Developer

-- PAGINA 17 --
/*
¿Cómo sería el código 
para imprimir tu nombre y apellidos?
¿Y para calcular el total con IVA al 
introducir cantidad y precioUnidad?
*/
DECLARE
    nombre VARCHAR(20) := 'Ismael';
    apellidos VARCHAR(50) := 'Fernandez Lopez';
BEGIN
    dbms_output.put_line('Nombre: '||nombre||' Apellidos: '||apellidos);
END;


-- PAGINA 23 --


-- ● Realiza un programa que pida el DNI y lo muestre con la letra correspondiente. (enlace)
DECLARE
    letrasDNI VARCHAR(23) := 'TRWAGMYFPDXBNJZSQVHLCKE';
    dni number:=451278611;
BEGIN
    --saber el numero en modulo 23
    dbms_output.put_line('La letra del DNI es: '||instr(letrasDNI, mod(dni, 23)+1,1));
END;

-- ● Realiza un programa que determine si un número introducido es par o impar
DECLARE
    numero number:= 5;
BEGIN
    IF MOD(numero,2) = 0 THEN
        dbms_output.put_line('El numero es par');
    ELSE
        dbms_output.put_line('El numero es impar');
    END IF;
END;
-- ● Escribe un programa que muestre una cadena de asteriscos según el tamaño de un texto (usa length y substr).
DECLARE
    palabra varchar(600):='Onomatopeya';
    salida VARCHAR2(20);
    i number:=0;
BEGIN
    length(palabra);
    for i in 1..lenght(palabra) loop
        salida:=salida||'*';
    end loop;
    dbms_output.put_line(salida);

END;

-- ● Realiza un programa que muestre por pantalla los números pares menores de 100. 

DECLARE
    i number:=0;
BEGIN
    WHILE i < 100 LOOP
        IF mod(i,2) = 0 THEN
            dbms_output.PUT_LINE(i);
        END IF;
        END LOOP;
END;

/*Realiza un programa que determine si un año es bisiesto desde 1900 (Divisible por 4 y (no 
divisible por 100 o sí por 400)) (usa la función mod)
mensaje de error si el año es menor a 1900*/
DECLARE
    anio NUMBER := 1999;
BEGIN
    IF anio < 1900 THEN
        dbms_output.put_line('Menos a 1900');
    ELSIF (MOD(anio,4) = 0 AND (MOD(anio,100) != 0 OR MOD(anio,400) = 0)) THEN
        dbms_output.put_line('Es bisiesto');
    ELSE
        dbms_output.put_line('No es bisiesto');
    END IF;
END;
/

-- Realiza un programa que escriba una frase al revés. (usa la función substr)
declare
    frase varchar(100):='Gabriel perro';
    i numero;
    
BEGIN
    for i in reverse 1..length(frase) loop
        dbms_output.put_line(substr(frase,i,1));
    end loop;
END;

/*
Tomando el ejercicio anterior, modifícalo para que si la letra que va leyendo es ‘X’, pare el 
proceso y finalice el programa. Si aparece, que indique dónde es la primera vez que la 
encuentra (usa la función instr y exit)
*/
declare
    frase varchar(100);
    i number;
    resultado varchar(50);
    parada boolean:=false;
BEGIN
    while parada=false and i>0 LOOP
        i:=i-1;
        if substr(frase, i,1) = 'X' then
            dbms_output.put_line('La letra X esta en la posicion: '||i);
            parada:=true;
        end if;
        i:=i-1;
        end loop;
        dbms_output.put_line(resultado);
    END;


-- PAGINA 27 --
/*Actividad: Diseña un procedimiento llamado DividirNumero que pasemos como parámetros de entrada: el dividendo y 
el divisor y devuelva como parámetros de salida: el cociente y el resto.
Usa este procedimiento en un programa en el que se divida 18 entre 4, y que muestre por pantalla el dividendo, divisor, 
cociente y resto.*/
create or replace PROCEDURE
    dividirnumero(diviendo in number, divisor in number, cociente out number, resto out number);
BEGIN
    cociente:=dividendo/divisor;
    resto:=mod(dividendo,divisor);
END;

DECLARE
    dividendo number:=25;
    divisor number:=5;
    cociente number;
    resto number;
BEGIN
    dividirnumero(dividendo, divisor, cociente, resto);
    dbms_output.put_Line(dividentro||'/'||divisor||'='||cociente||' resto '||resto);
END;
-- PAGINA 29 --
-- ● Diseña una función que se pasen como parámetros dos números enteros y nos devuelva el mayor de los dos
create or replace FUNCTION mayor (num1 in number, num2 in number) return number is
    BEGIN
        if num1>num2 then
            return num1;
        else
            return num2;
        end if;
    END;

--● Diseña una función que sume los números pares desde un valor x a un valor y como parámetros. 
create or replace FUNCTION sumapares (x in number, y in number) return number is
    suma number:=0;
    BEGIN
        for i in x..y loop
            if mod(i,2)=0 then
                suma:=suma+i;
            end if;
        end loop;
        return suma;
    END;

-- PAGINA 33 --
--  Crea un procedimiento que dado el código de asignatura saque los datos de la misma. Ej: GBD
create or replace PROCEDURE datosAsignatura (codigo in varchar2) as
    nombre varchar(50);
    curso varchar(50);
    BEGIN
        select nombre, curso into nombre, curso from asignaturas where Codas=codigo;
        dbms_output.put_line('Nombre: '||nombre||' Curso: '||curso);
    END;

--PAGINA 35--
-- 1) Crea una función que devuelva el número de alumnos matriculados en GBD en el curso 12-13
create or replace FUNCTION contarGBD return numer is
    total number:=0;
    BEGIN
        select count(Codal) into total from matricula where Codas='GBD' and curso='12-13';
        return total;
    END;
--2) Crea un procedimiento que apruebe a los alumnos suspensos en SSOO
create or replace PROCEDURE aprobarSSOO as
    begin
        update notas set nota=5 where Codas='SSOO' and nota<5;
    end;

-- 3) Crea un procedimiento que devuelva la nota mínima, máxima y la media en el curso 11-12 en PAR.
create or replace PROCEDURE estadisticas as
    min number;
    max number;
    media number;
    BEGIN
        select min(nota), max(nota), avg(nota) into min, max, media from notas where Codas='PAR' and curso='11-12';
        dbms_output.put_line('Nota minima: '||min||' Nota maxima: '||max||' Nota media: '||media);
    END;
/* 4) Crea un bloque anónimo que inserte 1 profesor, 1 alumno (matriculado en todas las materias de 
ASIR) y la asignatura TIC de 2º Bachillerato que imparte el nuevo profesor*/
DECLARE
    Codpr number;
    Codal number;
    Codas varchar(6);
BEGIN
    select max(Codpr)+1 into Codpr from profesores;
    insert into profesores values (Codpr, 'Nuevo profesor');
    select max(Codal)+1 into Codal from alumnos;
    insert into alumnos values (Codal, 'Nuevo alumno');
    select Codas into Codas from asignaturas where nombre='TIC';
    insert into imparte values (Codpr, Codas, '12-13');
    insert into matricula values (Codal, Codas, '12-13');
END;

--5) Crea un bloque que responda a… ¿Cómo se llama el profesor que imparte Redes locales?
DECLARE
    nombreProfesor varchar(50);
    apellidosProfesor varchar(50);
BEGIN
    select distinct p.Nombre, p.Apellidos into nombreProfesor, apellidosProfesor
    from profesores p 
    inner join imprte i on a.Codas=i.i.Codas
    inner join asignaturas a on a.Codas=p.Codas
    where a.Nombre='Redes locales';
    dbms_output.put_line('Profesor: '||nombre_profesor);
END;

/*6) Modifica el código anterior para que obtenga el nombre según el tipo de la tabla profesores y la 
materia por teclado
*/
DECLARE
    nombreProfesor varchar(50);
    apellidosProfesor varchar(50);
    materia varchar(50);
BEGIN
    select distinct p.Nombre, p.Apellidos into nombreProfesor, apellidosProfesor
    from profesores p 
    inner join imprte i on a.Codas=i.i.Codas
    inner join asignaturas a on a.Codas=p.Codas
    where a.Nombre=materia;
    dbms_output.put_line('Profesor: '||nombre_profesor);
END;

/*7) Incrementa el sueldo de los profesores que no son de 'Huercal-Overa' en una cantidad en 
concepto de dietas. Si el profesor no tiene sueldo indicado, se le colocará este incremento 
respecto al mínimo.*/
create or replace PROCEDURE subirSueldo AS
BEGIN
    select min(sueldo) into minimo from profesores;
    update profesores set sueldo=sueldo+100 where Ciudad!='Huercal-Overa';
    update profesores set sueldo=minimo+100 where sueldo is null;
END;
/*8) Escribe el procedimiento que imprime los datos del alumno indicado como parámetro (codal). 
¿Qué pasa si pones un codal que no existe?*/
declare
regAlumno alumnos%rowtype;
BEGIN
    SELECT * INTO regAlumno FROM alumnos WHERE Codal=10;
    dbms_output.put_line('Nombre: '||regAlumno.Nombre);
    dbms_output.put_line('Apellidos: '||regAlumno.Apellidos);
    dbms_output.put_line('Ciudad: '||regAlumno.Ciudad);
END;

/*9) Cambiar el alumno con codal=1 de GBD a SSOO en matricula y si no está se crea*/
declare
RegPro matricula%rowtype;
BEGIN
    select * into RegPro from matricula where Codal=1 and Codas='GBD';
    update matricula set Codas='SSOO' where Codal=1 and Codas='GBD';
    if SQL%NOTFOUND then
        insert into matricula values (1, 'SSOO', '12-13');
    else
        update MATRICULA set codas='SSOO' where codal=1 and codas='GBD';
        DBMS_OUTPUT.PUT_LINE('Alumno cambiado de GBD a SSOO');
    end if;
END;
-- PAGINA 41 --
-- 1) Crea un cursor para mostrar cuántas matrículas hay en cada curso académico en orden desc
DECLARE
    CURSOR cursorMatricula is select Curso, count(*) total from matricula group by Curso order by total desc;
    registroMatricula cursorMatricula%rowtype;
BEGIN
    FOR registroMatricula in cursorMatricula LOOP
        dbms_output.put_line('Curso: '||registroMatricula.Curso||' Total: '||registroMatricula.total);
    END LOOP;
END;
/

--2)Crea un cursor para imprimir los datos de los profesores que no son de informática
DECLARE
    CURSOR cursorProf is select * from profesores where DEPARTAMENTO<>'Informática';
    informaticaExcluido cursorProf%rowtype;
BEGIN
    FOR informaticaExcluido in cursorProf LOOP
        dbms_output.put_line('Nombre: '||informaticaExcluido.Nombre||' Apellidos: '||informaticaExcluido.Apellidos);
    END LOOP;
END;
/

-- 3)Crea un cursor para imprimir los datos de los alumnos y la materia en la que están suspensos
DECLARE
    CURSOR cursorProf is 
select a.Nombre NombreAlumno, s.Nombre NombreAsignatura, Nota from alumnos a
inner join notas n on a.Codal=n.Codal
inner join asignaturas s on n.Codas=s.Codas
where Nota<5;
    informaticaExcluido cursorProf%rowtype;
BEGIN
    FOR informaticaExcluido in cursorProf LOOP
        dbms_output.put_line('Nombre: '||informaticaExcluido.NombreAlumno||' Apellidos: '||informaticaExcluido.Apellidos||' Asignatura: '||informaticaExcluido.NombreAsignatura||' Nota: '||informaticaExcluido.Nota);
    END LOOP;
END;
/

-- PAGINA 42 --
/* 1)Listar los alumnos con su edad de mayor a menor. Usa 
TRUNC(MONTHS_BETWEEN(SYSDATE, FechaNacimiento) / 12) para 
conocer su edad*/
DECLARE
    CURSOR cursorAlumnos IS
        SELECT Nombre, Apellidos, TRUNC(MONTHS_BETWEEN(SYSDATE, FechaNacimiento) / 12) AS Edad
        FROM alumnos
        ORDER BY Edad DESC;
BEGIN
    FOR registroAlumnos IN cursorAlumnos LOOP
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || registroAlumnos.Nombre || ' Apellidos: ' || registroAlumnos.Apellidos || ' Edad: ' || registroAlumnos.Edad);
    END LOOP;
END;

-- 2)Listar los alumnos cuyo nombre comienza con una letra como parámetro.
DECLARE
    CURSOR cursorNombre (letra CHAR) IS 
        SELECT * FROM alumnos WHERE Nombre LIKE letra || '%';
    registroNombre cursorNombre%ROWTYPE;
BEGIN
    OPEN cursorNombre('A');
    LOOP
        FETCH cursorNombre INTO registroNombre;
        EXIT WHEN cursorNombre%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || registroNombre.Nombre || ' Apellidos: ' || registroNombre.Apellidos);
    END LOOP;
    CLOSE cursorNombre;
END;
/


-- 3)Listar los datos del profesor y la materia que imparte en el curso 12-13
DECLARE
    CURSOR cursorProfesor IS
        SELECT p.Nombre, p.Apellidos, a.Nombre AS Asignatura
        FROM profesores p
        INNER JOIN imparte i ON p.Codpr = i.Codpr
        INNER JOIN asignaturas a ON i.Codas = a.Codas
        WHERE i.Curso = '12-13';
    registroProfesor cursorProfesor%ROWTYPE;
BEGIN
    FOR registroProfesor IN cursorProfesor LOOP
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || registroProfesor.Nombre || ' Apellidos: ' || registroProfesor.Apellidos || ' Asignatura: ' || registroProfesor.Asignatura);
    END LOOP;
END;

-- 4)Muestra la media de calificaciones de cada materia.
DECLARE
    CURSOR cursorNotas IS
        SELECT Codas, AVG(Nota) AS Media
        FROM notas
        GROUP BY Codas;
    registroNotas cursorNotas%ROWTYPE;
BEGIN
    FOR registroNotas IN cursorNotas LOOP
        DBMS_OUTPUT.PUT_LINE('Codas: ' || registroNotas.Codas || ' Media: ' || registroNotas.Media);
    END LOOP;
END;

-- PAGINA 46 --
/*
Crear un procedimiento con parámetro un número e 
imprima su raíz cuadrada. Si introducimos una letra la 
gestionaremos como excepción con VALUE_ERROR y 
si el número es negativo gestionaremos la excepción 
nosotros. Emplea en este caso la opción RAISE 
excepción.`
YO TENGO QUE PONER EL NUMERO
*/
create or replace PROCEDURE raizCuadrada (numero IN NUMBER) AS
    resultado NUMBER;
    negativo EXCEPTION;
BEGIN
    IF numero < 0 THEN
        RAISE negativo;
    ELSE
        resultado := numero**0.5;
        DBMS_OUTPUT.PUT_LINE(resultado);
    END IF;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: No se puede calcular la raíz cuadrada de una letra');
    WHEN negativo THEN
        DBMS_OUTPUT.PUT_LINE('Error: No se puede calcular la raíz cuadrada de un número negativo');
END;
/*
Crea un procedimiento que borre los profesores de un 
departamento. Emplea en este caso la opción 
RAISE_APPLICATION_ERROR y el cursor SQL.
*/
create or replace PROCEDURE borrar (departamento in VARCHAR2) AS
    BEGIN
        DELETE profesores where Departamento=depto;
        IF SQL%NOTFOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'No hay profesores en el departamento');
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'Error al borrar profesores');
    END;

/*
Vamos a cambiar la matricula de GBD a SSOO para el alumno 11,pero si no esta los vamos a crear.
Usa NO_DATA_FOUND
*/
create or replace PROCEDURE cambiarMatricula AS
    BEGIN
        update matricula set Codas='SSOO' where Codal=11 and Codas='GBD';
        if SQL%NOTFOUND then
            insert into matricula values (11, 'SSOO', '12-13');
        end if;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Error al cambiar matricula');
    END;

    DECLARE
    RegPro matricula%rowtype;
    begin
        select * into RegPro
        from matricula where Codal=11 and Codas='GBD';
        IF SQL%NOTFOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'No existe el alumno');
        END IF;
        update matricula set Codas='SSOO' where Codal=11 and Codas='GBD';
          dbms_output.put_line('Alumno cambiado de GBD a SSOO');
          end if;

          EXCEPTION
          when others then
          insert into matricula values (11, 'SSOO', '12-13');
            dbms_output.put_line('Alumno creado y matriculado en SSOO');
            dbms_output.put_line('Codigo de error '||SQLCODE||' '||SQLERRM);
            end;

-- PAGINA 54 --
-- 1) Crea un trigger que compruebe que el alumno es mayor de edad al insertar uno nuevo
create or replace TRIGGER t_edad
    before insert on alumnos
    for each row
    declare
        edad number;
    begin
        edad:=TRUNC(MONTHS_BETWEEN(SYSDATE, :new.FechaNacimiento) / 12);
        if edad < 18 then
            RAISE_APPLICATION_ERROR (-29123, 'Menor de edad')
            end if;
    end;

-- 2) Crea un trigger que recoja en una tabla externa los cambios en datos de asignaturas a modo de histórico de cambios
create table h_asignaturas like asignaturas;

create or replace TRIGGER t_asignaturas
    before update on asignaturas
    for each row
    begin
        insert into h_asignaturas values (:old.Codas, :new.Cods :old.Nombre, :old.Curso, sysdate);
    end;

-- 3) Crea un trigger que impida borrar las notas de GBD

create or replace TRIGGER t_notas
    before delete on notas
    for each row 
    BEGIN
        if old.Codas='GBD' then
            RAISE_APPLICATION_ERROR (-29124, 'No se puede borrar la nota de GBD');
        end if;
    END;

--4) Crea un trigger que automáticamente inserte las notas con el mínimo a 0 y tope a 10.
create or replace TRIGGER t_notas
    before insert on notas
    for each row
    begin
        if :new.Nota < 0 then
            :new.Nota:=0;
        elsif :new.Nota > 10 then
            :new.Nota:=10;
        end if;
    end;

/*
5) Crea un trigger que compruebe que el alumno no se matricula más de una vez en una materia al 
hacer update. Este error se conoce como mutación
*/
create or replace TRIGGET t_matricula
    before update on matricula
    for each row
declare
    contador INTEGER;
begin
select count(*) into contador from matricula where Codal=:old.Codal and Codas=:new.Codas;
if (contador >= 1) then
    RAISE_APPLICATION_ERROR (-29125, 'Mutacion');
end if;
end;

/*
6) Un alumno no se puede matricular en asignaturas de segundo curso si tiene materias de primero 
suspensas de ASIR en el curso 12-13
*/
create or repacle trigger segundoASIR before insert on matricula
for each row
declare
    suspensas number;
BEGIN
    select count(*) into suspensas
    from notas
    inner join asignaturas a on notas.Codas=a.codas
    where notas.Codal=:new.Codal and a.Nivel='ASIR' and a.Curso='1' and notas.Nota<5 and notas.fecha between '15-09-2013';
    IF (suspensas >= 1) then
        raise_application_error(-29126, 'No se puede matricular en segundo curso');
    END IF;
END;

/*
Actividad: Crea una vista y genera el trigger asociado para alumnos aprobados en la materia de 
GBD. Comprueba el resultado antes y después de tener el trigger al insertar un nuevo alumno
*/
