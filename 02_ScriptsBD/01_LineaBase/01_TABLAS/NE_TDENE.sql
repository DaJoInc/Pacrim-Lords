/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 13.5 		*/
/*  Created On : 07-jun.-2018 5:56:50 p.m. 				*/
/*  DBMS       : Oracle 						*/
/* ---------------------------------------------------- */



/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."NE_TDENE"
(
	"DENE_DENE" NUMBER(22) NOT NULL,    -- Identificador unico del estado de negocio 
	"DENE_CODE" VARCHAR2(50) NULL,
	"DENE_NAME" VARCHAR2(255) NULL,
	"PSNE_PSNE" NUMBER(22) NULL
)
TABLESPACE	TS_PACRIM
PCTFREE		10
INITRANS	1
MAXTRANS	255
STORAGE (
	INITIAL		65536
	MINEXTENTS	1
	MAXEXTENTS	2147483645
	BUFFER_POOL	DEFAULT
	)
LOGGING
NOCOMPRESS
NOCACHE
NOPARALLEL
MONITORING
;

/* Create Comments, Sequences and Triggers for Autonumber Columns */

COMMENT ON TABLE  "FS_PCRM_US"."NE_TDENE" IS 'Tabla que almacena el estado del negocio que tienen los usuarios en las empresas'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TDENE"."DENE_DENE" IS 'Identificador unico del estado de negocio '
;

/* Create Primary Keys, Indexes, Uniques, Checks, Triggers */

ALTER TABLE  "FS_PCRM_US"."NE_TDENE" 
 ADD CONSTRAINT "PK_NE_TPSNE"
	PRIMARY KEY ("DENE_DENE") 
 USING INDEX 
 LOGGING 
 TABLESPACE	TS_IPACRIM 
 PCTFREE		10 
 INITRANS	2 
 MAXTRANS	255 
 STORAGE ( 
	INITIAL		65536
	MINEXTENTS 1
	MAXEXTENTS 2147483645
	BUFFER_POOL DEFAULT 
		)
;


CREATE INDEX "IXFK_NE_TDENE_NE_TPSNE"   
 ON  "FS_PCRM_US"."NE_TDENE" ("PSNE_PSNE") 
TABLESPACE	TS_IPACRIM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
  
/* Create Foreign Key Constraints */

ALTER TABLE  "FS_PCRM_US"."NE_TDENE" 
 ADD CONSTRAINT "FK_NE_TDENE_NE_TPSNE"
	FOREIGN KEY ("PSNE_PSNE") REFERENCES  "FS_PCRM_US"."NE_TPSNE" ("PSNE_PSNE")
;