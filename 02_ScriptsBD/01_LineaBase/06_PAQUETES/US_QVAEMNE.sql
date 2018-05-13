prompt
prompt PACKAGE: US_QVAEMNE
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.US_QVAEMNE IS
    --
    -- ===========================================================
    -- US_QVAEMNE
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
    
    PROCEDURE validarNombreEmps
    (
        p_nombre_emprsa                IN  EM_TEMNE.EMNE_NOBE%type,
        p_nit_emprsa                   IN  EM_TEMNE.EMNE_NITE%type,
        p_existencia_emps              OUT BOOLEAN,
        p_cod_rta                      OUT NE_TCRTA.CRTA_CRTA%type
    ); 

----------------------------------------------------------
    
END US_QVAEMNE;
/


prompt
prompt PACKAGE BODY:US_QVAEMNE
prompt

CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.US_QVAEMNE IS


    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE validarNombreEmps
    -- -----------------------------------------------------------
    -- validar existencia de roll
    -- ===========================================================
   PROCEDURE validarNombreEmps
    (
        p_nombre_emprsa                IN  EM_TEMNE.EMNE_NOBE%type,
        p_nit_emprsa                   IN  EM_TEMNE.EMNE_NITE%type,
        p_existencia_emps              OUT BOOLEAN,
        p_cod_rta                      OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        
        CURSOR c_empresa IS
        SELECT
            emne_emne
        FROM
            em_temne
        WHERE
            emne_nobe = p_nombre_emprsa,
            emne_nite = p_nit_emprsa;

            r_empresa c_empresa%rowtype;
        
    BEGIN
      
        OPEN  c_empresa;
        FETCH c_empresa INTO r_empresa;
        CLOSE c_empresa;
        
        IF(r_empresa.emne_emne IS NULL) then
        
            p_existencia_emps := TRUE;
            p_cod_rta         := 'OK';
            
        ELSE
            p_existencia_emps := FALSE;
            p_cod_rta         := 'ER_EMP_NUL';
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            p_existencia_emps := FALSE;
            p_cod_rta         := 'ERROR_NC';
        
    END validarNombreEmps;
    
END US_QVAEMNE;
/