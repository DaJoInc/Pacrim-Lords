package org.ada.business.logic;

import java.math.BigInteger;

import javax.swing.JOptionPane;

import org.ada.security.model.persitencia.country.CountryDBDto;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
       
		/*
		 * =======================
		 * Declaracion de varibles 
		 * =======================
		 */
    	TreeCountry treeCountry = new TreeCountry();
    	int option = 0;
    	int valueNode;
    	CountryDBDto countryDBDto = null;
    	
    	/*
		  * =====================================
		  * Este try catch se encarga de llamar
		  * las funcionalidades de un arbol
		  * =====================================
		*/
    	/*
		  * =====================================
		  * Este do while se encarga de ...
		  * =====================================
		*/
		do {
			

		try {
			
			option = Integer.parseInt(JOptionPane.showInputDialog(null,
					 "1 -> agregar nodo \n"
			        +"2 -> recorrer inOrden \n"
					+"3 -> salir \n","Arboles Binarios",
					JOptionPane.QUESTION_MESSAGE));
			/*
			  * =====================================
			  * Este switch se encarga de colocar nuestra
			  * seccion de codigo
			  * =====================================
			*/
			switch (option) {
			case 1:
				
				valueNode = Integer.parseInt(JOptionPane.showInputDialog(null,
						 "VALOR NODO \n","Valor",
						JOptionPane.QUESTION_MESSAGE));
				countryDBDto = App.simulatorCountryDBDto(BigInteger.valueOf(valueNode));

				treeCountry.addNode(countryDBDto);
				break;
			case 2:
				/*
				  * =====================================
				  * Este if se encarga de verificar 
				  * si el arbol esta vacio
				  * =====================================
				*/
				if (!treeCountry.isEmptyDadNodeTree()) {
					treeCountry.inOrderQuery(treeCountry.dadNodeCountryTree);
				}else {
					JOptionPane.showMessageDialog(null, "El arbol esta vacio", "arbol vacio", JOptionPane.INFORMATION_MESSAGE);
				}
				break;
			case 3:
				/*
				  * =====================================
				  * Este if se encarga de verificar 
				  * si el arbol esta vacio
				  * =====================================
				*/
				if (!treeCountry.isEmptyDadNodeTree()) {
					treeCountry.preOrderQuery(treeCountry.dadNodeCountryTree);
				}else {
					JOptionPane.showMessageDialog(null, "El arbol esta vacio", "arbol vacio", JOptionPane.INFORMATION_MESSAGE);
				}
				break;
			case 4:
				/*
				  * =====================================
				  * Este if se encarga de verificar 
				  * si el arbol esta vacio
				  * =====================================
				*/
				if (!treeCountry.isEmptyDadNodeTree()) {
					treeCountry.postOrderQuery(treeCountry.dadNodeCountryTree);
				}else {
					JOptionPane.showMessageDialog(null, "El arbol esta vacio", "arbol vacio", JOptionPane.INFORMATION_MESSAGE);
				}
				break;

			default:
				JOptionPane.showMessageDialog(null, "La opcion no es valida", "Termina el proceso", JOptionPane.INFORMATION_MESSAGE);
				break;
			}
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		} while (option!=5);
    }
	/**
	 * Description
	 * JavaDoc
	*/
	public static CountryDBDto simulatorCountryDBDto(BigInteger psne_psne) {
		
		/*
		 * =======================
		 * Declaracion de varibles 
		 * =======================
		*/
		CountryDBDto resultCheck = null;
		

		//Inicio logica
		
		resultCheck = new CountryDBDto();
		resultCheck.setPSNE_CODE("code"+psne_psne);
		resultCheck.setPSNE_NAME("name"+psne_psne);
		resultCheck.setPSNE_PSNE(psne_psne);
		
		return resultCheck;
	}
}
