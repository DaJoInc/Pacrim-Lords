REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."NE_TPRNE"
(
	"PRNE_PRNE" NUMBER(22) NOT NULL,    -- codigo unico del producto
	"PRNE_NMPR" VARCHAR2(50) NULL,    -- nombre del producto
	"PRNE_DEPR" VARCHAR2(50) NULL,    -- descripcion del producto
	"PRNE_CRPR" DATE NULL,    -- fecha de creacion del producto
	"EMUS_EMUS" VARCHAR2(50) NULL,
	"INEM_INEM" NUMBER(22) NULL,
	"TPPR_TPPR" NUMBER(22) NULL
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

COMMENT ON TABLE  "FS_PCRM_US"."NE_TPRNE" IS 'Tabla que almacena los productos del negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TPRNE"."PRNE_PRNE" IS 'codigo unico del producto'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TPRNE"."PRNE_NMPR" IS 'nombre del producto'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TPRNE"."PRNE_DEPR" IS 'descripcion del producto'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TPRNE"."PRNE_CRPR" IS 'fecha de creacion del producto'
;

ALTER TABLE  "FS_PCRM_US"."NE_TPRNE" 
 ADD CONSTRAINT "PK_PRNE"
	PRIMARY KEY ("PRNE_PRNE") USING INDEX;
