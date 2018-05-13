
prompt
prompt package: us_qfpurs
prompt
create or replace package fs_pcrm_us.us_qfpurs is
    --
    -- ===========================================================
    -- us_qfpurs
    -- -----------------------------------------------------------
    -- todas las funciones del psna
    -- ===========================================================
    --
    -- #version:0000001000
    --
    -- historial de cambios
    --
    -- versi�n        gap                solicitud        fecha        realiz�            descripci�n
    -- -----------    -------------    -------------    ----------    -------------    
-------------------------------------------------------------------------------------------------
-----------------------------------------
    -- 
    -- -----------    -------------    -------------    ----------    -------------    
-------------------------------------------------------------------------------------------------
-----------------------------------------

    -- ============================================================
    -- constantes generales a nivel de paquete
    -- ============================================================
  
    
    -- ============================================================
    -- declaracion de procedimientos y funciones
    -- ============================================================
  
  procedure crearusuariopersona
    (
        p_ttf_usuario_persona               in  us_qfpurs.us_tof_purs,
        p_cod_rta                           out ne_tcrta.crta_crta%type
    );


  procedure actualizarpersona
    (
        p_ttf_usuario_persona               in  us_qfpurs.us_tof_purs,
        p_cod_rta                           out ne_tcrta.crta_crta%type
    ); 
    -- ------------------------------------------------------------

    type  us_tof_purs is record (
       v_type_persona tt_us_tpsna,
       v_type_rol tt_us_troll);



end us_qfpurs;
/


prompt
prompt package body:us_qfpurs
prompt


create or replace package body fs_pcrm_us.us_qfpurs is
  
    --
    -- #version:0000001000
    --
    
    -- ===========================================================
    -- procedure crearusuariopersona
    -- -----------------------------------------------------------
    -- creacion de persona dado atributos
    -- ===========================================================
     procedure crearusuariopersona
    (
        p_ttf_usuario_persona               in  us_qfpurs.us_tof_purs,
        p_cod_rta                           out ne_tcrta.crta_crta%type
    )is
        v_existencia_usuario_persona        boolean;
        v_secuencia                         number;
        v_cod_rta_tipo                      ne_tcrta.crta_crta%type;

    begin  
      
        dbms_output.put_line('this string breaks
    here.');
    end crearusuariopersona;

    --
    -- #version:0000001000
    --
    
    -- ===========================================================
    -- procedure buscarusuperpordocu
    -- -----------------------------------------------------------
    -- busca la persona
    -- ===========================================================
    procedure buscarusuperpordocu
    (
        p_ttf_usuario_persona               in  us_qfpurs.us_tof_purs,
        p_cod_rta                           out ne_tcrta.crta_crta%type
    )is



    begin  

       dbms_output.put_line('this string breaks
    here.');
        
    end buscarusuperpordocu;
    --
    -- #version:0000001000
    --
    
    -- ===========================================================
    -- procedure actualizarpersona
    -- -----------------------------------------------------------
    -- actualiza los datos de la persona
    -- ===========================================================
   procedure actualizarpersona
    (
        p_ttf_usuario_persona               in  us_qfpurs.us_tof_purs,
        p_cod_rta                           out ne_tcrta.crta_crta%type
    )is
    
        v_id_usuario_persona                us_tpsna.psna_psna%type;
        v_cod_rta_tipo                      ne_tcrta.crta_crta%type;

    begin  
dbms_output.put_line('this string breaks
    here.');
        
    end actualizarpersona;
end us_qfpurs;
/