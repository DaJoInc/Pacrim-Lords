REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."EM_TEMNE"
(
	"EMNE_EMNE" NUMBER(22) NOT NULL,    -- Empresa Negocio numero unico identifiacion
	"EMNE_NOBE" VARCHAR2(100) NULL,    -- Empresa Negocio nombre Empresa
	"EMNE_NITE" VARCHAR2(200) NULL,    -- Empresa Negocio numero  identifiacion
	"EMNE_FECR" DATE NULL,    -- Empresa Negocio fecha creacion
	"EMNE_FEMO" DATE NULL    -- Empresa Negocio fecha modificacion
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


COMMENT ON TABLE  "FS_PCRM_US"."EM_TEMNE" IS 'Tabla que almacena las empresas de los negocios '
;

COMMENT ON COLUMN  "FS_PCRM_US"."EM_TEMNE"."EMNE_EMNE" IS 'Empresa Negocio numero unico identifiacion'
;

COMMENT ON COLUMN  "FS_PCRM_US"."EM_TEMNE"."EMNE_NOBE" IS 'Empresa Negocio nombre Empresa'
;

COMMENT ON COLUMN  "FS_PCRM_US"."EM_TEMNE"."EMNE_NITE" IS 'Empresa Negocio numero  identifiacion'
;

COMMENT ON COLUMN  "FS_PCRM_US"."EM_TEMNE"."EMNE_FECR" IS 'Empresa Negocio fecha creacion'
;

COMMENT ON COLUMN  "FS_PCRM_US"."EM_TEMNE"."EMNE_FEMO" IS 'Empresa Negocio fecha modificacion'
;

ALTER TABLE  "FS_PCRM_US"."EM_TEMNE" 
 ADD CONSTRAINT "PK_ENME"
	PRIMARY KEY ("EMNE_EMNE") 
 USING INDEX
