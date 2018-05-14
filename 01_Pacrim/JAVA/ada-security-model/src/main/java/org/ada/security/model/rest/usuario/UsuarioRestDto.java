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
 * <h1>UsuarioDBDto
 *
 * Description
 *
 * @author THEOVERLORDKOTAN (ADA, Inc) 
 * @version 1.0
 * 
 */
public class UsuarioRestDto {
	
	  private String nombreRol           ;
	  private String nombreUsuario       ;
	  private String claveUsuario        ;
	  private String documentoPersona    ;
	  private String nombresPersona      ;
	  private String apellidoPersona     ;
	  private String direccionPersona    ;
	  private String telefonoPersona     ;
	  private String emailPersona        ;
	  private String paisPersona         ;
	  
	public String getNombreRol() {
		return nombreRol;
	}
	public void setNombreRol(String nombreRol) {
		this.nombreRol = nombreRol;
	}
	public String getNombreUsuario() {
		return nombreUsuario;
	}
	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}
	public String getClaveUsuario() {
		return claveUsuario;
	}
	public void setClaveUsuario(String claveUsuario) {
		this.claveUsuario = claveUsuario;
	}
	public String getDocumentoPersona() {
		return documentoPersona;
	}
	public void setDocumentoPersona(String documentoPersona) {
		this.documentoPersona = documentoPersona;
	}
	public String getNombresPersona() {
		return nombresPersona;
	}
	public void setNombresPersona(String nombresPersona) {
		this.nombresPersona = nombresPersona;
	}
	public String getApellidoPersona() {
		return apellidoPersona;
	}
	public void setApellidoPersona(String apellidoPersona) {
		this.apellidoPersona = apellidoPersona;
	}
	public String getDireccionPersona() {
		return direccionPersona;
	}
	public void setDireccionPersona(String direccionPersona) {
		this.direccionPersona = direccionPersona;
	}
	public String getTelefonoPersona() {
		return telefonoPersona;
	}
	public void setTelefonoPersona(String telefonoPersona) {
		this.telefonoPersona = telefonoPersona;
	}
	public String getEmailPersona() {
		return emailPersona;
	}
	public void setEmailPersona(String emailPersona) {
		this.emailPersona = emailPersona;
	}
	public String getPaisPersona() {
		return paisPersona;
	}
	public void setPaisPersona(String paisPersona) {
		this.paisPersona = paisPersona;
	}
	  
}
