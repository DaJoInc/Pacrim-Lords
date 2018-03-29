REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."NE_TPVUS"
(
	"PVUS_PVUS" NUMBER(22) NOT NULL,    -- Numero unico de relacion de usuarios provedores
	"PVUS_FECR" DATE NULL,    -- Fecha Creacion de la relacion de provedor usuario
	"PVUS_FEMO" DATE NULL,    -- Fecha Modificacion de la relacion de provedor usuario
	"TPPV_TPPV" NUMBER(22) NULL,
	"PVNE_PVNE" NUMBER(22) NULL,
	"USRL_USRL" NUMBER(22) NULL
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

COMMENT ON TABLE  "FS_PCRM_US"."NE_TPVUS" IS 'Tabla que relaciona los provedores con los usuarios que toman ese rol desde el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TPVUS"."PVUS_PVUS" IS 'Numero unico de relacion de usuarios provedores'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TPVUS"."PVUS_FECR" IS 'Fecha Creacion de la relacion de provedor usuario'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TPVUS"."PVUS_FEMO" IS 'Fecha Modificacion de la relacion de provedor usuario'
;

ALTER TABLE  "FS_PCRM_US"."NE_TPVUS" 
 ADD CONSTRAINT "PK_PVUS"
	PRIMARY KEY ("PVUS_PVUS") 
 USING INDEX 
 LOGGING 
 TABLESPACE	TS_ISGC 
 PCTFREE		10 
 INITRANS	2 
 MAXTRANS	255 
 STORAGE ( 
	INITIAL		65536
	MINEXTENTS 1
	MAXEXTENTS 2147483645
	BUFFER_POOL DEFAULT 
		);
