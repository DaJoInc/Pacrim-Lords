REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */


CREATE TABLE  "FS_PCRM_US"."US_TPUSR"
(
	"PUSR_PUSR" NUMBER(22) NOT NULL,    -- Identificador  unico del usuario rol persona
	"PUSR_USNE" NUMBER(22) NULL,        -- Identificador  unico del usuario negocio
	"PUSR_RLNE" NUMBER(22) NULL,        -- Identificador  unico del usuario rol Negocio
	"PUSR_PSNE" NUMBER(22) NULL         -- Identificador  unico de  persona
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

COMMENT ON TABLE  "FS_PCRM_US"."US_TPUSR" IS 'Tabla que contendra la persona el usuario y su rol'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TPUSR"."PUSR_PUSR" IS 'Identificador  unico del usuario rol persona'
;
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TPUSR"."PUSR_USNE" IS 'Identificador  unico del usuario negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TPUSR"."PUSR_RLNE" IS 'Identificador  unico del usuario rol Negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TPUSR"."PUSR_PSNE" IS 'Identificador  unico de  persona'
;

ALTER TABLE  "FS_PCRM_US"."US_TPUSR" 
 ADD CONSTRAINT "PK_PUSR"
	PRIMARY KEY ("PUSR_PUSR") 
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
