prompt
prompt PACKAGE: US_QPSNA
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.US_QPSNA IS
    --
    -- ===========================================================
    -- US_QPSNA
    -- -----------------------------------------------------------
    -- Todas las funciones del PSNA
    -- ===========================================================
    --
    -- #VERSION:0000001000
    --
    -- HISTORIAL DE CAMBIOS
    --
    -- Versi�n        GAP                Solicitud        Fecha        Realiz�            Descripci�n
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------
    -- 
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------

    -- ============================================================
    -- Constantes generales a nivel de PAQUETE
    -- ============================================================
  
    
    -- ============================================================
    -- Declaracion de PROCEDIMIENTOS y FUNCIONES
    -- ============================================================
  
  PROCEDURE crearPersona
    (
        p_documento_persona         IN  US_TPSNA.PSNA_NRID%type,
        p_nombres_persona           IN  US_TPSNA.PSNA_NOBE%type,
        p_apellido_persona          IN  US_TPSNA.PSNA_APDO%type,
        p_direccion_persona         IN  US_TPSNA.PSNA_DIRN%type,
        p_telefono_persona          IN  US_TPSNA.PSNA_TLFN%type,
        p_email_persona             IN  US_TPSNA.PSNA_EMAL%type,
        p_pais_persona              IN  US_TPSNA.PSNA_PAIS%type,
        p_id_persona                OUT US_TPSNA.PSNA_PSNA%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    );
 
  PROCEDURE buscarPersonaPorDocumento
    (
        p_documento_persona         IN  US_TPSNA.PSNA_NRID%type,
        p_id_persona                OUT US_TPSNA.PSNA_PSNA%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    
    PROCEDURE actualizarPersona
    (
        p_documento_persona         IN  US_TPSNA.PSNA_NRID%type,
        p_documento_persona_act     IN  US_TPSNA.PSNA_NRID%type,
        p_nombres_persona_act       IN  US_TPSNA.PSNA_NOBE%type,
        p_apellido_persona_act      IN  US_TPSNA.PSNA_APDO%type,
        p_direccion_persona_act     IN  US_TPSNA.PSNA_DIRN%type,
        p_telefono_persona_act      IN  US_TPSNA.PSNA_TLFN%type,
        p_email_persona_act         IN  US_TPSNA.PSNA_EMAL%type,
        p_pais_persona_act          IN  US_TPSNA.PSNA_PAIS%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    -- ------------------------------------------------------------
    
END US_QPSNA;
/


prompt
prompt PACKAGE BODY:US_QPSNA
prompt


CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.US_QPSNA IS
  
    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE crearPersona
    -- -----------------------------------------------------------
    -- creacion de perSona dado atributos
    -- ===========================================================
    PROCEDURE crearPersona
    (
        p_documento_persona         IN  US_TPSNA.PSNA_NRID%type,
        p_nombres_persona           IN  US_TPSNA.PSNA_NOBE%type,
        p_apellido_persona          IN  US_TPSNA.PSNA_APDO%type,
        p_direccion_persona         IN  US_TPSNA.PSNA_DIRN%type,
        p_telefono_persona          IN  US_TPSNA.PSNA_TLFN%type,
        p_email_persona             IN  US_TPSNA.PSNA_EMAL%type,
        p_pais_persona              IN  US_TPSNA.PSNA_PAIS%type,
        p_id_persona                OUT US_TPSNA.PSNA_PSNA%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    )IS

        v_existencia_persona       BOOLEAN;
        v_secuencia                NUMBER;
        v_cod_rta_tipo             NE_TCRTA.CRTA_CRTA%type;

    BEGIN  
        v_secuencia := US_SETPSNA.NextVal;

        US_QVPSNA.validarPersonaPorDoctEmail
        (
            p_documento_persona,
            p_email_persona,
            v_existencia_persona,
            v_cod_rta_tipo
        );
          
        IF(v_existencia_persona) THEN
          INSERT INTO US_TPSNA(
            PSNA_PSNA,
            PSNA_NRID,
            PSNA_NOBE,
            PSNA_APDO,
            PSNA_DIRN,
            PSNA_TLFN,
            PSNA_EMAL,
            PSNA_PAIS
          )
          VALUES(
            v_secuencia,
            p_documento_persona,
            p_nombres_persona,
            p_apellido_persona,
            p_direccion_persona,
            p_telefono_persona,
            p_email_persona,
            p_pais_persona     
          );
           p_id_persona  := v_secuencia;
           p_cod_rta     := 'OK';
        ELSE
           p_cod_rta     := 'ER_NULL';
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
        
    END crearPersona;

    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE buscarPersonaPorDocumento
    -- -----------------------------------------------------------
    -- busca la persona
    -- ===========================================================
    PROCEDURE buscarPersonaPorDocumento
    (
        p_documento_persona            IN  US_TPSNA.PSNA_NRID%type,
        p_id_persona                   OUT US_TPSNA.PSNA_PSNA%type,
        p_cod_rta                      OUT NE_TCRTA.CRTA_CRTA%type
    )IS

    CURSOR c_persona IS
        SELECT 
            PSNA_PSNA
        FROM
            FS_PCRM_US.US_TPSNA
        WHERE
            PSNA_NRID = p_documento_persona;

        r_persona c_persona%rowtype;

    BEGIN  

        OPEN  c_persona;
        FETCH c_persona INTO r_persona;
        CLOSE c_persona;
          
        IF(r_persona.PSNA_PSNA IS NOT NULL) THEN
          p_id_persona  :=  r_persona.PSNA_PSNA;
          p_cod_rta     := 'OK';
        ELSE
          p_cod_rta     := 'ER_NULL';
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
        
    END buscarPersonaPorDocumento;
    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE actualizarPersona
    -- -----------------------------------------------------------
    -- actualiza los datos de la persona
    -- ===========================================================
    PROCEDURE actualizarPersona
    (
        p_documento_persona         IN  US_TPSNA.PSNA_NRID%type,
        p_documento_persona_act     IN  US_TPSNA.PSNA_NRID%type,
        p_nombres_persona_act       IN  US_TPSNA.PSNA_NOBE%type,
        p_apellido_persona_act      IN  US_TPSNA.PSNA_APDO%type,
        p_direccion_persona_act     IN  US_TPSNA.PSNA_DIRN%type,
        p_telefono_persona_act      IN  US_TPSNA.PSNA_TLFN%type,
        p_email_persona_act         IN  US_TPSNA.PSNA_EMAL%type,
        p_pais_persona_act          IN  US_TPSNA.PSNA_PAIS%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    )IS
    
        v_id_persona                US_TPSNA.PSNA_PSNA%type;
        v_cod_rta_tipo              NE_TCRTA.CRTA_CRTA%type;
        v_cod_vlrta_tipo              NE_TCRTA.CRTA_CRTA%type;
        v_existencia_persona          BOOLEAN;

    BEGIN  

        US_QPSNA.buscarPersonaPorDocumento
        (
            p_documento_persona,             
            v_id_persona,
            v_cod_rta_tipo                      
        );
        
        US_QVPSNA.validarPersonaPorDoctEmail
        (
            p_documento_persona_act,
            p_email_persona_act,            
            v_existencia_persona,
            v_cod_vlrta_tipo                      
        );

        IF(v_id_persona IS NOT NULL AND v_existencia_persona) THEN

            UPDATE 
                FS_PCRM_US.US_TPSNA
            SET 
                PSNA_NRID = p_documento_persona_act,
                PSNA_NOBE = p_nombres_persona_act,
                PSNA_APDO = p_apellido_persona_act,
                PSNA_DIRN = p_direccion_persona_act,
                PSNA_TLFN = p_telefono_persona_act,
                PSNA_EMAL = p_email_persona_act,
                PSNA_PAIS = p_pais_persona_act
            WHERE 
                PSNA_PSNA = v_id_persona;

              p_cod_rta     := 'OK';
        ELSE
              p_cod_rta     := v_cod_rta_tipo;
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';

    END actualizarPersona;
END US_QPSNA;
/