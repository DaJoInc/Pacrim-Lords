package org.ada.data.access.percistencia.mapper;

import java.util.HashMap;

public interface GestionadorNegocioMapper {
	
	public void registrarUsuarioNegocio(HashMap<Object, Object> parametros);
	
	public void inactivarNegocioUsuario(HashMap<Object, Object> parametros);

	public void activarNegocioUsuario(HashMap<Object, Object> parametros);

	
}
