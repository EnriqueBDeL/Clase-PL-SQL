-- MATRICES ASOCIATIVAS O TABLAS "INDEX BY"


-- LAS MATRICES ASOCIATIVAS (TAMBIÉN CONOCIDAS COMO TABLAS INDEX BY) SON ESTRUCTURAS DE DATOS QUE ALMACENAN PARES DE CLAVE-VALOR, PERMITIENDO UN ACCESO EFICIENTE A LOS ELEMENTOS MEDIANTE UN ÍNDICE.



-- SINTAXIS:

/*

DECLARE 

TPYE TYPE_NOMBRE IS TABLE OF TIPO_DE_DATO INDEX BY TIPO_INDICE;


NOMBRE_VARIABLE TIPO_VARIABLE;


BEGIN




END;



*/





-- EJEMPLO 1:


DECLARE

   TYPE T_EMPLEADOS IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
   V_EMPLEADOS T_EMPLEADOS;

BEGIN

   V_EMPLEADOS(101) := 'Juan Pérez';
   V_EMPLEADOS(102) := 'María Gómez';
   V_EMPLEADOS(103) := 'Carlos López';

   DBMS_OUTPUT.PUT_LINE(V_EMPLEADOS(101));

END;






-- EJEMPLO 2


DECLARE

    TYPE TYP_EMPLEADOS IS TABLE OF VARCHAR2(25) INDEX BY PLS_INTEGER;

    V_EMPLEADOS TYP_EMPLEADOS;

BEGIN

    V_EMPLEADOS(1)  :=  'Juan Pérez';
    V_EMPLEADOS(2)  :=  'María Gómez';
    V_EMPLEADOS(3)  :=  'Carlos López';

    DBMS_OUTPUT.PUT_LINE(V_EMPLEADOS(1)||', '||V_EMPLEADOS(2)||', '||V_EMPLEADOS(3));  
 
END;





-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||



-- METODOS DE LAS MATRICES ASOCIATIVAS:



-- EXISTS(n): DEVUELVE TRUE SI EXISTE EL N ELEMENTO EN UNA MATRIZ ASOCIATIVA.

-- COUNT: DEVUELVE EL NÚMERO DE ELEMENTOS QUE CONTIENE ACTUALMENTE UNA MATRIZ ASOCIATIVA.

-- FIRST: DEVUELVE EL PRIMER (MENOR) NÚMERO DE ÍNDICE EN UNA MATRIZ ASOCIATIVA. 
          DEVUELVE NULL SI LA MATRIZ ASOCIATIVA ESTÁ VACÍA.

-- LAST: DEVUELVE EL ÚLTIMO (MAYOR) NÚMERO DE ÍNDICE EN UNA MATRIZ ASOCIATIVA. 
	 DEVUELVE NULL SI LA MATRIZ ASOCIATIVA ESTÁ VACÍA.

-- PRIOR(n): DEVUELVE EL NÚMERO DE ÍNDICE QUE PRECEDE AL ÍNDICE N EN UNA MATRIZ ASOCIATIVA.

-- NEXT(n): DEVUELVE EL NÚMERO DE ÍNDICE QUE SUPERA AL ÍNDICE N EN UNA MATRIZ ASOCIATIVA.


-- DELETE: ELIMINA TODOS LOS ELEMENTOS DE UNA MATRIZ ASOCIATIVA.

-- DELETE(n): ELIMINA EL N ELEMENTO DE UNA MATRIZ ASOCIATIVA.

-- DELETE(m, n): ELIMINA TODOS LOS ELEMENTOS DEL RANGO M ... N DE UNA MATRIZ ASOCIATIVA.


-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||




-- EJEMPLO "EXISTS":


DECLARE

   TYPE T_EMPLEADOS IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
   V_EMPLEADOS T_EMPLEADOS;

