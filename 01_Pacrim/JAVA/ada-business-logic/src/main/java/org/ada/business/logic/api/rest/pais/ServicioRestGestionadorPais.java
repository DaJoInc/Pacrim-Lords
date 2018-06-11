/*
 * MIT License 
 * 
 * Copyright (c) 2018 ADA INC
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.business.logic.api.rest.pais;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.ada.data.access.percistencia.gestion.pais.controlador.GestionadorPaisControllerDB;
import org.ada.security.model.persitencia.country.CitiesDBDto;
import org.ada.security.model.persitencia.country.CityDBDto;
import org.ada.security.model.persitencia.country.CountryDBDto;
import org.ada.security.model.persitencia.country.StateDBDto;
import org.ada.security.model.persitencia.country.StatesDBDto;
import org.ada.security.model.persitencia.respuesta.ProcesoRespuestaApiDb;
import org.ada.security.model.rest.pais.request.CitiesDtoRestRequest;
import org.ada.security.model.rest.pais.request.StatesDtoRestRequest;
import org.ada.security.model.rest.pais.response.CitiesDtoRest;
import org.ada.security.model.rest.pais.response.CityDto;
import org.ada.security.model.rest.pais.response.CountryDto;
import org.ada.security.model.rest.pais.response.CountrysDtoRest;
import org.ada.security.model.rest.pais.response.StateDto;
import org.ada.security.model.rest.pais.response.StatesDtoRest;
import org.ada.security.model.rest.respuesta.ProcesoRespuestaApiRest;
import org.ada.util.constantes.ConstantesApiPathRest;
import org.ada.util.constantes.ConstantesCodigosAplicacion;
import org.ada.util.constantes.ConstantesMensajesAplicacion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * <h1>ServicioRestGestionadorNegocio
 *
 * Description
 *
 * @author THEOVERLORDKOTAN (ADA, Inc) 
 * @version 1.0
 * 
 */
@RestController
@SuppressWarnings("unchecked")
public class ServicioRestGestionadorPais {

	@Autowired
	GestionadorPaisControllerDB gestionadorPaisControllerDB;

