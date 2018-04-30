REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."NE_TCLNE"
(
	"CLNE_CLNE" NUMBER(22) NOT NULL,    -- identificador unico del cliente
	"CLNE_DNCL" NUMBER(22,2) NULL,    -- dinero actual del cliente
	"CLNE_FCCR" DATE NULL,    -- fecha creacion cliente
	"CLNE_FCMO" DATE NULL,    -- fecha modificacion cliente
	"CLNE_TSTC" NUMBER(22) NOT NULL,
	"CLNE_TPCL" NUMBER(22) NOT NULL,
    "CLNE_EMUS" NUMBER(22) NOT NULL
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

COMMENT ON TABLE  "FS_PCRM_US"."NE_TCLNE" IS 'Tabla que almacenara el cliente del sistema'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TCLNE"."CLNE_CLNE" IS 'identificador unico del cliente'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TCLNE"."CLNE_DNCL" IS 'dinero actual del cliente'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TCLNE"."CLNE_FCCR" IS 'fecha creacion cliente'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TCLNE"."CLNE_FCMO" IS 'fecha modificacion cliente'
;

ALTER TABLE  "FS_PCRM_US"."NE_TCLNE" 
 ADD CONSTRAINT "PK_CLNE"
	PRIMARY KEY ("CLNE_CLNE") USING INDEX;

