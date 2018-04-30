/* Create Foreign Key Constraints */

REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

ALTER TABLE  "FS_PCRM_US"."EM_TEMTE" 
 ADD CONSTRAINT "FK_EM_TEMTE_EM_TEMNE"
	FOREIGN KEY ("EMTE_EMNE") REFERENCES  "FS_PCRM_US"."EM_TEMNE" ("EMNE_EMNE");
    
    ALTER TABLE  "FS_PCRM_US"."EM_TEMTE" 
 ADD CONSTRAINT "FK_EM_TEMTE_EM_TTPEM"
	FOREIGN KEY ("EMTE_TPEM") REFERENCES  "FS_PCRM_US"."EM_TTPEM" ("TPEM_TPEM");
    
    
    