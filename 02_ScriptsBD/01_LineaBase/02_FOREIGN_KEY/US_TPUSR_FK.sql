/* Create Foreign Key Constraints */

REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

ALTER TABLE  "FS_PCRM_US"."US_TPUSR" 
 ADD CONSTRAINT "FK_US_TPUSR_US_TPSNE"
	FOREIGN KEY ("PUSR_PSNA") REFERENCES  "FS_PCRM_US"."US_TPSNA" ("PSNA_PSNA");
    
ALTER TABLE  "FS_PCRM_US"."US_TPUSR" 
 ADD CONSTRAINT "FK_US_TPUSR_US_TRLNE"
	FOREIGN KEY ("PUSR_ROLL") REFERENCES  "FS_PCRM_US"."US_TROLL" ("ROLL_ROLL");
    
ALTER TABLE  "FS_PCRM_US"."US_TPUSR" 
 ADD CONSTRAINT "FK_US_TPUSR_US_TUSNE"
	FOREIGN KEY ("PUSR_USER") REFERENCES  "FS_PCRM_US"."US_TUSER" ("USER_USER");    
    