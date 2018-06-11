prompt
prompt PACKAGE: NE_QFLGNE
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.NE_QFLGNE IS
    --
    -- ===========================================================
    -- NE_QFLGNE
    -- -----------------------------------------------------------
    -- Todas las funciones del PSNA
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
    PROCEDURE consultarDepartamePais
    (
        p_nombre_Pais    IN  NE_TPSNE.PSNE_NAME%type,
        p_query_Pais     OUT NE_TPSNE.PSNE_NAME%type,
        p_ne_tdene       OUT NE_TT_NE_TDENE,
        p_cod_rta        OUT NE_TCRTA.CRTA_CRTA%type
    );
    -- ----------------------------------------------------- 
    PROCEDURE consultarCiudadxDepYPa
    (
        p_nombre_Pais    IN  NE_TPSNE.PSNE_NAME%type,
        p_nombre_Depa    IN  NE_TDENE.DENE_NAME%type,
        p_query_Pais     OUT NE_TPSNE.PSNE_NAME%type,
        p_query_dene     OUT NE_TDENE.DENE_DENE%type,
        p_ne_tcdne       OUT NE_TT_NE_TCDNE,
        p_cod_rta        OUT NE_TCRTA.CRTA_CRTA%type
    );
    

END NE_QFLGNE;
/


prompt
prompt PACKAGE BODY:NE_QFLGNE
prompt


CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.NE_QFLGNE IS
  
    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE consultarDepartamePais
    -- -----------------------------------------------------------
    -- obtiene el id de el usuario persona rol 
    -- ===========================================================
    PROCEDURE consultarDepartamePais
    (
        p_nombre_Pais    IN  NE_TPSNE.PSNE_NAME%type,
        p_query_Pais     OUT NE_TPSNE.PSNE_NAME%type,
        p_ne_tdene       OUT NE_TT_NE_TDENE,
        p_cod_rta        OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        v_query_pais            NE_TPSNE.PSNE_NAME%type;
        v_id_psne               NE_TPSNE.PSNE_NAME%type;
        v_cod_rta_consldepa     NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_conslpais     NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta               NE_TCRTA.CRTA_CRTA%type := 'ERROR';
        tt_ne_tt_NE_TDENE NE_TT_NE_TDENE := NE_TT_NE_TDENE();

    BEGIN  
        EM_QAPSNE.buscarPaisXDescrip
        (
            p_nombre_Pais             ,--IN  NE_TPSNE.PSNE_NAME%type,
            v_id_psne                 ,--OUT NE_TPSNE.PSNE_PSNE%type,
            v_cod_rta_conslpais         --OUT NE_TCRTA.CRTA_CRTA%type
        );
        IF (v_cod_rta_conslpais='OK' AND  v_id_psne IS NOT NULL) THEN 
        
        EM_QADENE.consultarDeparXPaisNegocio
        (
            v_id_psne                  ,--IN  NE_TPSNE.PSNE_PSNE%type,
            tt_ne_tt_NE_TDENE          ,--OUT NE_TT_NE_TDENE,
            v_cod_rta_consldepa         --OUT NE_TCRTA.CRTA_CRTA%type
        );


            IF (v_cod_rta_consldepa='OK'  AND tt_ne_tt_NE_TDENE.count>0 ) THEN
            
                v_query_pais := p_nombre_Pais;
                p_ne_tdene := tt_ne_tt_NE_TDENE;
                v_cod_rta   := 'OK';
            END IF;
        END IF;
        p_ne_tdene:= tt_ne_tt_NE_TDENE;
        p_cod_rta := v_cod_rta;
        p_query_Pais :=v_query_pais;
    EXCEPTION
        WHEN OTHERS THEN
            p_ne_tdene := NULL;
            p_cod_rta  := 'ERROR_NC';
        
    END consultarDepartamePais;

    -- ===========================================================
    -- PROCEDURE consultarDepartamePais
    -- -----------------------------------------------------------
    -- obtiene el id de el usuario persona rol 
    -- ===========================================================
    PROCEDURE consultarCiudadxDepYPa
    (
        p_nombre_Pais    IN  NE_TPSNE.PSNE_NAME%type,
        p_nombre_Depa    IN  NE_TDENE.DENE_NAME%type,
        p_query_Pais     OUT NE_TPSNE.PSNE_NAME%type,
        p_query_dene     OUT NE_TDENE.DENE_DENE%type,
        p_ne_tcdne       OUT NE_TT_NE_TCDNE,
        p_cod_rta        OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        --adan paises
        v_query_pais            NE_TPSNE.PSNE_NAME%type;
        v_id_psne               NE_TPSNE.PSNE_NAME%type;
        v_cod_rta_conslpais     NE_TCRTA.CRTA_CRTA%type;
        
        --adan depart
        v_id_dene               NE_TDENE.DENE_DENE%type;
        v_query_dene            NE_TPSNE.PSNE_NAME%type;
        v_cod_rta_consldepa     NE_TCRTA.CRTA_CRTA%type;
        
        --adan ciudade
        v_cod_rta_conslciu      NE_TCRTA.CRTA_CRTA%type;
        tt_ne_tt_ne_tcdne NE_TT_NE_TCDNE := NE_TT_NE_TCDNE();
        
        v_cod_rta               NE_TCRTA.CRTA_CRTA%type := 'ERROR';
    BEGIN  
        EM_QAPSNE.buscarPaisXDescrip
        (
            p_nombre_Pais             ,--IN  NE_TPSNE.PSNE_NAME%type,
            v_id_psne                 ,--OUT NE_TPSNE.PSNE_PSNE%type,
            v_cod_rta_conslpais         --OUT NE_TCRTA.CRTA_CRTA%type
        );
        DBMS_OUTPUT.PUT_LINE('dijo esto = ' || v_cod_rta_conslpais);
        IF (v_cod_rta_conslpais='OK' AND  v_id_psne IS NOT NULL) THEN 
        
            EM_QADENE.buscarestadXDescrip
            (
                p_nombre_Depa             ,--IN  NE_TDENE.DENE_NAME%type,
                v_id_dene                 ,--OUT NE_TDENE.DENE_DENE%type,
                v_cod_rta_consldepa                  --OUT NE_TCRTA.CRTA_CRTA%type
            );
            DBMS_OUTPUT.PUT_LINE('dijo esto = ' || v_cod_rta_consldepa);
            IF (v_cod_rta_consldepa='OK' AND  v_id_dene IS NOT NULL) THEN 
                
                EM_QACDNE.consultarCiudadNegocio
                (
                    v_id_psne                 ,--,IN  NE_TPSNE.PSNE_PSNE%type,
                    v_id_dene                 ,--,IN  NE_TDENE.DENE_DENE%type,
                    tt_ne_tt_ne_tcdne         ,--,OUT NE_TT_NE_TCDNE,
                    v_cod_rta_conslciu         -- OUT NE_TCRTA.CRTA_CRTA%type
                );
                DBMS_OUTPUT.PUT_LINE('dijo esto = ' || v_cod_rta_conslciu);
                    IF (v_cod_rta_conslciu='OK'  AND tt_ne_tt_ne_tcdne.count>0 ) THEN
                    
                        v_query_pais := p_nombre_Pais;
                        v_query_dene := v_id_dene;
                        p_ne_tcdne := tt_ne_tt_ne_tcdne;
                        v_cod_rta   := 'OK';
                    END IF;
            END IF;
        END IF;
        p_ne_tcdne:= tt_ne_tt_ne_tcdne;
        p_cod_rta := v_cod_rta;
        p_query_Pais :=v_query_pais;
        p_query_dene :=v_query_dene;
    EXCEPTION
        WHEN OTHERS THEN
            p_ne_tcdne := NULL;
            p_query_Pais :=NULL;
            p_cod_rta  := 'ERROR_NC';
        
    END consultarCiudadxDepYPa;
    
END NE_QFLGNE;
/