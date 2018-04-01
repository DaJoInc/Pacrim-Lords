/* Create Foreign Key Constraints */

REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

ALTER TABLE  "FS_PCRM_US"."NE_TEMUS" 
 ADD CONSTRAINT "FK_NE_TEMUS_EM_TEMTE"
	FOREIGN KEY ("EMTE_EMTE") REFERENCES  "FS_PCRM_US"."EM_TEMTE" ("EMTE_EMTE");
    
ALTER TABLE  "FS_PCRM_US"."NE_TEMUS" 
 ADD CONSTRAINT "FK_NE_TEMUS_NE_TTPNE"
	FOREIGN KEY ("TPNE_TPNE") REFERENCES  "FS_PCRM_US"."NE_TTPNE" ("TPNE_TPNE");

  ALTER TABLE  "FS_PCRM_US"."NE_TEMUS" 
 ADD CONSTRAINT "FK_NE_TEMUS_US_TUSRL"
	FOREIGN KEY ("USRL_USRL") REFERENCES  "FS_PCRM_US"."US_TUSRL" ("USRL_USRL");
    



       
    
    