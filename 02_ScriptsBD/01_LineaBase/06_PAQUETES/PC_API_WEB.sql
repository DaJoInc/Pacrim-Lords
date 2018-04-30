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

    PROCEDURE comprarUsuario 
    (
        p_ctrl_operacion  IN  PYNT_TT_PN_TLGTR,
        p_slpn_in         IN  PYNT_TT_PN_TSLPN,
        p_slpn_out        OUT PYNT_TT_PN_TSLPN,
        p_runt_saldo      OUT number,
        p_cod_rta         OUT VARCHAR2,
        p_msj_rta         OUT VARCHAR2,
        p_mensajes        OUT PYNT_TT_PN_TMNSJE
    );
   
   
    -- ------------------------------------------------------------
    
END PC_API_WEB;
/


prompt
prompt PACKAGE BODY:PC_API_WEB
prompt

CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.PC_API_WEB IS


    -- ------------------------------------------------------------

    PROCEDURE comprarUsuario 
    (
        p_ctrl_operacion  IN  PYNT_TT_PN_TLGTR,
        p_slpn_in         IN  PYNT_TT_PN_TSLPN,
        p_slpn_out        OUT PYNT_TT_PN_TSLPN,
        p_runt_saldo      OUT number,
        p_cod_rta         OUT VARCHAR2,
        p_msj_rta         OUT VARCHAR2,
        p_mensajes        OUT PYNT_TT_PN_TMNSJE
    )
    IS
        v_mensajes PYNT_TT_PN_TMNSJE    := PYNT_TT_PN_TMNSJE();
        
        v_prcs_gral                     PN_TCRTA.crta_prcs%type;       --Proceso al cual pertenece el codigo de respuesta
        v_crta_http_gral                PN_TCRTA.crta_http_code%type;  --Codigo Http para el cogido interno de respuesta  
        v_crta_descri_gral              PN_TCRTA.crta_descri%type;     --Descripcion general del codigo de respuesta
        v_Usuario_id                        PN_TUsuario.Usuario_Usuario%type;           --ID Usuario interno
        v_lgtr                          PN_TLGTR.lgtr_lgtr%type;       --Log de trasnsacciones
        v_lgtr_id_entidad               PN_TLGTR.lgtr_id_entidad%type; --id entidad
        e_lgtr_exception                exception;                     --Excepcion exclusiva para el log de operaciones

    BEGIN
        --
        v_prcs_gral := 'PC_API_WEB.comprarUsuario';
        
        -- =============================================
        -- Se validan los parametros para inicio de log
        -- =============================================
        DECLARE
            v_cod_rspta_lgtr_v            PN_TCRTA.crta_crta%type;
            v_cod_rpta_descri_lgtr_v      PN_TCRTA.crta_descri%type;
        BEGIN
            PN_QLGTR_PYNT.validar_ctrl_operacion
            (   
                v_prcs_gral,
                p_ctrl_operacion,
                v_cod_rspta_lgtr_v,
                v_cod_rpta_descri_lgtr_v,
                v_mensajes
            );
            
            if(v_cod_rspta_lgtr_v <> 'OK') then
                raise e_lgtr_exception; 
            end if;
        END;
        
        -- =============================================
        -- Se inicializa el log general para toda
        -- la transaccion. A traves del log se puende
        -- consultar el estado final y los errores
        -- =============================================
        declare
            v_cod_rspta_lgtr         PN_TCRTA.crta_crta%type;       
            v_cod_rpta_descri_lgtr   PN_TCRTA.crta_descri%type;
        begin
        
            PN_QLGTR_PYNT.iniciar_log
            (
                p_ctrl_operacion,
                v_prcs_gral,
                v_cod_rspta_lgtr,
                v_cod_rpta_descri_lgtr,
                v_lgtr
            ); 
            
            
        end; 
        
        -- =============================================
        -- Se realizan llamado a servicio especializado
        -- de negocio para la compra Usuario
        -- =============================================
        DECLARE
        
        BEGIN
            PN_QGUsuario_PYNT.comprarUsuario
            (
                v_prcs_gral        ,--P_PRCS 
                p_slpn_in          ,--P_SLPN_IN 
                p_slpn_out         ,--P_SLPN_OUT
                p_runt_saldo       ,--P_RUNT_SALDO
                v_Usuario_id           ,--P_Usuario_ID
                p_cod_rta          ,--P_COD_RTA 
                p_msj_rta          ,--P_MSJ_RTA 
                p_mensajes          --P_MENSAJES
            );
            
        END;
        
        -- =============================================
        -- Luego de realizar todos los pasos de 
        -- negocio se finaliza el log
        -- de transaccion con el codigo general
        -- =============================================
        declare
            v_cod_rspta_lgtr         PN_TCRTA.crta_crta%type;         
            v_cod_rpta_descri_lgtr   PN_TCRTA.crta_descri%type;
            v_cod_rspta_dlgtr        PN_TCRTA.crta_crta%type;
            v_cod_rpta_descri_dlgtr  PN_TCRTA.crta_descri%type;
            
            v_dlgtr_observ           PN_TDLGTR.dlgtr_observ%type;
            v_dlgtr_error            PN_TDLGTR.dlgtr_error%type;
        begin
            
            if(p_mensajes is not null) then
                
            
                for i in 1 .. p_mensajes.count loop
                    
                    
                    v_dlgtr_observ := 'Mensaje Respuesta '||i||'. '||P_MENSAJES(i).crta;
                    
                    
                    if(P_MENSAJES(i).crta = 'OK') then
                        v_dlgtr_error:='Sin error';
                        
                    else
                        v_dlgtr_error:='Detalle error: '||P_MENSAJES(i).detalle;
                        
                    end if;
                    
                    
                    PN_QLGTR_PYNT.registrar_detalle_log
                    (
                        v_lgtr,
                        v_prcs_gral,
                        nvl(P_MENSAJES(i).crta, p_cod_rta),
                        SUBSTR(v_dlgtr_observ, 1,1000),
                        SUBSTR(v_dlgtr_error, 1, 4000),
                        v_cod_rspta_dlgtr,
                        v_cod_rpta_descri_dlgtr
                    );
                    
                    
                end loop;
                
            end if;
        
            
            v_lgtr_id_entidad := to_char(''||nvl(to_char(v_Usuario_id), '-'));
            
            PN_QLGTR_PYNT.finalizar_log
            (
                v_lgtr,
                p_cod_rta,
                v_lgtr_id_entidad,
                v_cod_rspta_lgtr,
                v_cod_rpta_descri_lgtr
            );
            
        
        end;

        
        
    EXCEPTION
        WHEN e_lgtr_exception THEN
            
            p_cod_rta  := 'ERROR';
            p_msj_rta  := 'Operacion finaliza con errores. Error validando parametros de control';
            p_mensajes := v_mensajes;
        
        WHEN OTHERS THEN
                
            p_cod_rta  := 'ERROR';
            p_msj_rta  := 'Operacion finaliza con errores API. Error BD: '||sqlerrm;
            p_mensajes := v_mensajes;
       
       

    END comprarUsuario;
    
    
END PC_API_WEB;
/