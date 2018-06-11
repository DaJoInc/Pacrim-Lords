prompt
prompt PACKAGE: PC_API_WEB
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.PC_API_WEB IS
    --
    -- ===========================================================
    -- PC_API_WEB
    -- -----------------------------------------------------------
    -- Reúne funciones y procedimientos relacionados con la 
    -- gestion de negocio Pacrim
    -- ===========================================================
    --
    -- #VERSION:0000001000
    --
    -- HISTORIAL DE CAMBIOS
    --
    -- Versión        GAP                Solicitud        Fecha        Realizó            Descripción
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------
    -- 1000                                             03/03/2018      DAJO INC           Se crean API de servicios para el modulo de Gestion Usuario Pacrim
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------

    
    -- ============================================================
    -- Constantes generales a nivel de PAQUETE
    -- ============================================================


    -- ------------------------------------------------------------
    -- ============================================================
    -- Declaracion de PROCEDIMIENTOS y FUNCIONES
    -- ============================================================
    
    -- ***********************************************************
    -- Procedimientos funcionalidad usuarios
    -- ***********************************************************
        PROCEDURE crearUsPeRo
        (
            p_nombre_roll               IN  US_TROLL.ROLL_RLDN%TYPE,
            p_nombre_usuario            IN  US_TUSER.USER_ALAS%TYPE,
            p_password_usuario          IN  US_TUSER.USER_PSWD%TYPE,
            p_documento_persona         IN  US_TPSNA.PSNA_NRID%TYPE,
            p_nombres_persona           IN  US_TPSNA.PSNA_NOBE%TYPE,
            p_apellido_persona          IN  US_TPSNA.PSNA_APDO%TYPE,
            p_direccion_persona         IN  US_TPSNA.PSNA_DIRN%TYPE,
            p_telefono_persona          IN  US_TPSNA.PSNA_TLFN%TYPE,
            p_email_persona             IN  US_TPSNA.PSNA_EMAL%TYPE,
            p_pais_persona              IN  US_TPSNA.PSNA_PAIS%TYPE,
            p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%TYPE,
            p_msj_rta                   OUT NE_TCRTA.CRTA_DESCRI%TYPE
        );
        -- ------------------------------------------------------------
        
        PROCEDURE actualizarUsPe
        (
            p_nombre_usuario            IN  US_TUSER.USER_ALAS%TYPE,
            p_documento_persona         IN  US_TPSNA.PSNA_NRID%TYPE,
            p_documento_persona_act     IN  US_TPSNA.PSNA_NRID%TYPE,
            p_nombres_persona_act       IN  US_TPSNA.PSNA_NOBE%TYPE,
            p_apellido_persona_act      IN  US_TPSNA.PSNA_APDO%TYPE,
            p_direccion_persona_act     IN  US_TPSNA.PSNA_DIRN%TYPE,
            p_telefono_persona_act      IN  US_TPSNA.PSNA_TLFN%TYPE,
            p_email_persona_act         IN  US_TPSNA.PSNA_EMAL%TYPE,
            p_pais_persona_act          IN  US_TPSNA.PSNA_PAIS%TYPE,
            p_nombre_usuario_act        IN  US_TUSER.USER_ALAS%TYPE,
            p_password_usuario_act      IN  US_TUSER.USER_PSWD%TYPE,
            p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%TYPE,
            p_msj_rta                   OUT NE_TCRTA.CRTA_DESCRI%TYPE
        );
        -- ------------------------------------------------------------   
        PROCEDURE asignarRolUsPe
        (
            p_nombre_roll               IN  US_TROLL.ROLL_RLDN%TYPE,
            p_nombre_usuario            IN  US_TUSER.USER_ALAS%TYPE,
            p_documento_persona         IN  US_TPSNA.PSNA_NRID%TYPE,
            p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%TYPE,
            p_msj_rta                   OUT NE_TCRTA.CRTA_DESCRI%TYPE
        );
    
    -- ------------------------------------------------------------   
    -- ___________________________________________________________ 
    
    -- ***********************************************************
    -- Procedimientos funcionalidad empresas
    -- ***********************************************************
        
        PROCEDURE crearEmpreNeg
        (
            p_nombre_emprsa           IN  EM_TEMNE.EMNE_NOBE%TYPE,
            p_nit_emprsa              IN  EM_TEMNE.EMNE_NITE%TYPE,
            p_tp_emprsa               IN  EM_TTPEM.TPEM_DTEM%TYPE,
            p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%TYPE,
            p_msj_rta                 OUT NE_TCRTA.CRTA_DESCRI%TYPE
        );
        
        -- ------------------------------------------------------------         
        PROCEDURE asignarNegoEmp
        (
            p_nombre_emprsa           IN  EM_TEMNE.EMNE_NOBE%TYPE,
            p_nit_emprsa              IN  EM_TEMNE.EMNE_NITE%TYPE,
            p_tp_emprsa               IN  EM_TTPEM.TPEM_DTEM%TYPE,
            p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%TYPE,
            p_msj_rta                 OUT NE_TCRTA.CRTA_DESCRI%TYPE
        );

        -- ------------------------------------------------------------   
        
    -- ___________________________________________________________  
    
    -- ***********************************************************
    -- Procedimientos funcionalidad negocio
    -- ***********************************************************
        
        PROCEDURE registrarUsEmNego
        (
            p_nombre_roll             IN  US_TROLL.ROLL_RLDN%TYPE,
            p_nombre_usuario          IN  US_TUSER.USER_ALAS%TYPE,
            p_documento_persona       IN  US_TPSNA.PSNA_NRID%TYPE,
            p_nombre_emprsa           IN  EM_TEMNE.EMNE_NOBE%TYPE,
            p_nit_emprsa              IN  EM_TEMNE.EMNE_NITE%TYPE,
            p_tp_emprsa               IN  EM_TTPEM.TPEM_DTEM%TYPE,
            p_id_ussy                 OUT NE_TEMUS.EMUS_EMUS%TYPE,
            p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%TYPE,
            p_msj_rta                 OUT NE_TCRTA.CRTA_DESCRI%TYPE
        );
        
        -- ------------------------------------------------------------         
        PROCEDURE inactivarUsEmSy
        (
            p_nombre_roll             IN  US_TROLL.ROLL_RLDN%TYPE,
            p_nombre_usuario          IN  US_TUSER.USER_ALAS%TYPE,
            p_documento_persona       IN  US_TPSNA.PSNA_NRID%TYPE,
            p_nombre_emprsa           IN  EM_TEMNE.EMNE_NOBE%TYPE,
            p_nit_emprsa              IN  EM_TEMNE.EMNE_NITE%TYPE,
            p_tp_emprsa               IN  EM_TTPEM.TPEM_DTEM%TYPE,
            p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%TYPE,
            p_msj_rta                 OUT NE_TCRTA.CRTA_DESCRI%TYPE
        );
        
        PROCEDURE activarUsEmSy
        (
            p_nombre_roll             IN  US_TROLL.ROLL_RLDN%TYPE,
            p_nombre_usuario          IN  US_TUSER.USER_ALAS%TYPE,
            p_documento_persona       IN  US_TPSNA.PSNA_NRID%TYPE,
            p_nombre_emprsa           IN  EM_TEMNE.EMNE_NOBE%TYPE,
            p_nit_emprsa              IN  EM_TEMNE.EMNE_NITE%TYPE,
            p_tp_emprsa               IN  EM_TTPEM.TPEM_DTEM%TYPE,
            p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%TYPE,
            p_msj_rta                 OUT NE_TCRTA.CRTA_DESCRI%TYPE
        );
        -- ------------------------------------------------------------   
    -- ___________________________________________________________  
    
    -- ***********************************************************
    -- Procedimientos funcionalidad paises
    -- ***********************************************************

        PROCEDURE consultarPaises
        (
            p_ne_tpsne       OUT NE_TT_NE_TPSNE,
            p_cod_rta        OUT NE_TCRTA.CRTA_CRTA%TYPE,
            p_msj_rta        OUT NE_TCRTA.CRTA_DESCRI%TYPE
        );
        -- ------------------------------------------------------------         
        PROCEDURE consultarDepartamePais
        (
            p_nombre_Pais    IN  NE_TPSNE.PSNE_NAME%TYPE,
            p_query_Pais     OUT NE_TPSNE.PSNE_NAME%TYPE,
            p_ne_tdene       OUT NE_TT_NE_TDENE,
            p_cod_rta        OUT NE_TCRTA.CRTA_CRTA%TYPE,
            p_msj_rta        OUT NE_TCRTA.CRTA_DESCRI%TYPE
        );
        -- ----------------------------------------------------- 
        PROCEDURE consultarCiudadxDepYPa
        (
            p_nombre_Pais    IN  NE_TPSNE.PSNE_NAME%type,
            p_nombre_Depa    IN  NE_TDENE.DENE_NAME%type,
            p_query_Pais     OUT NE_TPSNE.PSNE_NAME%type,
            p_query_dene     OUT NE_TDENE.DENE_DENE%type,
            p_ne_tcdne       OUT NE_TT_NE_TCDNE,
            p_cod_rta        OUT NE_TCRTA.CRTA_CRTA%type,
            p_msj_rta        OUT NE_TCRTA.CRTA_DESCRI%TYPE
        );
        
        -- ------------------------------------------------------------ 
    -- ___________________________________________________________ 
    -- ------------------------------------------------------------
    
