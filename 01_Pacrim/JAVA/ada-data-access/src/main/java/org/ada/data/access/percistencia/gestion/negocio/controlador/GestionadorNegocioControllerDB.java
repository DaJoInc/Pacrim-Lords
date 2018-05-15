/*
 * MIT License 
 * 
 * Copyright (c) 2018 ADA INC
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.data.access.percistencia.gestion.negocio.controlador;

import java.util.HashMap;

import org.ada.data.access.percistencia.mapper.GestionadorNegocioMapper;
import org.ada.security.model.persitencia.negocio.NegocioDBDto;
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
public class GestionadorNegocioControllerDB {

	@Autowired
	GestionadorNegocioMapper gestionadorNegocioMapper;

	public ProcesoRespuestaApiDb registrarUsuarioNegocio( NegocioDBDto negocioDBDto)  throws Exception{


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
		
		parametrosInOout.put("p_nombre_roll",negocioDBDto.getP_NOMBRE_ROLL() );
		parametrosInOout.put("p_nombre_usuario",negocioDBDto.getP_NOMBRE_USUARIO() );
		parametrosInOout.put("p_documento_persona",negocioDBDto.getP_DOCUMENTO_PERSONA() );
		parametrosInOout.put("p_nombre_emprsa",negocioDBDto.getP_NOMBRE_EMPRSA() );
		parametrosInOout.put("p_nit_emprsa",negocioDBDto.getP_NIT_EMPRSA());
		parametrosInOout.put("p_tp_emprsa",negocioDBDto.getP_TP_EMPRSA() );
		parametrosInOout.put("p_id_ussy",null);
		parametrosInOout.put("p_cod_rta", null);
		parametrosInOout.put("p_msj_rta", null);
		gestionadorNegocioMapper.registrarUsuarioNegocio(parametrosInOout);
		respuestaApiDb = new ProcesoRespuestaApiDb();
		
		respuestaApiDb.setCodigoRespuestaApi( (String) parametrosInOout.get("p_cod_rta"));
		respuestaApiDb.setMensajeRespuestaApi( (String) parametrosInOout.get("p_msj_rta"));

		if (respuestaApiDb!=null && respuestaApiDb.getCodigoRespuestaApi()!=null) {

			return respuestaApiDb;

		}else {
			return null;
		}




	}
	
	
	public ProcesoRespuestaApiDb inactivarNegocioUsuario( NegocioDBDto negocioDBDto)  throws Exception{


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
		
		
		parametrosInOout.put("p_nombre_roll",negocioDBDto.getP_NOMBRE_ROLL() );
		parametrosInOout.put("p_nombre_usuario",negocioDBDto.getP_NOMBRE_USUARIO() );
		parametrosInOout.put("p_documento_persona",negocioDBDto.getP_DOCUMENTO_PERSONA() );
		parametrosInOout.put("p_nombre_emprsa",negocioDBDto.getP_NOMBRE_EMPRSA() );
		parametrosInOout.put("p_nit_emprsa",negocioDBDto.getP_NIT_EMPRSA());
		parametrosInOout.put("p_tp_emprsa",negocioDBDto.getP_TP_EMPRSA() );

		parametrosInOout.put("p_cod_rta", null);
		parametrosInOout.put("p_msj_rta", null);
		gestionadorNegocioMapper.inactivarNegocioUsuario(parametrosInOout);
		respuestaApiDb = new ProcesoRespuestaApiDb();
		
		respuestaApiDb.setCodigoRespuestaApi( (String) parametrosInOout.get("p_cod_rta"));
		respuestaApiDb.setMensajeRespuestaApi( (String) parametrosInOout.get("p_msj_rta"));

		if (respuestaApiDb!=null && respuestaApiDb.getCodigoRespuestaApi()!=null) {

			return respuestaApiDb;

		}else {
			return null;
		}

	}

	
	public ProcesoRespuestaApiDb activarNegocioUsuario( NegocioDBDto negocioDBDto)  throws Exception{


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
		
		
		parametrosInOout.put("p_nombre_roll",negocioDBDto.getP_NOMBRE_ROLL() );
		parametrosInOout.put("p_nombre_usuario",negocioDBDto.getP_NOMBRE_USUARIO() );
		parametrosInOout.put("p_documento_persona",negocioDBDto.getP_DOCUMENTO_PERSONA() );
		parametrosInOout.put("p_nombre_emprsa",negocioDBDto.getP_NOMBRE_EMPRSA() );
		parametrosInOout.put("p_nit_emprsa",negocioDBDto.getP_NIT_EMPRSA());
		parametrosInOout.put("p_tp_emprsa",negocioDBDto.getP_TP_EMPRSA() );

		parametrosInOout.put("p_cod_rta", null);
		parametrosInOout.put("p_msj_rta", null);
		gestionadorNegocioMapper.activarNegocioUsuario(parametrosInOout);
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




