-- TABLAS ANIDADAS


-- SE UTILIZAN PARA ALMACENAR UNA SECUENCIA DE ELEMENTOS DEL MISMO TIPO.

-- TIENEN UNA CLAVE NUMÉRICA Y UN VALOR --> LA CLAVE ESTÁ BASADA EN UN ÍNDICE NUMÉRICO.

-- PUEDE SER USADA COMO UN VALOR DENTRO DE UNA COLUMNA DE UNA TABLA EN LA BASE DE DATOS.

-- TAMAÑO MÁXIMO DE UNA TABLA ANIDADA ES DE 2 GB.




-- SINTAXIS:

/*


DECLARE

TPYE TYPE_NOMBRE IS TABLE OF TIPO_DE_DATO


NOMBRE_VARIABLE TIPO_VARIABLE;


BEGIN




END;


*/





-- EJEMPLO 1:


DECLARE
   
   TYPE TABLA_NESTED IS TABLE OF VARCHAR2(100); 

   v_nombres TABLA_NESTED;  -- Variable de tipo tabla anidada.

BEGIN

   v_nombres := TABLA_NESTED();  

 
   v_nombres.EXTEND(3);    -- Extiende la tabla para 3 elementos.
                           -- SE DEBE INICIALIZAR SIEMPRE CON "EXTEND".


   v_nombres(1) := 'Juan Pérez';
   v_nombres(2) := 'María Gómez';
   v_nombres(3) := 'Carlos Ramírez';

   FOR i IN 1..v_nombres.COUNT LOOP

      DBMS_OUTPUT.PUT_LINE('Nombre ' || i || ': ' || v_nombres(i));

   END LOOP;
END;


-- EJEMPLO 2:


DECLARE

   TYPE TABLA_NESTED IS TABLE OF VARCHAR2(100);
   v_nombres TABLA_NESTED := TABLA_NESTED();  -- Inicialización

BEGIN

   v_nombres.EXTEND(3);  -- Extiende la tabla para 3 elementos

   v_nombres(1) := 'Juan Pérez';  
   v_nombres(2) := 'María Gómez';
   v_nombres(3) := 'Carlos Ramírez';
   
   FOR i IN 1..v_nombres.COUNT LOOP

      DBMS_OUTPUT.PUT_LINE('Nombre ' || i || ': ' || v_nombres(i));

   END LOOP;
END;



