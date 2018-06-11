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

import java.math.BigDecimal;

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
	public class CityDto{
	   private BigDecimal ciudadLatitud;
	   private BigDecimal ciudadLongitud;
	   private String ciudadNombre;
		public BigDecimal getCiudadLatitud() {
			return ciudadLatitud;
		}
		public void setCiudadLatitud(BigDecimal ciudadLatitud) {
			this.ciudadLatitud = ciudadLatitud;
		}
		public BigDecimal getCiudadLongitud() {
			return ciudadLongitud;
		}
		public void setCiudadLongitud(BigDecimal ciudadLongitud) {
			this.ciudadLongitud = ciudadLongitud;
		}
		public String getCiudadNombre() {
			return ciudadNombre;
		}
		public void setCiudadNombre(String ciudadNombre) {
			this.ciudadNombre = ciudadNombre;
		}

	    

	}	   