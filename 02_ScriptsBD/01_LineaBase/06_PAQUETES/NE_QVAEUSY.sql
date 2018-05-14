prompt
prompt PACKAGE: NE_QVAEUSY
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.NE_QVAEUSY IS
    --
    -- ===========================================================
    -- NE_QVAEUSY
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
    
    PROCEDURE validarUserEmp
    (
        p_id_emte_emte                 IN  EM_TEMTE.EMTE_EMTE%type,
        p_id_uspero                    IN  US_TPUSR.PUSR_PUSR%type,
        p_existencia_rolus             OUT BOOLEAN,
        p_cod_rta                      OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    
    
END NE_QVAEUSY;
/


prompt
prompt PACKAGE BODY:NE_QVAEUSY
prompt

CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.NE_QVAEUSY IS


    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE validarUserEmp
    -- -----------------------------------------------------------
    -- validar existencia de roll
    -- ===========================================================
    PROCEDURE validarUserEmp
    (
        p_id_emte_emte                 IN  EM_TEMTE.EMTE_EMTE%type,
        p_id_uspero                    IN  US_TPUSR.PUSR_PUSR%type,
        p_existencia_rolus             OUT BOOLEAN,
        p_cod_rta                      OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        
        CURSOR c_fu_usuemp IS
            SELECT
                emus_emus
            FROM
                ne_temus
            WHERE 
                emus_emte = p_id_emte_emte AND
                emus_pusr = p_id_uspero;

            r_fu_usuemp c_fu_usuemp%rowtype;
        
    BEGIN
      
        OPEN  c_fu_usuemp;
        FETCH c_fu_usuemp INTO r_fu_usuemp;
        CLOSE c_fu_usuemp;
        
        IF(r_fu_usuemp.emus_emus IS NULL) then
        
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
        
    END validarUserEmp;
    
END NE_QVAEUSY;
/