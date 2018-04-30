/* Create Foreign Key Constraints */

REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

ALTER TABLE  "FS_PCRM_US"."NE_TINEM" 
 ADD CONSTRAINT "FK_NE_TINEM_NE_TPVUS"
	FOREIGN KEY ("INEM_PVUS") REFERENCES  "FS_PCRM_US"."NE_TPVUS" ("PVUS_PVUS");
    

    



       
    
    