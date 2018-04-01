REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."EM_TTPEM"
(
	"TPEM_TPEM" NUMBER(22) NOT NULL,    -- Codigo unico de tipo empresa
	"TPEM_DTEM" VARCHAR2(50) NOT NULL,    -- Descripcion de tipo empresa
	"TPEM_STEM" VARCHAR2(1) NOT NULL,    -- Estado tipo empresa
	"TPEM_FCCR" DATE NULL,    -- Fecha de creacion de tipo empresa
	"TPEM_FCMO" DATE NULL    -- Fecha de modificacion de tipo empresa
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

COMMENT ON TABLE  "FS_PCRM_US"."EM_TTPEM" IS 'Tabla en el que se almacena los tipos de Empresas'
;

COMMENT ON COLUMN  "FS_PCRM_US"."EM_TTPEM"."TPEM_TPEM" IS 'Codigo unico de tipo empresa'
;

COMMENT ON COLUMN  "FS_PCRM_US"."EM_TTPEM"."TPEM_DTEM" IS 'Descripcion de tipo empresa'
;

COMMENT ON COLUMN  "FS_PCRM_US"."EM_TTPEM"."TPEM_STEM" IS 'Estado tipo empresa'
;

COMMENT ON COLUMN  "FS_PCRM_US"."EM_TTPEM"."TPEM_FCCR" IS 'Fecha de creacion de tipo empresa'
;

COMMENT ON COLUMN  "FS_PCRM_US"."EM_TTPEM"."TPEM_FCMO" IS 'Fecha de modificacion de tipo empresa'
;

ALTER TABLE  "FS_PCRM_US"."EM_TTPEM" 
 ADD CONSTRAINT "PK_TPEM"
	PRIMARY KEY ("TPEM_TPEM") USING INDEX ;
