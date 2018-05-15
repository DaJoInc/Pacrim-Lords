/*
 * MIT License 
 * 
 * Copyright (c) 2018 ADA INC
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.security.model.rest.usuario;

/**
 *
 * <h1>FuncionalidadUsuarioRestDto
 *
 * Description
 *
 * @author THEOVERLORDKOTAN (ADA, Inc) 
 * @version 1.0
 * 
 */
public class FuncionalidadUsuarioRestDto {
	
	public UsuarioActualizarRestDto actualizarRestDto;
	
	public UsuarioRestDto usuarioRestDto;

	public UsuarioActualizarRestDto getActualizarRestDto() {
		return actualizarRestDto;
	}

	public void setActualizarRestDto(UsuarioActualizarRestDto actualizarRestDto) {
		this.actualizarRestDto = actualizarRestDto;
	}

	public UsuarioRestDto getUsuarioRestDto() {
		return usuarioRestDto;
	}

	public void setUsuarioRestDto(UsuarioRestDto usuarioRestDto) {
		this.usuarioRestDto = usuarioRestDto;
	}
	
	

}
