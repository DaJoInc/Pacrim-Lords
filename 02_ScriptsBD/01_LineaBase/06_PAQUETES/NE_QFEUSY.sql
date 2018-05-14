prompt
prompt PACKAGE: NE_QFEUSY
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.NE_QFEUSY IS
    --
    -- ===========================================================
    -- NE_QFEUSY
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
    PROCEDURE obtenerUsEmSy
    (
        p_nombre_roll             IN  US_TROLL.ROLL_RLDN%type,
        p_nombre_usuario          IN  US_TUSER.USER_ALAS%type,
        p_documento_persona       IN  US_TPSNA.PSNA_NRID%type,
        p_nombre_emprsa           IN  EM_TEMNE.EMNE_NOBE%type,
        p_nit_emprsa              IN  EM_TEMNE.EMNE_NITE%type,
        p_tp_emprsa               IN  EM_TTPEM.TPEM_DTEM%type,
        p_tt_usemsy               OUT NE_QFEUSY.TT_USEMSY,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    );

    

    -- ============================================================
    -- Declaracion de Cursores
    -- ============================================================
    
    TYPE TT_USEMSY is table of NE_QFEUSY.TO_USEMSY;
    
    type TO_USEMSY is record
    (
        ROLL_ROLL    US_TROLL.ROLL_ROLL%type,
        ROLL_RLDN    US_TROLL.ROLL_RLDN%type,
        ROLL_FCMO    US_TROLL.ROLL_FCMO%type,
        USER_USER    US_TUSER.USER_USER%type,
        USER_ALAS    US_TUSER.USER_ALAS%type,
        USER_PSWD    US_TUSER.USER_PSWD%type,
        PSNA_PSNA    US_TPSNA.PSNA_PSNA%type,
        PSNA_NOBE    US_TPSNA.PSNA_NOBE%type,
        PSNA_APDO    US_TPSNA.PSNA_APDO%type,
        PSNA_DIRN    US_TPSNA.PSNA_DIRN%type,
        PSNA_TLFN    US_TPSNA.PSNA_TLFN%type,
        PSNA_EMAL    US_TPSNA.PSNA_EMAL%type,
        PSNA_PAIS    US_TPSNA.PSNA_PAIS%type,
        PSNA_NRID    US_TPSNA.PSNA_NRID%type,
        PUSR_PUSR    US_TPUSR.PUSR_PUSR%type,
        PUSR_USER    US_TPUSR.PUSR_USER%type,
        PUSR_ROLL    US_TPUSR.PUSR_ROLL%type,
        PUSR_PSNA    US_TPUSR.PUSR_PSNA%type,
        EMNE_EMNE    EM_TEMNE.EMNE_EMNE%type,
        EMNE_NOBE    EM_TEMNE.EMNE_NOBE%type,
        EMNE_NITE    EM_TEMNE.EMNE_NITE%type,
        EMNE_FECR    EM_TEMNE.EMNE_FECR%type,
        EMNE_FEMO    EM_TEMNE.EMNE_FEMO%type,
        TPEM_TPEM    EM_TTPEM.TPEM_TPEM%type,
        TPEM_DTEM    EM_TTPEM.TPEM_DTEM%type,
        TPEM_STEM    EM_TTPEM.TPEM_STEM%type,
        TPEM_FCCR    EM_TTPEM.TPEM_FCCR%type,
        TPEM_FCMO    EM_TTPEM.TPEM_FCMO%type,
        EMTE_EMTE    EM_TEMTE.EMTE_EMTE%type,
        EMTE_DTCR    EM_TEMTE.EMTE_DTCR%type,
        EMTE_DTMO    EM_TEMTE.EMTE_DTMO%type,
        EMTE_TPEM    EM_TEMTE.EMTE_TPEM%type,
        EMTE_EMNE    EM_TEMTE.EMTE_EMNE%type,
        EMUS_EMUS    NE_TEMUS.EMUS_EMUS%type,
        EMUS_EMTE    NE_TEMUS.EMUS_EMTE%type,
        EMUS_STNE    NE_TEMUS.EMUS_STNE%type,
        EMUS_PUSR    NE_TEMUS.EMUS_PUSR%type
    );
    
    ---------------------------------------------------------------
END NE_QFEUSY;
/


prompt
prompt PACKAGE BODY:NE_QFEUSY
prompt


CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.NE_QFEUSY IS
  
    --
    -- #VERSION:0000001000
    --
    -- ===========================================================
    -- NE_QFEUSY
    -- -----------------------------------------------------------
    -- Todas las funciones del usuario en el sistema
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
       ESTADO_ACTIVO_NEGO    NE_TSTNE.STNE_DENE%type := 'ACTIVO';
       ESTADO_INACTIVO_NEGO  NE_TSTNE.STNE_DENE%type := 'INACTIVO';
    
    -- ===========================================================
    -- PROCEDURE obtenerUsEmSy
    -- -----------------------------------------------------------
    -- obtiene el id de el usuario persona rol 
    -- ===========================================================
    PROCEDURE obtenerUsEmSy
    (
        p_nombre_roll             IN  US_TROLL.ROLL_RLDN%type,
        p_nombre_usuario          IN  US_TUSER.USER_ALAS%type,
        p_documento_persona       IN  US_TPSNA.PSNA_NRID%type,
        p_nombre_emprsa           IN  EM_TEMNE.EMNE_NOBE%type,
        p_nit_emprsa              IN  EM_TEMNE.EMNE_NITE%type,
        p_tp_emprsa               IN  EM_TTPEM.TPEM_DTEM%type,
        p_tt_usemsy               OUT NE_QFEUSY.TT_USEMSY,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    )IS

        CURSOR c_fu_ina 
        (
            pc_stne_dene NE_TSTNE.STNE_DENE%type
        )IS
        SELECT
            stne_stne
        FROM
            ne_tstne
        WHERE 
            stne_dene = pc_stne_dene;

        r_fu_ina c_fu_ina%rowtype;

        CURSOR c_fu_empre_user
        (
            pc_id_emte_emte          EM_TEMTE.EMTE_EMTE%type,
            pc_id_emne_emne          EM_TEMNE.EMNE_EMNE%type,
            pc_id_tpem_tpem          EM_TTPEM.TPEM_TPEM%type,
            pc_id_uspero             US_TPUSR.PUSR_PUSR%type,
            pc_id_rol                US_TROLL.ROLL_ROLL%type,
            pc_id_user               US_TUSER.USER_USER%type,
            pc_id_psna               US_TPSNA.PSNA_PSNA%type,
            pc_stne_dene             NE_TSTNE.STNE_DENE%type
        )IS
            SELECT
               *
            FROM
                US_TROLL ro,
                US_TUSER us, 
                US_TPSNA ps,
                US_TPUSR upr,
                EM_TEMNE en,
                EM_TTPEM te, 
                EM_TEMTE et,
                NE_TEMUS em
            WHERE
                upr.PUSR_ROLL = ro.ROLL_ROLL  AND
                upr.PUSR_USER = us.USER_USER  AND
                upr.PUSR_PSNA = ps.PSNA_PSNA  AND
                upr.PUSR_ROLL = pc_id_rol      AND
                upr.PUSR_USER = pc_id_user     AND
                upr.PUSR_PSNA = pc_id_psna     AND
                en.EMNE_EMNE = et.EMTE_EMNE   AND
                te.TPEM_TPEM = et.EMTE_TPEM   AND
                et.EMTE_EMNE = pc_id_emne_emne AND
                et.EMTE_TPEM = pc_id_tpem_tpem AND
                em.EMUS_EMTE = pc_id_emte_emte AND
                em.EMUS_PUSR = pc_id_uspero    AND
                em.EMUS_STNE = pc_stne_dene;       
        
        r_fu_empre_user c_fu_empre_user%rowtype;
    
       
        v_id_emte_emte          EM_TEMTE.EMTE_EMTE%type;
        v_id_emne_emne          EM_TEMNE.EMNE_EMNE%type;
        v_id_tpem_tpem          EM_TTPEM.TPEM_TPEM%type;
        v_id_uspero             US_TPUSR.PUSR_PUSR%type;
        v_id_rol                US_TROLL.ROLL_ROLL%type;
        v_id_user               US_TUSER.USER_USER%type;
        v_id_psna               US_TPSNA.PSNA_PSNA%type;
        v_id_persona            US_TPSNA.PSNA_PSNA%type;
        v_id_emus               NE_TEMUS.EMUS_EMUS%type;
        v_cod_rta_consluser     NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_consutemp     NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_persona       NE_TCRTA.CRTA_CRTA%type;
        vc_stne_dene            NE_TSTNE.STNE_DENE%type;
        v_tt_usemsy             NE_QFEUSY.TT_USEMSY :=  NE_QFEUSY.TT_USEMSY();
    BEGIN  
    
        OPEN c_fu_ina(ESTADO_ACTIVO_NEGO);
        FETCH c_fu_ina INTO r_fu_ina;
        CLOSE c_fu_ina;
        
        vc_stne_dene := r_fu_ina.STNE_STNE;
    
        US_QFEMTE.obtenerEmNeId
        (
            p_nombre_emprsa,
            p_nit_emprsa   ,
            p_tp_emprsa    ,
            v_id_emte_emte ,
            v_id_emne_emne ,
            v_id_tpem_tpem ,
            v_cod_rta_consutemp      
        );
        
        US_QFPUSR.obtenerUsperoId
        (
            p_nombre_roll       ,
            p_nombre_usuario    ,
            p_documento_persona ,
            v_id_uspero         ,
            v_id_rol            ,
            v_id_user           ,
            v_id_psna           ,
            v_cod_rta_consluser 
        );
          
        IF(
            v_cod_rta_consluser='OK'   AND 
            v_cod_rta_consutemp='OK'   AND 
            v_id_emte_emte IS NOT NULL AND
            v_id_uspero IS NOT NULL    AND
            vc_stne_dene IS NOT NULL   
        )THEN
        
            OPEN c_fu_empre_user
            (
                v_id_emte_emte,
                v_id_emne_emne,
                v_id_tpem_tpem,
                v_id_uspero   ,
                v_id_rol      ,
                v_id_user     ,
                v_id_psna     ,
                vc_stne_dene
            );
            
            FETCH c_fu_empre_user BULK COLLECT INTO v_tt_usemsy;
            CLOSE c_fu_empre_user;
            
            IF (v_tt_usemsy.count>0) THEN 
                p_tt_usemsy := v_tt_usemsy;
                p_cod_rta   := 'OK';
            ELSE 
                p_cod_rta   := 'ER_EMP_USER';
            END IF;
        ELSE
            v_id_emus := NULL;
            p_cod_rta   := 'ER_EMP_NUL';
        END if;
        EXCEPTION
            WHEN OTHERS THEN
                v_id_emus:= NULL;
                p_cod_rta  := 'ERROR_NC';
            
    END obtenerUsEmSy;

   
    
END NE_QFEUSY;
/