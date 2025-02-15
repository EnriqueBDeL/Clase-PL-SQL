-- BLOQUES ANIDADOS

-- SON BLOQUES DE CODIGO DENTRO DE OTROS BLOQUES.
-- SE UTILIZA PARA MEJORAR LA ESTRUCTURA DEL CODIGO, MEJORAR A MODULARIDAD, ETC.


-- SINTAXIS:


/*

DECLARE

BEGIN

   DECLARE -- INICIO BLOQUE ANIDADO

   BEGIN 
      
   END;  -- FIN BLOQUE ANIDADO

END;



*/




-- EJEMPLO 1:


DECLARE

   V_NOMBRE VARCHAR2(50) := 'Juan';
   V_EDAD   NUMBER := 25;

BEGIN

   DBMS_OUTPUT.PUT_LINE('Nombre: ' || V_NOMBRE);
   
 

   DECLARE   -- INICIO BLOQUE ANIDADO

      V_EDAD NUMBER := 30;  -- ESTA VARIABLE SOLO EXISTE DENTRO DEL BLOQUE ANIDADO

   BEGIN

      DBMS_OUTPUT.PUT_LINE('Edad en bloque anidado: ' || V_EDAD);

   END; -- FIN BLOQUE ANIDADO
   
   DBMS_OUTPUT.PUT_LINE('Edad en bloque principal: ' || V_EDAD);

END;



-- EJEMPLO 2:


DECLARE

   V_NOMBRE VARCHAR2(50) := 'Juan';
   V_EDAD   NUMBER := 25;

BEGIN

   DBMS_OUTPUT.PUT_LINE('Nombre: ' || V_NOMBRE);
   
 

   DECLARE   -- INICIO BLOQUE ANIDADO

      V_EDAD NUMBER := 30;  -- ESTA VARIABLE SOLO EXISTE DENTRO DEL BLOQUE ANIDADO
      V_APELLIDO VARCHAR2(50) := 'Pérez';  -- VARIABLE SOLO VÁLIDA EN ESTE BLOQUE

   BEGIN

      DBMS_OUTPUT.PUT_LINE('Edad en bloque anidado: ' || V_EDAD);
      DBMS_OUTPUT.PUT_LINE('Apellido en bloque anidado: ' || V_APELLIDO);

   END; -- FIN BLOQUE ANIDADO
   
   DBMS_OUTPUT.PUT_LINE('Edad en bloque principal: ' || V_EDAD);

END;



-- EJEMPLO 3:



DECLARE

   V_NOMBRE VARCHAR2(50) := 'Juan';
   V_EDAD   NUMBER := 25;
   V_APELLIDO VARCHAR2(50); -- DECLARADA EN EL BLOQUE PRINCIPAL

BEGIN

   DBMS_OUTPUT.PUT_LINE('Nombre: ' || V_NOMBRE);
   
 

   DECLARE   -- INICIO BLOQUE ANIDADO

      V_EDAD NUMBER := 30;  -- ESTA VARIABLE SOLO EXISTE DENTRO DEL BLOQUE ANIDADO

   BEGIN
	
      V_APELLIDO := 'Pérez'; -- SE USA LA VARIABLE DEL BLOQUE PRINCIPAL
 
      DBMS_OUTPUT.PUT_LINE('Edad en bloque anidado: ' || V_EDAD);
      DBMS_OUTPUT.PUT_LINE('Apellido en bloque anidado: ' || V_APELLIDO);

   END; -- FIN BLOQUE ANIDADO
   
   DBMS_OUTPUT.PUT_LINE('Apellido en bloque principal: ' || V_APELLIDO);

END;



-- EJEMPLO 4:




DECLARE

   V_DIVISION NUMBER;

BEGIN

   BEGIN   -- INICIO BLOQUE ANIDADO

      V_DIVISION := 10 / 0; -- ERROR DE DIVISIÓN POR CERO
  
 EXCEPTION

      WHEN ZERO_DIVIDE THEN

         DBMS_OUTPUT.PUT_LINE('Error: División por cero en bloque anidado.');

   END; -- FIN BLOQUE ANIDADO
   
   DBMS_OUTPUT.PUT_LINE('Operación finalizada correctamente.');

END;





