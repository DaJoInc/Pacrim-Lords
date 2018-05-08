/* Create Foreign Key Constraints */

REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

ALTER TABLE  "FS_PCRM_US"."US_TPUSR" 
 ADD CONSTRAINT "FK_US_TPUSR_US_TPSNE"
	FOREIGN KEY ("PUSR_PSNE") REFERENCES  "FS_PCRM_US"."US_TPSNE" ("PSNE_PSNE");
    
ALTER TABLE  "FS_PCRM_US"."US_TPUSR" 
 ADD CONSTRAINT "FK_US_TPUSR_US_TRLNE"
	FOREIGN KEY ("PUSR_RLNE") REFERENCES  "FS_PCRM_US"."US_TRLNE" ("RLNE_RLNE");
    
ALTER TABLE  "FS_PCRM_US"."US_TPUSR" 
 ADD CONSTRAINT "FK_US_TPUSR_US_TUSNE"
	FOREIGN KEY ("PUSR_USNE") REFERENCES  "FS_PCRM_US"."US_TUSNE" ("USNE_USNE");    
    