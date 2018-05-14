/*
 * MIT License 
 * 
 * Copyright (c) 2018 ADA INC
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.data.access.percistencia.gestion.empresa.controlador;

import java.util.HashMap;

import org.ada.data.access.percistencia.mapper.GestionadorEmpresasMapper;
import org.ada.security.model.persitencia.empresa.EmpresaDBDto;
import org.ada.security.model.persitencia.respuesta.ProcesoRespuestaApiDb;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



/**
 *
 * <h1>GestionConvocatoriaControllerDB
 *
 * Description
 *
 * @author THEOVERLORDKOTAN (ADA, Inc) 
 * @version 1.0
 * 
 */

@Component
public class GestionadorEmpresaControllerDB {

	@Autowired
	GestionadorEmpresasMapper gestionadorEmpresasMapper;

	public ProcesoRespuestaApiDb crearEmpresaNegocio( EmpresaDBDto  empresaDBDto)  throws Exception{


		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */

		HashMap<Object, Object> parametrosInOout = new HashMap<Object, Object>();
		ProcesoRespuestaApiDb  respuestaApiDb = null;



		/*
		 * ==============================================
		 * Se se realiza el mapeo de los parametros 
		 * de entrada que necesita el servicio ofrecido por 
		 * la API 
		 * ************************************************* 
		 */
		
		parametrosInOout.put("p_nombre_emprsa",empresaDBDto.getP_NOMBRE_EMPRSA() );
		parametrosInOout.put("p_nit_emprsa",empresaDBDto.getP_NIT_EMPRSA() );
		parametrosInOout.put("p_tp_emprsa",empresaDBDto.getP_TP_EMPRSA() );
		
		parametrosInOout.put("p_cod_rta", null);
		parametrosInOout.put("p_msj_rta", null);
		gestionadorEmpresasMapper.crearEmpresaNegocio(parametrosInOout);
		respuestaApiDb = new ProcesoRespuestaApiDb();
		
		respuestaApiDb.setCodigoRespuestaApi( (String) parametrosInOout.get("p_cod_rta"));
		respuestaApiDb.setMensajeRespuestaApi( (String) parametrosInOout.get("p_msj_rta"));

		if (respuestaApiDb!=null && respuestaApiDb.getCodigoRespuestaApi()!=null) {

			return respuestaApiDb;

		}else {
			return null;
		}




	}
	
	
	public ProcesoRespuestaApiDb asignarNegocioEmpresa(EmpresaDBDto  empresaDBDto)  throws Exception{


		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */

		HashMap<Object, Object> parametrosInOout = new HashMap<Object, Object>();
		ProcesoRespuestaApiDb  respuestaApiDb = null;



		/*
		 * ==============================================
		 * Se se realiza el mapeo de los parametros 
		 * de entrada que necesita el servicio ofrecido por 
		 * la API 
		 * ************************************************* 
		 */
		
		parametrosInOout.put("p_nombre_emprsa",empresaDBDto.getP_NOMBRE_EMPRSA() );
		parametrosInOout.put("p_nit_emprsa",empresaDBDto.getP_NIT_EMPRSA() );
		parametrosInOout.put("p_tp_emprsa",empresaDBDto.getP_TP_EMPRSA() );
		
		parametrosInOout.put("p_cod_rta", null);
		parametrosInOout.put("p_msj_rta", null);
		gestionadorEmpresasMapper.asignarNegocioEmpresa(parametrosInOout);
		respuestaApiDb = new ProcesoRespuestaApiDb();
		
		respuestaApiDb.setCodigoRespuestaApi( (String) parametrosInOout.get("p_cod_rta"));
		respuestaApiDb.setMensajeRespuestaApi( (String) parametrosInOout.get("p_msj_rta"));

		if (respuestaApiDb!=null && respuestaApiDb.getCodigoRespuestaApi()!=null) {

			return respuestaApiDb;

		}else {
			return null;
		}
	}

	
}




