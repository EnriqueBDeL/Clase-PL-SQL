-- REGISTROS


-- UN REGISTRO ES UNA ESTRUCTURA QUE PERMITE AGRUPAR DIFERENTES TIPOS DE DATOS EN UNA SOLA VARIABLE.

-- FUNCIONA COMO UNA FILA DE UNA TABLA, DONDE CADA CAMPO REPRESENTA UNA COLUMNA.


-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||




-- TIPOS DE REGISTROS:



-- REGISTRO BASADO EN TIPOS PERSONALIZADOS (TYPE).


	-- CUANDO USAR:

	-- NECESITAS UNA ESTRUCTURA PERSONALIZADA QUE NO ESTÁ DIRECTAMENTE VINCULADA A UNA TABLA.
	-- SOLO QUIERES ALGUNAS COLUMNAS DE UNA TABLA Y NO TODAS.
	-- NECESITAS TRABAJAR CON DATOS QUE PROVIENEN DE MÚLTIPLES TABLAS O CÁLCULOS QUE NO SE ENCUENTRAN EN UNA SOLA TABLA.




-- REGISTRO BASADO EN UNA FILA DE UNA TABLA (%ROWTYPE).

	-- CUANDO USAR:

	-- NECESITAS UNA VARIABLE QUE TENGA LA MISMA ESTRUCTURA QUE UNA FILA COMPLETA DE UNA TABLA O VISTA.
	-- QUIERES ASEGURARTE DE QUE TU CÓDIGO SE ADAPTE AUTOMÁTICAMENTE A CAMBIOS EN LA TABLA (POR EJEMPLO, SI SE AGREGAN O ELIMINAN COLUMNAS).
	-- NECESITAS ALMACENAR Y MANEJAR TODA UNA FILA CON UNA SOLA VARIABLE.



-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||




-- EJEMPLO "TYPE":



DECLARE  

    TYPE REGISTRO_EMPLEADO IS RECORD (  -- SE CREA EL REGISTRO "REGISTRO_EMPLEADO"
        ID NUMBER,  
        NOMBRE VARCHAR2(100),  
        SALARIO NUMBER(10,2)  
    );  
    
    V_EMPLEADO REGISTRO_EMPLEADO;  -- SE CREA LA VARIABLE "V_EMPLEADO", LA CUAL SIGUE LA ESTRUCTURA DEFINIDA EN EL "TYPE".

BEGIN  

    V_EMPLEADO.ID := 101;  
    V_EMPLEADO.NOMBRE := 'Juan Pérez';  
    V_EMPLEADO.SALARIO := 3500;  

    DBMS_OUTPUT.PUT_LINE('ID: ' || V_EMPLEADO.ID);  
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || V_EMPLEADO.NOMBRE);  
    DBMS_OUTPUT.PUT_LINE('Salario: ' || V_EMPLEADO.SALARIO);  

END;





-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||



-- [ TABLA E INSERCCIONES PARA LOS EJEMPLOS ]



CREATE TABLE EMPLEADOS_EB (
    ID NUMBER PRIMARY KEY,
    NOMBRE VARCHAR2(100),
    PUESTO VARCHAR2(50),
    SALARIO NUMBER(10,2)
);



INSERT INTO EMPLEADOS_EB (ID, NOMBRE, PUESTO, SALARIO) VALUES (101, 'Juan Pérez', 'Analista', 3500);

INSERT INTO EMPLEADOS_EB (ID, NOMBRE, PUESTO, SALARIO) VALUES (102, 'María Gómez', 'Gerente', 5000);

INSERT INTO EMPLEADOS_EB (ID, NOMBRE, PUESTO, SALARIO) VALUES (103, 'Carlos Ramírez', 'Desarrollador', 4000);

INSERT INTO EMPLEADOS_EB (ID, NOMBRE, PUESTO, SALARIO) VALUES (104, 'Ana Torres', 'Diseñadora', 3800);




-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||



-- EJEMPLO 2:


DECLARE

    TYPE REGISTRO_EMPLEADO IS RECORD (
        ID NUMBER,
        NOMBRE VARCHAR2(100),
        SALARIO NUMBER(10,2)
    );

    V_EMPLEADO REGISTRO_EMPLEADO;

BEGIN

    SELECT ID, NOMBRE, SALARIO
    INTO V_EMPLEADO
    FROM EMPLEADOS_EB
    WHERE ID = 101;

    DBMS_OUTPUT.PUT_LINE('ID: ' || V_EMPLEADO.ID);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || V_EMPLEADO.NOMBRE);
    DBMS_OUTPUT.PUT_LINE('Salario: ' || V_EMPLEADO.SALARIO);

END;




-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||




-- EJEMPLO 3:  

-- REGISTRO ANIDADOS.


