prompt
prompt PACKAGE: NE_QNEGOCIO
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.NE_QNEGOCIO IS
    --
    -- ===========================================================
    -- NE_QNEGOCIO
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
    
	PROCEDURE obtenerUsuarioEmpresaPorRol
    (
        p_nombre_empresa      	  IN  EM_TEMNE.EMNE_NOBE%type,
		p_tempresa_nombre  		  IN  EM_TTPEM.TPEM_DTEM%type,
        p_nombre_usuario          IN   US_TUSNE.USNE_NOBE%type,
		p_contraseña_usuario      IN   US_TUSNE.USNE_PSWD%type,
		p_nombre_rusuario  		  IN  US_TTPRL.TPRL_RLDN%type,
		p_usuario_sistema         OUT NE_TT_EMUS,
		p_cod_rta          	  	  OUT NE_TCRTA.CRTA_CRTA%type
    );
	
    -- ------------------------------------------------------------
    
END NE_QNEGOCIO;
/


prompt
prompt PACKAGE BODY:NE_QNEGOCIO
prompt

CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.NE_QNEGOCIO IS


    --
    -- #VERSION:0000001000
    --
    
  
	
	-- ===========================================================
    -- PROCEDURE consultarRolUsuarioEmpresa
    -- -----------------------------------------------------------
    -- Servicio especializado para hacer la consultar del rol dado 
    -- un usuario registrado en el sistema pacrim
    -- ===========================================================
	PROCEDURE obtenerUsuarioEmpresaPorRol
    (
        p_nombre_empresa      	  IN  EM_TEMNE.EMNE_NOBE%type,
		p_tempresa_nombre  		  IN  EM_TTPEM.TPEM_DTEM%type,
        p_nombre_usuario          IN   US_TUSNE.USNE_NOBE%type,
		p_contraseña_usuario      IN   US_TUSNE.USNE_PSWD%type,
		p_nombre_rusuario  		  IN  US_TTPRL.TPRL_RLDN%type,
		p_usuario_sistema         OUT NE_TT_EMUS,
		p_cod_rta          	  	  OUT NE_TCRTA.CRTA_CRTA%type
    )IS

        cursor c_empresa_tipo 
		(
		    pc_id_usuario  US_TUSNE.USNE_USNE%type,
			pc_id_rusuario US_TTPRL.TPRL_TPRL%type,
			pc_id_remte    EM_TEMTE.EMTE_EMTE%type
		)is
			SELECT
			   *
			FROM
				ne_temus nt,us_tusne u, us_ttprl ut, EM_TEMTE mte
			WHERE
				nt.EMUS_TPRL = ut.TPRL_TPRL   AND
				nt.EMUS_USNE = u.USNE_USNE    AND 
                nt.EMUS_EMTE = mte.EMTE_EMTE  AND 
				nt.EMUS_USNE = pc_id_usuario  AND 
				nt.EMUS_TPRL = pc_id_rusuario AND
                nt.EMUS_EMTE = pc_id_remte;              
                

        r_empresa_tipo c_empresa_tipo%rowtype;

		v_id_usuario  US_TUSNE.USNE_USNE%type;
		v_id_rusuario US_TTPRL.TPRL_TPRL%type;
		v_id_remte    EM_TEMTE.EMTE_EMTE%type;
		v_cod_rluser_tipo          NE_TCRTA.CRTA_CRTA%type;
		v_cod_rta_user             NE_TCRTA.CRTA_CRTA%type;
		v_cod_rta_ente             NE_TCRTA.CRTA_CRTA%type;
		v_tt_lista_empresa_tipo    EM_TT_EMTP := EM_TT_EMTP();
		
		v_lista_usuario_negocio	   NE_TO_EMUS;
		v_tt_lista_usuario_negocio NE_TT_EMUS := NE_TT_EMUS();
    BEGIN

		US_QUSUARIO.obtenerIdUsuario
		(
            p_nombre_usuario,
            p_contraseña_usuario,
			v_id_usuario,
            v_cod_rta_user
        );
		
		US_QUSUARIO.obtenerIdRol
		(
            p_nombre_rusuario,
            v_id_rusuario,
            v_cod_rluser_tipo
        );	
		
		EM_QEMPRESAS.obtenerEmpresaPorTipo
		(
            p_nombre_empresa,
            p_tempresa_nombre,
			v_tt_lista_empresa_tipo,
            v_cod_rta_ente
        );


		IF  v_cod_rta_user='OK' AND v_cod_rluser_tipo='OK' AND v_cod_rta_ente='OK' THEN

			for i in 1..  v_tt_lista_empresa_tipo.count LOOP 
				    FOR   r_empresa_tipo in c_empresa_tipo(v_id_usuario,v_id_rusuario,v_tt_lista_empresa_tipo(i).EMTE_EMTE) LOOP
                        v_lista_usuario_negocio:=NE_TO_EMUS
                        (
                            r_empresa_tipo.EMUS_EMUS ,
                        	r_empresa_tipo.EMUS_FECR ,
                        	r_empresa_tipo.EMUS_FEMO ,
                        	r_empresa_tipo.EMUS_TPNE ,
                        	r_empresa_tipo.EMUS_EMTE ,
                        	r_empresa_tipo.EMUS_USNE ,
                        	r_empresa_tipo.EMUS_TPRL ,
                        	r_empresa_tipo.USNE_USNE ,
                        	r_empresa_tipo.USNE_NOBE ,
                        	r_empresa_tipo.USNE_APDO ,
                        	r_empresa_tipo.USNE_DIRN ,
                        	r_empresa_tipo.USNE_TLFN ,
                        	r_empresa_tipo.USNE_EMAL ,
                        	r_empresa_tipo.USNE_PAIS ,
                        	r_empresa_tipo.USNE_USAO ,
                        	r_empresa_tipo.USNE_NRID ,
                        	r_empresa_tipo.USNE_PSWD ,
                        	r_empresa_tipo.TPRL_TPRL ,
                        	r_empresa_tipo.TPRL_RLDN ,
                        	r_empresa_tipo.TPRL_FCCE ,
                        	r_empresa_tipo.TPRL_FCMO ,
                        	r_empresa_tipo.EMTE_EMTE ,
                        	r_empresa_tipo.EMTE_DTCR ,
                        	r_empresa_tipo.EMTE_DTMO ,
                        	r_empresa_tipo.EMTE_TPEM ,
                        	r_empresa_tipo.EMTE_EMNE 
                        );
                    v_tt_lista_usuario_negocio.extend;
                    v_tt_lista_usuario_negocio(v_tt_lista_usuario_negocio.count):=v_lista_usuario_negocio;
                END LOOP;
            END LOOP;
			p_usuario_sistema:=v_tt_lista_usuario_negocio;
			p_cod_rta  := 'OK';
		ELSE
            p_usuario_sistema:=null;
            p_cod_rta  := 'ER_EMP_NUL';
        end if;
    EXCEPTION
        WHEN OTHERS THEN
            p_usuario_sistema:=null;
            p_cod_rta  := 'ERROR_NC';

    END obtenerUsuarioEmpresaPorRol;
    
    
END NE_QNEGOCIO;
/