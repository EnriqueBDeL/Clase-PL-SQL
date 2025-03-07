-- EXCEPCIONES



-- SON ADVERTENCIAS O CONDICIONES DE ERROR QUE OCURREN DURENTE LA EJECUCIÓN DE UN CÓDIGO QUE NO TIENE ERRORES DE SINTAXIS, LO QUE QUIERE DECIR QUE AUNQUE EL BLOQUE SE EJECUTE CORRECTAMENTE, AL EJECUTARLO, SE GENERA UN MENSAJE DE ERROR O ADVERTENCIA.



-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||




-- TIPOS DE EXCEPCIONES:


-- IMPLICITA: SE GENERAN AUTOMATICAMENTE POR ORACLE. 


	-- TIPOS:


	-- EXCEPCIONES PREDEFINIDAS: DEFINIDAS EN PL/SQL CON UN NOMBRE ESPECÍFICO.

	-- EXCEPCIONES NO PREDEFINIDA: ERRORES ESTÁNDAR DE ORACLE QUE NO TIENE UN NOMBRE ASIGNADO.




-- EXPLICITA: EL USUARIO PUEDE DEFINIR SUS PROPIAS EXCEPCIONES, UTILIZANDO LA PALABRA CLAVE "EXCEPTION".






-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||





-- SINTAXIS GENERAL DE LAS EXCEPCIONES:


/*




DECLARE



BEGIN


 EXCEPTION


	WHEN EXCEPCION1 THEN 

		CODIGO DE EXCEPCION....


	
	WHEN EXCEPCION2 THEN 

		CODIGO DE EXCEPCION....

    
END;



*/




-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- TABALA PARA EJEMPLOS:


CREATE TABLE CICLISTAS_EB (
    ID_CICLISTA NUMBER PRIMARY KEY,
    NOMBRE VARCHAR2(100),
    EDAD NUMBER
);


INSERT INTO CICLISTAS_EB VALUES (1, 'Juan Pérez', 25);
INSERT INTO CICLISTAS_EB VALUES (2, 'María Gómez', 30);
INSERT INTO CICLISTAS_EB VALUES (3, 'Carlos Ramírez', 23);




-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||




-- EJEMPLO EXCEPCION IMPLICITA:




DECLARE  

   V_NOMBRE CICLISTAS_EB.NOMBRE%TYPE;

BEGIN  

   SELECT NOMBRE INTO V_NOMBRE  
   FROM CICLISTAS_EB  
   WHERE ID_CICLISTA = 9999;  

EXCEPTION  

   WHEN NO_DATA_FOUND THEN  -- "NO_DATA_FOUND" ES UNA EXCEPCION QUE EXISTE YA EN ORACLE, LA CUAL SALTA CUANDO UN "SELECT INTO" NO DEVUELVE NINGUNA FILA.
    
      DBMS_OUTPUT.PUT_LINE('No se encontró ningún ciclista con ese ID.');  

END;





-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- EJEMPLO EXCEPCION EXPLICITA



DECLARE

    V_ID_CICLISTA NUMBER := 4; 
    V_NOMBRE VARCHAR2(100) := 'Luis Fernández';
    V_EDAD NUMBER := 19;  
    
    E_EDAD_INVALIDA EXCEPTION;  -- DECLARAMOS LA EXCEPCION

BEGIN

    IF V_EDAD < 21 THEN

        RAISE E_EDAD_INVALIDA;  -- LANZAMOS EXCEPCION

    END IF;

    INSERT INTO CICLISTAS_EB (ID_CICLISTA, NOMBRE, EDAD) 
    VALUES (V_ID_CICLISTA, V_NOMBRE, V_EDAD);

    DBMS_OUTPUT.PUT_LINE('Ciclista agregado correctamente.');

EXCEPTION

    WHEN E_EDAD_INVALIDA THEN

        DBMS_OUTPUT.PUT_LINE('ERROR: No se pueden registrar ciclistas menores de 21 años.');

END;




-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||




-- TIPOS DE EXCEPCIONES PREDEFINIDAS EN ORACLE.


