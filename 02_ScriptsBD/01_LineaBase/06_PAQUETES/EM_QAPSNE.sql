prompt
prompt PACKAGE: EM_QAPSNE
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.EM_QAPSNE IS
    --
    -- ===========================================================
    -- EM_QAPSNE
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

    PROCEDURE buscarPaisXDescrip
    (
        p_nombre_Pais             IN  NE_TPSNE.PSNE_NAME%type,
        p_id_psne                 OUT NE_TPSNE.PSNE_PSNE%type,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    
    PROCEDURE consultarPaisNegocio
    (
        p_psne_psne      IN  NE_TPSNE.PSNE_PSNE%type,
        p_ne_tpsne       OUT NE_TT_NE_TPSNE,
        p_cod_rta        OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    
    
    PROCEDURE consultarPaises
    (
        p_ne_tpsne       OUT NE_TT_NE_TPSNE,
        p_cod_rta        OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    -- ------------------------------------------------------------
    
END EM_QAPSNE;
/


prompt
prompt PACKAGE BODY:EM_QAPSNE
prompt


CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.EM_QAPSNE IS
  
     --
    -- #VERSION:0000001000
    --

    -- ===========================================================
    -- PROCEDURE buscarPaisXDescrip
    -- -----------------------------------------------------------
    -- Buscar pais por descripcion
    -- ===========================================================

    PROCEDURE buscarPaisXDescrip
    (
        p_nombre_Pais             IN  NE_TPSNE.PSNE_NAME%type,
        p_id_psne                 OUT NE_TPSNE.PSNE_PSNE%type,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    )IS

    CURSOR c_b_pais IS
        SELECT 
               PSNE_PSNE,
               PSNE_CODE,
               PSNE_NAME
        FROM NE_TPSNE
        WHERE 
        PSNE_NAME = p_nombre_Pais;

        r_b_pais c_b_pais%rowtype;

    BEGIN  

        OPEN  c_b_pais;
        FETCH c_b_pais INTO r_b_pais;
        CLOSE c_b_pais;
          
        IF(r_b_pais.PSNE_PSNE IS NOT NULL) THEN
          p_id_psne  :=  r_b_pais.PSNE_PSNE;
          p_cod_rta     := 'OK';
        ELSE
          p_cod_rta     := 'ERROR_PS_NF';
         
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            p_cod_rta  := 'ERROR_NC';
    
    END buscarPaisXDescrip;
    
    -- ===========================================================
    -- PROCEDURE consultarPaisNegocio
    -- -----------------------------------------------------------
    -- creacion de negocio por codigo Pais
    -- ===========================================================
    PROCEDURE consultarPaisNegocio
    (
        p_psne_psne      IN  NE_TPSNE.PSNE_PSNE%type,
        p_ne_tpsne       OUT NE_TT_NE_TPSNE,
        p_cod_rta        OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        CURSOR C_CONSULTA IS
        SELECT 
               PSNE_PSNE,
               PSNE_CODE,
               PSNE_NAME
        FROM NE_TPSNE
        WHERE 
        PSNE_PSNE = p_psne_psne;
        to_ne_to_ne_tpsne NE_TO_NE_TPSNE;
        tt_ne_tt_ne_tpsne NE_TT_NE_TPSNE := NE_TT_NE_TPSNE();
        v_crta_gral NE_TCRTA.CRTA_CRTA%type := 'OK';
    BEGIN
        FOR i IN C_CONSULTA LOOP
           to_ne_to_ne_tpsne := NE_TO_NE_TPSNE(
                           i.PSNE_PSNE,
                           i.PSNE_CODE,
                           i.PSNE_NAME);
        tt_ne_tt_ne_tpsne.extend;
        tt_ne_tt_ne_tpsne(tt_ne_tt_ne_tpsne.count):= to_ne_to_ne_tpsne;
        END LOOP;
        p_ne_tpsne:= tt_ne_tt_ne_tpsne;
        p_cod_rta := v_crta_gral;
    EXCEPTION WHEN OTHERS THEN
        p_cod_rta := 'ERROR';
    END;
    
        -- ===========================================================
    -- PROCEDURE consultarPaisNegocio
    -- -----------------------------------------------------------
    -- creacion de negocio por codigo Pais
    -- ===========================================================
    PROCEDURE consultarPaises
    (
        p_ne_tpsne       OUT NE_TT_NE_TPSNE,
        p_cod_rta        OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        CURSOR C_CONSULTA IS
        SELECT 
               PSNE_PSNE,
               PSNE_CODE,
               PSNE_NAME
        FROM NE_TPSNE;
        to_ne_to_ne_tpsne NE_TO_NE_TPSNE;
        tt_ne_tt_ne_tpsne NE_TT_NE_TPSNE := NE_TT_NE_TPSNE();
        v_crta_gral NE_TCRTA.CRTA_CRTA%type := 'OK';
    BEGIN
        FOR i IN C_CONSULTA LOOP
           to_ne_to_ne_tpsne := NE_TO_NE_TPSNE(
                           i.PSNE_PSNE,
                           i.PSNE_CODE,
                           i.PSNE_NAME);
        tt_ne_tt_ne_tpsne.extend;
        tt_ne_tt_ne_tpsne(tt_ne_tt_ne_tpsne.count):= to_ne_to_ne_tpsne;
        END LOOP;
        p_ne_tpsne:= tt_ne_tt_ne_tpsne;
        p_cod_rta := v_crta_gral;
    EXCEPTION WHEN OTHERS THEN
        p_cod_rta := 'ERROR';
    END;
END EM_QAPSNE;