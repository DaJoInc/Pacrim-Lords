prompt
prompt PACKAGE: EM_QFEMPSA
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.EM_QFEMPSA IS
    --
    -- ===========================================================
    -- EM_QFEMPSA
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
    

	
	PROCEDURE obtenerIdEmpresa
    (
        p_nombre_empresa      IN   EM_TEMNE.EMNE_NOBE%type,
		p_id_empresa          OUT  EM_TEMNE.EMNE_EMNE%type,
		p_cod_rta          	  OUT NE_TCRTA.CRTA_CRTA%type
    
    );
 
	PROCEDURE obtenerIdTEmpresa
    (
        p_tempresa_nombre  		  IN  EM_TTPEM.TPEM_DTEM%type,
		p_id_tipo_empresa         OUT EM_TTPEM.TPEM_TPEM%type,
		p_cod_rta          	  	  OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    -- ------------------------------------------------------------
    
END EM_QFEMPSA;
/


prompt
prompt PACKAGE BODY:EM_QFEMPSA
prompt

CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.EM_QFEMPSA IS


    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE consultarRolUsuarioEmpresa
    -- -----------------------------------------------------------
    -- Servicio especializado para hacer la consultar del rol dado 
    -- un usuario registrado en el sistema pacrim
    -- ===========================================================
	PROCEDURE obtenerIdEmpresa
    (
        p_nombre_empresa      IN   EM_TEMNE.EMNE_NOBE%type,
		p_id_empresa          OUT  EM_TEMNE.EMNE_EMNE%type,
		p_cod_rta          	  OUT NE_TCRTA.CRTA_CRTA%type
    
    )IS
        
        cursor c_empresa is
			SELECT
				emne_emne
			FROM
				FS_PCRM_US.em_temne
			WHERE
			   emne_nobe=p_nombre_empresa;

			r_empresa c_empresa%rowtype;
        
    BEGIN
      
        open c_empresa;
        fetch c_empresa into r_empresa;
        close c_empresa;
        
        if(r_empresa.emne_emne is not null) then
        
			p_id_empresa := r_empresa.emne_emne;
            p_cod_rta  := 'OK';
            
        else
            p_id_empresa:= null;
            p_cod_rta  := 'ER_EMP_NUL';
        end if;
    EXCEPTION
        WHEN OTHERS THEN
            p_id_empresa:= null;
            p_cod_rta  := 'ERROR_NC';
        
    END obtenerIdEmpresa;
	
	
        -- ===========================================================
    -- PROCEDURE consultarRolUsuarioEmpresa
    -- -----------------------------------------------------------
    -- Servicio especializado para hacer la consultar del rol dado 
    -- un usuario registrado en el sistema pacrim
    -- ===========================================================
	PROCEDURE obtenerIdTEmpresa
    (
        p_tempresa_nombre  		  IN  EM_TTPEM.TPEM_DTEM%type,
		p_id_tipo_empresa         OUT EM_TTPEM.TPEM_TPEM%type,
		p_cod_rta          	  	  OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        
        cursor c_tempresa is
			SELECT
				tpem_tpem
			FROM
				FS_PCRM_US.em_ttpem
			WHERE
				tpem_dtem = p_tempresa_nombre;
				
        r_tempresa c_tempresa%rowtype;
		
    BEGIN
      
        open c_tempresa;
        fetch c_tempresa into r_tempresa;
        close c_tempresa;
        
        if(r_tempresa.tpem_tpem is not null) then
        
			p_id_tipo_empresa := r_tempresa.tpem_tpem;
            p_cod_rta  := 'OK';
            
        else
            p_id_tipo_empresa:= null;
            p_cod_rta  := 'ER_EMP_NUL';
        end if;
    EXCEPTION
        WHEN OTHERS THEN
            p_id_tipo_empresa:= null;
            p_cod_rta  := 'ERROR_NC';
        
    END obtenerIdTEmpresa;
	
	

    
END EM_QFEMPSA;
/