-- NOMBRE DE EXCEPCIÓN          NÚMERO DE ERROR DE SERVIDOR    DESCRIPCIÓN
-- -----------------------------------------------------------------------------------
-- ACCESS_INTO_NULL            ORA06530                        SE HA INTENTADO ASIGNAR VALORES A LOS ATRIBUTOS DE UN OBJETO NO INICIALIZADO
-- CASE_NOT_FOUND              ORA06592                        NINGUNA DE LAS OPCIONES DE LAS CLÁUSULAS WHEN DE UNA SENTENCIA CASE ESTÁ SELECCIONADA Y NO HAY NINGUNA CLÁUSULA ELSE
-- COLLECTION_IS_NULL          ORA06531                        SE HA INTENTADO APLICAR MÉTODOS DE RECOPILACIÓN DISTINTOS DE EXISTS A UNA TABLA O VARRAY ANIDADA NO INICIALIZADA
-- CURSOR_ALREADY_OPEN         ORA06511                        SE HA INTENTADO ABRIR UN CURSOR YA ABIERTO
-- DUP_VAL_ON_INDEX            ORA00001                        SE HA INTENTADO INSERTAR UN VALOR DUPLICADO
-- INVALID_CURSOR              ORA01001                        SE HA PRODUCIDO UNA OPERACIÓN DE CURSOR NO VÁLIDA
-- INVALID_NUMBER              ORA01722                        FALLO DE CONVERSIÓN DE CADENA DE CARACTERES A NÚMERO
-- LOGIN_DENIED                ORA01017                        CONEXIÓN A SERVIDOR DE ORACLE CON UN NOMBRE DE USUARIO O CONTRASEÑA NO VÁLIDOS
-- NO_DATA_FOUND               ORA01403                        SELECT DE UNA SOLA FILA NO HA DEVUELTO NINGÚN DATO
-- NOT_LOGGED_ON               ORA01012                        EL PROGRAMA PL/SQL EMITE UNA LLAMADA DE BASE DE DATOS SIN CONECTARSE AL SERVIDOR DE ORACLE
-- PROGRAM_ERROR               ORA06501                        PL/SQL TIENE UN PROBLEMA INTERNO
-- ROWTYPE_MISMATCH            ORA06504                        LA VARIABLE DE CURSOR DEL HOST Y LA VARIABLE DE CURSOR DE PL/SQL DE UNA ASIGNACIÓN TIENEN TIPOS DE RETORNO INCOMPATIBLES
-- STORAGE_ERROR               ORA06500                        PL/SQL SE HA QUEDADO SIN MEMORIA O ESTÁ CORROMPIDA
-- SUBSCRIPT_BEYOND_COUNT      ORA06533                        SE HACE REFERENCIA A UNA TABLA ANIDADA O ELEMENTO VARRAY UTILIZANDO UN NÚMERO DE ÍNDICE MAYOR QUE EL NÚMERO DE ELEMENTOS EN LA RECOPILACIÓN
-- SUBSCRIPT_OUTSIDE_LIMIT     ORA06532                        SE HACE REFERENCIA A UNA TABLA ANIDADA O ELEMENTO VARRAY UTILIZANDO UN NÚMERO DE ÍNDICE QUE QUEDA FUERA DEL RANGO VÁLIDO (-1 POR EJEMPLO)
-- SYS_INVALID_ROWID          ORA01410                        LA CONVERSIÓN DE UNA CADENA DE CARACTERES EN ROWID UNIVERSAL FALLA PORQUE LA CADENA DE CARACTERES NO REPRESENTA UNA ROWID VÁLIDA
-- TIMEOUT_ON_RESOURCE        ORA00051                        SE HA PRODUCIDO UN TIMEOUT MIENTRAS EL SERVIDOR DE ORACLE ESPERABA UN RECURSO
-- TOO_MANY_ROWS              ORA01422                        SELECT DE UNA SOLA FILA HA DEVUELTO VARIAS FILAS
-- VALUE_ERROR                 ORA06502                        SE HA PRODUCIDO UN ERROR ARITMÉTICO, DE CONVERSIÓN, DE TRUNCAMIENTO O DE RESTRICCIÓN DE TAMAÑO
-- ZERO_DIVIDE                 ORA01476                        SE HA INTENTADO DIVIDIR ENTRE CERO


-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||



-- EJEMPLO CON UNA EXCEPCION PREDEFINIDA:

DECLARE

    V_NOMBRE CICLISTAS_EB.NOMBRE%TYPE;
    V_ID_CICLISTA NUMBER := 100;

