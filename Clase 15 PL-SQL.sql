-- BUCLES




-- LOOP (BUCLE INFINITO CON SALIDA MANUAL):

-- ESTE BUCLE SE EJECUTA INDEFINIDAMENTE HASTA QUE SE ENCUENTRA UNA SENTENCIA "EXIT".



-- SINTAXIS:

/*


LOOP  

   -- INSTRUCCIONES A EJECUTAR  

    EXIT WHEN [CONDICIÓN];  

END LOOP;


*/





-- EJEMPLO:


DECLARE  

    V_CONTADOR NUMBER := 1;  

BEGIN  

    LOOP  

        DBMS_OUTPUT.PUT_LINE('ITERACIÓN: ' ||  V_CONTADOR);
  
         V_CONTADOR :=  V_CONTADOR + 1;  

        EXIT WHEN  V_CONTADOR > 5;  -- TERMINA EL BUCLE CUANDO CONTADOR > 5  

    END LOOP;  
END;




--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||



-- WHILE LOOP (BUCLE CONDICIONAL)


-- SE EJECUTA MIENTRAS SE CUMPLA UNA CONDICIÓN.
-- SI LA CONDICIÓN ES FALSA DESDE EL INICIO, EL BUCLE NO SE EJECUTA NUNCA.


-- SINTAXIS:


/*


WHILE [CONDICIÓN] LOOP 
 
    -- INSTRUCCIONES A EJECUTAR 
 
END LOOP;


*/





-- EJEMPLO: 


DECLARE  

    V_CONTADOR NUMBER := 1;  

BEGIN  

    WHILE V_CONTADOR <= 5 LOOP  

        DBMS_OUTPUT.PUT_LINE('ITERACIÓN: ' || V_CONTADOR);  
        V_CONTADOR := V_CONTADOR + 1;  

    END LOOP;  
END;



--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||



-- FOR LOOP (BUCLE CON CONTADOR AUTOMÁTICO):


-- ES UN BUCLE QUE SE UTILIZA CUANDO YA SE SABE CUÁNTAS VECES SE VA A REPETIR EL CÓDIGO.
-- NO NECESITA QUE DECLARES NI INCREMENTES MANUALMENTE EL CONTADOR.
-- EL PL/SQL SE ENCARGA AUTOMÁTICAMENTE DE CONTROLAR EL CICLO.




-- SINTAXIS:

/*


FOR VARIABLE IN INICIO..FINAL LOOP 
 
    -- INSTRUCCIONES A EJECUTAR  

END LOOP;


*/





-- EJEMPLO:


BEGIN  

    FOR I IN 1..5 LOOP  

        DBMS_OUTPUT.PUT_LINE('ITERACIÓN: ' || I); 

    END LOOP;  

END;








