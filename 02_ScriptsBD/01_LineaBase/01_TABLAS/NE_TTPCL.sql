REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."NE_TTPCL"
(
	"TPCL_TPCL" NUMBER(22) NOT NULL,    -- identificador unico del tipo de cliente
	"TPCL_NRTP" VARCHAR2(50) NULL,    -- nombre del tipo de cliente
	"TPCL_DETP" VARCHAR2(50) NULL,    -- descripcion del tipo de cliente
	"TPCL_DACR" DATE NULL    -- date del tipo de cliente
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

COMMENT ON TABLE  "FS_PCRM_US"."NE_TTPCL" IS 'Tabla que almacena los tipos de clientes para el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTPCL"."TPCL_TPCL" IS 'identificador unico del tipo de cliente'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTPCL"."TPCL_NRTP" IS 'nombre del tipo de cliente'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTPCL"."TPCL_DETP" IS 'descripcion del tipo de cliente'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTPCL"."TPCL_DACR" IS 'date del tipo de cliente'
;

ALTER TABLE  "FS_PCRM_US"."NE_TTPCL" 
 ADD CONSTRAINT "PK_TPCL"
	PRIMARY KEY ("TPCL_TPCL") 
 USING INDEX