BEGIN

    SELECT NOMBRE 
    INTO V_NOMBRE 
    FROM CICLISTAS_EB 
    WHERE ID_CICLISTA = V_ID_CICLISTA;
    
    DBMS_OUTPUT.PUT_LINE('Ciclista encontrado: ' || V_NOMBRE);

EXCEPTION

    WHEN NO_DATA_FOUND THEN

        DBMS_OUTPUT.PUT_LINE('No se encontró ningún ciclista con el ID ' || V_ID_CICLISTA);
        
END;




-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||



-- EXCEPCIONES DEFINIDAS POR EL USUARIO:


-- SON AQUELLAS QUE EL PROGRAMADOR PUEDE CREAR PARA MEJORAR SITUACIONES ESPECÍFICAS QUE NO ESTÁM CUBIERTAS POR LA EXCEPCIONES PREDETERMINADAS DE ORACLE.




-- ¿CÓMO SE CREAN?


-- DECLARAR LA EXCEPCIÓN: SE DECLARA EN LA SECCIÓN DECLARE DEL BLOQUE PL/SQL, ESPECIFICANDO UN NOMBRE PARA LA EXCEPCIÓN.

-- EMITIR LA EXCEPCIÓN: SE EMITE EXPLÍCITAMENTE UTILIZANDO LA SENTENCIA RAISE PARA LANZAR LA EXCEPCIÓN CUANDO SE CUMPLA UNA CONDICIÓN ESPECÍFICA.

-- MANEJO DE LA EXCEPCIÓN: DESPUÉS DE EMITIR LA EXCEPCIÓN, SE PUEDE MANEJAR EN LA SECCIÓN EXCEPTION UTILIZANDO LA CLÁUSULA WHEN, PARA TOMAR UNA ACCIÓN ESPECÍFICA CUANDO ESA EXCEPCIÓN OCURRA.






-- [ LAS EXCEPCIONES EXPLÍCITAS Y EXCEPCIONES DEFINIDAS POR EL USUARIO SON LO MISMO. ]






-- EJEMPLO:

DECLARE
 
   E_MAXIMO_CICLISTAS EXCEPTION;   -- EXCEPCIÓN DEFINIDA POR EL USUARIO
   

   V_ID_CICLISTA NUMBER := 5;
   V_ID_EQUIPO NUMBER := 3;
   V_NUM_CICLISTAS NUMBER;

BEGIN

   SELECT COUNT(*) 
   INTO V_NUM_CICLISTAS
   FROM CICLISTAS_EB
   WHERE ID_EQUIPO = V_ID_EQUIPO;


   IF V_NUM_CICLISTAS >= 2 THEN

      RAISE E_MAXIMO_CICLISTAS;  -- LANZAMOS LA EXCEPCIÓN EXPLÍCITAMENTE

   END IF;



   UPDATE CICLISTAS_EB
   SET ID_EQUIPO = V_ID_EQUIPO
   WHERE ID_CICLISTA = V_ID_CICLISTA;

   DBMS_OUTPUT.PUT_LINE('CICLISTA ASIGNADO AL EQUIPO CON ÉXITO.');


EXCEPTION

   WHEN E_MAXIMO_CICLISTAS THEN

      DBMS_OUTPUT.PUT_LINE('ERROR: EL EQUIPO CON ID ' || V_ID_EQUIPO || ' YA TIENE EL MÁXIMO DE CICLISTAS.');

      
END;




-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- EXCEPCIONES CON LOS ERRORES ESTÁNDAR DE ORACLE:


-- SE PUEDEN CREAR EXCEPCIONES QUE ESTÁN BASADAS EN ERRORES ESTÁNDAR DE LA BASE DE DATOS. ESTOS ERRORES PUEDEN SER LOS MISMOS QUE ORACLE GENERA AUTOMÁTICAMENTE EN CASO DE UNA FALLA EN UNA OPERACIÓN SQL.




-- SENTENCIAS IMPORTANTES:


-- "PRAGMA EXCEPTION_INIT": SE UTILIZA PARA ASOCIAR UNA EXCEPCIÓN DEFINIDA POR EL USUARIO CON UN ERROR ESPECÍFICO DE ORACLE.


-- "SQLCODE": DEVUELVE EL CÓDIGO NUMÉRICO DEL ERROR.


