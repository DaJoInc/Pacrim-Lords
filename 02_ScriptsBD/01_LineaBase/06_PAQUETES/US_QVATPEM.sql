prompt
prompt PACKAGE: US_QVATPEM
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.US_QVATPEM IS
    --
    -- ===========================================================
    -- US_QVATPEM
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
    
    PROCEDURE validarTipoEmps
    (
        p_tp_emprsa                    IN  EM_TTPEM.TPEM_DTEM%type,
        p_existencia_tptpem            OUT BOOLEAN,
        p_cod_rta                      OUT NE_TCRTA.CRTA_CRTA%type
    ); 

----------------------------------------------------------
    
END US_QVATPEM;
/


prompt
prompt PACKAGE BODY:US_QVATPEM
prompt

CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.US_QVATPEM IS


    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE validarTipoEmps
    -- -----------------------------------------------------------
    -- validar existencia de roll
    -- ===========================================================
    PROCEDURE validarTipoEmps
    (
        p_tp_emprsa                    IN  EM_TTPEM.TPEM_DTEM%type,
        p_existencia_tptpem            OUT BOOLEAN,
        p_cod_rta                      OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        
        CURSOR c_tp_empresa IS
            SELECT
                tpem_tpem
            FROM
                em_ttpem
            WHERE 
              tpem_dtem= p_tp_emprsa;

            r_tp_empresa c_tp_empresa%rowtype;
        
    BEGIN
      
        OPEN  c_tp_empresa;
        FETCH c_tp_empresa INTO r_tp_empresa;
        CLOSE c_tp_empresa;
        
        IF(r_tp_empresa.tpem_tpem IS NULL) then
        
            p_existencia_tptpem := TRUE;
            p_cod_rta         := 'OK';
            
        ELSE
            p_existencia_tptpem := FALSE;
            p_cod_rta         := 'ER_EMP_NUL';
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            p_existencia_tptpem := FALSE;
            p_cod_rta         := 'ERROR_NC';
        
    END validarTipoEmps;
    
END US_QVATPEM;
/