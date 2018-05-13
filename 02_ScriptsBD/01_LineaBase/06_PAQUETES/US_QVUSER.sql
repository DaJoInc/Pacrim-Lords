prompt
prompt PACKAGE: US_QVUSER
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.US_QVUSER IS
    --
    -- ===========================================================
    -- US_QVUSER
    -- -----------------------------------------------------------
    -- validador de existencia de usuario
    -- ===========================================================
    --
    -- #VERSION:0000001000
    --
    -- HISTORIAL DE CAMBIOS
    --
    -- Versión        GAP                Solicitud        Fecha        Realizó            Descripción
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------
    -- 
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------

    -- ============================================================
    -- Constantes generales a nivel de PAQUETE
    -- ============================================================
  
    
    -- ============================================================
    -- Declaracion de PROCEDIMIENTOS y FUNCIONES
    -- ============================================================
    
  PROCEDURE validarUsuarioPorNombre
    (
        p_nombre_usuario               IN  US_TUSER.USER_ALAS%type,
        p_existencia_usuario           OUT BOOLEAN,
        p_cod_rta                      OUT NE_TCRTA.CRTA_CRTA%type
    ); 

----------------------------------------------------------
    
END US_QVUSER;
/


prompt
prompt PACKAGE BODY:US_QVUSER
prompt

CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.US_QVUSER IS


    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE validarUsuarioPorNombre
    -- -----------------------------------------------------------
    -- validar existencia de usuario
    -- ===========================================================
    PROCEDURE validarUsuarioPorNombre
    (
        p_nombre_usuario               IN  US_TUSER.USER_ALAS%type,
        p_existencia_usuario           OUT BOOLEAN,
        p_cod_rta                      OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        
        CURSOR c_usuario IS
			SELECT
				USER_ALAS
			FROM
				FS_PCRM_US.US_TUSER
            WHERE
                USER_ALAS = p_nombre_usuario;

			r_usuario c_usuario%rowtype;
        
    BEGIN
      
        OPEN  c_usuario;
        FETCH c_usuario INTO r_usuario;
        CLOSE c_usuario;
        
        IF(r_usuario.USER_ALAS IS NULL) then
        
			p_existencia_usuario := TRUE;
            p_cod_rta            := 'OK';
            
        ELSE
            p_existencia_usuario := FALSE;
            p_cod_rta            := 'ER_EMP_NUL';
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            p_existencia_usuario := FALSE;
            p_cod_rta            := 'ERROR_NC';
        
    END validarUsuarioPorNombre;
    
END US_QVUSER;
/