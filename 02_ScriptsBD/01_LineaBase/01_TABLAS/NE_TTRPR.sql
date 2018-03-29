REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."NE_TTRPR"
(
	"TRPR_TRPR" NUMBER(22) NOT NULL,    -- IDENTIFICACION UNICA DE LA TRANSACCION
	"TRPR_DTCR" DATE NULL,    -- DATE CREACION DE LA TRANSACCION
	"TRPR_VAPR" NUMBER(22,2) NOT NULL,    -- VALOR DE LA TRANSACCION
	"TRPR_CTPR" NUMBER(22) NOT NULL,    -- CANTIDAD DE TRANSACCION
	"PRNE_PRNE" NUMBER(22) NULL
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

COMMENT ON TABLE  "FS_PCRM_US"."NE_TTRPR" IS 'Tabla de transacciones de productos con los clientes'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTRPR"."TRPR_TRPR" IS 'IDENTIFICACION UNICA DE LA TRANSACCION'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTRPR"."TRPR_DTCR" IS 'DATE CREACION DE LA TRANSACCION'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTRPR"."TRPR_VAPR" IS 'VALOR DE LA TRANSACCION'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTRPR"."TRPR_CTPR" IS 'CANTIDAD DE TRANSACCION'
;

ALTER TABLE  "FS_PCRM_US"."NE_TTRPR" 
 ADD CONSTRAINT "PK_TRPR"
	PRIMARY KEY ("TRPR_TRPR") 
 USING INDEX