	@RequestMapping(value = ConstantesApiPathRest.PATH_SOLICITAR_PAISES, method = RequestMethod.POST)
	public ResponseEntity<CountrysDtoRest> solicitarPaises( ) {

		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */
		List<CountryDBDto> countryDBDto = null;
		List<CountryDto> listCountryRestDto = null;
		CountrysDtoRest countryRestDto = null;
		CountryDto countryDto = null;
		ProcesoRespuestaApiRest procesoRespuestaApiRest = null;
		ProcesoRespuestaApiDb procesoRespuestaApiDb = null;
		HashMap<Object, Object> respuestaGestionador = null;

		/*
		 * ==============================================
		 * Se se realiza el mapeo de los parametros 
		 * de entrada que necesita el servicio ofrecido por 
		 * la API y se llama el controller
		 * ************************************************* 
		 */

		/*
		 * =====================================
		 * Este if se encarga de ...
		 * =====================================
		 */
		if (true) {


			try {				
				respuestaGestionador = gestionadorPaisControllerDB.consultarPaises();
				procesoRespuestaApiDb = (ProcesoRespuestaApiDb) respuestaGestionador.get("ProcesoRespuestaApiDb");

				/*
				 * =====================================
				 * Este if se encarga de ...
				 * =====================================
				 */
				if (procesoRespuestaApiDb!= null && procesoRespuestaApiDb.getCodigoRespuestaApi()!=null ) {
					procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
					countryDBDto = (List<CountryDBDto>) respuestaGestionador.get("ObjetoApiDb");
					/*
					  * =====================================
					  * Este for se encarga de ...
					  * =====================================
					*/
					listCountryRestDto = new ArrayList<CountryDto>();
					for (CountryDBDto countryDBDto2 : countryDBDto) {
						 countryDto = new CountryDto();
						 countryDto.setPaisCodigo(countryDBDto2.getPSNE_CODE());
						 countryDto.setPaisNombre(countryDBDto2.getPSNE_NAME());
						listCountryRestDto.add(countryDto);
					}
					procesoRespuestaApiRest.setCodigoRespuestaApi(procesoRespuestaApiDb.getCodigoRespuestaApi());
					procesoRespuestaApiRest.setMensajeRespuestaApi(procesoRespuestaApiDb.getMensajeRespuestaApi());
					countryRestDto = new CountrysDtoRest();
					countryRestDto.setCountryDtos(listCountryRestDto);
					countryRestDto.setProcesoRespuestaApi(procesoRespuestaApiRest);
				}else {
					procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
					procesoRespuestaApiRest.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_SERVICIO);
					procesoRespuestaApiRest.setMensajeRespuestaApi(ConstantesMensajesAplicacion.CODIGO_MENSAJE_ERROR_SERVICIO);
				}

			} catch (Exception e) {
				procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
				procesoRespuestaApiRest.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_SERVICIO);
				procesoRespuestaApiRest.setMensajeRespuestaApi(ConstantesMensajesAplicacion.CODIGO_MENSAJE_ERROR_SERVICIO);
			}

		}

		if(procesoRespuestaApiRest.getCodigoRespuestaApi()!=null){
			return new ResponseEntity<CountrysDtoRest>(countryRestDto,HttpStatus.OK);
		}else {
			return new ResponseEntity<CountrysDtoRest>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
		}


	}

	@RequestMapping(value = ConstantesApiPathRest.PATH_OBTENER_PAIS_DEPARTAMENTO, method = RequestMethod.POST)
	public ResponseEntity<StatesDtoRest> consultarDepartamePais(@RequestBody StatesDtoRestRequest statesDtoRestRequest) {

		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */
		ProcesoRespuestaApiRest procesoRespuestaApiRest = null;
		ProcesoRespuestaApiDb procesoRespuestaApiDb = null;
		HashMap<Object, Object> respuestaGestionador = null;
		StatesDBDto statesDBDto = null;
		List<StateDto> statesDtoRests = null;
		StateDto stateDto = null;
		StatesDtoRest statesDtoRest2 = null;
		
		
		/*
		 * ==============================================
		 * Se se realiza el mapeo de los parametros 
		 * de entrada que necesita el servicio ofrecido por 
		 * la API y se llama el controller
		 * ************************************************* 
		 */

		/*
		 * =====================================
		 * Este if se encarga de ...
		 * =====================================
		 */
		if (statesDtoRestRequest.getCodigoPais()!=null ) {


			try {
				respuestaGestionador = gestionadorPaisControllerDB.consultarDepartamePais(statesDtoRestRequest.getCodigoPais());
				procesoRespuestaApiDb = (ProcesoRespuestaApiDb) respuestaGestionador.get("ProcesoRespuestaApiDb");
				/*
				 * =====================================
				 * Este if se encarga de ...
				 * =====================================
				 */
				if (procesoRespuestaApiDb!= null && procesoRespuestaApiDb.getCodigoRespuestaApi()!=null ) {
					procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
					procesoRespuestaApiRest.setCodigoRespuestaApi(procesoRespuestaApiDb.getCodigoRespuestaApi());
					procesoRespuestaApiRest.setMensajeRespuestaApi(procesoRespuestaApiDb.getMensajeRespuestaApi());
					statesDBDto = (StatesDBDto) respuestaGestionador.get("ObjetoApiDb");
					
					statesDtoRests = new ArrayList<StateDto>();
				    /*
					  * =====================================
					  * Este for se encarga de ...
					  * =====================================
					*/
					for (StateDBDto stateDBDto : statesDBDto.getStateDBDtos()) {
						stateDto = new StateDto();
						stateDto.setDepartamentoCodigo(stateDBDto.getDene_code());
						stateDto.setDepartamentoNombre(stateDBDto.getDene_name());
						statesDtoRests.add(stateDto);
					}
					statesDtoRest2 = new StatesDtoRest();
					statesDtoRest2.setDepartamentoPais(statesDtoRests);
					statesDtoRest2.setProcesoRespuestaApi(procesoRespuestaApiRest);
					statesDtoRest2.setCodigoPais(statesDBDto.getCodigoPais());
				}else {
					procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
					procesoRespuestaApiRest.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_SERVICIO);
					procesoRespuestaApiRest.setMensajeRespuestaApi(ConstantesMensajesAplicacion.CODIGO_MENSAJE_ERROR_SERVICIO);
				}

			} catch (Exception e) {
				procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
				procesoRespuestaApiRest.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_SERVICIO);
				procesoRespuestaApiRest.setMensajeRespuestaApi(ConstantesMensajesAplicacion.CODIGO_MENSAJE_ERROR_SERVICIO);
			}

		}else {
			procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
			procesoRespuestaApiRest.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_PARAMETROS_SERVICIO);
			procesoRespuestaApiRest.setMensajeRespuestaApi(ConstantesMensajesAplicacion.CODIGO_MENSAJE_ERROR_PARAMETROS_SERVICIO);
		}
		if(procesoRespuestaApiRest.getCodigoRespuestaApi()!=null){
			return new ResponseEntity<StatesDtoRest>(statesDtoRest2,HttpStatus.OK);
		}else {
			return new ResponseEntity<StatesDtoRest>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
		}


	}
	
	@RequestMapping(value = ConstantesApiPathRest.PATH_OBTENER_PAIS_DEPARTAMENTO_CIUDAD, method = RequestMethod.POST)
	public ResponseEntity<CitiesDtoRest> consultarCiudadxDepYPa(@RequestBody CitiesDtoRestRequest citiesDtoRestRequest) {

		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */
		ProcesoRespuestaApiRest procesoRespuestaApiRest = null;
		ProcesoRespuestaApiDb procesoRespuestaApiDb = null;
		HashMap<Object, Object> respuestaGestionador = null;
		CitiesDBDto citiesDBDto = null;
		List<CityDto> citisDtoRests = null;
		CityDto cityDto = null;
		CitiesDtoRest citiesDtoRest = null;
		
		
		/*
		 * ==============================================
		 * Se se realiza el mapeo de los parametros 
		 * de entrada que necesita el servicio ofrecido por 
		 * la API y se llama el controller
		 * ************************************************* 
		 */

		/*
		 * =====================================
		 * Este if se encarga de ...
		 * =====================================
		 */
		if (citiesDtoRestRequest.getCodigoPais()!=null &&  citiesDtoRestRequest.getCodigoDeparta()!=null) {


			try {
				respuestaGestionador = gestionadorPaisControllerDB.consultarCiudadxDepYPa(citiesDtoRestRequest.getCodigoPais(), citiesDtoRestRequest.getCodigoDeparta());
				procesoRespuestaApiDb = (ProcesoRespuestaApiDb) respuestaGestionador.get("ProcesoRespuestaApiDb");
				/*
				 * =====================================
				 * Este if se encarga de ...
				 * =====================================
				 */
				if (procesoRespuestaApiDb!= null && procesoRespuestaApiDb.getCodigoRespuestaApi()!=null ) {
					procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
					procesoRespuestaApiRest.setCodigoRespuestaApi(procesoRespuestaApiDb.getCodigoRespuestaApi());
					procesoRespuestaApiRest.setMensajeRespuestaApi(procesoRespuestaApiDb.getMensajeRespuestaApi());
					citiesDBDto = (CitiesDBDto) respuestaGestionador.get("ObjetoApiDb");
					
					citisDtoRests = new ArrayList<CityDto>();
				    /*
					  * =====================================
					  * Este for se encarga de ...
					  * =====================================
					*/
					for (CityDBDto stateDBDto : citiesDBDto.getCityDBDtos()) {
						cityDto = new CityDto();
						cityDto.setCiudadLatitud(stateDBDto.getCdne_ltud());
						cityDto.setCiudadLongitud(stateDBDto.getCdne_lotd());
						cityDto.setCiudadNombre(stateDBDto.getCdne_name());
						citisDtoRests.add(cityDto);
					}
					citiesDtoRest = new CitiesDtoRest();
					citiesDtoRest.setCodigoDeparta(citiesDBDto.getCodigoDeparta());
					citiesDtoRest.setCodigoPais(citiesDBDto.getCodigoPais());
					citiesDtoRest.setCiudadesPais(citisDtoRests);
					citiesDtoRest.setProcesoRespuestaApi(procesoRespuestaApiRest);
				}else {
					procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
					procesoRespuestaApiRest.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_SERVICIO);
					procesoRespuestaApiRest.setMensajeRespuestaApi(ConstantesMensajesAplicacion.CODIGO_MENSAJE_ERROR_SERVICIO);
				}

			} catch (Exception e) {
				procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
				procesoRespuestaApiRest.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_SERVICIO);
				procesoRespuestaApiRest.setMensajeRespuestaApi(ConstantesMensajesAplicacion.CODIGO_MENSAJE_ERROR_SERVICIO);
			}

		}else {
			procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
			procesoRespuestaApiRest.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_PARAMETROS_SERVICIO);
			procesoRespuestaApiRest.setMensajeRespuestaApi(ConstantesMensajesAplicacion.CODIGO_MENSAJE_ERROR_PARAMETROS_SERVICIO);
		}
		if(procesoRespuestaApiRest.getCodigoRespuestaApi()!=null){
			return new ResponseEntity<CitiesDtoRest>(citiesDtoRest,HttpStatus.OK);
		}else {
			return new ResponseEntity<CitiesDtoRest>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
		}


	}
	
	
}
