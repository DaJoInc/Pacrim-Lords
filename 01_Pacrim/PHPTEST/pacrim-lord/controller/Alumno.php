<?php

class Alumno {

		function registroAlumno($nombre)
			{
				if($nombre != null){
				$url ='http://127.0.0.1:8010/ada-business-logic-0.0.1-SNAPSHOT/api/usuario/registrar/usuario';
				$post_data = array(
				'nombreRol'=>'PROVEDOR',
                'nombreUsuario'=>'KOTAN21',
                'claveUsuario'=>'ytuysdsd',
                'documentoPersona'=>'564678',
                'nombresPersona'=>'sdsa',
                'apellidoPersona'=>'sdsad',
                'direccionPersona'=>'asddsa',
                'emailPersona'=>'jhoysd4uy@gmail.com',
                'paisPersona'=>'ghgf',
                'telefonoPersona'=>'5354'
				);
                $data_string = json_encode($post_data); 
				///Post data de servicio

				$ch = curl_init();

				curl_setopt($ch, CURLOPT_URL, $url);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_POST, 1);
				curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);                                                                  
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); 
                curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
                'Content-Type: application/json',                                                                                
                'Content-Length: ' . strlen($data_string))                                                                       
                );  
				$output = curl_exec($ch);
					
					if ($output==false) {
						echo "Curl Error".curl_error($ch);
					}
				curl_close($ch);
                $data = json_decode($output);

                
                $datas = $data->{'codigoRespuestaApi'};
                print_r( $datas );
				return $datas;
			}
				else{
					return 0;
				}
			}
}

?>