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

import org.ada.security.model.persitencia.country.StateDBDto;
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
public class HandlerStateDB implements TypeHandler<Object> {

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
	 List<StateDBDto> lista = new ArrayList<StateDBDto>();
	  Object[] structArray = null;
	  Object[] structAttr;
	  java.sql.Struct mystruct = null;
	  StateDBDto statedbdto = null;
	  BigInteger big  = null;
	
		//Inicio logica

	  try {
		  structArray = (Object[]) cs.getArray(columnIndex).getArray();
		  if (structArray != null && structArray.length>0) {
			  for (Object structObj : structArray) {
				  statedbdto = new StateDBDto();
				  mystruct = (java.sql.Struct) structObj;

	                structAttr = mystruct.getAttributes();
	                try{
	              	  big  =  (BigInteger) structAttr[0];
	                 } catch (Exception e) {
	              	   big = null;
	                 }
	               statedbdto.setDene_dene(big);
	               statedbdto.setDene_code((String) structAttr[1]);
	               statedbdto.setDene_name((String) structAttr[2]);
	                try{
		              	  big  =  (BigInteger) structAttr[0];
		                 } catch (Exception e) {
		              	   big = null;
		                 }
	               statedbdto.setPsne_psne(big);
	               lista.add(statedbdto);

			  }
		  }
	  }catch (Exception e) {
		  lista = null;
	  }
	  return lista;
		
	}
	
	}