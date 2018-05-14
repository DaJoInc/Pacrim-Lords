/*
 * MIT License 
 * 
 * Copyright (c) 2018 ADA INC
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.data.access.percistencia.handler;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.ada.security.model.convocatoria.MostrarA;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

/**
 *
 * <h1>HandlerConsultaConvocatoria
 *
 * Description
 *
 * @author THEOVERLORDKOTAN (ADA, Inc) 
 * @version 1.0
 * 
 */
public class HandlerConsultaConvocatoria implements TypeHandler<Object> {

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
	 List<MostrarA> lista = new ArrayList<MostrarA>();
	  Object[] structArray = null;
	  BigDecimal valor = null;
	  Object[] structAttr;
	  java.sql.Struct mystruct = null;
	  MostrarA solicitudMostrarEquipo = null;
	
		//Inicio logica

	  try {
		  structArray = (Object[]) cs.getArray(columnIndex).getArray();
		  if (structArray != null && structArray.length>0) {
			  for (Object structObj : structArray) {
				  solicitudMostrarEquipo = new MostrarA();
				  mystruct = (java.sql.Struct) structObj;

				  structAttr = mystruct.getAttributes();
				  
				  try{
					  BigDecimal big = (BigDecimal) structAttr[0];
					  valor = big;
				  } catch (Exception e) {
					  valor = null;
				  }
				  solicitudMostrarEquipo.setIdConvocatoria(valor);
				  try{
					  BigDecimal big = (BigDecimal) structAttr[1];
					  valor = big;
				  } catch (Exception e) {
					  valor = null;
				  }
				  solicitudMostrarEquipo.setIdEquipo(valor);
				  
				  solicitudMostrarEquipo.setNombreEquipo((String) structAttr[2]);
				  
				  lista.add(solicitudMostrarEquipo);

			  }
		  }
	  }catch (Exception e) {
		  lista = null;
	  }
	  return lista;
		
	}
	
	}

	