prompt
prompt PACKAGE: US_QUSER_PACR
prompt
CREATE OR REPLACE PACKAGE VU_SFI.US_QUSER_PACR IS
    --
    -- ===========================================================
    -- US_QUSER_PACR
    -- -----------------------------------------------------------
    -- Reúne funciones y procedimientos relacionados con la 
    -- gestion de Usuarios. Paquete especializado de negocio
    -- ===========================================================
    --
    -- #VERSION:0000001000
    --
    -- HISTORIAL DE CAMBIOS
    --
    -- Versión        GAP                Solicitud        Fecha        Realizó            Descripción
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------
    -- 1000                                             03/03/2018      ownk           Se crean API de servicios para el modulo de Gestion Usuario Pacrim
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------

    -- ============================================================
    -- Constantes generales a nivel de PAQUETE
    -- ============================================================
  
    
    -- ============================================================
    -- Declaracion de PROCEDIMIENTOS y FUNCIONES
    -- ============================================================
    
    PROCEDURE consultarUsuarioSistema
    (
        p_username_id     IN  US_TUSNE.USNE_USAO%type,
        p_empresa_id      IN  NE_TEMUS.EMUS_EMTE%type,
        p_empresa_rol_id  IN  NE_TEMUS.EMUS_TPRL%type,
        p_rol_sistem      OUT NE_TEMUS.TPRL_TPRL%type,
        p_cod_rta         OUT NE_TCRTA.CRTA_CRTA%type
    
    );
    
    -- ------------------------------------------------------------
    
END US_QUSER_PACR;
/


prompt
prompt PACKAGE BODY:US_QUSER_PACR
prompt

CREATE OR REPLACE PACKAGE BODY VU_SFI.US_QUSER_PACR IS


    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE consultarRolUsuarioEmpresa
    -- -----------------------------------------------------------
    -- Servicio especializado para hacer la consultar del rol dado 
    -- un usuario registrado en el sistema pacrim
    -- ===========================================================
    PROCEDURE consultarUsuarioSistema
    (
        p_username_id     IN  US_TUSNE.USNE_USAO%type,
        p_empresa_id      IN  NE_TEMUS.EMUS_EMTE%type,
        p_empresa_rol_id  IN  NE_TEMUS.EMUS_TPRL%type,
        p_rol_sistem      OUT NE_TEMUS.TPRL_TPRL%type,
        p_cod_rta         OUT NE_TCRTA.CRTA_CRTA%type
    
    )IS
        
        
        cursor c_usuario is
        SELECT
           *
        FROM
            NE_TEMUS,US_TUSNE,US_TTPRL,EM_TEMTE
        WHERE 
          EMUS_EMTE =  EMTE_EMTE      AND
        EMUS_USNE=USNE_USNE           AND
        EMUS_TPRL = TPRL_TPRL         AND
        EMUS_USNE=p_username_id       AND
        TPRL_TPRL = p_empresa_rol_id  AND
        EMUS_EMTE = p_empresa_id;
        
        r_usuario c_usuario%rowtype;
        
    BEGIN
      
        open c_usuario;
        fetch c_usuario into r_usuario;
        close c_usuario;
        
        if(r_usuario.emus_emus is not null) then
        
        
            p_cod_rta  := 'OK';
            
        else
            p_runt_saldo:= null;
            p_cod_rta  := 'ER_RUNT_NE';
        end if;
    EXCEPTION
        WHEN OTHERS THEN
            p_runt_saldo:= null;
            p_cod_rta  := 'ERROR_NC';
        
    END consultarUsuarioSistema;
    

    
    
END US_QUSER_PACR;
/