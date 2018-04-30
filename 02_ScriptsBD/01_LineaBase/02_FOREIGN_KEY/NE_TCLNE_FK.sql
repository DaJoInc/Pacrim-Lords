/* Create Foreign Key Constraints */

REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

ALTER TABLE  "FS_PCRM_US"."NE_TCLNE" 
 ADD CONSTRAINT "FK_NE_TCLNE_NE_TTPCL"
	FOREIGN KEY ("CLNE_TPCL") REFERENCES  "FS_PCRM_US"."NE_TTPCL" ("TPCL_TPCL");
    

    ALTER TABLE  "FS_PCRM_US"."NE_TCLNE" 
 ADD CONSTRAINT "FK_NE_TCLNE_NE_TTSTC"
	FOREIGN KEY ("CLNE_TSTC") REFERENCES  "FS_PCRM_US"."NE_TTSTC" ("TSTC_TSTC");
    
    
    
 ALTER TABLE  "FS_PCRM_US"."NE_TCLNE" 
 ADD CONSTRAINT "FK_NE_TCLNE_NE_TEMUS"
	FOREIGN KEY ("CLNE_EMUS") REFERENCES  "FS_PCRM_US"."NE_TEMUS" ("EMUS_EMUS");


       
    
    