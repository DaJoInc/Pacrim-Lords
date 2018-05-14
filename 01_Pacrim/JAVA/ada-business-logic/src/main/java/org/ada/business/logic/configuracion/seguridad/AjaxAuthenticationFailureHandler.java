package org.ada.business.logic.configuracion.seguridad;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Returns a 401 error code (Unauthorized) to the client, when Ajax authentication fails.
 */
@Component
public class AjaxAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {
	
	@Autowired
	private CustomAuthenticationProvider customAuthenticationProvider;
	
	private static Logger logger = Logger.getLogger(AjaxAuthenticationFailureHandler.class);

	
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
        AuthenticationException exception) throws IOException, ServletException {
    	if(true){
  
    	 logger.debug("CODIGO AUTH FAILURE: ");
    	 logger.debug("MENSAJE AUTH FAILURE: ");

         response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "OK");
    	}
    	else {
    	 response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Se requiere autenticación para acceder este servicio.");
    	}
    }
}
