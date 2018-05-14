package org.ada.business.logic.configuracion;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ada.business.logic.configuracion.seguridad.AjaxAuthenticationFailureHandler;
import org.ada.business.logic.configuracion.seguridad.AjaxAuthenticationSuccessHandler;
import org.ada.business.logic.configuracion.seguridad.CustomAuthenticationProvider;
import org.ada.business.logic.configuracion.seguridad.LogoutAjaxAuthenticationSuccessHandler;
import org.ada.util.constantes.ConstantesApiPathRest;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration 
@EnableWebSecurity
@ComponentScan("org.ada")
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	private static Logger logger = Logger.getLogger(SecurityConfig.class);
	@Inject
	private AjaxAuthenticationSuccessHandler ajaxAuthenticationSuccessHandler;

	@Inject
	private AjaxAuthenticationFailureHandler ajaxAuthenticationFailureHandler;
	
	@Inject
	private LogoutAjaxAuthenticationSuccessHandler logoutAjaxAuthenticationSuccessHandler;

	@Autowired
	private CustomAuthenticationProvider authProvider;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {		
		http
		.authorizeRequests()
		.antMatchers("/ada/**").authenticated()
		.and()
		//.addFilterBefore(new FiltroCifradoPeticiones(), UsernamePasswordAuthenticationFilter.class)
		.formLogin()
		.usernameParameter("j_username")
		.passwordParameter("j_password")
		.loginProcessingUrl(ConstantesApiPathRest.PATH_LOGIN)
		.successHandler(ajaxAuthenticationSuccessHandler)
		.failureHandler(ajaxAuthenticationFailureHandler)
		.and()
		.logout().logoutSuccessHandler(logoutAjaxAuthenticationSuccessHandler)
		.logoutRequestMatcher(new AntPathRequestMatcher(ConstantesApiPathRest.PATH_LOGOUT))
		.invalidateHttpSession(true)
		.deleteCookies("JSESSIONID")
		.and().exceptionHandling().authenticationEntryPoint(new AuthenticationEntryPoint() {

	        @Override
	        public void commence(HttpServletRequest request, HttpServletResponse response,
	                AuthenticationException authException) throws IOException, ServletException {
	            if (authException != null) {
	            	response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Se requiere autenticaciÃ³n para acceder este servicio.");
	            }
	        }
	    })
		.and()
		.requiresChannel()
		.antMatchers("/").requiresSecure()
		.and()
		.csrf().disable();

	}
	



	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authProvider);
	}


}
