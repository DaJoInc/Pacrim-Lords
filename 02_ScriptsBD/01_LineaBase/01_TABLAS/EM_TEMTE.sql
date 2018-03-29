REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."EM_TEMTE"
(
	"EMTE_EMTE" NUMBER(22) NOT NULL,    -- Numero unico de relacion de empresa
	"EMTE_DTCR" DATE NULL,    -- Fecha de creacion de la empresa
	"EMTE_DTMO" DATE NULL,    -- Fecha modificacion de la empresa
	"TPEM_TPEM" NUMBER(22) NULL,
	"EMNE_EMNE" NUMBER(22) NULL
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

COMMENT ON TABLE  "FS_PCRM_US"."EM_TEMTE" IS 'Tabla que relaciona los tipos de empresas y las empresas '
;

COMMENT ON COLUMN  "FS_PCRM_US"."EM_TEMTE"."EMTE_EMTE" IS 'Numero unico de relacion de empresa'
;

COMMENT ON COLUMN  "FS_PCRM_US"."EM_TEMTE"."EMTE_DTCR" IS 'Fecha de creacion de la empresa'
;

COMMENT ON COLUMN  "FS_PCRM_US"."EM_TEMTE"."EMTE_DTMO" IS 'Fecha modificacion de la empresa'
;

ALTER TABLE  "FS_PCRM_US"."EM_TEMTE" 
 ADD CONSTRAINT "PK_EMTE"
	PRIMARY KEY ("EMTE_EMTE") 
 USING INDEX
