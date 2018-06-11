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
 * <h1>CitiesDBDto</h1>
 *
 * Description
 *
 * @author TheOverlordKotan (ADAINC) 
 * @version 1.0
 * 
 */
public class CitiesDtoRest extends GenericProcesoRespuestaApi<ProcesoRespuestaApiRest>{
	private List<CityDto> ciudadesPais;
	private String codigoPais;
	private String codigoDeparta;


	public List<CityDto> getCiudadesPais() {
		return ciudadesPais;
	}
	public void setCiudadesPais(List<CityDto> ciudadesPais) {
		this.ciudadesPais = ciudadesPais;
	}
	public String getCodigoPais() {
		return codigoPais;
	}
	public void setCodigoPais(String codigoPais) {
		this.codigoPais = codigoPais;
	}
	public String getCodigoDeparta() {
		return codigoDeparta;
	}
	public void setCodigoDeparta(String codigoDeparta) {
		this.codigoDeparta = codigoDeparta;
	}


}	   