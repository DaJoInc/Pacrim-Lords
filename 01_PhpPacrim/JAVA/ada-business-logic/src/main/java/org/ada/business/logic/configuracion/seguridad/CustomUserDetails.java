package org.ada.business.logic.configuracion.seguridad;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class CustomUserDetails extends User {

    /**
	 * 
	 */
	private static final long serialVersionUID = 8490534716697395326L;
	public CustomUserDetails(String username, String password,
         Collection<? extends GrantedAuthority> authorities) {            
        super(username, password, authorities);
    }

    //for example lets add some person data        
    private String firstName;
    private String lastName;
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

    
}
