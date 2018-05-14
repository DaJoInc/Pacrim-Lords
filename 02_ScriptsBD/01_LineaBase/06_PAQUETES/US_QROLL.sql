prompt
prompt PACKAGE: US_QROLL
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.US_QROLL IS
    --
    -- ===========================================================
    -- US_QROLL
    -- -----------------------------------------------------------
    -- Todas las funciones del roll
    -- ===========================================================
    --
    -- #VERSION:0000001000
    --
    -- HISTORIAL DE CAMBIOS
    --
    -- Versi�n        GAP                Solicitud        Fecha        Realiz�            Descripci�n
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------
    -- 
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------

    -- ============================================================
    -- Constantes generales a nivel de PAQUETE
    -- ============================================================
  
    
    -- ============================================================
    -- Declaracion de PROCEDIMIENTOS y FUNCIONES
    -- ============================================================
  
  PROCEDURE crearRoll
    (
        p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
        p_id_roll                   OUT US_TROLL.ROLL_ROLL%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    );
 
  PROCEDURE buscarRollPorNombre
    (
        p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
        p_id_roll                   OUT US_TROLL.ROLL_ROLL%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    
  PROCEDURE actualizarRoll
    (
        p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
        p_nombre_roll_act           IN  US_TROLL.ROLL_RLDN%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    -- ------------------------------------------------------------
    
END US_QROLL;
/


prompt
prompt PACKAGE BODY:US_QROLL
prompt


CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.US_QROLL IS
  
     --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE crearroll
    -- -----------------------------------------------------------
    -- creacion de usuaio dado atributos
    -- ===========================================================
    PROCEDURE crearRoll
    (
        p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
        p_id_roll                   OUT US_TROLL.ROLL_ROLL%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    )IS

        v_existencia_roll       BOOLEAN;
        v_secuencia             NUMBER;
        v_cod_rta_tipo          NE_TCRTA.CRTA_CRTA%type;

    BEGIN  
        v_secuencia := US_SETROLL.NextVal;

        US_QVROLL.validarRollPorNombre
        (
            p_nombre_roll,
            v_existencia_roll,
            v_cod_rta_tipo
        );
          
        IF(v_existencia_roll) THEN
          INSERT INTO US_TROLL(
            ROLL_ROLL,
            ROLL_RLDN,
            ROLL_FCMO
          )
          VALUES(
            v_secuencia,
            p_nombre_roll,
            sysdate
          );
           p_id_roll     := v_secuencia;
           p_cod_rta     := 'OK';
        ELSE
           p_cod_rta     := 'ER_NULL';
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
        
    END crearRoll;

    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE homologarCoreWebModulo
    -- -----------------------------------------------------------
    -- insersion type table core en type table web de roles y 
    -- modulos
    -- ===========================================================
    PROCEDURE buscarRollPorNombre
    (
        p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
        p_id_roll                   OUT US_TROLL.ROLL_ROLL%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    )IS

    CURSOR c_roll IS
        SELECT 
            ROLL_ROLL
        FROM
            FS_PCRM_US.US_TROLL
        WHERE
            ROLL_RLDN = p_nombre_roll;

        r_roll c_roll%rowtype;

    BEGIN  

        OPEN  c_roll;
        FETCH c_roll INTO r_roll;
        CLOSE c_roll;
          
        IF(r_roll.ROLL_ROLL IS NOT NULL) THEN
          p_id_roll  :=  r_roll.ROLL_ROLL;
          p_cod_rta     := 'OK';
        ELSE
          p_id_roll  := NULL;
          p_cod_rta     := 'ER_NULL';
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_id_roll  := NULL;
                p_cod_rta  := 'ERROR_NC';
        
    END buscarRollPorNombre;
    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE homologarWebCoreModulo
    -- -----------------------------------------------------------
    -- insersion type table web en type table core de roles y
    -- modulos
    -- ===========================================================
    PROCEDURE actualizarRoll
    (
        p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
        p_nombre_roll_act           IN  US_TROLL.ROLL_RLDN%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    )IS
    
        v_id_roll            US_TROLL.ROLL_ROLL%type;
        v_cod_rta_tipo       NE_TCRTA.CRTA_CRTA%type;

    BEGIN  

        US_QROLL.buscarRollPorNombre
        (
            p_nombre_roll,             
            v_id_roll,
            v_cod_rta_tipo                      
        );

        IF(v_id_roll IS NOT NULL) THEN

            UPDATE 
                FS_PCRM_US.US_TROLL
            SET 
                ROLL_RLDN = p_nombre_roll_act,
                ROLL_FCMO = sysdate
            WHERE 
                ROLL_ROLL = v_id_roll;

              p_cod_rta     := 'OK';
        ELSE
              p_cod_rta     := v_cod_rta_tipo;
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';

    END actualizarRoll;
END US_QROLL;