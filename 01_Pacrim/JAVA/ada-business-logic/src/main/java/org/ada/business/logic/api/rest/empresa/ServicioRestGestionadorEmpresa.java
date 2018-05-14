/*
 * MIT License 
 * 
 * Copyright (c) 2018 ADA INC
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.business.logic.api.rest.empresa;


import org.ada.data.access.percistencia.gestion.empresa.controlador.GestionadorEmpresaControllerDB;
import org.ada.security.model.persitencia.empresa.EmpresaDBDto;
import org.ada.security.model.persitencia.respuesta.ProcesoRespuestaApiDb;
import org.ada.security.model.rest.empresa.EmpresaRestDto;
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
* <h1>ServicioRestGestionadorEmpresa
*
* Description
*
* @author THEOVERLORDKOTAN (ADA, Inc) 
* @version 1.0
* 
*/
@RestController
public class ServicioRestGestionadorEmpresa {

	@Autowired
	GestionadorEmpresaControllerDB gestionadorEmpresaControllerDB;

	@RequestMapping(value = ConstantesApiPathRest.PATH_REGISTRO_EMPRESA, method = RequestMethod.POST)
	public ResponseEntity<ProcesoRespuestaApiRest> registrarUsuarioRol(@RequestBody EmpresaRestDto empresaRestDto) {

		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */
		EmpresaDBDto empresaDBDto = null;
		ProcesoRespuestaApiRest procesoRespuestaApiRest = null;
		ProcesoRespuestaApiDb procesoRespuestaApiDb = null;

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
		if (empresaRestDto.getNitEmpresa()!=null && empresaRestDto.getNombreEmpresa()!=null && empresaRestDto.getTipoEmpresa()!=null) {


			try {
				empresaDBDto = new EmpresaDBDto();
				empresaDBDto.setP_NIT_EMPRSA(empresaRestDto.getNitEmpresa());
				empresaDBDto.setP_NOMBRE_EMPRSA(empresaRestDto.getNombreEmpresa());
				empresaDBDto.setP_TP_EMPRSA(empresaRestDto.getTipoEmpresa());

				procesoRespuestaApiDb = gestionadorEmpresaControllerDB.crearEmpresaNegocio(empresaDBDto);

				/*
				 * =====================================
				 * Este if se encarga de ...
				 * =====================================
				 */
				if (procesoRespuestaApiDb!= null && procesoRespuestaApiDb.getCodigoRespuestaApi()!=null ) {
					procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
					procesoRespuestaApiRest.setCodigoRespuestaApi(procesoRespuestaApiDb.getCodigoRespuestaApi());
					procesoRespuestaApiRest.setMensajeRespuestaApi(procesoRespuestaApiDb.getMensajeRespuestaApi());

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
			return new ResponseEntity<ProcesoRespuestaApiRest>(procesoRespuestaApiRest,HttpStatus.OK);
		}else {
			return new ResponseEntity<ProcesoRespuestaApiRest>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
		}


	}

	@RequestMapping(value = ConstantesApiPathRest.PATH_ASIGNAR_EMPRESA_NEGOCIO, method = RequestMethod.POST)
	public ResponseEntity<ProcesoRespuestaApiRest> asignarNegocioEmpresa(@RequestBody EmpresaRestDto empresaRestDto) {

		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */
		EmpresaDBDto empresaDBDto = null;
		ProcesoRespuestaApiRest procesoRespuestaApiRest = null;
		ProcesoRespuestaApiDb procesoRespuestaApiDb = null;

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
		if (empresaRestDto.getNitEmpresa()!=null && empresaRestDto.getNombreEmpresa()!=null && empresaRestDto.getTipoEmpresa()!=null) {
			try {
				
	
				
				empresaDBDto = new EmpresaDBDto();
				empresaDBDto.setP_NIT_EMPRSA(empresaRestDto.getNitEmpresa());
				empresaDBDto.setP_NOMBRE_EMPRSA(empresaRestDto.getNombreEmpresa());
				empresaDBDto.setP_TP_EMPRSA(empresaRestDto.getTipoEmpresa());
				
				procesoRespuestaApiDb = gestionadorEmpresaControllerDB.asignarNegocioEmpresa(empresaDBDto);

				/*
				 * =====================================
				 * Este if se encarga de ...
				 * =====================================
				 */
				if (procesoRespuestaApiDb!= null && procesoRespuestaApiDb.getCodigoRespuestaApi()!=null ) {
					procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
					procesoRespuestaApiRest.setCodigoRespuestaApi(procesoRespuestaApiDb.getCodigoRespuestaApi());
					procesoRespuestaApiRest.setMensajeRespuestaApi(procesoRespuestaApiDb.getMensajeRespuestaApi());

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
			return new ResponseEntity<ProcesoRespuestaApiRest>(procesoRespuestaApiRest,HttpStatus.OK);
		}else {
			return new ResponseEntity<ProcesoRespuestaApiRest>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
		}


	}

	
}