DECLARE

    TYPE REGISTRO_SALARIO IS RECORD (
        SALARIO NUMBER(10,2),
        BONO NUMBER(10,2)
    );


    TYPE REGISTRO_EMPLEADO IS RECORD (
        ID NUMBER,
        NOMBRE VARCHAR2(100),
        DETALLES_SALARIO REGISTRO_SALARIO
    );

    V_EMPLEADO REGISTRO_EMPLEADO;


BEGIN

    V_EMPLEADO.ID := 105;
    V_EMPLEADO.NOMBRE := 'Pedro Martínez';
    V_EMPLEADO.DETALLES_SALARIO.SALARIO := 4200;
    V_EMPLEADO.DETALLES_SALARIO.BONO := 500;

    DBMS_OUTPUT.PUT_LINE('ID: ' || V_EMPLEADO.ID);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || V_EMPLEADO.NOMBRE);
    DBMS_OUTPUT.PUT_LINE('Salario: ' || V_EMPLEADO.DETALLES_SALARIO.SALARIO);
    DBMS_OUTPUT.PUT_LINE('Bono: ' || V_EMPLEADO.DETALLES_SALARIO.BONO);

END;



-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- EJEMPLO 4:

DECLARE

    TYPE REGISTRO_EMPLEADO IS RECORD (
        ID NUMBER,
        NOMBRE VARCHAR2(100),
        PUESTO VARCHAR2(50),
        SALARIO NUMBER(10,2)
    );

    V_EMPLEADO REGISTRO_EMPLEADO;

BEGIN

    V_EMPLEADO.ID := 105;
    V_EMPLEADO.NOMBRE := 'Laura Gómez';
    V_EMPLEADO.PUESTO := 'Ingeniera';
    V_EMPLEADO.SALARIO := 4200;

    INSERT INTO EMPLEADOS_EB (ID, NOMBRE, PUESTO, SALARIO)
    VALUES (V_EMPLEADO.ID, V_EMPLEADO.NOMBRE, V_EMPLEADO.PUESTO, V_EMPLEADO.SALARIO);

    DBMS_OUTPUT.PUT_LINE('Empleado insertado con ID: ' || V_EMPLEADO.ID);

END;


-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- EJEMPLO 5:

DECLARE

    TYPE REGISTRO_EMPLEADO IS RECORD (
        ID NUMBER,
        NOMBRE VARCHAR2(100),
        PUESTO VARCHAR2(50),
        SALARIO NUMBER(10,2)
    );

    V_EMPLEADO REGISTRO_EMPLEADO;

BEGIN

    V_EMPLEADO.ID := 103;

    SELECT ID, NOMBRE, PUESTO, SALARIO
    INTO V_EMPLEADO
    FROM EMPLEADOS_EB
    WHERE ID = V_EMPLEADO.ID;

    V_EMPLEADO.SALARIO := V_EMPLEADO.SALARIO + 500;


    UPDATE EMPLEADOS_EB
    SET SALARIO = V_EMPLEADO.SALARIO
    WHERE ID = V_EMPLEADO.ID;

    DBMS_OUTPUT.PUT_LINE('Empleado con ID ' || V_EMPLEADO.ID || ' ha sido actualizado con el nuevo salario: ' || V_EMPLEADO.SALARIO);

END;




-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||



-- EJEMPLO "%ROWTYPE":



DECLARE  

    V_EMPLEADO EMPLEADOS_EB%ROWTYPE;  -- DECLARA UNA VARIABLE "V_EMPLEADO", LA CUAL SIGUE LA MISMA ESTRUCTURA QUE LA TABLA "EMPLEADOS_EB".

BEGIN  

    SELECT *
    INTO V_EMPLEADO  
    FROM EMPLEADOS_EB  
    WHERE ID = 101;  

    DBMS_OUTPUT.PUT_LINE('ID: ' ||  V_EMPLEADO.ID);  
    DBMS_OUTPUT.PUT_LINE('Nombre: ' ||  V_EMPLEADO.NOMBRE);  
    DBMS_OUTPUT.PUT_LINE('Puesto: ' ||  V_EMPLEADO.PUESTO);  
    DBMS_OUTPUT.PUT_LINE('Salario: ' ||  V_EMPLEADO.SALARIO);  

END;


-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||



-- EJEMPLO 2:


DECLARE

    TYPE T_EMP_REGISTRO IS RECORD (
        EMPLEADO_NUMERO NUMBER,
        EMPLEADO_DATOS EMPLEADOS_EB%ROWTYPE 
    );

  
    V_REGISTRO_EMP T_EMP_REGISTRO;

BEGIN

    V_REGISTRO_EMP.EMPLEADO_NUMERO := 1;


    SELECT * INTO V_REGISTRO_EMP.EMPLEADO_DATOS
    FROM EMPLEADOS_EB
    WHERE ID = 101;


    DBMS_OUTPUT.PUT_LINE('NÚMERO: ' || V_REGISTRO_EMP.EMPLEADO_NUMERO || '.- ' || V_REGISTRO_EMP.EMPLEADO_DATOS.NOMBRE);
    
END;







