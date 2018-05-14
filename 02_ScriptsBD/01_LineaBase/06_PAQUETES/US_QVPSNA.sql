prompt
prompt PACKAGE: US_QVPSNA
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.US_QVPSNA IS
    --
    -- ===========================================================
    -- US_QVPSNA
    -- -----------------------------------------------------------
    -- validador de existencia de persona por documento
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
    
    PROCEDURE validarPersonaPorDoctEmail
    (
        p_documento_persona               IN  US_TPSNA.PSNA_NRID%type,
        p_email_persona                   IN  US_TPSNA.PSNA_EMAL%type,
        p_existencia_persona              OUT BOOLEAN,
        p_cod_rta                         OUT NE_TCRTA.CRTA_CRTA%type
    );

    PROCEDURE validarPersonaPorDoct
    (
        p_documento_persona               IN  US_TPSNA.PSNA_NRID%type,
        p_existencia_persona              OUT BOOLEAN,
        p_cod_rta                         OUT NE_TCRTA.CRTA_CRTA%type
    );    

----------------------------------------------------------
    
END US_QVPSNA;
/


prompt
prompt PACKAGE BODY:US_QVPSNA
prompt

CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.US_QVPSNA IS


    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE validarPersonaPorDoctEmail
    -- -----------------------------------------------------------
    -- validar existencia de persona por documento
    -- ===========================================================
    PROCEDURE validarPersonaPorDoctEmail
    (
        p_documento_persona               IN  US_TPSNA.PSNA_NRID%type,
        p_email_persona                   IN  US_TPSNA.PSNA_EMAL%type,
        p_existencia_persona              OUT BOOLEAN,
        p_cod_rta                         OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        
        CURSOR c_persona IS
            SELECT
                PSNA_NRID
            FROM
                FS_PCRM_US.US_TPSNA
            WHERE
                PSNA_NRID = p_documento_persona AND
                PSNA_EMAL = p_email_persona;

            r_persona c_persona%rowtype;
        
    BEGIN
      
        OPEN  c_persona;
        FETCH c_persona INTO r_persona;
        CLOSE c_persona;
        
        IF(r_persona.PSNA_NRID IS NULL) then
        
            p_existencia_persona := TRUE;
            p_cod_rta         := 'OK';
            
        ELSE
            p_existencia_persona := FALSE;
            p_cod_rta            := 'ER_EMP_NUL';
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            p_existencia_persona := FALSE;
            p_cod_rta            := 'ERROR_NC';
        
    END validarPersonaPorDoctEmail;
    
        -- ===========================================================
    -- PROCEDURE validarPersonaPorDoctEmail
    -- -----------------------------------------------------------
    -- validar existencia de persona por documento
    -- ===========================================================
    PROCEDURE validarPersonaPorDoct
    (
        p_documento_persona               IN  US_TPSNA.PSNA_NRID%type,
        p_existencia_persona              OUT BOOLEAN,
        p_cod_rta                         OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        
        CURSOR c_persona IS
            SELECT
                PSNA_NRID
            FROM
                FS_PCRM_US.US_TPSNA
            WHERE
                PSNA_NRID = p_documento_persona;

            r_persona c_persona%rowtype;
        
    BEGIN
      
        OPEN  c_persona;
        FETCH c_persona INTO r_persona;
        CLOSE c_persona;
        
        IF(r_persona.PSNA_NRID IS NULL) then
        
            p_existencia_persona := TRUE;
            p_cod_rta         := 'OK';
            
        ELSE
            p_existencia_persona := FALSE;
            p_cod_rta            := 'ER_EMP_NUL';
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            p_existencia_persona := FALSE;
            p_cod_rta            := 'ERROR_NC';
        
    END validarPersonaPorDoct;
    
END US_QVPSNA;
/