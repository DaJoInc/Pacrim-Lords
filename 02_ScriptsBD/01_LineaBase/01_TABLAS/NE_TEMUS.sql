REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."NE_TEMUS"
(
	"EMUS_EMUS" NUMBER(22) NOT NULL,    -- Identificador unico de relacion empresa y usuario
	"EMUS_FECR" DATE NULL,    -- Fecha creacion de la relacion del sistema 
	"EMUS_FEMO" DATE NULL,    -- Fecha modificacion de la relacion del sistema 
	"EMUS_TPNE" NUMBER(22) NULL,
	"EMUS_EMTE" NUMBER(22) NULL,
	"EMUS_USNE" NUMBER(22) NULL,
	"EMUS_TPRL" NUMBER(22) NULL
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

COMMENT ON TABLE  "FS_PCRM_US"."NE_TEMUS" IS 'Tabla que almacena informacion de las empresas y sus relaciones de negocio con los usuarios'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TEMUS"."EMUS_EMUS" IS 'Identificador unico de relacion empresa y usuario'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TEMUS"."EMUS_FECR" IS 'Fecha creacion de la relacion del sistema '
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TEMUS"."EMUS_FEMO" IS 'Fecha modificacion de la relacion del sistema '
;


ALTER TABLE  "FS_PCRM_US"."NE_TEMUS" 
 ADD CONSTRAINT "PK_EMUS"
	PRIMARY KEY ("EMUS_EMUS") 
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

