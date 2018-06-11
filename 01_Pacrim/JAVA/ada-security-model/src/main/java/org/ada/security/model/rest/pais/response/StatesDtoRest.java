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
 * <h1>StatesDBDto</h1>
 *
 * Description
 *
 * @author TheOverlordKotan (ADAINC) 
 * @version 1.0
 * 
 */
public class StatesDtoRest extends GenericProcesoRespuestaApi<ProcesoRespuestaApiRest> {
	private List<StateDto> departamentoPais;
	private String codigoPais;

	
	public List<StateDto> getDepartamentoPais() {
		return departamentoPais;
	}
	public void setDepartamentoPais(List<StateDto> departamentoPais) {
		this.departamentoPais = departamentoPais;
	}
	public String getCodigoPais() {
		return codigoPais;
	}
	public void setCodigoPais(String codigoPais) {
		this.codigoPais = codigoPais;
	}
	@Override
	public String toString() {
		return "StatesDtoRest [departamentoPais=" + departamentoPais + ", codigoPais=" + codigoPais + "]";
	}

	
}
