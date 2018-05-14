prompt
prompt PACKAGE: US_QFPUSR
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.US_QFPUSR IS
    --
    -- ===========================================================
    -- US_QFPUSR
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
    PROCEDURE obtenerUsperoId
    (
        p_nombre_roll             IN  US_TROLL.ROLL_RLDN%type,
        p_nombre_usuario          IN  US_TUSER.USER_ALAS%type,
        p_documento_persona       IN  US_TPSNA.PSNA_NRID%type,
        p_id_uspero               OUT US_TPUSR.PUSR_PUSR%type,
        p_id_rol                  OUT US_TROLL.ROLL_ROLL%type,
        p_id_user                 OUT US_TUSER.USER_USER%type,
        p_id_psna                 OUT US_TPSNA.PSNA_PSNA%type,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    );
  PROCEDURE crearUsPeRo
    (
        p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
        p_nombre_usuario            IN  US_TUSER.USER_ALAS%type,
        p_password_usuario          IN  US_TUSER.USER_PSWD%type,
        p_documento_persona         IN  US_TPSNA.PSNA_NRID%type,
        p_nombres_persona           IN  US_TPSNA.PSNA_NOBE%type,
        p_apellido_persona          IN  US_TPSNA.PSNA_APDO%type,
        p_direccion_persona         IN  US_TPSNA.PSNA_DIRN%type,
        p_telefono_persona          IN  US_TPSNA.PSNA_TLFN%type,
        p_email_persona             IN  US_TPSNA.PSNA_EMAL%type,
        p_pais_persona              IN  US_TPSNA.PSNA_PAIS%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    );
    
    PROCEDURE asignarRolUsPe
    (
        p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
        p_nombre_usuario            IN  US_TUSER.USER_ALAS%type,
        p_documento_persona         IN  US_TPSNA.PSNA_NRID%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    );
    
    PROCEDURE actualizarUsPe
    (
        p_nombre_usuario            IN  US_TUSER.USER_ALAS%type,
        p_documento_persona         IN  US_TPSNA.PSNA_NRID%type,
        p_documento_persona_act     IN  US_TPSNA.PSNA_NRID%type,
        p_nombres_persona_act       IN  US_TPSNA.PSNA_NOBE%type,
        p_apellido_persona_act      IN  US_TPSNA.PSNA_APDO%type,
        p_direccion_persona_act     IN  US_TPSNA.PSNA_DIRN%type,
        p_telefono_persona_act      IN  US_TPSNA.PSNA_TLFN%type,
        p_email_persona_act         IN  US_TPSNA.PSNA_EMAL%type,
        p_pais_persona_act          IN  US_TPSNA.PSNA_PAIS%type,
        p_nombre_usuario_act        IN  US_TUSER.USER_ALAS%type,
        p_password_usuario_act      IN  US_TUSER.USER_PSWD%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    );

END US_QFPUSR;
/


prompt
prompt PACKAGE BODY:US_QFPUSR
prompt


CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.US_QFPUSR IS
  
    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE obtenerUsperoId
    -- -----------------------------------------------------------
    -- obtiene el id de el usuario persona rol 
    -- ===========================================================
    PROCEDURE obtenerUsperoId
    (
        p_nombre_roll             IN  US_TROLL.ROLL_RLDN%type,
        p_nombre_usuario          IN  US_TUSER.USER_ALAS%type,
        p_documento_persona       IN  US_TPSNA.PSNA_NRID%type,
        p_id_uspero               OUT US_TPUSR.PUSR_PUSR%type,
        p_id_rol                  OUT US_TROLL.ROLL_ROLL%type,
        p_id_user                 OUT US_TUSER.USER_USER%type,
        p_id_psna                 OUT US_TPSNA.PSNA_PSNA%type,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        cursor c_uspero 
        (
            pc_ROLL_ROLL US_TROLL.ROLL_ROLL%type,
            pc_USER_USER US_TUSER.USER_USER%type,
            pc_PSNA_PSNA US_TPSNA.PSNA_PSNA%type
        )is
            SELECT
               *
            FROM
                US_TROLL ro,
                US_TUSER us, 
                US_TPSNA ps,
                US_TPUSR upr
            WHERE
                upr.PUSR_ROLL = ro.ROLL_ROLL AND
                upr.PUSR_USER = us.USER_USER AND
                upr.PUSR_PSNA = ps.PSNA_PSNA AND
                upr.PUSR_ROLL = pc_ROLL_ROLL AND
                upr.PUSR_USER = pc_USER_USER AND
                upr.PUSR_PSNA = pc_PSNA_PSNA;

        r_uspero                c_uspero%rowtype;
        v_id_roll               US_TROLL.ROLL_ROLL%type;
        v_id_usuario            US_TUSER.USER_USER%type;
        v_id_persona            US_TPSNA.PSNA_PSNA%type;
        v_cod_rta_roll          NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_usuario       NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_persona       NE_TCRTA.CRTA_CRTA%type;

    BEGIN  
        US_QROLL.buscarRollPorNombre
        (
            p_nombre_roll,
            v_id_roll,
            v_cod_rta_roll
        );
        US_QUSER.buscarUsuarioPorNombre
        (
            p_nombre_usuario,
            v_id_usuario,
            v_cod_rta_usuario
        );
        US_QPSNA.buscarPersonaPorDocumento
        (
            p_documento_persona,
            v_id_persona,
            v_cod_rta_persona
        );

        OPEN c_uspero(v_id_roll,v_id_usuario,v_id_persona);
        FETCH c_uspero INTO r_uspero;
        CLOSE c_uspero;

        IF 
        (   v_cod_rta_roll='OK'     AND 
            v_cod_rta_usuario='OK'  AND 
            v_cod_rta_persona='OK'  AND
            r_uspero.PUSR_PUSR IS NOT NULL
        ) THEN
    
            p_id_uspero := r_uspero.PUSR_PUSR;
            p_id_rol    := r_uspero.PUSR_ROLL;
            p_id_user   := r_uspero.PUSR_USER;
            p_id_psna   := r_uspero.PUSR_PSNA;
            p_cod_rta   := 'OK';
        ELSE
            p_id_uspero := NULL;
            p_cod_rta   := 'ER_EMP_NUL';
        END if;
        EXCEPTION
            WHEN OTHERS THEN
                p_id_uspero:= NULL;
                p_cod_rta  := 'ERROR_NC';
            
    END obtenerUsperoId;

     --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE crearUsPeRo
    -- -----------------------------------------------------------
    -- creacion de usuario persona y rol dado atributos
    -- ===========================================================
    PROCEDURE crearUsPeRo
    (
        p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
        p_nombre_usuario            IN  US_TUSER.USER_ALAS%type,
        p_password_usuario          IN  US_TUSER.USER_PSWD%type,
        p_documento_persona         IN  US_TPSNA.PSNA_NRID%type,
        p_nombres_persona           IN  US_TPSNA.PSNA_NOBE%type,
        p_apellido_persona          IN  US_TPSNA.PSNA_APDO%type,
        p_direccion_persona         IN  US_TPSNA.PSNA_DIRN%type,
        p_telefono_persona          IN  US_TPSNA.PSNA_TLFN%type,
        p_email_persona             IN  US_TPSNA.PSNA_EMAL%type,
        p_pais_persona              IN  US_TPSNA.PSNA_PAIS%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        v_secuencia                 NUMBER;
        v_id_roll                   US_TROLL.ROLL_ROLL%type;
        v_id_usuario                US_TUSER.USER_USER%type;
        v_id_persona                US_TPSNA.PSNA_PSNA%type;
        v_cod_rta_roll              NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_usuario           NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_persona           NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_vupr              NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta                   NE_TCRTA.CRTA_CRTA%type;
        v_existencia_rolus          BOOLEAN;

    BEGIN  
        v_secuencia := US_SETPUSR.NextVal;

        US_QROLL.buscarRollPorNombre
        (
            p_nombre_roll,
            v_id_roll,
            v_cod_rta_roll
        );
        
        IF  v_cod_rta_roll ='OK'  THEN
        
            US_QUSER.buscarUsuarioPorNombre
            (
                p_nombre_usuario,
                v_id_usuario,
                v_cod_rta_usuario
            );
            
            US_QPSNA.buscarPersonaPorDocumento
            (
                p_documento_persona,
                v_id_persona,
                v_cod_rta_persona
            );
            
            IF  v_cod_rta_usuario <>'OK' AND v_cod_rta_persona<>'OK'  THEN
                
                US_QUSER.crearUsuario
                (
                    p_nombre_usuario  ,
                    p_password_usuario,
                    v_id_usuario,
                    v_cod_rta_usuario
                );
                
                US_QPSNA.crearPersona
                (
                    p_documento_persona,
                    p_nombres_persona  ,
                    p_apellido_persona ,
                    p_direccion_persona,
                    p_telefono_persona ,
                    p_email_persona    ,
                    p_pais_persona     ,
                    v_id_persona       ,
                    v_cod_rta_persona
                );
            
            END IF;
            
            US_QVAFPUSR.validarUserRolSys
            (
                v_id_usuario,
                v_id_roll,
                v_id_persona,
                v_existencia_rolus,
                v_cod_rta_vupr
            );
            
            IF  (v_existencia_rolus)  THEN
                IF  v_cod_rta_roll='OK' AND v_cod_rta_usuario='OK' AND v_cod_rta_persona='OK' THEN
                   INSERT INTO US_TPUSR(
                    PUSR_PUSR,
                    PUSR_USER,
                    PUSR_ROLL,
                    PUSR_PSNA
                  )
                  VALUES(
                    v_secuencia,
                    v_id_usuario,
                    v_id_roll,
                    v_id_persona
                  );
                   v_cod_rta     := 'OK';
                   COMMIT;
                ELSE
                   v_cod_rta     := 'ER_NULL';
                   ROLLBACK;
                END IF;
            ELSE
                v_cod_rta     := 'ER_YA_ROL_USR';
                
            END IF;
            
        ELSE
            v_cod_rta     := 'ER_NO_ROL';
        END IF;
        p_cod_rta  := v_cod_rta;
    EXCEPTION
       WHEN OTHERS THEN
            
           p_cod_rta  := 'ERROR_NC';
           ROLLBACK;
    END crearUsPeRo;
    
    -- ===========================================================
    -- PROCEDURE asignarRolUsPe
    -- -----------------------------------------------------------
    -- creacion de usuario persona y rol dado atributos
    -- ===========================================================
    PROCEDURE asignarRolUsPe
    (
        p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
        p_nombre_usuario            IN  US_TUSER.USER_ALAS%type,
        p_documento_persona         IN  US_TPSNA.PSNA_NRID%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        v_secuencia                 NUMBER;
        v_id_roll                   US_TROLL.ROLL_ROLL%type;
        v_id_usuario                US_TUSER.USER_USER%type;
        v_id_persona                US_TPSNA.PSNA_PSNA%type;
        v_cod_rta_roll              NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_usuario           NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_persona           NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_vupr              NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta                   NE_TCRTA.CRTA_CRTA%type;
        v_existencia_rolus          BOOLEAN;

    BEGIN  
        v_secuencia := US_SETPUSR.NextVal;

        US_QROLL.buscarRollPorNombre
        (
            p_nombre_roll,
            v_id_roll,
            v_cod_rta_roll
        );
        
        IF  v_cod_rta_roll ='OK'  THEN
        
            US_QUSER.buscarUsuarioPorNombre
            (
                p_nombre_usuario,
                v_id_usuario,
                v_cod_rta_usuario
            );
            
            US_QPSNA.buscarPersonaPorDocumento
            (
                p_documento_persona,
                v_id_persona,
                v_cod_rta_persona
            );
            
            
            US_QVAFPUSR.validarUserRolSys
            (
                v_id_usuario,
                v_id_roll,
                v_id_persona,
                v_existencia_rolus,
                v_cod_rta_vupr
            );
            
            IF  (v_existencia_rolus)  THEN
                IF  v_cod_rta_roll='OK' AND v_cod_rta_usuario='OK' AND v_cod_rta_persona='OK' THEN
                   INSERT INTO US_TPUSR(
                    PUSR_PUSR,
                    PUSR_USER,
                    PUSR_ROLL,
                    PUSR_PSNA
                  )
                  VALUES(
                    v_secuencia,
                    v_id_usuario,
                    v_id_roll,
                    v_id_persona
                  );
                   v_cod_rta     := 'OK';
                   COMMIT;
                ELSE
                   v_cod_rta     := 'ER_NULL';
                   ROLLBACK;
                END IF;
            ELSE
                v_cod_rta     := 'ER_YA_ROL_USR';
            
            END IF;
            
        ELSE
            v_cod_rta     := 'ER_NO_ROL';
        END IF;
        p_cod_rta  := v_cod_rta;
    EXCEPTION
       WHEN OTHERS THEN
           p_cod_rta  := 'ERROR_NC';
           ROLLBACK;
    
    END asignarRolUsPe;
    
     -- ===========================================================
    -- PROCEDURE actualizarUsPe
    -- -----------------------------------------------------------
    -- creacion de usuario persona y rol dado atributos
    -- ===========================================================
    PROCEDURE actualizarUsPe
    (
        p_nombre_usuario            IN  US_TUSER.USER_ALAS%type,
        p_documento_persona         IN  US_TPSNA.PSNA_NRID%type,
        p_documento_persona_act     IN  US_TPSNA.PSNA_NRID%type,
        p_nombres_persona_act       IN  US_TPSNA.PSNA_NOBE%type,
        p_apellido_persona_act      IN  US_TPSNA.PSNA_APDO%type,
        p_direccion_persona_act     IN  US_TPSNA.PSNA_DIRN%type,
        p_telefono_persona_act      IN  US_TPSNA.PSNA_TLFN%type,
        p_email_persona_act         IN  US_TPSNA.PSNA_EMAL%type,
        p_pais_persona_act          IN  US_TPSNA.PSNA_PAIS%type,
        p_nombre_usuario_act        IN  US_TUSER.USER_ALAS%type,
        p_password_usuario_act      IN  US_TUSER.USER_PSWD%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    )IS
 
        v_cod_rta_usuario           NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_act_usuario       NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_persona           NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_act_persona       NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta                   NE_TCRTA.CRTA_CRTA%type;
        v_existencia_persona          BOOLEAN;
        v_existencia_user             BOOLEAN;

    BEGIN  
        
        US_QVPSNA.validarPersonaPorDoct
        (
            p_documento_persona               ,
            v_existencia_persona              ,
            v_cod_rta_persona                         
        );
        
        US_QVUSER.validarUsuarioPorNombre
        (
            p_nombre_usuario    ,
            v_existencia_user,
            v_cod_rta_usuario             
        );
        
        IF  v_cod_rta_persona<>'OK' THEN
            
            IF  NOT (v_existencia_persona) THEN
                
                US_QPSNA.actualizarPersona
                (
                    p_documento_persona    ,
                    p_documento_persona_act,
                    p_nombres_persona_act  ,
                    p_apellido_persona_act ,
                    p_direccion_persona_act,
                    p_telefono_persona_act ,
                    p_email_persona_act    ,
                    p_pais_persona_act     ,
                    v_cod_rta_act_persona                        
                );
                IF  v_cod_rta_act_persona='OK' THEN
                     v_cod_rta     := 'OK';
                     COMMIT;
                ELSE
                     p_cod_rta  := 'ERROR_NC';
                END IF;
            ELSE
               v_cod_rta     := 'ER_NULL';
            END IF;
        ELSE
            v_cod_rta     := 'ER_NULL';
        END IF;
        
        IF  v_cod_rta_usuario<>'OK' THEN
            
            IF  NOT (v_existencia_user) THEN
                
                US_QUSER.actualizarUsuario
                (
                    p_nombre_usuario      ,
                    p_nombre_usuario_act  ,
                    p_password_usuario_act,
                    v_cod_rta_act_usuario             
                );
                IF  v_cod_rta_act_usuario='OK' THEN
                     v_cod_rta     := 'OK';
                     COMMIT;
                ELSE
                     p_cod_rta  := 'ERROR_NC';
                END IF;
            ELSE
               v_cod_rta     := 'ER_NULL';
            END IF;
        ELSE
            v_cod_rta     := 'ER_NULL';
        END IF;
        p_cod_rta  := v_cod_rta;
    EXCEPTION
       WHEN OTHERS THEN
           p_cod_rta  := 'ERROR_NC';
           ROLLBACK;
    
    END actualizarUsPe;
    
END US_QFPUSR;
/