/*
 * MIT License 
 * 
 * Copyright (c) 2018 Ownk
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.security.model.rest.pais.request;

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
public class CountryDtoRestRequest {
	
	private String paisCodigo;
	private String paisNombre;
	public String getPaisCodigo() {
		return paisCodigo;
	}
	public void setPaisCodigo(String paisCodigo) {
		this.paisCodigo = paisCodigo;
	}
	public String getPaisNombre() {
		return paisNombre;
	}
	public void setPaisNombre(String paisNombre) {
		this.paisNombre = paisNombre;
	}
	@Override
	public String toString() {
		return "CountryDtoRest [paisCodigo=" + paisCodigo + ", paisNombre=" + paisNombre + "]";
	}
	
	



}
