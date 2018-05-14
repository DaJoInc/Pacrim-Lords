prompt
prompt PACKAGE: EM_QVAFEMTE
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.EM_QVAFEMTE IS
    --
    -- ===========================================================
    -- EM_QVAFEMTE
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
    -- EM_QVATPEM
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------

    -- ============================================================
    -- Constantes generales a nivel de PAQUETE
    -- ============================================================
  
    
    -- ============================================================
    -- Declaracion de PROCEDIMIENTOS y FUNCIONES
    -- ============================================================
    
    PROCEDURE validarEmprTpNe
    (
        p_emne_emne                    IN  EM_TEMNE.EMNE_EMNE%type,
        p_tpem_tpem                    IN  EM_TTPEM.TPEM_TPEM%type,
        p_existencia_rolus             OUT BOOLEAN,
        p_cod_rta                      OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    
    
END EM_QVAFEMTE;
/


prompt
prompt PACKAGE BODY:EM_QVAFEMTE
prompt

CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.EM_QVAFEMTE IS


    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE validarTipoEmps
    -- -----------------------------------------------------------
    -- validar existencia de roll
    -- ===========================================================
    PROCEDURE validarEmprTpNe
    (
        p_emne_emne                    IN  EM_TEMNE.EMNE_EMNE%type,
        p_tpem_tpem                    IN  EM_TTPEM.TPEM_TPEM%type,
        p_existencia_rolus             OUT BOOLEAN,
        p_cod_rta                      OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        
        CURSOR c_fem_empre IS
            SELECT
                emte_emte
            FROM
                em_temte
            WHERE 
                emte_tpem = p_tpem_tpem  AND
                emte_emne = p_emne_emne;

            r_fem_empre c_fem_empre%rowtype;
        
    BEGIN
      
        OPEN  c_fem_empre;
        FETCH c_fem_empre INTO r_fem_empre;
        CLOSE c_fem_empre;
        
        IF(r_fem_empre.emte_emte IS NULL) then
        
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
        
    END validarEmprTpNe;
    
END EM_QVAFEMTE;
/