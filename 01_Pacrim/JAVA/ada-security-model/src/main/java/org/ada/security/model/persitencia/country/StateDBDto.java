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

import java.math.BigInteger;

/**
 *
 * <h1>StateDBDto</h1>
 *
 * Description
 *
 * @author TheOverlordKotan (ADAINC) 
 * @version 1.0
 * 
 */
public class StateDBDto {
	   private BigInteger dene_dene;
	   private String dene_code;
	   private String dene_name;
	   private BigInteger psne_psne;
    
	public String getDene_code() {
		return dene_code;
	}
	public void setDene_code(String dene_code) {
		this.dene_code = dene_code;
	}
	public BigInteger getDene_dene() {
		return dene_dene;
	}
	public void setDene_dene(BigInteger dene_dene) {
		this.dene_dene = dene_dene;
	}
	public String getDene_name() {
		return dene_name;
	}
	public void setDene_name(String dene_name) {
		this.dene_name = dene_name;
	}
	public BigInteger getPsne_psne() {
		return psne_psne;
	}
	public void setPsne_psne(BigInteger psne_psne) {
		this.psne_psne = psne_psne;
	}
    
     
}
