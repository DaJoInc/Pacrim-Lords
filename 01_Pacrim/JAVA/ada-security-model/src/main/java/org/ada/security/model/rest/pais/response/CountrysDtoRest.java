/*
 * MIT License 
 * 
 * Copyright (c) 2018 Ownk
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.security.model.rest.pais.response;

import java.util.List;

import org.ada.security.model.GenericProcesoRespuestaApi;
import org.ada.security.model.rest.respuesta.ProcesoRespuestaApiRest;

/**
 *
 * <h1>CountryDBDto</h1>
 *
 * Description
 *
 * @author TheOverlordKotan (ADAINC) 
 * @version 1.0
 * 
 */
public class CountrysDtoRest extends GenericProcesoRespuestaApi<ProcesoRespuestaApiRest>{
	
	private List<CountryDto> countryDtos;

	public List<CountryDto> getCountryDtos() {
		return countryDtos;
	}

	public void setCountryDtos(List<CountryDto> countryDtos) {
		this.countryDtos = countryDtos;
	}
	
}
