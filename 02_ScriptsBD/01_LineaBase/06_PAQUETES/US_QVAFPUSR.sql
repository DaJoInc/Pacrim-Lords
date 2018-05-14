prompt
prompt PACKAGE: US_QVAFPUSR
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.US_QVAFPUSR IS
    --
    -- ===========================================================
    -- US_QVAFPUSR
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
    
    PROCEDURE validarUserRolSys
    (
        p_id_usuario                   IN  US_TUSER.USER_USER%type,
        p_id_roll                      IN  US_TROLL.ROLL_ROLL%type,
        p_id_persona                   IN  US_TPSNA.PSNA_PSNA%type,
        p_existencia_rolus             OUT BOOLEAN,
        p_cod_rta                      OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    
    
END US_QVAFPUSR;
/


prompt
prompt PACKAGE BODY:US_QVAFPUSR
prompt

CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.US_QVAFPUSR IS


    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE validarTipoEmps
    -- -----------------------------------------------------------
    -- validar existencia de roll
    -- ===========================================================
    PROCEDURE validarUserRolSys
    (
        p_id_usuario                   IN  US_TUSER.USER_USER%type,
        p_id_roll                      IN  US_TROLL.ROLL_ROLL%type,
        p_id_persona                   IN  US_TPSNA.PSNA_PSNA%type,
        p_existencia_rolus             OUT BOOLEAN,
        p_cod_rta                      OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        
        CURSOR c_fu_usuario IS
            SELECT
                pusr_pusr
            FROM
                us_tpusr
            WHERE 
               pusr_user = p_id_usuario AND
               pusr_roll = p_id_roll   AND
               pusr_psna = p_id_persona;

            r_fu_usuario c_fu_usuario%rowtype;
        
    BEGIN
      
        OPEN  c_fu_usuario;
        FETCH c_fu_usuario INTO r_fu_usuario;
        CLOSE c_fu_usuario;
        
        IF(r_fu_usuario.pusr_pusr IS NULL) then
        
            p_existencia_rolus := TRUE;
            p_cod_rta         := 'OK';
            
        ELSE
            p_existencia_rolus := FALSE;
            p_cod_rta         := 'ER_EMP_NUL';
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            p_existencia_rolus := FALSE;
            p_cod_rta         := 'ERROR_NC';
        
    END validarUserRolSys;
    
END US_QVAFPUSR;
/