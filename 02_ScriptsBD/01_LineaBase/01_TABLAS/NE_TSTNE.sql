REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."NE_TSTNE"
(
	"STNE_STNE" NUMBER(22) NOT NULL,   -- Identificador unico del estado de negocio 
	"STNE_DENE" VARCHAR2(100) NULL,    -- Descripcion del estado de negocio
	"STNE_FEMO" DATE NULL              -- Fecha Modificiacion del estado de negocio
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

COMMENT ON TABLE  "FS_PCRM_US"."NE_TSTNE" IS 'Tabla que almacena el estado del negocio que tienen los usuarios en las empresas'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TSTNE"."STNE_STNE" IS 'Identificador unico del estado de negocio '
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TSTNE"."STNE_DENE" IS 'Descripcion del estado de negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TSTNE"."STNE_FEMO" IS 'Fecha Modificiacion del estado de negocio'
;

ALTER TABLE  "FS_PCRM_US"."NE_TSTNE" 
 ADD CONSTRAINT "PK_STNE"
	PRIMARY KEY ("STNE_STNE") 
 USING INDEX
;