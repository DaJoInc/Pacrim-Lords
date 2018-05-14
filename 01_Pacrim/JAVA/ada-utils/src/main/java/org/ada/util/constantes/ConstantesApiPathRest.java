/*
 * MIT License 
 * 
 * Copyright (c) 2018 ADA INC
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.util.constantes;

/**
 *
 * <h1>ConstantesApiPathRest
 *
 * Description
 *
 * @author THEOVERLORDKOTAN (ADA, Inc) 
 * @version 1.0
 * 
 */
public class ConstantesApiPathRest {
	
	/*
	 * -----------------------------------------------------------------------------------------------------------------------
	 *  TRANSACCIONES
	 * ----------------------------------------------------------------------------------------------------------------------- 
	 */

	/**
	 * 
	 * CRUD usuario
	 */
	public static final String PATH_REGISTRO_USUARIO   = "/api/usuario/registrar/usuario";
	public static final String PATH_ACTUALIZAR_USUARIO = "/api/usuario/actualizar/usuario";
	public static final String PATH_ASIGNAR_USUARIO    = "/api/usuario/asignar/usuario";
	

	/**
	 * 
	 * CRUD empresa
	 */
	public static final String PATH_REGISTRO_EMPRESA        = "/api/empresa/registrar/empresa";
	public static final String PATH_ASIGNAR_EMPRESA_NEGOCIO = "/api/empresa/asignarnegocio/empresa";

	
	/**
	 * 
	 * CRUD empresa
	 */
	public static final String PATH_CREAR_NEGOCIO_USUARIO_EMPRESA        = "/api/negocio/crear/usuarioempresa";
	public static final String PATH_INACTIVAR_NEGOCIO_USUARIO_EMPRESA    = "/api/negocio/inactivar/usuario";
	public static final String PATH_ACTIVAR_NEGOCIO_USUARIO_EMPRESA      = "/api/negocio/activar/usuario";
	
	/**
	 * LOGIN
	 */
	public static final String PATH_LOGIN= "/login";
	
	
	/**
	 * SESSION_CLEAN 
	 */
	public static final String PATH_SESSION_CLEAN = "/api/session/clean";
	
	/**
	 * LOGOUT
	 */
	public static final String PATH_LOGOUT = "/api/salir";

}
