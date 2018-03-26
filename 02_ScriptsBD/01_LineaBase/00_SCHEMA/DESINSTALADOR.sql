REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

REM TABLESPACE Y SEGMENTOS DE ROLLBACK
set feedback off
spool TMP.lst
select distinct 'pause DEBE estar conectado con Usuario SYSTEM' || chr(10) || 'ROLL' || chr(10) || 'EXIT'
from dual
where user <> 'SYSTEM'
/
spool off
start TMP.lst
set feedback on

REM USUARIO  DUENHO DEL APLICATIVO PACRIM_US
drop user PACRIM_US cascade;
/

REM TABLESPACE DE DATOS
DROP TABLESPACE TS_TPACRIM INCLUDING CONTENTS
/

REM TABLESPACE DE INDICES 
DROP TABLESPACE TS_IPACRIM INCLUDING CONTENTS
/

REM TABLESPACE TEMPORAL
DROP tablespace TS_TPACRIM
/






