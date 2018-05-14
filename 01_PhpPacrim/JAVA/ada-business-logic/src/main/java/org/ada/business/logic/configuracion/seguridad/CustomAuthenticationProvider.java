package org.ada.business.logic.configuracion.seguridad;

import org.apache.log4j.Logger;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {
	

	
	private static Logger logger = Logger.getLogger(CustomAuthenticationProvider.class);
 
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
    	
    	String name = "";
    	String tipoUsuario = "";
    	
    	
    	if(authentication.getName() != null && !authentication.getName().isEmpty()){
    		String[] partes = authentication.getName().split("\\|");
    		if(partes.length > 0){
    			name = partes[0];
    		}
    		if(partes.length > 1){
    			tipoUsuario = partes[1];
    		}
    	}
    	
    	return null;
    }
 
//    @Override
//    public boolean supports(Class<?> authentication) {
//        return authentication.equals(UsernamePasswordAuthenticationToken.class);
//    }
    
    @Override
    public boolean supports(Class<? extends Object> authentication) {
        return (UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication));
    }
    
    
}
