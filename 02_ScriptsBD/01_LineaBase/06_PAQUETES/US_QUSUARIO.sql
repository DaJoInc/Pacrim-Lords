prompt
prompt PACKAGE: US_QUSUARIO
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.US_QUSUARIO IS
    --
    -- ===========================================================
    -- US_QUSUARIO
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
    
	
	PROCEDURE obtenerIdUsuario
    (
        p_nombre_usuario      IN   US_TUSNE.USNE_NOBE%type,
		p_contraseña_usuario  IN   US_TUSNE.USNE_PSWD%type,
		p_id_usuario  		  OUT  US_TUSNE.USNE_USNE%type,
		p_cod_rta          	  OUT  NE_TCRTA.CRTA_CRTA%type
    
    );
  -- ------------------------------------------------------------
	PROCEDURE obtenerIdRol
    (
        p_nombre_rusuario  		  IN  US_TTPRL.TPRL_RLDN%type,
		p_id_rusuario    		  OUT US_TTPRL.TPRL_TPRL%type,
		p_cod_rta          	  	  OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    -- ------------------------------------------------------------
    
END US_QUSUARIO;
/


prompt
prompt PACKAGE BODY:US_QUSUARIO
prompt

CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.US_QUSUARIO IS


    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE consultarRolUsuariorusuario
    -- -----------------------------------------------------------
    -- Servicio especializado para hacer la consultar del rol dado 
    -- un usuario registrado en el sistema pacrim
    -- ===========================================================
	PROCEDURE obtenerIdUsuario
    (
        p_nombre_usuario      IN   US_TUSNE.USNE_NOBE%type,
		p_contraseña_usuario  IN   US_TUSNE.USNE_PSWD%type,
		p_id_usuario  		  OUT  US_TUSNE.USNE_USNE%type,
		p_cod_rta          	  OUT  NE_TCRTA.CRTA_CRTA%type
    
    )IS
        
        cursor c_rusuario is
			SELECT
				USNE_USNE
			FROM
				fs_pcrm_us.US_TUSNE
			WHERE
			   USNE_NOBE=p_nombre_usuario AND
			   USNE_PSWD=p_contraseña_usuario;

			r_rusuario c_rusuario%rowtype;
        
    BEGIN
      
        open c_rusuario;
        fetch c_rusuario into r_rusuario;
        close c_rusuario;
        
        if(r_rusuario.USNE_USNE is not null) then
        
			p_id_usuario := r_rusuario.USNE_USNE;
            p_cod_rta  := 'OK';
            
        else
            p_id_usuario:= null;
            p_cod_rta  := 'ER_EMP_NUL';
        end if;
    EXCEPTION
        WHEN OTHERS THEN
            p_id_usuario:= null;
            p_cod_rta  := 'ERROR_NC';
        
    END obtenerIdUsuario;
	
	
        -- ===========================================================
    -- PROCEDURE consultarRolUsuariorusuario
    -- -----------------------------------------------------------
    -- Servicio especializado para hacer la consultar del rol dado 
    -- un usuario registrado en el sistema pacrim
    -- ===========================================================
	PROCEDURE obtenerIdRol
    (
        p_nombre_rusuario  		  IN  US_TTPRL.TPRL_RLDN%type,
		p_id_rusuario  			  OUT US_TTPRL.TPRL_TPRL%type,
		p_cod_rta          	  	  OUT NE_TCRTA.CRTA_CRTA%type
		
    )IS
        
        cursor c_trusuario is
			SELECT
				TPRL_TPRL
			FROM
				fs_pcrm_us.US_TTPRL
			WHERE
				TPRL_RLDN = p_nombre_rusuario;
				
        r_trusuario c_trusuario%rowtype;
		
    BEGIN
      
        open c_trusuario;
        fetch c_trusuario into r_trusuario;
        close c_trusuario;
        
        if(r_trusuario.TPRL_TPRL is not null) then
        
			p_id_rusuario := r_trusuario.TPRL_TPRL;
            p_cod_rta  := 'OK';
            
        else
            p_id_rusuario:= null;
            p_cod_rta  := 'ER_EMP_NUL';
        end if;
    EXCEPTION
        WHEN OTHERS THEN
            p_id_rusuario:= null;
            p_cod_rta  := 'ERROR_NC';
        
    END obtenerIdRol;
    
    
END US_QUSUARIO;
/