-- "SQLERRM" DEVUELVE EL MENSAJE DE ERROR ASOCIADO AL CÓDIGO DE ERROR.







-- EJEMPLO 1:

 

DECLARE

    E_UNIQUE_VIOLATION EXCEPTION;  

     
    PRAGMA EXCEPTION_INIT(E_UNIQUE_VIOLATION, -00001);  -- USAMOS PRAGMA EXCEPTION_INIT PARA ASOCIAR EL ERROR DE ORACLE -00001 (VIOLACIÓN DE CLAVE ÚNICA) CON NUESTRA EXCEPCIÓN


BEGIN
   

    INSERT INTO CICLISTAS_EB (ID_CICLISTA, NOMBRE, EDAD) VALUES (1, 'Juan Pérez', 25);  -- ESTE ID YA EXISTE

EXCEPTION

    WHEN E_UNIQUE_VIOLATION THEN

        DBMS_OUTPUT.PUT_LINE('Error: El ID ya existe.');
    
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Otro error ocurrió: ' || SQLERRM);     -- CAPTURAMOS CUALQUIER OTRO ERROR QUE PUEDA OCURRIR
      

END;





-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- EJEMPLO 2:



DECLARE

    E_UNIQUE_VIOLATION EXCEPTION;  
    

    PRAGMA EXCEPTION_INIT(E_UNIQUE_VIOLATION, -00001);  

BEGIN

    INSERT INTO CICLISTAS_EB (ID_CICLISTA, NOMBRE, EDAD) VALUES (1, 'Juan Pérez', 25);  -- ESTE ID YA EXISTE

EXCEPTION


    WHEN E_UNIQUE_VIOLATION THEN

        DBMS_OUTPUT.PUT_LINE('Error: El ID ya existe.');
        DBMS_OUTPUT.PUT_LINE('Código de error: ' || SQLCODE);  
    

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Otro error ocurrió: ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('Código de error: ' || SQLCODE); 

END;





-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



-- EJEMPLO 3:



DECLARE

    EX_GENERIC_ERROR EXCEPTION;

BEGIN
  
    DECLARE
        V_RESULT NUMBER;
    BEGIN
        V_RESULT := 10 / 0;  -- ESTO GENERARÁ UN ERROR DE DIVISIÓN POR CERO
    END;

EXCEPTION

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Se produjo un error: ' || SQLERRM);  
END;







-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||




-- PROPAGACIÓN DE EXCEPCIONES EN UN SUBBLOQUE:

-- CUANDO EN PL/SQL OCURRE UNA EXCEPCIÓN DENTRO DE UN SUBBLOQUE, PUEDE MANEJARSE ALLÍ MISMO O PROPAGARSE AL BLOQUE SUPERIOR.



-- CASOS POSIBLES:

-- LA EXCEPCIÓN SE MANEJA EN EL SUBBLOQUE. --> EL PROGRAMA CONTINUA FUNCIOANDO CORRECTAMENTE DESPUES DEL SUBBLOQUE.

-- LA EXCEPCIÓN NO SE MANEJA EN EL SUBBLOQUE. --> LA EXCEPCION SE PROPAGA  AL BLOQUE SUPERIOR HASTA ENCONTRAR UN MENEJADOR.

-- NINGÚN BLOQUE MANEJA LA EXCEPCIÓN. --> EL PROGRAMA FALLA Y MUESTRA UN ERROR.






-- EJEMPLO "LA EXCEPCIÓN SE MANEJA EN EL SUBBLOQUE.":


DECLARE

    V_NUM NUMBER := 10;

BEGIN

    DBMS_OUTPUT.PUT_LINE('INICIO DEL BLOQUE PRINCIPAL');

    DECLARE

        V_DIV NUMBER;

    BEGIN

        DBMS_OUTPUT.PUT_LINE('INICIO DEL SUBBLOQUE');

        V_DIV := V_NUM / 0;   -- GENERARÁ UN ERROR POR DIVISIÓN ENTRE CERO

        
        DBMS_OUTPUT.PUT_LINE('ESTO NO SE EJECUTARÁ'); -- SE OMITE SI OCURRE ERROR


    EXCEPTION
    
        WHEN ZERO_DIVIDE THEN

            DBMS_OUTPUT.PUT_LINE('ERROR: DIVISIÓN ENTRE CERO MANEJADA EN SUBBLOQUE');

    END; -- TERMINA SUBBLOQUE Y SE RETOMA EL CONTROL EN EL BLOQUE PRINCIPAL


    DBMS_OUTPUT.PUT_LINE('CONTINÚA EJECUCIÓN DEL BLOQUE PRINCIPAL');

