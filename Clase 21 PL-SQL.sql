-- DISPARADORES


-- SON BLOQUES DE CÓDIGO QUE SE ALMACENAN EN LA BASE DE DATOS Y SE EJECUTAN AUTOMÁTICAMENTE CUANDO OCURRE UN EVENTO ESPECÍFICO. 
-- SE PUEDEN DEFINIR EN TABLAS, VISTAS, ESQUEMAS O EN LA BASE DE DATOS COMPLETA.




-- TIPOS DE DISPARADORES:



-- DISPARADORES DML (DATA MANIPULATION LANGUAGE): SE ACTIVAN CUANDO SE EJECUTA UNA OPERACIÓN INSERT, UPDATE O DELETE.


-- DISPARADORES DDL (DATA DEFINITION LANGUAGE): SE ACTIVAN CUANDO SE EJECUTA UNA OPERACIÓN CREATE, ALTER O DROP.


-- DISPARADORES DE EVENTOS DE BASE DE DATOS: SE ACTIVAN CUANDO OCURRE UN EVENTO COMO LOGON, LOGOFF, STARTUP O SHUTDOWN.





-- SINTAXIS:


/*



CREATE OR REPLACE TRIGGER NOMBRE_DISPARADOR 
CONTROLADOR_DE_TIEMPO <-- [BEFORE | AFTER | INSTEAD OF] 
INSERT OR UPDATE OR DELETE ON NOMBRE_TABLA
FOR EACH ROW
BEGIN
   -- ACCIONES A EJECUTAR
END;




*/



--|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||



-- TABLA DE EJEMPLO:


CREATE TABLE empleados_eb (
    id_empleado NUMBER PRIMARY KEY,
    nombre VARCHAR2(50),
    cargo VARCHAR2(50),
    salario NUMBER,
    fecha_ingreso DATE
);



-- DATOS PARA LA TABLA:

INSERT INTO empleados_eb VALUES (1, 'JUAN PÉREZ', 'DESARROLLADOR', 3000, TO_DATE('2020-05-10', 'YYYY-MM-DD'));
INSERT INTO empleados_eb VALUES (2, 'ANA LÓPEZ', 'GERENTE', 5000, TO_DATE('2018-03-25', 'YYYY-MM-DD'));
INSERT INTO empleados_eb VALUES (3, 'CARLOS MARTÍNEZ', 'ANALISTA', 4000, TO_DATE('2019-07-12', 'YYYY-MM-DD'));



--|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- EJEMPLO 1:

CREATE OR REPLACE TRIGGER evitar_eliminacion
BEFORE DELETE ON empleados_eb
FOR EACH ROW

BEGIN

    RAISE_APPLICATION_ERROR(-20001, 'NO SE PUEDEN ELIMINAR EMPLEADOS');

END;


-- ESTE DISPARADOR IMPIDE QUE SE BORREN REGISTROS DE LA TABLA EMPLEADOS.


-- EJECUCION:

DELETE FROM empleados_eb WHERE id_empleado = 1;


-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- TABLA EJEMPLO 


CREATE TABLE auditoria_salarios (
    id_auditoria NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_empleado NUMBER,
    salario_anterior NUMBER,
    salario_nuevo NUMBER,
    usuario_modificacion VARCHAR2(50),
    fecha_modificacion DATE
);



-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



-- EJEMPLO 2:



CREATE OR REPLACE TRIGGER auditar_cambio_salario
AFTER UPDATE OF salario ON empleados_eb
FOR EACH ROW

BEGIN

    INSERT INTO auditoria_salarios (id_empleado, salario_anterior, salario_nuevo, usuario_modificacion, fecha_modificacion)
    VALUES (:OLD.id_empleado, :OLD.salario, :NEW.salario, USER, SYSDATE);

END;


-- CADA VEZ QUE SE ACTUALIZA EL SALARIO DE UN EMPLEADO, SE GUARDA EL CAMBIO EN "AUDITORIA_SALARIOS".


-- EJECUCION:

UPDATE empleados_eb SET salario = 4500 WHERE id_empleado = 3;



-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- EJEMPLO 3:


CREATE OR REPLACE TRIGGER restringir_modificacion
BEFORE UPDATE OR DELETE ON empleados_eb
FOR EACH ROW

WHEN (TO_CHAR(SYSDATE, 'HH24:MI') NOT BETWEEN '09:00' AND '18:00')

BEGIN

    RAISE_APPLICATION_ERROR(-20002, 'NO SE PUEDEN HACER CAMBIOS FUERA DEL HORARIO LABORAL');

END;



--IMPIDE MODIFICACIONES EN LA TABLA EMPLEADOS FUERA DEL HORARIO DE 09:00 A 18:00 HORAS.



-- EJECUCION:

UPDATE empleados_eb SET cargo = 'LÍDER DE PROYECTO' WHERE id_empleado = 1;



-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- EJEMPLO 4:


CREATE OR REPLACE TRIGGER asignar_salario
BEFORE INSERT ON empleados_eb
FOR EACH ROW

BEGIN
    IF :NEW.cargo = 'DESARROLLADOR' THEN
        :NEW.salario := 3500;
    ELSIF :NEW.cargo = 'GERENTE' THEN
        :NEW.salario := 6000;
    ELSIF :NEW.cargo = 'ANALISTA' THEN
        :NEW.salario := 4500;
    ELSE
        :NEW.salario := 3000; -- SALARIO POR DEFECTO
    END IF;
END;


-- CUANDO SE INSERTA UN NUEVO EMPLEADO, SE LE ASIGNA AUTOMÁTICAMENTE UN SALARIO.


-- EJECUCION:

INSERT INTO empleados_eb (id_empleado, nombre, cargo, fecha_ingreso) VALUES (4, 'PEDRO GARCÍA', 'GERENTE', TO_DATE('2025-01-15', 'YYYY-MM-DD'));




--|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||



-- MODIFICAR LA EJECUCIÓN DE UN DISPARADOR:



-- EN OCASIONES, ES NECESARIO HABILITAR O DESHABILITAR UN DISPARADOR TEMPORALMENTE SIN NECESIDAD DE ELIMINARLO. 
-- ESTO SE HACE UTILIZANDO LOS COMANDOS ENABLE Y DISABLE.




-- IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII

-- DESACTIVAR UN DISPARADOR:

-- ALTER TRIGGER NOMBRE_DEL_DISPARADOR DISABLE;

-- IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII

-- ACTIVAR UN DISPARADOR:

-- ALTER TRIGGER NOMBRE_DEL_DISPARADOR ENABLE;

-- IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII

-- DESACTIVAR TODOS LOS DISPARADORES DE UNA TABLA:

-- ALTER TABLE NOMBRE_TABLA DISABLE ALL TRIGGERS;

-- IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII

-- ACTIVAR TODOS LOS DISPARADORES DE UNA TABLA:

-- ALTER TABLE NOMBRE_TABLA ENABLE ALL TRIGGERS;

-- IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII







