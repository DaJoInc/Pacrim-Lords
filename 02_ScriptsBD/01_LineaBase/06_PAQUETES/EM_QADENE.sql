prompt
prompt PACKAGE: EM_QADENE
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.EM_QADENE IS
    --
    -- ===========================================================
    -- EM_QADENE
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

    PROCEDURE buscarestadXDescrip
    (
        p_nombre_Depa             IN  NE_TDENE.DENE_NAME%type,
        p_id_dene                 OUT NE_TDENE.DENE_DENE%type,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    
    PROCEDURE consultarDeparNegocio
    (
        p_dene_dene      IN  NE_TDENE.DENE_DENE%type,
        p_id_psne        IN  NE_TPSNE.PSNE_PSNE%type,
        p_ne_tdene       OUT NE_TT_NE_TDENE,
        p_cod_rta        OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    
    PROCEDURE consultarDeparXPaisNegocio
    (
        p_id_psne        IN  NE_TPSNE.PSNE_PSNE%type,
        p_ne_tdene       OUT NE_TT_NE_TDENE,
        p_cod_rta        OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    -- ------------------------------------------------------------
    
END EM_QADENE;
/


prompt
prompt PACKAGE BODY:EM_QADENE
prompt


CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.EM_QADENE IS
  
     --
    -- #VERSION:0000001000
    --

    -- ===========================================================
    -- PROCEDURE buscarestadXDescrip
    -- -----------------------------------------------------------
    -- Buscar pais por descripcion
    -- ===========================================================

    PROCEDURE buscarestadXDescrip
    (
        p_nombre_Depa             IN  NE_TDENE.DENE_NAME%type,
        p_id_dene                 OUT NE_TDENE.DENE_DENE%type,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    )IS

    CURSOR c_b_depa IS
         SELECT 
            DENE_DENE
         FROM NE_TDENE
         WHERE 
         DENE_NAME = p_nombre_Depa;

        r_b_depa c_b_depa%rowtype;

    BEGIN  

        OPEN  c_b_depa;
        FETCH c_b_depa INTO r_b_depa;
        CLOSE c_b_depa;
          
        IF(r_b_depa.DENE_DENE IS NOT NULL) THEN
          p_id_dene  :=  r_b_depa.DENE_DENE;
          p_cod_rta     := 'OK';
        ELSE
          p_cod_rta     := 'ERROR_PS_NF';
         
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            p_cod_rta  := 'ERROR_NC';
    
    END buscarestadXDescrip;
    
    -- ===========================================================
    -- PROCEDURE consultarDeparNegocio
    -- -----------------------------------------------------------
    -- creacion de negocio por codigo Pais
    -- ===========================================================
    PROCEDURE consultarDeparNegocio
    (
        p_dene_dene      IN  NE_TDENE.DENE_DENE%type,
        p_id_psne        IN  NE_TPSNE.PSNE_PSNE%type,
        p_ne_tdene       OUT NE_TT_NE_TDENE,
        p_cod_rta        OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        CURSOR C_CONSULTA IS
         SELECT 
                DENE_DENE,
                DENE_CODE,
                DENE_NAME,
                DENE_PSNE
         FROM NE_TDENE
         WHERE 
            DENE_DENE = p_dene_dene
        AND 
            DENE_PSNE =p_id_psne;
         
         to_ne_to_NE_TDENE NE_TO_NE_TDENE;
         tt_ne_tt_NE_TDENE NE_TT_NE_TDENE := NE_TT_NE_TDENE();
         v_crta_gral NE_TCRTA.CRTA_CRTA%type := 'OK';
    BEGIN
        FOR i IN C_CONSULTA LOOP
            to_ne_to_ne_tdene := NE_TO_NE_TDENE(
                            i.DENE_DENE,
                            i.DENE_CODE,
                            i.DENE_NAME,
                            i.DENE_PSNE);
        tt_ne_tt_ne_tdene.extend;
        tt_ne_tt_ne_tdene(tt_ne_tt_ne_tdene.count):= to_ne_to_ne_tdene;
        END LOOP;
        p_ne_tdene:= tt_ne_tt_ne_tdene;
        p_cod_rta := v_crta_gral;
    EXCEPTION WHEN OTHERS THEN
        p_cod_rta := 'ERROR';
    END consultarDeparNegocio;
    
        -- ===========================================================
    -- PROCEDURE consultarDeparXPaisNegocio
    -- -----------------------------------------------------------
    -- creacion de negocio por codigo Pais
    -- ===========================================================
    PROCEDURE consultarDeparXPaisNegocio
    (
        p_id_psne        IN  NE_TPSNE.PSNE_PSNE%type,
        p_ne_tdene       OUT NE_TT_NE_TDENE,
        p_cod_rta        OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        CURSOR C_CONSULTA IS
         SELECT 
                DENE_DENE,
                DENE_CODE,
                DENE_NAME,
                DENE_PSNE
         FROM NE_TDENE
         WHERE 
            DENE_PSNE =p_id_psne;
         
         to_ne_to_NE_TDENE NE_TO_NE_TDENE;
         tt_ne_tt_NE_TDENE NE_TT_NE_TDENE := NE_TT_NE_TDENE();
         v_crta_gral NE_TCRTA.CRTA_CRTA%type := 'OK';
    BEGIN
        FOR i IN C_CONSULTA LOOP
            to_ne_to_ne_tdene := NE_TO_NE_TDENE(
                            i.DENE_DENE,
                            i.DENE_CODE,
                            i.DENE_NAME,
                            i.DENE_PSNE);
        tt_ne_tt_ne_tdene.extend;
        tt_ne_tt_ne_tdene(tt_ne_tt_ne_tdene.count):= to_ne_to_ne_tdene;
        END LOOP;
        p_ne_tdene:= tt_ne_tt_ne_tdene;
        p_cod_rta := v_crta_gral;
    EXCEPTION WHEN OTHERS THEN
        p_cod_rta := 'ERROR';
    END consultarDeparXPaisNegocio;
END EM_QADENE;