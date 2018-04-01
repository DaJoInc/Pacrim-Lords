REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."NE_TTPPR"
(
	"TPPR_TPPR" NUMBER(22) NOT NULL,    -- Identificador unico del tipo de producto
	"TPPR_NBTP" VARCHAR2(50) NULL,    -- nombre  del tipo de producto
	"TPPR_DETP" VARCHAR2(50) NULL,    -- descripcion  del tipo de producto
	"PRNE_PRNE" NUMBER(22) NOT NULL
)
TABLESPACE	TS_PACRIM
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

/* Create Comments, Sequences and Triggers for Autonumber Columns */

COMMENT ON TABLE  "FS_PCRM_US"."NE_TTPPR" IS 'Tabla para la informacion de tipo de productos'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTPPR"."TPPR_TPPR" IS 'Identificador unico del tipo de producto'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTPPR"."TPPR_NBTP" IS 'nombre  del tipo de producto'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTPPR"."TPPR_DETP" IS 'descripcion  del tipo de producto'
;

ALTER TABLE  "FS_PCRM_US"."NE_TTPPR" 
 ADD CONSTRAINT "PK_TPPR"
	PRIMARY KEY ("TPPR_TPPR") USING INDEX;
