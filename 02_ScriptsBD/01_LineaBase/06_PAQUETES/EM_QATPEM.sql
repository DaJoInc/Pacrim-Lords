prompt
prompt PACKAGE: EM_QATPEM
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.EM_QATPEM IS
    --
    -- ===========================================================
    -- EM_QATPEM
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
       ESTADO_ACTIVO_TP_NEGO    EM_TTPEM.TPEM_STEM%type := 'A';
       ESTADO_INACTIVO_TP_NEGO  EM_TTPEM.TPEM_STEM%type := 'I';
    -- ============================================================
    -- Declaracion de PROCEDIMIENTOS y FUNCIONES
    -- ============================================================
  
    PROCEDURE crearTpEmpresa
    (
        p_tp_emprsa             IN  EM_TTPEM.TPEM_DTEM%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    );
 
  PROCEDURE buscarEmpPorTpEmp
    (
        p_tp_emprsa             IN  EM_TTPEM.TPEM_DTEM%type,
       
        p_id_tpem                   OUT EM_TTPEM.tpem_tpem%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    
    PROCEDURE actualizaTpEmp
    (
        p_nom_tpemprsa        IN  EM_TTPEM.TPEM_DTEM%type,
        p_est_tpemprsa        IN  EM_TTPEM.TPEM_STEM%type,
        p_n_nom_tpemprsa      IN  EM_TTPEM.TPEM_DTEM%type,
        p_n_est_tpemprsa      IN  EM_TTPEM.TPEM_STEM%type,
        p_cod_rta             OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    -- ------------------------------------------------------------
    
END EM_QATPEM;
/


prompt
prompt PACKAGE BODY:EM_QATPEM
prompt


CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.EM_QATPEM IS
  
     --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE crearTpEmpresa
    -- -----------------------------------------------------------
    -- creacion de usuaio dado atributos
    -- ===========================================================
    PROCEDURE crearTpEmpresa
    (
        p_tp_emprsa             IN  EM_TTPEM.TPEM_DTEM%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    )IS

        v_existencia_tp_emprs   BOOLEAN;
        v_secuencia             NUMBER;
        v_cod_rta_tipo          NE_TCRTA.CRTA_CRTA%type;

    BEGIN  
        v_secuencia := SEM_TTPEM.NextVal;

        US_QVATPEM.validarTipoEmps
        (
            p_tp_emprsa,
            v_existencia_tp_emprs,
            v_cod_rta_tipo
        );
          
        IF(v_existencia_tp_emprs) THEN
        
            INSERT INTO em_ttpem (
                tpem_tpem,
                tpem_dtem,
                tpem_stem,
                tpem_fccr,
                tpem_fcmo
            ) VALUES (
                v_secuencia,
                p_tp_emprsa,
                ESTADO_ACTIVO_TP_NEGO,
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
        
    END crearTpEmpresa;

    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE homologarCoreWebModulo
    -- -----------------------------------------------------------
    -- insersion type table core en type table web de roles y 
    -- modulos
    -- ===========================================================
    PROCEDURE buscarEmpPorTpEmp
    (
        p_tp_emprsa           IN  EM_TTPEM.TPEM_DTEM%type,
        p_id_tpem             OUT EM_TTPEM.tpem_tpem%type,
        p_cod_rta             OUT NE_TCRTA.CRTA_CRTA%type
    )IS

    CURSOR c_b_tpempres IS
        SELECT
            tpem_tpem
        FROM
            em_ttpem
        WHERE 
            tpem_dtem= p_tp_emprsa AND
            tpem_stem= ESTADO_ACTIVO_TP_NEGO;

        r_b_tpempres c_b_tpempres%rowtype;

    BEGIN  

        OPEN  c_b_tpempres;
        FETCH c_b_tpempres INTO r_b_tpempres;
        CLOSE c_b_tpempres;
          
        IF(r_b_tpempres.tpem_tpem IS NOT NULL) THEN
          p_id_tpem  :=  r_b_tpempres.tpem_tpem;
          p_cod_rta     := 'OK';
        ELSE
          p_cod_rta     := 'ERROR_EMP_NF';
         
        END IF;
        
    EXCEPTION
        WHEN OTHERS THEN
            p_cod_rta  := 'ERROR_NC';
    
    END buscarEmpPorTpEmp;
    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE homologarWebCoreModulo
    -- -----------------------------------------------------------
    -- insersion type table web en type table core de roles y
    -- modulos
    -- ===========================================================
    PROCEDURE actualizaTpEmp
    (
        p_nom_tpemprsa        IN  EM_TTPEM.TPEM_DTEM%type,
        p_est_tpemprsa        IN  EM_TTPEM.TPEM_STEM%type,
        p_n_nom_tpemprsa      IN  EM_TTPEM.TPEM_DTEM%type,
        p_n_est_tpemprsa      IN  EM_TTPEM.TPEM_STEM%type,
        p_cod_rta             OUT NE_TCRTA.CRTA_CRTA%type
    )IS
    v_existencia_tp_emprs      BOOLEAN;
        v_id_tpem            EM_TTPEM.tpem_tpem%type;
        v_cod_rta_tipo       NE_TCRTA.CRTA_CRTA%type;

    BEGIN  

        EM_QATPEM.buscarEmpPorTpEmp
        (
            p_nom_tpemprsa, 
            v_id_tpem,
            v_cod_rta_tipo                      
        );

        IF(v_id_tpem IS NOT NULL) THEN
        
            US_QVATPEM.validarTipoEmps
            (
                p_n_nom_tpemprsa,
                v_existencia_tp_emprs,
                v_cod_rta_tipo
            );
            
            IF(v_existencia_tp_emprs) THEN
                
                UPDATE em_ttpem
                    SET
                        TPEM_DTEM = p_n_nom_tpemprsa,
                        TPEM_STEM = p_n_est_tpemprsa
                WHERE
                    tpem_tpem =v_id_tpem;
                
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

    END actualizaTpEmp;
    
END EM_QATPEM;