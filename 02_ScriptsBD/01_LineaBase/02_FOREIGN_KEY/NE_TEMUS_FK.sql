/* Create Foreign Key Constraints */

REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

ALTER TABLE  "FS_PCRM_US"."NE_TEMUS" 
 ADD CONSTRAINT "FK_NE_TEMUS_EM_TEMTE"
	FOREIGN KEY ("EMUS_EMTE") REFERENCES  "FS_PCRM_US"."EM_TEMTE" ("EMUS_EMTE");
    
ALTER TABLE  "FS_PCRM_US"."NE_TEMUS" 
 ADD CONSTRAINT "FK_NE_TEMUS_NE_TSTNE"
	FOREIGN KEY ("EMUS_STNE") REFERENCES  "FS_PCRM_US"."NE_TSTNE" ("EMUS_STNE");

    
ALTER TABLE  "FS_PCRM_US"."NE_TEMUS" 
 ADD CONSTRAINT "FK_NE_TEMUS_US_TPUSR"
	FOREIGN KEY ("EMUS_PUSR") REFERENCES  "FS_PCRM_US"."US_TPUSR" ("EMUS_PUSR")
;





  
    
    