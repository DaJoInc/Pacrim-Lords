REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."NE_TTPNE"
(
	"TPNE_TPNE" NUMBER(22) NOT NULL,    -- Identificador unico del tipo de negocio 
	"TPNE_DENE" VARCHAR2(100) NULL,    -- Descripcion del tipo de negocio
	"TPNE_FECR" DATE NULL,    -- Fecha Creacion del tipo de negocio
	"TPNE_FEMO" DATE NULL    -- Fecha Modificiacion del tipo de negocio
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

COMMENT ON TABLE  "FS_PCRM_US"."NE_TTPNE" IS 'Tabla que almacena el tipo de negocio que tienen los usuarios y las empresas '
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTPNE"."TPNE_TPNE" IS 'Identificador unico del tipo de negocio '
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTPNE"."TPNE_DENE" IS 'Descripcion del tipo de negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTPNE"."TPNE_FECR" IS 'Fecha Creacion del tipo de negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTPNE"."TPNE_FEMO" IS 'Fecha Modificiacion del tipo de negocio'
;

ALTER TABLE  "FS_PCRM_US"."NE_TTPNE" 
 ADD CONSTRAINT "PK_TPNE"
	PRIMARY KEY ("TPNE_TPNE") USING INDEX;
