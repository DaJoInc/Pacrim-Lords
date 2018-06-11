/*
 * MIT License 
 * 
 * Copyright (c) 2018 Ownk
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.security.model;

/**
 *
 * <h1>GenericProcesoRespuestaApiRest</h1>
 *
 * Description
 *
 * @author TheOverlordKotan (ADAINC) 
 * @version 1.0
 * 
 */
public abstract class GenericProcesoRespuestaApi <T> {
	
	private T procesoRespuestaApi;

	public T getProcesoRespuestaApiRest() {
		return procesoRespuestaApi;
	}

	public void setProcesoRespuestaApi(T procesoRespuestaApiRest) {
		this.procesoRespuestaApi = procesoRespuestaApiRest;
	}
	
	

}