END PC_API_WEB;
/


prompt
prompt PACKAGE BODY:PC_API_WEB
prompt

CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.PC_API_WEB IS

    -- ***********************************************************
    -- Procedimientos funcionalidad usuarios
    -- ***********************************************************
        -- ===========================================================
        -- PROCEDURE crearUsPeRo
        -- -----------------------------------------------------------
        -- permite creacion del usuario
        -- ===========================================================
        PROCEDURE crearUsPeRo
        (
            p_nombre_roll               IN  US_TROLL.ROLL_RLDN%TYPE,
            p_nombre_usuario            IN  US_TUSER.USER_ALAS%TYPE,
            p_password_usuario          IN  US_TUSER.USER_PSWD%TYPE,
            p_documento_persona         IN  US_TPSNA.PSNA_NRID%TYPE,
            p_nombres_persona           IN  US_TPSNA.PSNA_NOBE%TYPE,
            p_apellido_persona          IN  US_TPSNA.PSNA_APDO%TYPE,
            p_direccion_persona         IN  US_TPSNA.PSNA_DIRN%TYPE,
            p_telefono_persona          IN  US_TPSNA.PSNA_TLFN%TYPE,
            p_email_persona             IN  US_TPSNA.PSNA_EMAL%TYPE,
            p_pais_persona              IN  US_TPSNA.PSNA_PAIS%TYPE,
            p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%TYPE,
            p_msj_rta                   OUT NE_TCRTA.CRTA_DESCRI%TYPE
        )IS
        
          v_cod_rta_ruser              NE_TCRTA.CRTA_CRTA%TYPE;
          v_cod_rta                    NE_TCRTA.CRTA_CRTA%TYPE;
          v_msj_rta                    NE_TCRTA.CRTA_DESCRI%TYPE;
        BEGIN  
        
            US_QFPUSR.crearUsPeRo
            (
                p_nombre_roll       ,
                p_nombre_usuario    ,
                p_password_usuario  ,
                p_documento_persona ,
                p_nombres_persona   ,
                p_apellido_persona  ,
                p_direccion_persona ,
                p_telefono_persona  ,
                p_email_persona     ,
                p_pais_persona      ,
                v_cod_rta_ruser     
            );
              
            IF(v_cod_rta_ruser = 'OK') THEN
              v_cod_rta     := 'OK';
              v_msj_rta := 'Se registro correctamente el usuario';
            ELSE
                v_cod_rta     := 'ERR_INSR_USER';
                v_msj_rta := 'No se registro el usuario';
            END IF;
            p_cod_rta  := v_cod_rta;
            p_msj_rta  := v_msj_rta;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
                p_msj_rta  := 'Error Negocio No se registro el usuario';
            
        END crearUsPeRo;

        -- ===========================================================
        -- PROCEDURE actualizarUsPe
        -- -----------------------------------------------------------
        -- permite creacion del usuario
        -- ===========================================================
        PROCEDURE actualizarUsPe
        (
            p_nombre_usuario            IN  US_TUSER.USER_ALAS%TYPE,
            p_documento_persona         IN  US_TPSNA.PSNA_NRID%TYPE,
            p_documento_persona_act     IN  US_TPSNA.PSNA_NRID%TYPE,
            p_nombres_persona_act       IN  US_TPSNA.PSNA_NOBE%TYPE,
            p_apellido_persona_act      IN  US_TPSNA.PSNA_APDO%TYPE,
            p_direccion_persona_act     IN  US_TPSNA.PSNA_DIRN%TYPE,
            p_telefono_persona_act      IN  US_TPSNA.PSNA_TLFN%TYPE,
            p_email_persona_act         IN  US_TPSNA.PSNA_EMAL%TYPE,
            p_pais_persona_act          IN  US_TPSNA.PSNA_PAIS%TYPE,
            p_nombre_usuario_act        IN  US_TUSER.USER_ALAS%TYPE,
            p_password_usuario_act      IN  US_TUSER.USER_PSWD%TYPE,
            p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%TYPE,
            p_msj_rta                   OUT NE_TCRTA.CRTA_DESCRI%TYPE
        )IS
        
          v_cod_rta_ruser              NE_TCRTA.CRTA_CRTA%TYPE;
          v_cod_rta                    NE_TCRTA.CRTA_CRTA%TYPE;
          v_msj_rta                    NE_TCRTA.CRTA_DESCRI%TYPE;
        BEGIN  
        
            US_QFPUSR.actualizarUsPe
            (
                p_nombre_usuario         ,
                p_documento_persona      ,
                p_documento_persona_act  ,
                p_nombres_persona_act    ,
                p_apellido_persona_act   ,
                p_direccion_persona_act  ,
                p_telefono_persona_act   ,
                p_email_persona_act      ,
                p_pais_persona_act       ,
                p_nombre_usuario_act     ,
                p_password_usuario_act   ,
                v_cod_rta_ruser                
            );
              
            IF(v_cod_rta_ruser = 'OK') THEN
              v_cod_rta     := 'OK';
              v_msj_rta := 'Se actualizando correctamente el usuario';
            ELSE
                v_cod_rta     := 'ERR_ACT_USER';
                v_msj_rta := 'No se actualizando el usuario';
            END IF;
            p_cod_rta  := v_cod_rta;
            p_msj_rta  := v_msj_rta;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
                p_msj_rta  := 'Error Negocio No se actualizando el usuario';
            
        END actualizarUsPe;        


        -- ===========================================================
        -- PROCEDURE actualizarUsPe
        -- -----------------------------------------------------------
        -- permite creacion del usuario
        -- ===========================================================
        PROCEDURE asignarRolUsPe
        (
            p_nombre_roll               IN  US_TROLL.ROLL_RLDN%TYPE,
            p_nombre_usuario            IN  US_TUSER.USER_ALAS%TYPE,
            p_documento_persona         IN  US_TPSNA.PSNA_NRID%TYPE,
            p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%TYPE,
            p_msj_rta                   OUT NE_TCRTA.CRTA_DESCRI%TYPE
        )IS
        
          v_cod_rta_ruser              NE_TCRTA.CRTA_CRTA%TYPE;
          v_cod_rta                    NE_TCRTA.CRTA_CRTA%TYPE;
          v_msj_rta                    NE_TCRTA.CRTA_DESCRI%TYPE;
        BEGIN  
        
            US_QFPUSR.asignarRolUsPe
            (
                p_nombre_roll       ,
                p_nombre_usuario    ,
                p_documento_persona ,
                v_cod_rta_ruser           
            );
              
            IF(v_cod_rta_ruser = 'OK') THEN
              v_cod_rta     := 'OK';
              v_msj_rta := 'se puede asignar rol el correctamente del usuario';
            ELSE
                v_cod_rta     := 'ERR_ASIG_USEROL';
                v_msj_rta := 'No se puede asignar rol el usuario';
            END IF;
            p_cod_rta  := v_cod_rta;
            p_msj_rta  := v_msj_rta;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
                p_msj_rta  := 'Error Negocio No se actualizando el usuario';
            
        END asignarRolUsPe;        
    -- ___________________________________________________________  

    -- ***********************************************************
    -- Procedimientos funcionalidad empresas
    -- *********************************************************** 

        -- ===========================================================
        -- PROCEDURE crearEmpreNeg
        -- -----------------------------------------------------------
        -- permite creacion del usuario
        -- ===========================================================
        PROCEDURE crearEmpreNeg
        (
            p_nombre_emprsa           IN  EM_TEMNE.EMNE_NOBE%TYPE,
            p_nit_emprsa              IN  EM_TEMNE.EMNE_NITE%TYPE,
            p_tp_emprsa               IN  EM_TTPEM.TPEM_DTEM%TYPE,
            p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%TYPE,
            p_msj_rta                 OUT NE_TCRTA.CRTA_DESCRI%TYPE
        )IS
        
          v_cod_rta_rempr              NE_TCRTA.CRTA_CRTA%TYPE;
          v_cod_rta                    NE_TCRTA.CRTA_CRTA%TYPE;
          v_msj_rta                    NE_TCRTA.CRTA_DESCRI%TYPE;
        BEGIN  
        
            US_QFEMTE.crearEmpreNeg
            (
                p_nombre_emprsa,
                p_nit_emprsa   ,
                p_tp_emprsa    ,
                v_cod_rta_rempr      
            );
              
            IF(v_cod_rta_rempr = 'OK') THEN
              v_cod_rta     := 'OK';
              v_msj_rta := 'se creo empresa correctamente';
            ELSE
                v_cod_rta     := 'ERR_ASIG_USEROL';
                v_msj_rta := 'No se creo empresa correctamente';
            END IF;
            p_cod_rta  := v_cod_rta;
            p_msj_rta  := v_msj_rta;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
                p_msj_rta  := 'Error Negocio no se creo empresa correctamente';
            
        END crearEmpreNeg;      

        -- ===========================================================
        -- PROCEDURE asignarNegoEmp
        -- -----------------------------------------------------------
        -- permite creacion del usuario
        -- ===========================================================
        PROCEDURE asignarNegoEmp
        (
            p_nombre_emprsa           IN  EM_TEMNE.EMNE_NOBE%TYPE,
            p_nit_emprsa              IN  EM_TEMNE.EMNE_NITE%TYPE,
            p_tp_emprsa               IN  EM_TTPEM.TPEM_DTEM%TYPE,
            p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%TYPE,
            p_msj_rta                 OUT NE_TCRTA.CRTA_DESCRI%TYPE
        )IS
        
          v_cod_rta_rempr              NE_TCRTA.CRTA_CRTA%TYPE;
          v_cod_rta                    NE_TCRTA.CRTA_CRTA%TYPE;
          v_msj_rta                    NE_TCRTA.CRTA_DESCRI%TYPE;
        BEGIN  
        
            US_QFEMTE.asignarNegoEmp
            (
                p_nombre_emprsa,
                p_nit_emprsa   ,
                p_tp_emprsa    ,
                v_cod_rta_rempr      
            );
              
            IF(v_cod_rta_rempr = 'OK') THEN
              v_cod_rta     := 'OK';
              v_msj_rta := 'se creo empresa correctamente';
            ELSE
                v_cod_rta     := 'ERR_ASIG_USEROL';
                v_msj_rta := 'No se creo empresa correctamente';
            END IF;
            p_cod_rta  := v_cod_rta;
            p_msj_rta  := v_msj_rta;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
                p_msj_rta  := 'Error Negocio no se creo empresa correctamente';
            
        END asignarNegoEmp; 
    -- ___________________________________________________________  

    -- ***********************************************************
    -- Procedimientos funcionalidad negocio
    -- *********************************************************** 

        -- ===========================================================
        -- PROCEDURE registrarUsEmNego
        -- -----------------------------------------------------------
        -- permite creacion del usuario
        -- ===========================================================
        PROCEDURE registrarUsEmNego
        (
            p_nombre_roll             IN  US_TROLL.ROLL_RLDN%TYPE,
            p_nombre_usuario          IN  US_TUSER.USER_ALAS%TYPE,
            p_documento_persona       IN  US_TPSNA.PSNA_NRID%TYPE,
            p_nombre_emprsa           IN  EM_TEMNE.EMNE_NOBE%TYPE,
            p_nit_emprsa              IN  EM_TEMNE.EMNE_NITE%TYPE,
            p_tp_emprsa               IN  EM_TTPEM.TPEM_DTEM%TYPE,
            p_id_ussy                 OUT NE_TEMUS.EMUS_EMUS%TYPE,
            p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%TYPE,
            p_msj_rta                 OUT NE_TCRTA.CRTA_DESCRI%TYPE
        )IS
        
          v_cod_rta_rusne              NE_TCRTA.CRTA_CRTA%TYPE;
          v_cod_rta                    NE_TCRTA.CRTA_CRTA%TYPE;
          v_msj_rta                    NE_TCRTA.CRTA_DESCRI%TYPE;
          v_id_emus               NE_TEMUS.EMUS_EMUS%TYPE;
        BEGIN  
        
            NE_QFEUSY.registrarUsEmNego
            (
                p_nombre_roll       ,
                p_nombre_usuario    ,
                p_documento_persona ,
                p_nombre_emprsa     ,
                p_nit_emprsa        ,
                p_tp_emprsa         ,
                v_id_emus           ,
                v_cod_rta_rusne     
            );
              
            IF(v_cod_rta_rusne = 'OK') THEN
              v_cod_rta     := 'OK';
              v_msj_rta := 'se creo negocio correctamente';
            ELSE
                v_cod_rta     := 'ERR_ASIG_USEROL';
                v_msj_rta := 'No se creo negocio correctamente';
            END IF;
            p_cod_rta  := v_cod_rta;
            p_msj_rta  := v_msj_rta;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
                p_msj_rta  := 'Error Negocio no se creo negocio correctamente';
            
        END registrarUsEmNego;      

        -- ===========================================================
        -- PROCEDURE registrarUsEmNego
        -- -----------------------------------------------------------
        -- permite creacion del usuario
        -- ===========================================================
        PROCEDURE inactivarUsEmSy
        (
            p_nombre_roll             IN  US_TROLL.ROLL_RLDN%TYPE,
            p_nombre_usuario          IN  US_TUSER.USER_ALAS%TYPE,
            p_documento_persona       IN  US_TPSNA.PSNA_NRID%TYPE,
            p_nombre_emprsa           IN  EM_TEMNE.EMNE_NOBE%TYPE,
            p_nit_emprsa              IN  EM_TEMNE.EMNE_NITE%TYPE,
            p_tp_emprsa               IN  EM_TTPEM.TPEM_DTEM%TYPE,
            p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%TYPE,
            p_msj_rta                 OUT NE_TCRTA.CRTA_DESCRI%TYPE
        )IS
        
          v_cod_rta_rusne              NE_TCRTA.CRTA_CRTA%TYPE;
          v_cod_rta                    NE_TCRTA.CRTA_CRTA%TYPE;
          v_msj_rta                    NE_TCRTA.CRTA_DESCRI%TYPE;
        BEGIN  
        
            NE_QFEUSY.inactivarUsEmSy
            (
                p_nombre_roll      ,
                p_nombre_usuario   ,
                p_documento_persona,
                p_nombre_emprsa    ,
                p_nit_emprsa       ,
                p_tp_emprsa        ,
                v_cod_rta_rusne    
            );
              
            IF(v_cod_rta_rusne = 'OK') THEN
              v_cod_rta     := 'OK';
              v_msj_rta := 'se inactiva negocio correctamente';
            ELSE
                v_cod_rta     := 'ERR_ASIG_USEROL';
                v_msj_rta := 'No se inactiva negocio correctamente';
            END IF;
            p_cod_rta  := v_cod_rta;
            p_msj_rta  := v_msj_rta;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
                p_msj_rta  := 'Error Negocio no se inactiva negocio correctamente';
            
        END inactivarUsEmSy;   

        -- ===========================================================
        -- PROCEDURE registrarUsEmNego
        -- -----------------------------------------------------------
        -- permite creacion del usuario
        -- ===========================================================
        PROCEDURE activarUsEmSy
        (
            p_nombre_roll             IN  US_TROLL.ROLL_RLDN%TYPE,
            p_nombre_usuario          IN  US_TUSER.USER_ALAS%TYPE,
            p_documento_persona       IN  US_TPSNA.PSNA_NRID%TYPE,
            p_nombre_emprsa           IN  EM_TEMNE.EMNE_NOBE%TYPE,
            p_nit_emprsa              IN  EM_TEMNE.EMNE_NITE%TYPE,
            p_tp_emprsa               IN  EM_TTPEM.TPEM_DTEM%TYPE,
            p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%TYPE,
            p_msj_rta                 OUT NE_TCRTA.CRTA_DESCRI%TYPE
        )IS
        
          v_cod_rta_rusne              NE_TCRTA.CRTA_CRTA%TYPE;
          v_cod_rta                    NE_TCRTA.CRTA_CRTA%TYPE;
          v_msj_rta                    NE_TCRTA.CRTA_DESCRI%TYPE;
        BEGIN  
        
            NE_QFEUSY.activarUsEmSy
            (
                p_nombre_roll      ,
                p_nombre_usuario   ,
                p_documento_persona,
                p_nombre_emprsa    ,
                p_nit_emprsa       ,
                p_tp_emprsa        ,
                v_cod_rta_rusne    
            );
              
            IF(v_cod_rta_rusne = 'OK') THEN
              v_cod_rta     := 'OK';
              v_msj_rta := 'se activa negocio correctamente';
            ELSE
                v_cod_rta     := 'ERR_ASIG_USEROL';
                v_msj_rta := 'No se activa negocio correctamente';
            END IF;
            p_cod_rta  := v_cod_rta;
            p_msj_rta  := v_msj_rta;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
                p_msj_rta  := 'Error Negocio no se activa negocio correctamente';
            
        END activarUsEmSy; 
    -- ___________________________________________________________  
    
    -- ***********************************************************
    -- Procedimientos funcionalidad lugar negocio
    -- *********************************************************** 
    -- ---------------------------------------------------------------
    
        -- ===========================================================
        -- PROCEDURE consultarPaises
        -- -----------------------------------------------------------
        -- permite creacion del usuario
        -- ===========================================================   
        PROCEDURE consultarPaises
        (
            p_ne_tpsne       OUT NE_TT_NE_TPSNE,
            p_cod_rta        OUT NE_TCRTA.CRTA_CRTA%TYPE,
            p_msj_rta        OUT NE_TCRTA.CRTA_DESCRI%TYPE
        )IS 
            v_cod_consulps_rta           NE_TCRTA.CRTA_CRTA%TYPE;
            v_tt_ne_tt_ne_tpsne          NE_TT_NE_TPSNE := NE_TT_NE_TPSNE();
            v_cod_rta                    NE_TCRTA.CRTA_CRTA%TYPE;
            v_msj_rta                    NE_TCRTA.CRTA_DESCRI%TYPE;
        
        BEGIN  
        
            EM_QAPSNE.consultarPaises
            (
                v_tt_ne_tt_ne_tpsne        ,--OUT NE_TT_NE_TPSNE,
                v_cod_consulps_rta         --OUT NE_TCRTA.CRTA_CRTA%TYPE,
            );
              
            IF(v_cod_consulps_rta = 'OK') THEN
              p_ne_tpsne :=    v_tt_ne_tt_ne_tpsne;
              v_cod_rta  := 'OK';
              v_msj_rta  := 'se consultan páises';
            ELSE
                v_cod_rta     := 'ERR_CONSUL_PIS';
                v_msj_rta := 'No se activa negocio correctamente';
            END IF;
            p_cod_rta  := v_cod_rta;
            p_msj_rta  := v_msj_rta;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
                p_msj_rta  := 'Error No se puede consultar los paises';
            
        END consultarPaises;  

        -- ===========================================================
        -- PROCEDURE consultarDepartamePais
        -- -----------------------------------------------------------
        -- permite la cunsulta de un  departamento
        -- ===========================================================   
        PROCEDURE consultarDepartamePais
        (
            p_nombre_Pais    IN  NE_TPSNE.PSNE_NAME%TYPE,
            p_query_Pais     OUT NE_TPSNE.PSNE_NAME%TYPE,
            p_ne_tdene       OUT NE_TT_NE_TDENE,
            p_cod_rta        OUT NE_TCRTA.CRTA_CRTA%TYPE,
            p_msj_rta        OUT NE_TCRTA.CRTA_DESCRI%TYPE
        )IS 
            v_cod_consulps_rta           NE_TCRTA.CRTA_CRTA%TYPE;
            v_tt_ne_tt_NE_TDENE NE_TT_NE_TDENE := NE_TT_NE_TDENE();
            v_query_pais            NE_TPSNE.PSNE_NAME%type;
            v_cod_rta                    NE_TCRTA.CRTA_CRTA%TYPE := 'ERROR_NULL_VALUE';
            v_msj_rta                    NE_TCRTA.CRTA_DESCRI%TYPE;
        
        BEGIN
            IF(p_nombre_Pais IS NOT NULL) THEN        
        
                NE_QFLGNE.consultarDepartamePais
                (
                    p_nombre_Pais             ,--IN  NE_TPSNE.PSNE_NAME%TYPE,
                    v_query_pais              ,--OUT NE_TPSNE.PSNE_NAME%TYPE,
                    v_tt_ne_tt_NE_TDENE       ,--OUT NE_TT_NE_TDENE,
                    v_cod_consulps_rta         --OUT NE_TCRTA.CRTA_CRTA%TYPE,
                );
                  
                IF(v_cod_consulps_rta = 'OK') THEN
                    p_ne_tdene   := v_tt_ne_tt_NE_TDENE;
                    p_query_Pais := v_query_pais;
                    v_cod_rta    := 'OK';
                    v_msj_rta    := 'se consultan páises';
                ELSE
                    v_cod_rta     := 'ERR_CONSUL_PIS';
                    v_msj_rta := 'No se activa negocio correctamente';
                END IF;
            END IF;
            p_cod_rta  := v_cod_rta;
            p_msj_rta  := v_msj_rta;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
                p_msj_rta  := 'Error No se puede consultar los paises';
            
        END consultarDepartamePais;   

        -- ===========================================================
        -- PROCEDURE consultarDepartamePais
        -- -----------------------------------------------------------
        -- permite la cunsulta de un  departamento
        -- ===========================================================   
        PROCEDURE consultarCiudadxDepYPa
        (
            p_nombre_Pais    IN  NE_TPSNE.PSNE_NAME%type,
            p_nombre_Depa    IN  NE_TDENE.DENE_NAME%type,
            p_query_Pais     OUT NE_TPSNE.PSNE_NAME%type,
            p_query_dene     OUT NE_TDENE.DENE_DENE%type,
            p_ne_tcdne       OUT NE_TT_NE_TCDNE,
            p_cod_rta        OUT NE_TCRTA.CRTA_CRTA%type,
            p_msj_rta        OUT NE_TCRTA.CRTA_DESCRI%TYPE
        )IS 
            v_cod_consulps_rta           NE_TCRTA.CRTA_CRTA%TYPE;
            v_tt_ne_tt_ne_tcdne NE_TT_NE_TCDNE := NE_TT_NE_TCDNE();
            v_query_pais            NE_TPSNE.PSNE_NAME%type;
            v_query_dene            NE_TPSNE.PSNE_NAME%type;
            v_cod_rta                    NE_TCRTA.CRTA_CRTA%TYPE := 'ERROR_NULL_VALUE';
            v_msj_rta                    NE_TCRTA.CRTA_DESCRI%TYPE;
        
        BEGIN
            IF(p_nombre_Pais IS NOT NULL AND p_nombre_Depa IS NOT NULL) THEN        
        
                NE_QFLGNE.consultarCiudadxDepYPa
                (
                    p_nombre_Pais       ,--IN  NE_TPSNE.PSNE_NAME%type,
                    p_nombre_Depa       ,--IN  NE_TDENE.DENE_NAME%type,
                    v_query_pais        ,--OUT NE_TPSNE.PSNE_NAME%type,
                    v_query_dene        ,--OUT NE_TDENE.DENE_DENE%type,
                    v_tt_ne_tt_ne_tcdne ,--OUT NE_TT_NE_TCDNE,
                    v_cod_consulps_rta   --OUT NE_TCRTA.CRTA_CRTA%type
                );
                  
                IF(v_cod_consulps_rta = 'OK') THEN
                    p_ne_tcdne   := v_tt_ne_tt_ne_tcdne;
                    p_query_Pais := v_query_pais;
                    p_query_dene :=v_query_dene;
                    v_cod_rta    := 'OK';
                    v_msj_rta    := 'se consultan ciudades';
                ELSE
                    v_cod_rta     := 'ERR_CONSUL_PIS' || v_cod_consulps_rta;
                    v_msj_rta := 'No se consultan ciudades correctamente';
                END IF;
            END IF;
            p_cod_rta  := v_cod_rta;
            p_msj_rta  := v_msj_rta;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
                p_msj_rta  := 'Error No se puede consultar las ciudadees';
            
        END consultarCiudadxDepYPa;          
    -- ___________________________________________________________      
        
END PC_API_WEB;
/