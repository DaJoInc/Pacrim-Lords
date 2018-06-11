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
 * <h1>StatesDBDto</h1>
 *
 * Description
 *
 * @author TheOverlordKotan (ADAINC) 
 * @version 1.0
 * 
 */
public class StatesDBDto {
	private List<StateDBDto> stateDBDtos;
	private String codigoPais;
	public List<StateDBDto> getStateDBDtos() {
		return stateDBDtos;
	}
	public void setStateDBDtos(List<StateDBDto> stateDBDtos) {
		this.stateDBDtos = stateDBDtos;
	}
	public String getCodigoPais() {
		return codigoPais;
	}
	public void setCodigoPais(String codigoPais) {
		this.codigoPais = codigoPais;
	}

}
