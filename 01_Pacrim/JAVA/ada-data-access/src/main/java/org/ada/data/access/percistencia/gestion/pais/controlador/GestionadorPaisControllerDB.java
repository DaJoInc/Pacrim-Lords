/*
 * MIT License 
 * 
 * Copyright (c) 2018 ADA INC
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.data.access.percistencia.gestion.pais.controlador;

import java.util.HashMap;
import java.util.List;

import org.ada.data.access.percistencia.mapper.GestionadorPaisMapper;
import org.ada.security.model.persitencia.country.CitiesDBDto;
import org.ada.security.model.persitencia.country.CityDBDto;
import org.ada.security.model.persitencia.country.CountryDBDto;
import org.ada.security.model.persitencia.country.StateDBDto;
import org.ada.security.model.persitencia.country.StatesDBDto;
import org.ada.security.model.persitencia.respuesta.ProcesoRespuestaApiDb;
import org.ada.util.constantes.ConstantesCodigosAplicacion;
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
@SuppressWarnings("unchecked")
public class GestionadorPaisControllerDB {

	@Autowired
	GestionadorPaisMapper gestionadorPaisMapper;


	public HashMap<Object, Object> consultarPaises( )  throws Exception{

		
		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */

		HashMap<Object, Object> parametrosInOout = new HashMap<Object, Object>();
		ProcesoRespuestaApiDb  respuestaApiDb = null;
		List<CountryDBDto> countryDBDtos = null;
		HashMap<Object,Object> respuestaGestionador = null;


		/*
		 * ==============================================
		 * Se se realiza el mapeo de los parametros 
		 * de entrada que necesita el servicio ofrecido por 
		 * la API 
		 * ************************************************* 
		 */
		
		
		parametrosInOout.put("p_cod_rta", null);
		parametrosInOout.put("p_msj_rta", null);
		gestionadorPaisMapper.consultarPaises(parametrosInOout);
		respuestaApiDb = new ProcesoRespuestaApiDb();
		
		respuestaApiDb.setCodigoRespuestaApi( (String) parametrosInOout.get("p_cod_rta"));
		respuestaApiDb.setMensajeRespuestaApi( (String) parametrosInOout.get("p_msj_rta"));

		if (respuestaApiDb!=null && respuestaApiDb.getCodigoRespuestaApi()!=null) {
			if (respuestaApiDb!=null && respuestaApiDb.getCodigoRespuestaApi().equals(ConstantesCodigosAplicacion.CODIGO_OK_API_DB)) {
			countryDBDtos = (List<CountryDBDto>) parametrosInOout.get("p_ne_tpsne");
			}
		}else {
			respuestaApiDb.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_API_DB);
		}
		
		respuestaGestionador = new HashMap<Object, Object>();
		respuestaGestionador.put("ProcesoRespuestaApiDb", respuestaApiDb);
		respuestaGestionador.put("ObjetoApiDb", countryDBDtos);
		return respuestaGestionador;

	}
	
	
	public HashMap<Object, Object> consultarDepartamePais( String nombrePais )  throws Exception{

		
		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */

		HashMap<Object, Object> parametrosInOout = new HashMap<Object, Object>();
		ProcesoRespuestaApiDb  respuestaApiDb = null;
		List<StateDBDto> stateDBDto = null;
		StatesDBDto statesDBDto = null;
		String codigopais = null;
		HashMap<Object, Object> respuestaGestionador = null;


		/*
		 * ==============================================
		 * Se se realiza el mapeo de los parametros 
		 * de entrada que necesita el servicio ofrecido por 
		 * la API 
		 * ************************************************* 
		 */
		
		
		parametrosInOout.put("p_cod_rta", null);
		parametrosInOout.put("p_msj_rta", null);
		parametrosInOout.put("p_nombre_Pais", nombrePais);
		gestionadorPaisMapper.consultarDepartamePais(parametrosInOout);
		respuestaApiDb = new ProcesoRespuestaApiDb();
		
		respuestaApiDb.setCodigoRespuestaApi( (String) parametrosInOout.get("p_cod_rta"));
		respuestaApiDb.setMensajeRespuestaApi( (String) parametrosInOout.get("p_msj_rta"));

		if (respuestaApiDb!=null && respuestaApiDb.getCodigoRespuestaApi()!=null) {
			if (respuestaApiDb!=null && respuestaApiDb.getCodigoRespuestaApi().equals(ConstantesCodigosAplicacion.CODIGO_OK_API_DB)) {
			stateDBDto = (List<StateDBDto>) parametrosInOout.get("p_ne_tdene");
			codigopais = (String) parametrosInOout.get("p_query_Pais");
			statesDBDto = new StatesDBDto();
			statesDBDto.setStateDBDtos(stateDBDto);
			statesDBDto.setCodigoPais(codigopais);
			}
		}else {
			respuestaApiDb.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_API_DB);
		}
		
		respuestaGestionador = new HashMap<Object, Object>();
		respuestaGestionador.put("ProcesoRespuestaApiDb", respuestaApiDb);
		respuestaGestionador.put("ObjetoApiDb", statesDBDto);
		return respuestaGestionador;

	}

	
	public HashMap<Object, Object> consultarCiudadxDepYPa( String nombrePais, String nombreDepartame )  throws Exception{

		
		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */

		HashMap<Object, Object> parametrosInOout = new HashMap<Object, Object>();
		ProcesoRespuestaApiDb  respuestaApiDb = null;
		List<CityDBDto> cityDBDtos = null;
		CitiesDBDto citiesDBDtos = null;
		String codigopais = null;
		String codigoDeparta = null;
		HashMap<Object, Object> respuestaGestionador = null;


		/*
		 * ==============================================
		 * Se se realiza el mapeo de los parametros 
		 * de entrada que necesita el servicio ofrecido por 
		 * la API 
		 * ************************************************* 
		 */
		
		
		parametrosInOout.put("p_cod_rta", null);
		parametrosInOout.put("p_msj_rta", null);
		parametrosInOout.put("p_nombre_Pais", nombrePais);
		parametrosInOout.put("p_nombre_Depa", nombreDepartame);
		gestionadorPaisMapper.consultarCiudadxDepYPa(parametrosInOout);
		respuestaApiDb = new ProcesoRespuestaApiDb();
		
		respuestaApiDb.setCodigoRespuestaApi( (String) parametrosInOout.get("p_cod_rta"));
		respuestaApiDb.setMensajeRespuestaApi( (String) parametrosInOout.get("p_msj_rta"));

		if (respuestaApiDb!=null && respuestaApiDb.getCodigoRespuestaApi()!=null) {
			if (respuestaApiDb!=null && respuestaApiDb.getCodigoRespuestaApi().equals(ConstantesCodigosAplicacion.CODIGO_OK_API_DB)) {
				cityDBDtos = (List<CityDBDto>) parametrosInOout.get("p_ne_tcdne");
				codigopais = (String) parametrosInOout.get("p_query_Pais");
				codigoDeparta = (String) parametrosInOout.get("p_query_dene");
				citiesDBDtos = new CitiesDBDto();
				citiesDBDtos.setCityDBDtos(cityDBDtos);
				citiesDBDtos.setCodigoPais(codigopais);
				citiesDBDtos.setCodigoDeparta(codigoDeparta);
			}
		}else {
			respuestaApiDb.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_API_DB);
		}
		
		respuestaGestionador = new HashMap<Object, Object>();
		respuestaGestionador.put("ProcesoRespuestaApiDb", respuestaApiDb);
		respuestaGestionador.put("ObjetoApiDb", citiesDBDtos);
		return respuestaGestionador;

	}
	
}




