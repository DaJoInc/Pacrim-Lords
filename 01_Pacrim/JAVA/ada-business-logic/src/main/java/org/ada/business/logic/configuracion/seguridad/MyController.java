package org.ada.business.logic.configuracion.seguridad;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController{

    @RequestMapping("/mapping")
    public String myMethod(Principal principal, ModelMap model){
        CustomUserDetails userDetails = (CustomUserDetails)principal;
        model.addAttribute("firstName", userDetails.getFirstName());
        model.addAttribute("lastName", userDetails.getLastName());
		return "jcbr";
    }
}