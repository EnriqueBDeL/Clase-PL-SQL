-- ATRIBUTO %TYPE

-- SE UTILIZA PARA DECLARAR VARIABLES QUE DEBEN TENER EL MISMO TIPO DE DATOS
-- QUE UNA COLUMNA DE UNA TABLA O UNA VARIABLE PREVIAMENTE DEFINIDA EN PL/SQL.


-- SINTAXIS:  NOMBRE_VARIABLE NOMBRE_TABLA.NOMBRE_COLUMNA%TYPE;


-- TABLA PARA EL EJEMPLO.
CREATE TABLE EMPLEADOS (
  ID_EMPLEADO NUMBER PRIMARY KEY,
  NOMBRE VARCHAR2(50),
  SALARIO NUMBER
);

-- INSERCCION DE DATOS DE EJEMPLO.
INSERT INTO EMPLEADOS (ID_EMPLEADO, NOMBRE, SALARIO) VALUES (1, 'JUAN PÉREZ', 5000);
INSERT INTO EMPLEADOS (ID_EMPLEADO, NOMBRE, SALARIO) VALUES (2, 'ANA GÓMEZ', 4500);
INSERT INTO EMPLEADOS (ID_EMPLEADO, NOMBRE, SALARIO) VALUES (3, 'CARLOS MARTÍNEZ', 6000);


-- EJEMPLO
DECLARE

  V_SALARIO EMPLEADOS.SALARIO%TYPE; -- DECLARAR UNA VARIABLE DE TIPO DEL CAMPO 'SALARIO' DE LA TABLA 'EMPLEADOS'

BEGIN

  V_SALARIO := 5000;

  DBMS_OUTPUT.PUT_LINE('EL SALARIO ES: ' || V_SALARIO);

END;
