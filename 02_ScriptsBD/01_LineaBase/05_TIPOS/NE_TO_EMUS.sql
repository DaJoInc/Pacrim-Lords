create or replace TYPE FS_PCRM_US.NE_TO_EMUS IS

OBJECT 
(
        EMUS_EMUS NUMBER(22),
		EMUS_FECR DATE ,
		EMUS_FEMO DATE ,
		EMUS_TPNE NUMBER(22),
		EMUS_EMTE NUMBER(22),
		EMUS_USNE NUMBER(22),
		EMUS_TPRL NUMBER(22),
		USNE_USNE NUMBER(22) ,
		USNE_NOBE VARCHAR2(70) ,
		USNE_APDO VARCHAR2(70) ,
		USNE_DIRN VARCHAR2(50) ,
		USNE_TLFN VARCHAR2(50) ,
		USNE_EMAL VARCHAR2(50) ,
		USNE_PAIS VARCHAR2(50) ,
		USNE_USAO VARCHAR2(200),
		USNE_NRID NUMBER(22) ,
		USNE_PSWD VARCHAR2(200),
		TPRL_TPRL NUMBER(22) ,
		TPRL_RLDN VARCHAR2(50),
		TPRL_FCCE DATE ,
		TPRL_FCMO DATE ,
		EMTE_EMTE NUMBER(22),
		EMTE_DTCR DATE ,
		EMTE_DTMO DATE ,
		EMTE_TPEM NUMBER(22),
		EMTE_EMNE NUMBER(22)
);
		
/