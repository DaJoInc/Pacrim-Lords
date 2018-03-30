/* Create Foreign Key Constraints */

REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

ALTER TABLE  "FS_PCRM_US"."NE_TCLNE" 
 ADD CONSTRAINT "FK_NE_TCLNE_NE_TTPCL"
	FOREIGN KEY ("TPCL_TPCL") REFERENCES  "FS_PCRM_US"."NE_TTPCL" ("TPCL_TPCL");
    
ALTER TABLE  "FS_PCRM_US"."NE_TCLNE" 
 ADD CONSTRAINT "FK_NE_TCLNE_NE_TTRPR"
	FOREIGN KEY ("TRPR_TRPR") REFERENCES  "FS_PCRM_US"."NE_TTRPR" ("TRPR_TRPR");

    ALTER TABLE  "FS_PCRM_US"."NE_TCLNE" 
 ADD CONSTRAINT "FK_NE_TCLNE_NE_TTSTC"
	FOREIGN KEY ("TSTC_TSTC") REFERENCES  "FS_PCRM_US"."NE_TTSTC" ("TSTC_TSTC");
    
    
    
 ALTER TABLE  "FS_PCRM_US"."NE_TCLNE" 
 ADD CONSTRAINT "FK_NE_TCLNE_US_TUSRL"
	FOREIGN KEY ("USRL_USRL") REFERENCES  "FS_PCRM_US"."US_TUSRL" ("USRL_USRL");


       
    
    