/* Create Foreign Key Constraints */

REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************
ALTER TABLE  "FS_PCRM_US"."NE_TTRPR" 
 ADD CONSTRAINT "FK_NE_TTRPR_NE_TPRNE"
	FOREIGN KEY ("PRNE_PRNE") REFERENCES  "FS_PCRM_US"."NE_TPRNE" ("PRNE_PRNE");
    


    
    

    



       
    
    