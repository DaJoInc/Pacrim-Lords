package org.ada.business.logic.api.rest.convocatoria;

import java.util.ArrayList;
import java.util.List;

import org.ada.data.access.percistencia.convocatoria.controlador.GestionConvocatoriaControllerDB;
import org.ada.security.model.convocatoria.MostrarA;
import org.ada.util.constantes.ConstantesApiPathRest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class ServicioRestConvocatoria {
	
	@Autowired
	GestionConvocatoriaControllerDB gestionConvocatoriaControllerDB;
	
	@RequestMapping(value = ConstantesApiPathRest.PATH_CONSULTA_CONVOVATORIAS, method = RequestMethod.GET)
    public ResponseEntity<List<MostrarA>> listAllUsers() {
        
		List<MostrarA> mostrarAs = new ArrayList<MostrarA>();
        
         
        try {
			mostrarAs = gestionConvocatoriaControllerDB.consultar();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


        if(mostrarAs.isEmpty()){
            return new ResponseEntity<List<MostrarA>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<MostrarA>>(mostrarAs,HttpStatus.OK);
    }

}