END;




-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- EJEMPLO "LA EXCEPCIÓN NO SE MANEJA EN EL SUBBLOQUE.":



DECLARE

    V_NUM NUMBER := 10;

BEGIN

    DBMS_OUTPUT.PUT_LINE('INICIO DEL BLOQUE PRINCIPAL');

    DECLARE

        V_DIV NUMBER;

    BEGIN
        DBMS_OUTPUT.PUT_LINE('INICIO DEL SUBBLOQUE');

        V_DIV := V_NUM / 0;   -- GENERA ERROR POR DIVISIÓN ENTRE CERO


        DBMS_OUTPUT.PUT_LINE('ESTO NO SE EJECUTARÁ'); -- SE OMITE SI OCURRE ERROR

    END; -- NO HAY MANEJO DE ERROR AQUÍ, SE PROPAGA AL BLOQUE PRINCIPAL
 
   DBMS_OUTPUT.PUT_LINE('ESTO NO SE EJECUTARÁ'); -- SE OMITE SI OCURRE ERROR

EXCEPTION

    WHEN ZERO_DIVIDE THEN

        DBMS_OUTPUT.PUT_LINE('ERROR: DIVISIÓN ENTRE CERO MANEJADA EN BLOQUE PRINCIPAL');

END;




-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- EJEMPLO "NINGÚN BLOQUE MANEJA LA EXCEPCIÓN.":


DECLARE

    V_NUM NUMBER := 10;

BEGIN
    DBMS_OUTPUT.PUT_LINE('INICIO DEL BLOQUE PRINCIPAL');

    DECLARE

        V_DIV NUMBER;

    BEGIN
        DBMS_OUTPUT.PUT_LINE('INICIO DEL SUBBLOQUE');

        V_DIV := V_NUM / 0;     -- GENERA ERROR POR DIVISIÓN ENTRE CERO


        DBMS_OUTPUT.PUT_LINE('ESTO NO SE EJECUTARÁ');

    END; -- NO HAY MANEJO DE ERROR, SE PROPAGA

    DBMS_OUTPUT.PUT_LINE('ESTO TAMPOCO SE EJECUTARÁ'); -- SE OMITE POR ERROR

END;






-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||



-- PORCEDIMIENTO "RAISE_APPLICATION_ERROR":


-- SE USA PARA GENERAR ERRORES PERSONALIZADOS DENTRO DE UN BLOQUE O SUBBLOQUE.


-- SINTAXIS:

/*


RAISE_APPLICATION_ERROR (NUMERO_DE_ERROR, MENSAJE [, {TRUE | FALSE}]);



-- TRUE | FALSE:
--	TRUE: EL ERROR SE COLOCA EN LA PILA DE ERRORES ANTERIORES.
--	FALSE: EL ERROR SUSTITUYE A LOS ANTERIORES.


*/



-- EJEMPLO 1 "EN UN BLOQUE ANÓNIMO":


DECLARE

    V_SALDO NUMBER := -100;

BEGIN

    IF V_SALDO < 0 THEN

        RAISE_APPLICATION_ERROR(-20001, 'Error: el saldo no puede ser negativo');

    END IF;

    DBMS_OUTPUT.PUT_LINE('Esto no se ejecutará si hay error');

END;


-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- EJEMPLO 2 "EN UN PROCEDIMIENTO":


CREATE OR REPLACE PROCEDURE VALIDAR_RETIRO (
    P_SALDO NUMBER,
    P_MONTO NUMBER
) AS

BEGIN

    IF P_MONTO > P_SALDO THEN

        RAISE_APPLICATION_ERROR(-20002, 'Error: fondos insuficientes');

    END IF;

    DBMS_OUTPUT.PUT_LINE('Retiro exitoso');

END;



-- LLAMADA:

BEGIN

    VALIDAR_RETIRO(500, 700);  -- INTENTA RETIRAR MÁS DINERO DEL QUE TIENE

END;







