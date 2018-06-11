/*
 * MIT License 
 * 
 * Copyright (c) 2018 Ownk
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.security.model.persitencia.country;

import java.util.List;

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
public class CitiesDBDto{
	private List<CityDBDto> cityDBDtos;
	private String codigoPais;
	private String codigoDeparta;

	public List<CityDBDto> getCityDBDtos() {
		return cityDBDtos;
	}
	public void setCityDBDtos(List<CityDBDto> cityDBDtos) {
		this.cityDBDtos = cityDBDtos;
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