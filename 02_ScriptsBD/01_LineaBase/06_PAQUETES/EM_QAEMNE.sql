prompt
prompt PACKAGE: EM_QAEMNE
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.EM_QAEMNE IS
    --
    -- ===========================================================
    -- EM_QAEMNE
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
  
    PROCEDURE crearEmpresa
    (
        p_nombre_emprsa             IN  EM_TEMNE.EMNE_NOBE%type,
        p_nit_emprsa                IN  EM_TEMNE.EMNE_NITE%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    );
 
  PROCEDURE buscarEmpPorNoNit
    (
        p_nombre_emprsa             IN  EM_TEMNE.EMNE_NOBE%type,
        p_nit_emprsa                IN  EM_TEMNE.EMNE_NITE%type,
        p_id_emne                   OUT EM_TEMNE.EMNE_EMNE%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    
    PROCEDURE actualiEmpPorNoNit
    (
        p_nombre_emprsa             IN  EM_TEMNE.EMNE_NOBE%type,
        p_nit_emprsa                IN  EM_TEMNE.EMNE_NITE%type,
        p_n_nombre_emprsa           IN  EM_TEMNE.EMNE_NOBE%type,
        p_n_nit_emprsa              IN  EM_TEMNE.EMNE_NITE%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    -- ------------------------------------------------------------
    
END EM_QAEMNE;
/


prompt
prompt PACKAGE BODY:EM_QAEMNE
prompt


CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.EM_QAEMNE IS
  
     --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE crearEmpresa
    -- -----------------------------------------------------------
    -- creacion de usuaio dado atributos
    -- ===========================================================
    PROCEDURE crearEmpresa
    (
        p_nombre_emprsa             IN  EM_TEMNE.EMNE_NOBE%type,
        p_nit_emprsa                IN  EM_TEMNE.EMNE_NITE%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    )IS

        v_existencia_emprs      BOOLEAN;
        v_secuencia             NUMBER;
        v_cod_rta_tipo          NE_TCRTA.CRTA_CRTA%type;

    BEGIN  
        v_secuencia := SEM_TEMNE.NextVal;

        US_QVAEMNE.validarNombreEmps
        (
            p_nombre_emprsa,
            p_nit_emprsa,
            v_existencia_emprs,
            v_cod_rta_tipo
        );
          
        IF(v_existencia_emprs) THEN
            INSERT INTO em_temne (
                emne_emne,
                emne_nobe,
                emne_nite,
                emne_fecr,
                emne_femo
            ) VALUES (
                v_secuencia,
                p_nombre_emprsa,
                p_nit_emprsa,
                SYSDATE,
                null
            );
           p_cod_rta     := 'OK';
        ELSE
           p_cod_rta     := 'EMP_EXI_NE';
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
        
    END crearEmpresa;

    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE homologarCoreWebModulo
    -- -----------------------------------------------------------
    -- insersion type table core en type table web de roles y 
    -- modulos
    -- ===========================================================
    PROCEDURE buscarEmpPorNoNit
    (
        p_nombre_emprsa             IN  EM_TEMNE.EMNE_NOBE%type,
        p_nit_emprsa                IN  EM_TEMNE.EMNE_NITE%type,
        p_id_emne                   OUT EM_TEMNE.EMNE_EMNE%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    )IS

    CURSOR c_b_empres IS
            SELECT
                emne_emne
            FROM
                em_temne
            WHERE
                emne_nobe = p_nombre_emprsa AND
                emne_nite = p_nit_emprsa;

        r_b_empres c_b_empres%rowtype;

    BEGIN  

        OPEN  c_b_empres;
        FETCH c_b_empres INTO r_b_empres;
        CLOSE c_b_empres;
          
        IF(r_b_empres.emne_emne IS NOT NULL) THEN
          p_id_emne  :=  r_b_empres.emne_emne;
          p_cod_rta     := 'OK';
        ELSE
          p_cod_rta     := 'ERROR_EMP_NF';
         
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
        
    END buscarEmpPorNoNit;
    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE homologarWebCoreModulo
    -- -----------------------------------------------------------
    -- insersion type table web en type table core de roles y
    -- modulos
    -- ===========================================================
    PROCEDURE actualiEmpPorNoNit
    (
        p_nombre_emprsa             IN  EM_TEMNE.EMNE_NOBE%type,
        p_nit_emprsa                IN  EM_TEMNE.EMNE_NITE%type,
        p_n_nombre_emprsa           IN  EM_TEMNE.EMNE_NOBE%type,
        p_n_nit_emprsa              IN  EM_TEMNE.EMNE_NITE%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        v_existencia_emprs      BOOLEAN;
        v_id_emne            EM_TEMNE.EMNE_EMNE%type;
        v_cod_rta_tipo       NE_TCRTA.CRTA_CRTA%type;

    BEGIN  

        EM_QAEMNE.buscarEmpPorNoNit
        (
            p_nombre_emprsa, 
            p_nit_emprsa,
            v_id_emne,
            v_cod_rta_tipo                      
        );

        IF(v_id_emne IS NOT NULL) THEN
            US_QVAEMNE.validarNombreEmps
            (
                p_n_nombre_emprsa,
                p_n_nit_emprsa,
                v_existencia_emprs,
                v_cod_rta_tipo
            );
            IF(v_existencia_emprs) THEN
                
                UPDATE em_temne
                SET
                    emne_nobe =p_nombre_emprsa,
                    emne_nite =p_nit_emprsa,
                    emne_femo = SYSDATE
                WHERE
                    emne_emne = v_id_emne;
                
                p_cod_rta     := 'OK';
            ELSE
               p_cod_rta     := 'EMP_EXI_NE';
            END IF;
        ELSE
              p_cod_rta     := v_cod_rta_tipo;
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';

    END actualiEmpPorNoNit;
END EM_QAEMNE;