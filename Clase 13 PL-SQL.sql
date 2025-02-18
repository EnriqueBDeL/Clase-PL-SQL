-- SENTENCIA "IF"


-- LA SENTENCIA IF EN PL/SQL SE UTILIZA PARA TOMAR DECISIONES EN FUNCIÓN DE UNA CONDICIÓN. 
-- PERMITE EJECUTAR DIFERENTES BLOQUES DE CÓDIGO DEPENDIENDO DE SI LA CONDICIÓN ES VERDADERA O FALSA.



-- SINTAXIS:

/*


IF [CONDICION] THEN

-- CONDICION VERDADERA

ELSE


-- CONDICION FALSA (OPCIONAL)

END IF;


*/






-- EJEMPLO 1:


DECLARE

    V_SALARIO DECIMAL(10,2) := 3500;

BEGIN

    IF  V_SALARIO > 3000 THEN
        DBMS_OUTPUT.PUT_LINE('Salario es mayor a 3000');

    END IF;
END;







-- EJEMPLO 2:




DECLARE

    V_EDAD INT := 20;

BEGIN
    IF V_EDAD >= 18 THEN

        DBMS_OUTPUT.PUT_LINE('Eres mayor de edad');

    ELSE

        DBMS_OUTPUT.PUT_LINE('Eres menor de edad');

    END IF;

END;








-- EJEMPLO 3:



DECLARE

    V_NOTA INT := 85;

BEGIN

    IF V_NOTA >= 90 THEN

        DBMS_OUTPUT.PUT_LINE('Excelente');

    ELSIF V_NOTA >= 70 THEN

        DBMS_OUTPUT.PUT_LINE('Aprobado');

    ELSE

        DBMS_OUTPUT.PUT_LINE('Reprobado');

    END IF;

END;







