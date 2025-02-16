-- DML (DATA MANIPULATION LANGUAGE - LENGUAJE DE MANIPULACIÓN DE DATOS)



-- EL DML PERMITE MANIPULAR LOS DATOS DENTRO DE LAS TABLAS DE UNA BASE DE DATOS.




-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||



-- TABLA PARA LOS EJEMPLOS:


CREATE TABLE COCHES (  
    ID NUMBER PRIMARY KEY,  
    MARCA VARCHAR2(50),  
    MODELO VARCHAR2(50),  
    PRECIO NUMBER  
);  




-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||




-- SENTENCIA "INSERT":


-- LA SENTENCIA INSERT SE USA PARA AGREGAR NUEVAS FILAS A UNA TABLA EN UNA BASE DE DATOS.



-- EJEMPLO 1:

BEGIN  

    INSERT INTO COCHES (ID, MARCA, MODELO, PRECIO) VALUES (1, 'TOYOTA', 'COROLLA', 25000);  

END; 




-- EJEMPLO 2:


BEGIN  

    INSERT INTO COCHES (ID, MARCA, MODELO, PRECIO) VALUES (2, 'FORD', 'FIESTA', 18000);  
    INSERT INTO COCHES (ID, MARCA, MODELO, PRECIO) VALUES (3, 'HONDA', 'CIVIC', 22000);  
    INSERT INTO COCHES (ID, MARCA, MODELO, PRECIO) VALUES (4, 'BMW', 'SERIE 3', 40000);  
    INSERT INTO COCHES (ID, MARCA, MODELO, PRECIO) VALUES (5, 'MERCEDES', 'CLASE A', 38000);  

END;  




-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||



-- SENTENCIA "UPDATE":

-- LA SENTENCIA UPDATE SE USA PARA MODIFICAR LOS DATOS DE FILAS EXISTENTES EN UNA TABLA.  




-- EJEMPLO 1:


BEGIN  

    UPDATE COCHES SET PRECIO = 26000 WHERE ID = 1; 
  
END;  




-- EJEMPLO 2:


BEGIN  

    UPDATE COCHES SET PRECIO = 19000 WHERE ID = 2;  
    UPDATE COCHES SET PRECIO = 23000 WHERE ID = 3;  
    UPDATE COCHES SET PRECIO = 42000 WHERE ID = 4;  
    UPDATE COCHES SET PRECIO = 39000 WHERE ID = 5;  

END;  



-- EJEMPLO 3:


BEGIN  

    UPDATE COCHES  
    SET  
        PRECIO = 27000,  
        MODELO = 'COROLLA X'  

    WHERE ID = 1;  

END;  




-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||


-- TABLAS PARA EJEMPLO "MARGE":

CREATE TABLE COCHES_NUEVOS (  
    ID NUMBER PRIMARY KEY,  
    MARCA VARCHAR2(50),  
    MODELO VARCHAR2(50),  
    PRECIO NUMBER  
);  



-- DATOS:

BEGIN  

    INSERT INTO COCHES_NUEVOS (ID, MARCA, MODELO, PRECIO) VALUES (1, 'TOYOTA', 'COROLLA', 26000); 
    INSERT INTO COCHES_NUEVOS (ID, MARCA, MODELO, PRECIO) VALUES (2, 'FORD', 'FIESTA', 19000);  
    INSERT INTO COCHES_NUEVOS (ID, MARCA, MODELO, PRECIO) VALUES (4, 'BMW', 'SERIE 3', 40000);  

END;  


-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||




-- SENTENCIA "MARGE":

-- LA SENTENCIA MERGE SE USA PARA INSERTAR, ACTUALIZAR O ELIMINAR REGISTROS, DEPENDIENDO DE SI YA EXISTEN O NO EN OTRA TABLA.


-- SINTAXIS:


/* 

BEGIN

MERGE INTO [TABLA]
USING [TABLA]
ON (CONDICION)

WHEN MATCHED THEN
--CODIGO INSERT, UPDATE

WHEN NOT MATCHED
--CODIGO INSERT, UPDATE

END;

*/





-- EJEMPLO:



BEGIN  

    MERGE INTO COCHES C  
    USING COCHES_NUEVOS CN  
    ON (C.ID = CN.ID)  


    WHEN MATCHED THEN  -- SI EL ID EXISTE EN AMBAS TABLAS --> SE ACTUALIZAN EL PRECIO Y MODELO.  

        UPDATE SET C.PRECIO = CN.PRECIO, C.MODELO = CN.MODELO  



    WHEN NOT MATCHED THEN  -- SI EL ID NO EXISTE EN LA TABLA COCHES --> SE INSERTA COMO NUEVO REGISTRO.  

        INSERT (ID, MARCA, MODELO, PRECIO) VALUES (CN.ID, CN.MARCA, CN.MODELO, CN.PRECIO);  

END;  



-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||



-- SENTENCIA "DELETE":


-- LA SENTENCIA DELETE SE USA PARA ELIMINAR FILAS DE UNA TABLA SEGÚN UNA CONDICIÓN.  


-- EJEMPLO 1:

BEGIN  

    DELETE FROM COCHES WHERE ID = 3;  

END;  


-- EJEMPLO 2:

BEGIN  

    DELETE FROM COCHES WHERE PRECIO < 20000;  

END;



-- EJEMPLO 3:


BEGIN  

    DELETE FROM COCHES;  -- BORRA TODAS LAS FILAS

END;  



