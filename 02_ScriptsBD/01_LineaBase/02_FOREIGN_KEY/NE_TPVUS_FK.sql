/* Create Foreign Key Constraints */

REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

ALTER TABLE  "FS_PCRM_US"."NE_TPVUS" 
 ADD CONSTRAINT "FK_NE_TPVUS_NE_TEMUS"
	FOREIGN KEY ("PVUS_EMUS") REFERENCES  "FS_PCRM_US"."NE_TEMUS" ("EMUS_EMUS")
;

ALTER TABLE  "FS_PCRM_US"."NE_TPVUS" 
 ADD CONSTRAINT "FK_NE_TPVUS_NE_TTPPV"
	FOREIGN KEY ("PVUS_TPPV") REFERENCES  "FS_PCRM_US"."NE_TTPPV" ("TPPV_TPPV")
;


       
    
    