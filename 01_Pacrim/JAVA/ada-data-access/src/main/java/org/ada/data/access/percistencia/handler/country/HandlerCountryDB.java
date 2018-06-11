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

import java.math.BigInteger;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.ada.security.model.persitencia.country.CountryDBDto;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

/**
 *
 * <h1>HandlerCountryDB</h1>
 *
 * Description
 *
 * @author TheOverlordKotan (ADAINC) 
 * @version 1.0
 * 
 */
public class HandlerCountryDB implements TypeHandler<Object> {

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
	 List<CountryDBDto> lista = new ArrayList<CountryDBDto>();
	  Object[] structArray = null;
	  Object[] structAttr;
	  java.sql.Struct mystruct = null;
	  CountryDBDto countrydbdtodto = null;
	  BigInteger big  = null;
	
		//Inicio logica

	  try {
		  structArray = (Object[]) cs.getArray(columnIndex).getArray();
		  if (structArray != null && structArray.length>0) {
			  for (Object structObj : structArray) {
				  countrydbdtodto = new CountryDBDto();
				  mystruct = (java.sql.Struct) structObj;

				  structAttr = mystruct.getAttributes();
				  	
	                try{
	                	big  = (BigInteger) structAttr[0];
	                 } catch (Exception e) {
	                	 big = null;
	                 }
	               countrydbdtodto.setPSNE_PSNE(big);
	               countrydbdtodto.setPSNE_CODE((String) structAttr[1]);
	               countrydbdtodto.setPSNE_NAME((String) structAttr[2]);
	               lista.add(countrydbdtodto);

			  }
		  }
	  }catch (Exception e) {
		  lista = null;
	  }
	  return lista;
		
	}
	
	}