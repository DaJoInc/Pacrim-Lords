REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."US_TTPRL"
(
	"TPRL_TPRL" NUMBER(22) NOT NULL,    -- Codigo unico tipo Rol asignado por el sistema
	"TPRL_RLDN" VARCHAR2(50) NOT NULL,    -- Descripcion del rol asignado por el sistema
	"TPRL_FCCE" DATE NOT NULL,    -- Fecha de creacion del tipo rol
	"TPRL_FCMO" DATE NOT NULL    -- Fecha de Modificacion del tipo rol
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

COMMENT ON TABLE  "FS_PCRM_US"."US_TTPRL" IS 'Tipo de Rol usuarios Pacrim'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TTPRL"."TPRL_TPRL" IS 'Codigo unico tipo Rol asignado por el sistema'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TTPRL"."TPRL_RLDN" IS 'Descripcion del rol asignado por el sistema'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TTPRL"."TPRL_FCCE" IS 'Fecha de creacion del tipo rol'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TTPRL"."TPRL_FCMO" IS 'Fecha de Modificacion del tipo rol'
;

ALTER TABLE  "FS_PCRM_US"."US_TTPRL" 
 ADD CONSTRAINT "PK_TPRL"
	PRIMARY KEY ("TPRL_TPRL") 
 USING INDEX