/*
 * MIT License 
 * 
 * Copyright (c) 2018 ADA INC
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.data.access.percistencia.convocatoria.controlador;

import java.util.HashMap;
import java.util.List;

import org.ada.data.access.percistencia.mapper.ConvocatoriaMapper;
import org.ada.security.model.convocatoria.MostrarA;
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
public class GestionConvocatoriaControllerDB {

	@Autowired
	ConvocatoriaMapper convocatoriaMapper;

	@SuppressWarnings("unchecked")
	public List<MostrarA> consultar()  throws Exception{


		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */

		HashMap<Object, Object> parametrosInOout = new HashMap<Object, Object>();
		List<MostrarA> respuestaPlsql = null;
		String setCodRespuesta;



		/*
		 * ==============================================
		 * Se se realiza el mapeo de los parametros 
		 * de entrada que necesita el servicio ofrecido por 
		 * la API 
		 * ************************************************* 
		 */

		setCodRespuesta = convocatoriaMapper.consultarConvocatorias(parametrosInOout);
		System.out.println(setCodRespuesta);

		respuestaPlsql = (List<MostrarA>) parametrosInOout.get("p_Lista_Convocatorias");


		if (respuestaPlsql!=null && !respuestaPlsql.isEmpty()) {

			return respuestaPlsql;

		}else {
			return null;
		}




	}

}




