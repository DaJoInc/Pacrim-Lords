package org.ada.business.logic.configuracion;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;



import java.util.Properties;


import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "org.ada")
public class ServiciosRestConfiguration {
	
	
	@Bean
    public JavaMailSender getMailSender(){
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
          
        String auth ="False";
        
        if(auth != null && auth.equals("true")){
        	mailSender.setUsername("a");
            mailSender.setPassword("v");
        }
        
        mailSender.setHost("127.0.0.1");
        mailSender.setPort(1123);        
        
        Properties javaMailProperties = new Properties();
        javaMailProperties.put("mail.smtp.starttls.enable", "");
        javaMailProperties.put("mail.smtp.auth", "");
        javaMailProperties.put("mail.transport.protocol", "");
        javaMailProperties.put("mail.debug", "");//Prints out everything on screen     
        
        mailSender.setJavaMailProperties(javaMailProperties);
        return mailSender;
    }
	
	

}
