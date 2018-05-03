prompt
prompt PACKAGE: EM_QEMPRESAS
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.EM_QEMPRESAS IS
    --
    -- ===========================================================
    -- EM_QEMPRESAS
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
    
	PROCEDURE obtenerEmpresaPorTipo
    (
        p_nombre_empresa      	  IN  EM_TEMNE.EMNE_NOBE%type,
		p_tempresa_nombre  		  IN  EM_TTPEM.TPEM_DTEM%type,
		p_empresa                 OUT EM_TT_EMTP,
		p_cod_rta          	  	  OUT NE_TCRTA.CRTA_CRTA%type
		

    );
	
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
    
END EM_QEMPRESAS;
/


prompt
prompt PACKAGE BODY:EM_QEMPRESAS
prompt

CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.EM_QEMPRESAS IS


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
				fs_pcrm_us.em_temne
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
				fs_pcrm_us.em_ttpem
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
	
	
	     -- ===========================================================
    -- PROCEDURE consultarRolUsuarioEmpresa
    -- -----------------------------------------------------------
    -- Servicio especializado para hacer la consultar del rol dado 
    -- un usuario registrado en el sistema pacrim
    -- ===========================================================
	PROCEDURE obtenerEmpresaPorTipo
    (
        p_nombre_empresa      	  IN  EM_TEMNE.EMNE_NOBE%type,
		p_tempresa_nombre  		  IN  EM_TTPEM.TPEM_DTEM%type,
		p_empresa                 OUT EM_TT_EMTP,
		p_cod_rta          	  	  OUT NE_TCRTA.CRTA_CRTA%type
		

    )IS

        cursor c_empresa_tipo 
		(
			pc_EMTE_TPEM EM_TTPEM.TPEM_TPEM%type,
			pc_EMTE_EMNE EM_TEMNE.EMNE_EMNE%type
		)is
			SELECT
			   *
			FROM
				em_ttpem te,em_temne e, em_temte es
			WHERE
				te.TPEM_TPEM = es.EMTE_TPEM AND
				e.EMNE_EMNE = es.EMTE_EMNE  AND 
				es.EMTE_TPEM = pc_EMTE_TPEM AND
				es.EMTE_EMNE = pc_EMTE_EMNE;

        r_empresa_tipo c_empresa_tipo%rowtype;

		v_id_nombre_empresa        EM_TTPEM.TPEM_TPEM%type;
		v_id_nombre_tipo_empresa   EM_TTPEM.TPEM_TPEM%type;
		v_cod_rta_tipo             NE_TCRTA.CRTA_CRTA%type;
		v_cod_rta          	  	   NE_TCRTA.CRTA_CRTA%type;
		v_lista_empresa_tipo	   EM_TO_EMTP;

		v_tt_lista_empresa_tipo EM_TT_EMTP := EM_TT_EMTP();
    BEGIN

		EM_QEMPRESAS.OBTENERIDTEMPRESA
		(
            p_tempresa_nombre,
            v_id_nombre_tipo_empresa,
            v_cod_rta_tipo
        );
		EM_QEMPRESAS.OBTENERIDEMPRESA
		(
            p_nombre_empresa,
            v_id_nombre_empresa,
            v_cod_rta
        );


		IF  v_cod_rta_tipo='OK' AND v_cod_rta='OK' THEN



		   FOR   r_empresa_tipo in c_empresa_tipo(v_id_nombre_tipo_empresa,v_id_nombre_empresa) LOOP

                v_lista_empresa_tipo:=EM_TO_EMTP(
		            r_empresa_tipo.TPEM_TPEM,
		            r_empresa_tipo.TPEM_DTEM,
		            r_empresa_tipo.TPEM_STEM, 
		            r_empresa_tipo.TPEM_FCCR,
		            r_empresa_tipo.TPEM_FCMO,
		            r_empresa_tipo.EMNE_EMNE,
		            r_empresa_tipo.EMNE_NOBE,
		            r_empresa_tipo.EMNE_NITE,	 
		            r_empresa_tipo.EMNE_FECR,	 
		            r_empresa_tipo.EMNE_FEMO,	 
		            r_empresa_tipo.EMTE_EMTE, 	 
		            r_empresa_tipo.EMTE_DTCR,	 
		            r_empresa_tipo.EMTE_DTMO,	 
		            r_empresa_tipo.EMTE_TPEM,	 
		            r_empresa_tipo.EMTE_EMNE	 
		        );
                v_tt_lista_empresa_tipo.extend;
                v_tt_lista_empresa_tipo(v_tt_lista_empresa_tipo.count):=v_lista_empresa_tipo;

             END LOOP;
            p_empresa:= v_tt_lista_empresa_tipo;
			p_cod_rta  := 'OK';
		ELSE
            p_empresa:= null;
            p_cod_rta  := 'ER_EMP_NUL';
        end if;
    EXCEPTION
        WHEN OTHERS THEN
            p_empresa:= null;
            p_cod_rta  := 'ERROR_NC';

    END obtenerEmpresaPorTipo;
    
    
END EM_QEMPRESAS;
/