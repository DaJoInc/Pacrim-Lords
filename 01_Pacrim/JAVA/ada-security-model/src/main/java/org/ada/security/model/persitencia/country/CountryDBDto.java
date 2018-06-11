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
 * <h1>CountryDBDto</h1>
 *
 * Description
 *
 * @author TheOverlordKotan (ADAINC) 
 * @version 1.0
 * 
 */
public class CountryDBDto {
	
	private BigInteger PSNE_PSNE;
	private String PSNE_CODE;
	private String PSNE_NAME;
	public BigInteger getPSNE_PSNE() {
		return PSNE_PSNE;
	}
	public void setPSNE_PSNE(BigInteger pSNE_PSNE) {
		PSNE_PSNE = pSNE_PSNE;
	}
	public String getPSNE_CODE() {
		return PSNE_CODE;
	}
	public void setPSNE_CODE(String pSNE_CODE) {
		PSNE_CODE = pSNE_CODE;
	}
	public String getPSNE_NAME() {
		return PSNE_NAME;
	}
	public void setPSNE_NAME(String pSNE_NAME) {
		PSNE_NAME = pSNE_NAME;
	}
	@Override
	public String toString() {
		return "CountryDBDto [PSNE_PSNE=" + PSNE_PSNE + ", PSNE_CODE=" + PSNE_CODE + ", PSNE_NAME=" + PSNE_NAME + "]";
	}


}
