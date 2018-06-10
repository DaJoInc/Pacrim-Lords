/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 13.5 		*/
/*  Created On : 07-jun.-2018 5:56:50 p.m. 				*/
/*  DBMS       : Oracle 						*/
/* ---------------------------------------------------- */

/* Drop Tables */



CREATE TABLE  "FS_PCRM_US"."NE_TPSNE"
(
	"PSNE_PSNE" NUMBER(22) NOT NULL,    -- Identificador unico del estado de negocio 
	"PSNE_CODE" VARCHAR2(50) NULL,
	"PSNE_NAME" VARCHAR2(255) NULL
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

COMMENT ON TABLE  "FS_PCRM_US"."NE_TPSNE" IS 'Tabla que almacena el estado del negocio que tienen los usuarios en las empresas'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TPSNE"."PSNE_PSNE" IS 'Identificador unico del estado de negocio '
;

/* Create Primary Keys, Indexes, Uniques, Checks, Triggers */

ALTER TABLE  "FS_PCRM_US"."NE_TPSNE" 
 ADD CONSTRAINT "PK_NE_TPSNE"
	PRIMARY KEY ("PSNE_PSNE") 
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

  