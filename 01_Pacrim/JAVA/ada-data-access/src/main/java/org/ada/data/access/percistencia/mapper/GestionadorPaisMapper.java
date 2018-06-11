package org.ada.data.access.percistencia.mapper;

import java.util.HashMap;

public interface GestionadorPaisMapper {
	

	public void consultarPaises(HashMap<Object, Object> parametros);
	
	public void consultarDepartamePais(HashMap<Object, Object> parametros);
	
	public void consultarCiudadxDepYPa(HashMap<Object, Object> parametros);

}
