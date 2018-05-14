/*
 * MIT License 
 * 
 * Copyright (c) 2018 ADA INC
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.security.model.convocatoria;

import java.math.BigDecimal;

/**
 *
 * <h1>MostrarA
 *
 * Description
 *
 * @author THEOVERLORDKOTAN (ADA, Inc) 
 * @version 1.0
 * 
 */
public class MostrarA {
	
	private	BigDecimal	    idConvocatoria;
	private BigDecimal	    idEquipo;
	private	String		    nombreEquipo;

	
	public BigDecimal getIdConvocatoria() {
		return idConvocatoria;
	}
	public void setIdConvocatoria(BigDecimal idConvocatoria) {
		this.idConvocatoria = idConvocatoria;
	}
	public BigDecimal getIdEquipo() {
		return idEquipo;
	}
	public void setIdEquipo(BigDecimal idEquipo) {
		this.idEquipo = idEquipo;
	}
	public String getNombreEquipo() {
		return nombreEquipo;
	}
	public void setNombreEquipo(String nombreEquipo) {
		this.nombreEquipo = nombreEquipo;
	}
	
	

}