BEGIN

   V_EMPLEADOS(101) := 'Juan Pérez';
   V_EMPLEADOS(102) := 'María Gómez';

   IF V_EMPLEADOS.EXISTS(101) THEN

      DBMS_OUTPUT.PUT_LINE('El empleado con índice 101 existe.');

   ELSE

      DBMS_OUTPUT.PUT_LINE('El empleado con índice 101 no existe.');
   END IF;


   IF V_EMPLEADOS.EXISTS(103) THEN

      DBMS_OUTPUT.PUT_LINE('El empleado con índice 103 existe.');

   ELSE

      DBMS_OUTPUT.PUT_LINE('El empleado con índice 103 no existe.');

   END IF;
END;



-- ///////////////////////////////////////////////////////////////////////////////////////////


-- EJEMPLO "COUNT":



DECLARE

   TYPE T_EMPLEADOS IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
   V_EMPLEADOS T_EMPLEADOS;

BEGIN

   V_EMPLEADOS(101) := 'Juan Pérez';
   V_EMPLEADOS(102) := 'María Gómez';
   
   DBMS_OUTPUT.PUT_LINE('Número de empleados: ' || V_EMPLEADOS.COUNT);

END;


-- ///////////////////////////////////////////////////////////////////////////////////////////




-- EJEMPLO "FIRST":


DECLARE

   TYPE T_EMPLEADOS IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
   V_EMPLEADOS T_EMPLEADOS;

BEGIN

   V_EMPLEADOS(101) := 'Juan Pérez';
   V_EMPLEADOS(102) := 'María Gómez';

   DBMS_OUTPUT.PUT_LINE('Primer índice: ' || V_EMPLEADOS.FIRST);

END;


-- ///////////////////////////////////////////////////////////////////////////////////////////



-- EJEMPLO "LAST":



DECLARE

   TYPE T_EMPLEADOS IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
   V_EMPLEADOS T_EMPLEADOS;

BEGIN

   V_EMPLEADOS(101) := 'Juan Pérez';
   V_EMPLEADOS(102) := 'María Gómez';

   DBMS_OUTPUT.PUT_LINE('Último índice: ' || V_EMPLEADOS.LAST);

END;



-- ///////////////////////////////////////////////////////////////////////////////////////////


-- EJEMPLO "PRIOR":


DECLARE

   TYPE T_EMPLEADOS IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
   V_EMPLEADOS T_EMPLEADOS;

BEGIN


   V_EMPLEADOS(101) := 'Juan Pérez';
   V_EMPLEADOS(102) := 'María Gómez';
   V_EMPLEADOS(103) := 'Carlos López';


   DBMS_OUTPUT.PUT_LINE('El índice anterior a 102 es: ' || V_EMPLEADOS.PRIOR(102)); 


   BEGIN

      DBMS_OUTPUT.PUT_LINE('El índice anterior a 101 es: ' || V_EMPLEADOS.PRIOR(101)); 
   
   EXCEPTION

      WHEN OTHERS THEN

         DBMS_OUTPUT.PUT_LINE('No hay un índice anterior a 101.');

   END;
END;




-- ///////////////////////////////////////////////////////////////////////////////////////////


-- EJEMPLO "NEXT":



DECLARE

   TYPE T_EMPLEADOS IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
   V_EMPLEADOS T_EMPLEADOS;
   
BEGIN

   V_EMPLEADOS(101) := 'Juan Pérez';
   V_EMPLEADOS(102) := 'María Gómez';
   V_EMPLEADOS(103) := 'Carlos López';


   DBMS_OUTPUT.PUT_LINE('El índice siguiente a 102 es: ' || V_EMPLEADOS.NEXT(102)); 

   BEGIN
      DBMS_OUTPUT.PUT_LINE('El índice siguiente a 103 es: ' || V_EMPLEADOS.NEXT(103)); 
  
   EXCEPTION

      WHEN OTHERS THEN

         DBMS_OUTPUT.PUT_LINE('No hay un índice siguiente a 103.');

   END;
END;

