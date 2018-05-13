prompt
prompt PACKAGE: US_QVROLL
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.US_QVROLL IS
    --
    -- ===========================================================
    -- US_QVROLL
    -- -----------------------------------------------------------
    -- validador de existencia de roll
    -- ===========================================================
    --
    -- #VERSION:0000001000
    --
    -- HISTORIAL DE CAMBIOS
    --
    -- Versión        GAP                Solicitud        Fecha        Realizó            Descripción
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------
    -- 
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------

    -- ============================================================
    -- Constantes generales a nivel de PAQUETE
    -- ============================================================
  
    
    -- ============================================================
    -- Declaracion de PROCEDIMIENTOS y FUNCIONES
    -- ============================================================
    
  PROCEDURE validarRollPorNombre
    (
        p_nombre_roll                  IN  US_TROLL.ROLL_RLDN%type,
        p_existencia_roll              OUT BOOLEAN,
        p_cod_rta                      OUT NE_TCRTA.CRTA_CRTA%type
    ); 

----------------------------------------------------------
    
END US_QVROLL;
/


prompt
prompt PACKAGE BODY:US_QVROLL
prompt

CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.US_QVROLL IS


    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE validarRollPorNombre
    -- -----------------------------------------------------------
    -- validar existencia de roll
    -- ===========================================================
    PROCEDURE validarRollPorNombre
    (
        p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
        p_existencia_roll           OUT BOOLEAN,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        
        CURSOR c_roll IS
            SELECT
                ROLL_RLDN
            FROM
                FS_PCRM_US.US_TROLL
            WHERE
                ROLL_RLDN = p_nombre_roll;

            r_roll c_roll%rowtype;
        
    BEGIN
      
        OPEN  c_roll;
        FETCH c_roll INTO r_roll;
        CLOSE c_roll;
        
        IF(r_roll.ROLL_RLDN IS NULL) then
        
            p_existencia_roll := TRUE;
            p_cod_rta         := 'OK';
            
        ELSE
            p_existencia_roll := FALSE;
            p_cod_rta         := 'ER_EMP_NUL';
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            p_existencia_roll := FALSE;
            p_cod_rta         := 'ERROR_NC';
        
    END validarRollPorNombre;
    
END US_QVROLL;
/