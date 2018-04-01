/* Create Foreign Key Constraints */

REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************
ALTER TABLE  "FS_PCRM_US"."US_TUSRL" 
 ADD CONSTRAINT "FK_US_TUSRL_US_TTPRL"
	FOREIGN KEY ("TPRL_TPRL") REFERENCES  "FS_PCRM_US"."US_TTPRL" ("TPRL_TPRL");
    
ALTER TABLE  "FS_PCRM_US"."US_TUSRL" 
 ADD CONSTRAINT "FK_US_TUSRL_US_TUSNE"
	FOREIGN KEY ("USNE_USNE") REFERENCES  "FS_PCRM_US"."US_TUSNE" ("USNE_USNE");

    
    

    



       
    
    