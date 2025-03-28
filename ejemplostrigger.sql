CREATE TABLE alumnos2 (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    nota FLOAT NOT NULL
);


insert into alumnos2 values (1, 'Ismael', 'Fernandez', 'Lopez', 5);

create or replace TRIGGER trigger_nota before INSERT
on alumnos2 for each row 
BEGIN
    IF :new.nota < 0 THEN
        :new.nota := 0;
    ELSIF :new.nota > 10 THEN
        :new.nota := 10;
    END IF;
END;

INSERT INTO alumnos2 VALUES (2, 'Juan', 'Perez', 'Garcia', 11);

SELECT * FROM alumnos2;


create or replace trigger trigger_cambio_apellido
before update of apellido1 on alumnos2 for each row
BEGIN
    IF (:old.apellido1 = "Lopez") THEN
        RAISE_APPLICATION_ERROR(-25000,'No puedes cambiar el apellido');
    END IF;
END;