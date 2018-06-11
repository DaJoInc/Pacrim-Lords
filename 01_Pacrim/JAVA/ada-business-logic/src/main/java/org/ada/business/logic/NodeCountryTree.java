/*
 * MIT License 
 * 
 * Copyright (c) 2018 Ownk
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.business.logic;

import org.ada.security.model.persitencia.country.CountryDBDto;

/**
 *
 * <h1>NodeContryTree</h1>
 *
 * Description
 *
 * @author TheOverlordKotan (ADAINC) 
 * @version 1.0
 * 
 */
public class NodeCountryTree {
	
	private CountryDBDto countryDBDto;
	
	private NodeCountryTree nodeCountryTreeLeft,nodeCountryTreeRight;
	
	

	public NodeCountryTree(CountryDBDto countryDBDto) {
		this.countryDBDto = countryDBDto;
		nodeCountryTreeLeft = null;
		nodeCountryTreeRight = null;
	}

	public CountryDBDto getCountryDBDto() {
		return countryDBDto;
	}

	public void setCountryDBDto(CountryDBDto countryDBDto) {
		this.countryDBDto = countryDBDto;
	}

	public NodeCountryTree getNodeCountryTreeLeft() {
		return nodeCountryTreeLeft;
	}

	public void setNodeCountryTreeLeft(NodeCountryTree nodeCountryTreeLeft) {
		this.nodeCountryTreeLeft = nodeCountryTreeLeft;
	}

	public NodeCountryTree getNodeCountryTreeRight() {
		return nodeCountryTreeRight;
	}

	public void setNodeCountryTreeRight(NodeCountryTree nodeCountryTreeRight) {
		this.nodeCountryTreeRight = nodeCountryTreeRight;
	}

	@Override
	public String toString() {
		return "NodeCountryTree [countryDBDto=" + countryDBDto + ", nodeCountryTreeLeft=" + nodeCountryTreeLeft
				+ ", nodeCountryTreeRight=" + nodeCountryTreeRight + "]";
	}

	
}
