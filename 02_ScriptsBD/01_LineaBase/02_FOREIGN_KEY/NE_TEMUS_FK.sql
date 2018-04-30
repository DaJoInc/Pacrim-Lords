/* Create Foreign Key Constraints */

REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

ALTER TABLE  "FS_PCRM_US"."NE_TEMUS" 
 ADD CONSTRAINT "FK_NE_TEMUS_EM_TEMTE"
	FOREIGN KEY ("EMUS_EMTE") REFERENCES  "FS_PCRM_US"."EM_TEMTE" ("EMTE_EMTE");
    
ALTER TABLE  "FS_PCRM_US"."NE_TEMUS" 
 ADD CONSTRAINT "FK_NE_TEMUS_NE_TTPNE"
	FOREIGN KEY ("EMUS_TPNE") REFERENCES  "FS_PCRM_US"."NE_TTPNE" ("TPNE_TPNE");

    
ALTER TABLE  "FS_PCRM_US"."NE_TEMUS" 
 ADD CONSTRAINT "FK_NE_TEMUS_US_TTPRL"
	FOREIGN KEY ("EMUS_TPRL") REFERENCES  "FS_PCRM_US"."US_TTPRL" ("TPRL_TPRL")
;

ALTER TABLE  "FS_PCRM_US"."NE_TEMUS" 
 ADD CONSTRAINT "FK_NE_TEMUS_US_TUSNE"
	FOREIGN KEY ("EMUS_USNE") REFERENCES  "FS_PCRM_US"."US_TUSNE" ("USNE_USNE")
;




  
    
    