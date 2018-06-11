/*
 * MIT License 
 * 
 * Copyright (c) 2018 Ownk
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.data.access.percistencia.handler.country;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.ada.security.model.persitencia.country.CityDBDto;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

/**
 *
 * <h1>HandlerCitiesDB</h1>
 *
 * Description
 *
 * @author TheOverlordKotan (ADAINC) 
 * @version 1.0
 * 
 */
public class HandlerCitiesDB implements TypeHandler<Object> {
	public void setParameter(PreparedStatement ps, int i, Object parameter, JdbcType jdbcType) throws SQLException {
		/*
		 * =======================
		 * Declaracion de varibles 
		 * =======================
		*/
	
	
		//Inicio logica
	
}

public Object getResult(ResultSet rs, String columnName) throws SQLException {
		/*
		 * =======================
		 * Declaracion de varibles 
		 * =======================
		*/
	
	
		//Inicio logica
	return null;
	
}

public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		/*
		 * =======================
		 * Declaracion de varibles 
		 * =======================
		*/
	
	
		//Inicio logica
	return null;
	
}

public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
	/*
	 * =======================
	 * Declaracion de varibles 
	 * =======================
	*/
 List<CityDBDto> lista = new ArrayList<CityDBDto>();
  Object[] structArray = null;
  Object[] structAttr;
  java.sql.Struct mystruct = null;
  CityDBDto citiesdbdto = null;
  BigInteger big  = null;
  BigDecimal bigDecimal  = null;

	//Inicio logica

  try {
	  structArray = (Object[]) cs.getArray(columnIndex).getArray();
	  if (structArray != null && structArray.length>0) {
		  for (Object structObj : structArray) {
			  citiesdbdto = new CityDBDto();
			  mystruct = (java.sql.Struct) structObj;
			  structAttr = mystruct.getAttributes();

              try{
            	  big  =  (BigInteger) structAttr[0];
               } catch (Exception e) {
            	   big = null;
               }
             citiesdbdto.setCdne_cdne(big);
              try{
            	  bigDecimal = (BigDecimal) structAttr[1];
               } catch (Exception e) {
            	   bigDecimal = null;
               }
             citiesdbdto.setCdne_ltud(bigDecimal);
             try{
           	  bigDecimal = (BigDecimal) structAttr[1];
              } catch (Exception e) {
           	   bigDecimal = null;
              }
             citiesdbdto.setCdne_lotd(bigDecimal);
             
             citiesdbdto.setCdne_name((String) structAttr[3]);
             try{
           	  big  =  (BigInteger) structAttr[0];
              } catch (Exception e) {
           	   big = null;
              }
             citiesdbdto.setDene_dene(big);
             try{
           	  big  =  (BigInteger) structAttr[0];
              } catch (Exception e) {
           	   big = null;
              }
             citiesdbdto.setPsne_psne(big);
             lista.add(citiesdbdto);
		  }
	  }
  }catch (Exception e) {
	  lista = null;
  }
  return lista;
	
}

}