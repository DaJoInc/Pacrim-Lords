prompt
prompt PACKAGE: US_QFEMTE
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.US_QFEMTE IS
    --
    -- ===========================================================
    -- US_QFEMTE
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
     PROCEDURE obtenerEmNeId
    (
        p_nombre_emprsa           IN  EM_TEMNE.EMNE_NOBE%type,
        p_nit_emprsa              IN  EM_TEMNE.EMNE_NITE%type,
        p_tp_emprsa               IN  EM_TTPEM.TPEM_DTEM%type,
        p_id_emte_emte            OUT EM_TEMTE.EMTE_EMTE%type,
        p_id_emne_emne            OUT EM_TEMNE.EMNE_EMNE%type,
        p_id_tpem_tpem            OUT EM_TTPEM.TPEM_TPEM%type,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    );
    
    PROCEDURE crearEmpreNeg
    (
        p_nombre_emprsa           IN  EM_TEMNE.EMNE_NOBE%type,
        p_nit_emprsa              IN  EM_TEMNE.EMNE_NITE%type,
        p_tp_emprsa               IN  EM_TTPEM.TPEM_DTEM%type,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    );
    
    PROCEDURE asignarNegoEmp
    (
        p_nombre_emprsa           IN  EM_TEMNE.EMNE_NOBE%type,
        p_nit_emprsa              IN  EM_TEMNE.EMNE_NITE%type,
        p_tp_emprsa               IN  EM_TTPEM.TPEM_DTEM%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    );
    

END US_QFEMTE;
/


prompt
prompt PACKAGE BODY:US_QFEMTE
prompt


CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.US_QFEMTE IS
  
    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE obtenerEmpTpId
    -- -----------------------------------------------------------
    -- obtiene el id de el usuario persona rol 
    -- ===========================================================
     PROCEDURE obtenerEmNeId
    (
        p_nombre_emprsa           IN  EM_TEMNE.EMNE_NOBE%type,
        p_nit_emprsa              IN  EM_TEMNE.EMNE_NITE%type,
        p_tp_emprsa               IN  EM_TTPEM.TPEM_DTEM%type,
        p_id_emte_emte            OUT EM_TEMTE.EMTE_EMTE%type,
        p_id_emne_emne            OUT EM_TEMNE.EMNE_EMNE%type,
        p_id_tpem_tpem            OUT EM_TTPEM.TPEM_TPEM%type,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        cursor c_emne 
        (
            pc_emne_emne EM_TEMNE.EMNE_EMNE%type,
            pc_tpem_tpem EM_TTPEM.TPEM_TPEM%type
        )is
            SELECT
               *
            FROM
                EM_TEMNE en,
                EM_TTPEM te, 
                EM_TEMTE et
            WHERE
                en.EMNE_EMNE = et.EMTE_EMNE AND
                te.TPEM_TPEM = et.EMTE_TPEM AND
                et.EMTE_EMNE = pc_emne_emne AND
                et.EMTE_TPEM = pc_tpem_tpem;

        r_emne                c_emne%rowtype;
        v_id_emprsa             EM_TEMNE.EMNE_EMNE%type;
        v_id_tpemprsa           EM_TTPEM.TPEM_TPEM%type;
        v_cod_rta_bempre        NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_btpempre      NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_persona       NE_TCRTA.CRTA_CRTA%type;

    BEGIN  
        EM_QAEMNE.buscarEmpPorNoNit
        (
            p_nombre_emprsa,
            p_nit_emprsa,
            v_id_emprsa,
            v_cod_rta_bempre
        );
        EM_QATPEM.buscarTipoNeg
        (
            p_tp_emprsa,
            v_id_tpemprsa,
            v_cod_rta_btpempre
        );
        
        
        OPEN c_emne(v_id_emprsa,v_id_tpemprsa);
        FETCH c_emne INTO r_emne;
        CLOSE c_emne;

        IF  v_cod_rta_bempre='OK' AND v_cod_rta_btpempre='OK' AND r_emne.EMTE_EMTE IS NOT NULL THEN

            p_id_emte_emte := r_emne.EMTE_EMTE;
            p_id_emne_emne := r_emne.EMTE_EMNE;
            p_id_tpem_tpem := r_emne.EMTE_TPEM;
            p_cod_rta   := 'OK';
        ELSE
            p_id_emte_emte := NULL;
            p_id_emne_emne := NULL;
            p_id_tpem_tpem := NULL;
            p_cod_rta   := 'ER_EMP_NUL';
        END if;
        EXCEPTION
            WHEN OTHERS THEN
                p_id_emte_emte := NULL;
                p_id_emne_emne := NULL;
                p_id_tpem_tpem := NULL;
                p_cod_rta  := 'ERROR_NC';
            
    END obtenerEmNeId;

     --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE crearEmpreNeg
    -- -----------------------------------------------------------
    -- creacion de usuario persona y rol dado atributos
    -- ===========================================================
    PROCEDURE crearEmpreNeg
    (
        p_nombre_emprsa           IN  EM_TEMNE.EMNE_NOBE%type,
        p_nit_emprsa              IN  EM_TEMNE.EMNE_NITE%type,
        p_tp_emprsa               IN  EM_TTPEM.TPEM_DTEM%type,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        v_secuencia                 NUMBER;
        v_id_emprsa                 EM_TEMNE.EMNE_EMNE%type;
        v_id_tp_emprsa                 EM_TTPEM.TPEM_TPEM%type;
        v_cod_rta_bemp              NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_tpneg             NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_creem             NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_vupr              NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta                   NE_TCRTA.CRTA_CRTA%type;
        v_existencia_neemp          BOOLEAN;

    BEGIN  
        v_secuencia := SEM_TEMTE.NextVal;
        
        EM_QATPEM.buscarTipoNeg
        (
            p_tp_emprsa,
            v_id_tp_emprsa,
            v_cod_rta_tpneg
        
        );
        
        EM_QAEMNE.buscarEmpPorNoNit
        (
            p_nombre_emprsa,
            p_nit_emprsa,
            v_id_emprsa,
            v_cod_rta_bemp
        );
        
        IF  v_cod_rta_tpneg='OK' THEN
            IF  v_cod_rta_bemp <> 'OK'  THEN
                
                EM_QAEMNE.crearEmpresa
                (
                    p_nombre_emprsa  ,
                    p_nit_emprsa,
                    v_id_emprsa,
                    v_cod_rta_creem
                );
            ELSE
                v_cod_rta_creem := 'OK';
            END IF;
            
            EM_QVAFEMTE.validarEmprTpNe
            (
                v_id_emprsa        ,
                v_id_tp_emprsa     ,
                v_existencia_neemp ,
                v_cod_rta_vupr          
            );
        
            IF  (v_existencia_neemp) AND v_cod_rta_creem= 'OK'  THEN
                    
                INSERT INTO em_temte (
                    emte_emte,
                    emte_dtcr,
                    emte_dtmo,
                    emte_tpem,
                    emte_emne
                ) VALUES (
                    v_secuencia,
                    sysdate,
                    null,
                    v_id_tp_emprsa,
                    v_id_emprsa
                );
                   v_cod_rta     := 'OK';
                   COMMIT;
            ELSE
                v_cod_rta     := 'ER_YA_EMP_NE';
                
            END IF;
            
        ELSE
            v_cod_rta     := 'ER_NO_TPNG';
        
        END IF;
        p_cod_rta  := v_cod_rta;
      
    EXCEPTION
       WHEN OTHERS THEN
           p_cod_rta  := 'ERROR_NC' || SQLERRM;
           ROLLBACK;
    END crearEmpreNeg;
    
    -- ===========================================================
    -- PROCEDURE asignarNegoEmp
    -- -----------------------------------------------------------
    -- creacion de usuario persona y rol dado atributos
    -- ===========================================================
    PROCEDURE asignarNegoEmp
    (
        p_nombre_emprsa           IN  EM_TEMNE.EMNE_NOBE%type,
        p_nit_emprsa              IN  EM_TEMNE.EMNE_NITE%type,
        p_tp_emprsa               IN  EM_TTPEM.TPEM_DTEM%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        v_secuencia                 NUMBER;
        v_id_emprsa                 EM_TEMNE.EMNE_EMNE%type;
        v_id_tpemprsa               EM_TTPEM.TPEM_TPEM%type;
        v_cod_rta_valemne           NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_bempre            NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_tpneg             NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_persona           NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_vupr              NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta                   NE_TCRTA.CRTA_CRTA%type;
        v_existencia_neemp          BOOLEAN;

    BEGIN  
        v_secuencia := SEM_TEMTE.NextVal;

        EM_QATPEM.buscarTipoNeg
        (
            p_tp_emprsa,
            v_id_tpemprsa,
            v_cod_rta_tpneg
        
        );
        
        IF  v_cod_rta_tpneg ='OK'  THEN
        
            EM_QAEMNE.buscarEmpPorNoNit
            (
                p_nombre_emprsa,
                p_nit_emprsa,
                v_id_emprsa,
                v_cod_rta_bempre
            );
            
            EM_QVAFEMTE.validarEmprTpNe
            (
                v_id_emprsa        ,
                v_id_tpemprsa      ,
                v_existencia_neemp ,
                v_cod_rta_valemne          
            );
            
            IF  (v_existencia_neemp)  THEN
                IF  v_cod_rta_valemne='OK' AND v_cod_rta_bempre='OK' THEN
                    INSERT INTO em_temte (
                        emte_emte,
                        emte_dtcr,
                        emte_dtmo,
                        emte_tpem,
                        emte_emne
                    ) VALUES (
                        v_secuencia,
                        sysdate,
                        null,
                        v_id_tpemprsa,
                        v_id_emprsa
                    );
                   v_cod_rta     := 'OK';
                   COMMIT;
                ELSE
                   v_cod_rta     := 'ER_NULL';
                   ROLLBACK;
                END IF;
            ELSE
                v_cod_rta     := 'ER_YA_NE_EMP';
            
            END IF;
            
        ELSE
            v_cod_rta     := 'ER_NO_ROL';
        END IF;
        p_cod_rta  := v_cod_rta;
    EXCEPTION
       WHEN OTHERS THEN
           p_cod_rta  := 'ERROR_NC';
           ROLLBACK;
    
    END asignarNegoEmp;
    
    
END US_QFEMTE;
/