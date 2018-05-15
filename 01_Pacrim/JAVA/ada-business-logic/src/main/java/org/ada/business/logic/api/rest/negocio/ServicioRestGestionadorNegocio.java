/*
 * MIT License 
 * 
 * Copyright (c) 2018 ADA INC
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.business.logic.api.rest.negocio;

import org.ada.data.access.percistencia.gestion.negocio.controlador.GestionadorNegocioControllerDB;
import org.ada.security.model.persitencia.negocio.NegocioDBDto;
import org.ada.security.model.persitencia.respuesta.ProcesoRespuestaApiDb;
import org.ada.security.model.rest.negocio.NegocioRestDto;
import org.ada.security.model.rest.respuesta.ProcesoRespuestaApiRest;
import org.ada.security.model.rest.usuario.UsuarioActualizarRestDto;
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
public class ServicioRestGestionadorNegocio {

	@Autowired
	GestionadorNegocioControllerDB gestionadorNegocioControllerDB;

	@RequestMapping(value = ConstantesApiPathRest.PATH_CREAR_NEGOCIO_USUARIO_EMPRESA, method = RequestMethod.POST)
	public ResponseEntity<ProcesoRespuestaApiRest> registrarUsuarioRol(@RequestBody NegocioRestDto negocioRestDto) {

		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */
		NegocioDBDto negocioDBDto = null;
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
		if (negocioRestDto.getDocumentoPersona()!=null && negocioRestDto.getNombreRol()!=null &&
			negocioRestDto.getNombreUsuario()!=null    && negocioRestDto.getNombreEmpresa()!=null &&
			negocioRestDto.getTipoEmpresa()!=null) {


			try {
				negocioDBDto = new NegocioDBDto();
				negocioDBDto.setP_NOMBRE_USUARIO(negocioRestDto.getNombreUsuario());
				negocioDBDto.setP_DOCUMENTO_PERSONA(negocioRestDto.getDocumentoPersona());
				negocioDBDto.setP_NOMBRE_ROLL(negocioRestDto.getNombreRol());
				
				negocioDBDto.setP_NOMBRE_EMPRSA(negocioRestDto.getNombreEmpresa());
				negocioDBDto.setP_NIT_EMPRSA(negocioRestDto.getNitEmpresa());
				negocioDBDto.setP_TP_EMPRSA(negocioRestDto.getTipoEmpresa());
				

				procesoRespuestaApiDb = gestionadorNegocioControllerDB.registrarUsuarioNegocio(negocioDBDto);

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

	@RequestMapping(value = ConstantesApiPathRest.PATH_INACTIVAR_NEGOCIO_USUARIO_EMPRESA, method = RequestMethod.POST)
	public ResponseEntity<ProcesoRespuestaApiRest> actualizarUsuarioPersona(@RequestBody NegocioRestDto negocioRestDto,UsuarioActualizarRestDto usuarioActualizarRestDto) {

		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */
		NegocioDBDto negocioDBDto = null;
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
		if (negocioRestDto.getDocumentoPersona()!=null && negocioRestDto.getNombreRol()!=null &&
			negocioRestDto.getNombreUsuario()!=null    && negocioRestDto.getNombreEmpresa()!=null &&
			negocioRestDto.getTipoEmpresa()!=null) {


			try {
				negocioDBDto = new NegocioDBDto();
				negocioDBDto.setP_NOMBRE_USUARIO(negocioRestDto.getNombreUsuario());
				negocioDBDto.setP_DOCUMENTO_PERSONA(negocioRestDto.getDocumentoPersona());
				negocioDBDto.setP_NOMBRE_ROLL(negocioRestDto.getNombreRol());
				
				negocioDBDto.setP_NOMBRE_EMPRSA(negocioRestDto.getNombreEmpresa());
				negocioDBDto.setP_NIT_EMPRSA(negocioRestDto.getNitEmpresa());
				negocioDBDto.setP_TP_EMPRSA(negocioRestDto.getTipoEmpresa());
				procesoRespuestaApiDb = gestionadorNegocioControllerDB.inactivarNegocioUsuario(negocioDBDto);

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
	
	@RequestMapping(value = ConstantesApiPathRest.PATH_ACTIVAR_NEGOCIO_USUARIO_EMPRESA, method = RequestMethod.POST)
	public ResponseEntity<ProcesoRespuestaApiRest> activarNegocioUsuario(@RequestBody NegocioRestDto negocioRestDto,UsuarioActualizarRestDto usuarioActualizarRestDto) {

		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */
		NegocioDBDto negocioDBDto = null;
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
		if (negocioRestDto.getDocumentoPersona()!=null && negocioRestDto.getNombreRol()!=null &&
			negocioRestDto.getNombreUsuario()!=null    && negocioRestDto.getNombreEmpresa()!=null &&
			negocioRestDto.getTipoEmpresa()!=null) {


			try {
				negocioDBDto = new NegocioDBDto();
				negocioDBDto.setP_NOMBRE_USUARIO(negocioRestDto.getNombreUsuario());
				negocioDBDto.setP_DOCUMENTO_PERSONA(negocioRestDto.getDocumentoPersona());
				negocioDBDto.setP_NOMBRE_ROLL(negocioRestDto.getNombreRol());
				
				negocioDBDto.setP_NOMBRE_EMPRSA(negocioRestDto.getNombreEmpresa());
				negocioDBDto.setP_NIT_EMPRSA(negocioRestDto.getNitEmpresa());
				negocioDBDto.setP_TP_EMPRSA(negocioRestDto.getTipoEmpresa());
				procesoRespuestaApiDb = gestionadorNegocioControllerDB.activarNegocioUsuario(negocioDBDto);

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
