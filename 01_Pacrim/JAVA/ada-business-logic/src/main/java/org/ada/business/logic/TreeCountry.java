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

import java.math.BigInteger;

import org.ada.security.model.persitencia.country.CountryDBDto;

/**
 *
 * <h1>TreeContry</h1>
 *
 * Description
 *
 * @author TheOverlordKotan (ADAINC) 
 * @version 1.0
 * 
 */
public class TreeCountry {
	
	NodeCountryTree dadNodeCountryTree;
	
	public TreeCountry() {
	 dadNodeCountryTree = null;
	}
	
	/**
	 * Description
	 * generate a new node in the tree
	 * JavaDoc
	*/
	public void addNode(CountryDBDto countryDBDto) throws Exception{
		/*
		 * =======================
		 * Declaracion de varibles 
		 * =======================
		 */
		NodeCountryTree nodeCountry = null;
		NodeCountryTree auxNodeCountry = null;
		NodeCountryTree dadNodeCountry = null;
		Boolean rutineLogic = true;
		BigInteger numberCompareA = null;
		BigInteger numberCompareB = null;

		//Inicio logica de negocio
		nodeCountry = new NodeCountryTree(countryDBDto);
		/*
		 * =====================================
		 * Este if se encarga de verificar
		 * si un nodo principal y si esta null
		 * es padre se instancia.
		 * si no sigue la logica de los nodos
		 * o hojas
		 * =====================================
		 */
		if (isEmptyDadNodeTree()) {
			dadNodeCountryTree = nodeCountry;
		}else {
			auxNodeCountry = dadNodeCountryTree;
			/*
			 * =====================================
			 * Este while se encarga de recorrer
			 * el arbol y agregar los nodos
			 * =====================================
			 */
			while (rutineLogic) {
				dadNodeCountry = auxNodeCountry;
				/*
				 * =====================================
				 * Este if se encarga de validar la
				 * estructura de datos con data existente
				 * =====================================
				 */
				if (TreeCountry.isCorrectDataNode(countryDBDto)) {
					/*
					 * =====================================
					 * Este if se encarga de validar si
					 * el nodo es mayor al auxiliar
					 * para apuntarlo a la izquierda
					 * o derecha
					 * =====================================
					 */
					numberCompareA = countryDBDto.getPSNE_PSNE();
					numberCompareB =auxNodeCountry.getCountryDBDto().getPSNE_PSNE();
					int result = numberCompareA.compareTo(numberCompareB);
					// compare the two input
					if(result==-1){
						auxNodeCountry = auxNodeCountry.getNodeCountryTreeLeft();
						/*
						 * =====================================
						 * Este if se encarga de asignar el nodo
						 * hasta que sea una hoja
						 * =====================================
						 */
						if (auxNodeCountry == null) {
							dadNodeCountry.setNodeCountryTreeLeft(nodeCountry);
							return;
						}
					}else{
						auxNodeCountry = auxNodeCountry.getNodeCountryTreeRight();
						/*
						 * =====================================
						 * Este if se encarga de asignar el nodo
						 * hasta que sea una hoja
						 * =====================================
						 */
						if (auxNodeCountry == null) {
							dadNodeCountry.setNodeCountryTreeRight(nodeCountry);
							return;
						}						
					}

				}

			}
		}


	}
	/**
	 * Description
	 * JavaDoc
	*/
	public void inOrderQuery(NodeCountryTree pNodeCountryTree) {
		//Inicio logica
		/*
		  * =====================================
		  * Este if se encarga de verificar el nodo 
		  * null
		  * =====================================
		*/
		if (pNodeCountryTree!=null) {
			inOrderQuery(pNodeCountryTree.getNodeCountryTreeLeft());
			System.out.println(
					"["+pNodeCountryTree.getCountryDBDto().getPSNE_PSNE()+","+
					"["+pNodeCountryTree.getCountryDBDto().getPSNE_CODE()+","+
					"["+pNodeCountryTree.getCountryDBDto().getPSNE_NAME()+","
					);
			inOrderQuery(pNodeCountryTree.getNodeCountryTreeRight());
		}
	}
	
	public void preOrderQuery(NodeCountryTree pNodeCountryTree) {
		//Inicio logica
		/*
		  * =====================================
		  * Este if se encarga de verificar el nodo 
		  * null
		  * =====================================
		*/
		if (pNodeCountryTree!=null) {
			System.out.println(
					"["+pNodeCountryTree.getCountryDBDto().getPSNE_PSNE()+","+
					"["+pNodeCountryTree.getCountryDBDto().getPSNE_CODE()+","+
					"["+pNodeCountryTree.getCountryDBDto().getPSNE_NAME()+","
					);
			preOrderQuery(pNodeCountryTree.getNodeCountryTreeLeft());

			preOrderQuery(pNodeCountryTree.getNodeCountryTreeRight());
		}
	}
	public void postOrderQuery(NodeCountryTree pNodeCountryTree) {
		//Inicio logica
		/*
		  * =====================================
		  * Este if se encarga de verificar el nodo 
		  * null
		  * =====================================
		*/
		postOrderQuery(pNodeCountryTree.getNodeCountryTreeLeft());

		postOrderQuery(pNodeCountryTree.getNodeCountryTreeRight());
		if (pNodeCountryTree!=null) {
			System.out.println(
					"["+pNodeCountryTree.getCountryDBDto().getPSNE_PSNE()+","+
					"["+pNodeCountryTree.getCountryDBDto().getPSNE_CODE()+","+
					"["+pNodeCountryTree.getCountryDBDto().getPSNE_NAME()+","
					);

		}
	}	
	/**
	 * Description
	 * JavaDoc
	*/
	public Boolean isEmptyDadNodeTree() {
		
		//Inicio logica
		return dadNodeCountryTree==null;
	}
	
	/**
	 * Description
	 * JavaDoc
	*/
	public static Boolean isCorrectDataNode(CountryDBDto countryDBDto) {
		
		/*
		 * =======================
		 * Declaracion de varibles 
		 * =======================
		*/
		Boolean resultCheck = false;
		
		/*
		  * =====================================
		  * Este if se encarga de validar
		  * el objeto parametro
		  * =====================================
		*/
		if (countryDBDto.getPSNE_CODE()!=null &&
		    countryDBDto.getPSNE_NAME()!=null &&
		    countryDBDto.getPSNE_PSNE()!=null) {
			resultCheck=true;			
		}

		//Inicio logica
		return resultCheck;
	}

}
