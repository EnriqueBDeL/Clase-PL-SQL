-- DELIMITADORES DE LITERALES DE CADENA


-- EJEMPLO 1:


DECLARE
    MENSAJE VARCHAR2(100);
BEGIN
    -- ASIGNAR UN LITERAL DE CADENA
    MENSAJE := 'HOLA, MUNDO!';
    
    DBMS_OUTPUT.PUT_LINE(MENSAJE);  -- IMPRIME: HOLA, MUNDO!
END;


----------------------------------------------------------------------------------

-- EJEMPLO 2:

DECLARE
    MENSAJE VARCHAR2(100);
BEGIN
    -- USAR COMILLAS DOBLES DENTRO DE UNA CADENA
    MENSAJE := 'ESTE ES UN EJEMPLO CON COMILLAS: ''PL/SQL''';
    
    DBMS_OUTPUT.PUT_LINE(MENSAJE);  -- IMPRIME: ESTE ES UN EJEMPLO CON COMILLAS: 'PL/SQL'
END;


----------------------------------------------------------------------------------

-- EJEMPLO 3:


DECLARE
    SALUDO VARCHAR2(50);
BEGIN
    -- CONCATENAR CADENAS
    SALUDO := 'HOLA ' || 'MUNDO ' || 'DESDE PL/SQL!';
    
    DBMS_OUTPUT.PUT_LINE(SALUDO);  -- IMPRIME: HOLA MUNDO DESDE PL/SQL!
END;


----------------------------------------------------------------------------------

-- EJEMPLO 4:


DECLARE
    MENSAJE VARCHAR2(100);
BEGIN
    -- ASIGNAR UNA CADENA VACÍA
    MENSAJE := '';
    
    IF MENSAJE IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('LA CADENA ESTÁ VACÍA');
    ELSE
        DBMS_OUTPUT.PUT_LINE('LA CADENA TIENE CONTENIDO');
    END IF;
END;


----------------------------------------------------------------------------------

-- EJEMPLO 5:


DECLARE
    MENSAJE VARCHAR2(100);
BEGIN
    -- USAR COMILLAS DOBLES DENTRO DE UNA CADENA
    MENSAJE := 'ÉL DIJO: "HOLA, ¿CÓMO ESTÁS?"';
    
    DBMS_OUTPUT.PUT_LINE(MENSAJE);  -- IMPRIME: ÉL DIJO: "HOLA, ¿CÓMO ESTÁS?"
END;


----------------------------------------------------------------------------------

-- EJEMPLO 6:


DECLARE
    MENSAJE VARCHAR2(100);
BEGIN
    -- MEZCLAR COMILLAS SIMPLES Y DOBLES
    MENSAJE := 'ÉL DIJO: "PL/SQL ES ''GENIAL''!"';
    
    DBMS_OUTPUT.PUT_LINE(MENSAJE);  -- IMPRIME: ÉL DIJO: "PL/SQL ES 'GENIAL'!"
END;


----------------------------------------------------------------------------------



-- EL PREFIJO Q EN PL/SQL PERMITE USAR DELIMITADORES PERSONALIZADOS (COMO ? O []) PARA DEFINIR LITERALES DE CADENA, FACILITANDO LA INCLUSIÓN DE COMILLAS
-- SIMPLES Y CARACTERES ESPECIALES SIN NECESIDAD DE ESCAPARLOS.




----------------------------------------------------------------------------------

-- EJEMPLO 7:


DECLARE
    NOMBRE VARCHAR2(100);
BEGIN
    -- USAR COMILLAS SIMPLES DENTRO DE LA CADENA CON DELIMITADOR PERSONALIZADO
    NOMBRE := Q'?MC'DONALL?';
    
    DBMS_OUTPUT.PUT_LINE(NOMBRE);  -- IMPRIME: MC'DONALL
END;


----------------------------------------------------------------------------------

-- EJEMPLO 8:


DECLARE
    NOMBRE VARCHAR2(100);
BEGIN
    -- USAR CORCHETES COMO DELIMITADORES
    NOMBRE := Q'[MC'DONALL]';
    
    DBMS_OUTPUT.PUT_LINE(NOMBRE);  -- IMPRIME: MC'DONALL
END;



