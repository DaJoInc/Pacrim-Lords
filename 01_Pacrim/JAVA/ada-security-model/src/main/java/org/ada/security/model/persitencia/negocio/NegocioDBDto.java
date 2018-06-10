/*
 * MIT License 
 * 
 * Copyright (c) 2018 ADA INC
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.security.model.persitencia.negocio;

import org.ada.security.model.persitencia.usuario.UsuarioDBDto;

/**
 *
 * <h1>NegocioDBDto
 *
 * Description
 *
 * @author THEOVERLORDKOTAN (ADA, Inc) 
 * @version 1.0
 * 
 */
public class NegocioDBDto  extends UsuarioDBDto {
	
	private String P_NOMBRE_EMPRSA ;
	private String P_NIT_EMPRSA    ;
	private String P_TP_EMPRSA ;
	
	public String getP_NOMBRE_EMPRSA() {
		return P_NOMBRE_EMPRSA;
	}
	public void setP_NOMBRE_EMPRSA(String p_NOMBRE_EMPRSA) {
		P_NOMBRE_EMPRSA = p_NOMBRE_EMPRSA;
	}
	public String getP_NIT_EMPRSA() {
		return P_NIT_EMPRSA;
	}
	public void setP_NIT_EMPRSA(String p_NIT_EMPRSA) {
		P_NIT_EMPRSA = p_NIT_EMPRSA;
	}
	public String getP_TP_EMPRSA() {
		return P_TP_EMPRSA;
	}
	public void setP_TP_EMPRSA(String p_TP_EMPRSA) {
		P_TP_EMPRSA = p_TP_EMPRSA;
	}
	
	

}
