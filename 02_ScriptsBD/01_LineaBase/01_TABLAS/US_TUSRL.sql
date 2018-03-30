REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."US_TUSRL"
(
	"USRL_USRL" NUMBER(22) NOT NULL,    -- Identificador  unico de la union de roles y usuarios
	"USRL_FCCR" DATE NULL,    -- Fecha creacion de la union de roles y usuarios
	"USRL_FCMO" DATE NULL,    -- Fecha modificacion de la union de roles y usuarios
	"USNE_USNE" NUMBER(22) NOT NULL,
	"TPRL_TPRL" NUMBER(22) NOT NULL
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

COMMENT ON TABLE  "FS_PCRM_US"."US_TUSRL" IS 'Tabla que contendra los roles asignados a los usuarios en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TUSRL"."USRL_USRL" IS 'Identificador  unico de la union de roles y usuarios'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TUSRL"."USRL_FCCR" IS 'Fecha creacion de la union de roles y usuarios'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TUSRL"."USRL_FCMO" IS 'Fecha modificacion de la union de roles y usuarios'
;

ALTER TABLE  "FS_PCRM_US"."US_TUSRL" 
 ADD CONSTRAINT "PK_USRL"
	PRIMARY KEY ("USRL_USRL") USING INDEX;

