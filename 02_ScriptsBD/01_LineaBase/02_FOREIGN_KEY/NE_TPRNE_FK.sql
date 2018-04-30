/* Create Foreign Key Constraints */

REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************
ALTER TABLE  "FS_PCRM_US"."NE_TPRNE" 
 ADD CONSTRAINT "FK_NE_TPRNE_NE_TEMUS"
	FOREIGN KEY ("PRNE_EMUS") REFERENCES  "FS_PCRM_US"."NE_TEMUS" ("EMUS_EMUS") ;
    
    
ALTER TABLE  "FS_PCRM_US"."NE_TPRNE" 
 ADD CONSTRAINT "FK_NE_TPRNE_NE_TINEM"
	FOREIGN KEY ("PRNE_INEM") REFERENCES  "FS_PCRM_US"."NE_TINEM" ("INEM_INEM");
    
ALTER TABLE  "FS_PCRM_US"."NE_TPRNE" 
 ADD CONSTRAINT "FK_NE_TPRNE_NE_TTPPR"
	FOREIGN KEY ("PRNE_TPPR") REFERENCES  "FS_PCRM_US"."NE_TTPPR" ("TPPR_TPPR");


    
    

    



       
    
    