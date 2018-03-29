prompt *************************************         PAYNET        *********************************************
prompt *************************************  NOTA IMPORTANTE!!!!  *********************************************
prompt *                                                                                                       *
prompt *  POR FAVOR ENVIAR LOS LOGs DE EJECUCION DE ESTE SCRIPT (.lst) PARA EFECTOS DE VERIFICACION DEL CAMBIO *
prompt *                                                                                                       *
prompt *                                                                                                       *
prompt *                                          Dajo INC                                                     *
prompt *                                                                                                       *
prompt *                                                                                                       *
prompt *********************************************************************************************************
set serveroutput on size 10000
set linesize 500
set verify on


spool Salida_PACRIM.lst;    


-- SCRIPTS
prompt CORRIENDO SCRIPTS
prompt ================================================================================================
prompt @INSTALL_SCHEMA.sql
@@INSTALL_SCHEMA.sql

prompt CORRIENDO SCRIPTS
prompt ================================================================================================
prompt @INSTALL_OBJECTS.sql
@@INSTALL_OBJECTS.sql




spool off

set feedback on
set pages 200

prompt Si la ejecución del script no presenta ningún problema por favor haga COMMIT, 
prompt de lo contrario haga ROLLBACK y comuniquese con Dajo INC
prompt


prompt *************************************  NOTA IMPORTANTE!!!!  *********************************************
prompt *                                                                                                       *
prompt *  POR FAVOR ENVIAR EL LOG DE EJECUCION DE ESTE SCRIPT (*.lst) PARA EFECTOS DE VERIFICACION DEL CAMBIO  *
prompt *                                                                                                       *
prompt *                                                                                                       *
prompt *                                             Dajo INC                                                  *
prompt *                                                                                                       *
prompt *                                                                                                       *
prompt *********************************************************************************************************