prompt
prompt PACKAGE: EM_QACDNE
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.EM_QACDNE IS
    --
    -- ===========================================================
    -- EM_QACDNE
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

    PROCEDURE buscarciudaXDescrip
    (
        p_nombre_Depa             IN  NE_TCDNE.CDNE_NAME%type,
        p_id_psne                 IN  NE_TPSNE.PSNE_PSNE%type,
        p_id_dene                 IN  NE_TDENE.DENE_DENE%type,
        p_id_cdne                 OUT NE_TCDNE.CDNE_CDNE%type,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    
    PROCEDURE consultarCiudadNegocio
    (
        p_id_psne        IN  NE_TPSNE.PSNE_PSNE%type,
        p_id_dene        IN  NE_TDENE.DENE_DENE%type,
        p_ne_tcdne       OUT NE_TT_NE_TCDNE,
        p_cod_rta        OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    -- ------------------------------------------------------------
    
END EM_QACDNE;

/


prompt
prompt PACKAGE BODY:EM_QACDNE
prompt


CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.EM_QACDNE IS
  
     --
    -- #VERSION:0000001000
    --

    -- ===========================================================
    -- PROCEDURE buscarciudaXDescrip
    -- -----------------------------------------------------------
    -- Buscar pais por descripcion
    -- ===========================================================

    PROCEDURE buscarciudaXDescrip
    (
        p_nombre_Depa             IN  NE_TCDNE.CDNE_NAME%type,
        p_id_psne                 IN  NE_TPSNE.PSNE_PSNE%type,
        p_id_dene                 IN  NE_TDENE.DENE_DENE%type,
        p_id_cdne                 OUT NE_TCDNE.CDNE_CDNE%type,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    )IS

    CURSOR c_b_cida IS
    SELECT 
        CDNE_CDNE
    FROM NE_TCDNE
    WHERE 
        CDNE_NAME = p_nombre_Depa
    AND CDNE_DENE = p_id_dene
    AND CDNE_PSNE = p_id_psne;

        r_b_cida c_b_cida%rowtype;

    BEGIN  

        OPEN  c_b_cida;
        FETCH c_b_cida INTO r_b_cida;
        CLOSE c_b_cida;
          
        IF(r_b_cida.CDNE_CDNE IS NOT NULL) THEN
          p_id_cdne  :=  r_b_cida.CDNE_CDNE;
          p_cod_rta     := 'OK';
        ELSE
          p_cod_rta     := 'ERROR_PS_NF';
         
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            p_cod_rta  := 'ERROR_NC';
    
    END buscarciudaXDescrip;
    
    -- ===========================================================
    -- PROCEDURE consultarCiudadNegocio
    -- -----------------------------------------------------------
    -- creacion de negocio por codigo Pais
    -- ===========================================================
    PROCEDURE consultarCiudadNegocio
    (
        p_id_psne        IN  NE_TPSNE.PSNE_PSNE%type,
        p_id_dene        IN  NE_TDENE.DENE_DENE%type,
        p_ne_tcdne       OUT NE_TT_NE_TCDNE,
        p_cod_rta        OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        CURSOR C_CONSULTA IS
        SELECT 
               CDNE_CDNE,
               CDNE_LTUD,
               CDNE_LOTD,
               CDNE_NAME,
               CDNE_DENE,
               CDNE_PSNE
        FROM NE_TCDNE
        WHERE 
            CDNE_DENE = p_id_dene
        AND CDNE_PSNE = p_id_psne;
         
        to_ne_to_ne_tcdne NE_TO_NE_TCDNE;
        tt_ne_tt_ne_tcdne NE_TT_NE_TCDNE := NE_TT_NE_TCDNE();
         v_crta_gral NE_TCRTA.CRTA_CRTA%type := 'OK';
    BEGIN
        FOR i IN C_CONSULTA LOOP
            to_ne_to_ne_tcdne := NE_TO_NE_TCDNE(
                            i.CDNE_CDNE,
                            i.CDNE_LTUD,
                            i.CDNE_LOTD,
                            i.CDNE_NAME,
                            i.CDNE_DENE,
                            i.CDNE_PSNE);
        tt_ne_tt_ne_tcdne.extend;
        tt_ne_tt_ne_tcdne(tt_ne_tt_ne_tcdne.count):= to_ne_to_ne_tcdne;
        END LOOP;
        p_ne_tcdne:= tt_ne_tt_ne_tcdne;
        p_cod_rta := v_crta_gral;
    EXCEPTION WHEN OTHERS THEN
        p_cod_rta := 'ERROR';
    END consultarCiudadNegocio;
    
END EM_QACDNE;
