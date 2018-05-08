REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."US_TRLNE"
(
	"RLNE_RLNE" NUMBER(22) NOT NULL,    -- Codigo unico tipo Rol asignado por el sistema
	"RLNE_RLDN" VARCHAR2(50) NOT NULL,    -- Descripcion del rol asignado por el sistema
	"RLNE_FCMO" DATE NOT NULL    -- Fecha de Modificacion del tipo rol
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

COMMENT ON TABLE  "FS_PCRM_US"."US_TRLNE" IS 'Tipo de Rol usuarios Pacrim'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TRLNE"."RLNE_RLNE" IS 'Codigo unico tipo Rol asignado por el sistema'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TRLNE"."RLNE_RLDN" IS 'Descripcion del rol asignado por el sistema'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TRLNE"."RLNE_FCMO" IS 'Fecha de Modificacion del tipo rol'
;

ALTER TABLE  "FS_PCRM_US"."US_TRLNE" 
 ADD CONSTRAINT "PK_TPRL"
	PRIMARY KEY ("RLNE_RLNE") 
 USING INDEX 
 LOGGING 
 TABLESPACE	TS_IPACRIM 
 PCTFREE		10 
 INITRANS	2 
 MAXTRANS	255 
 STORAGE ( 
	INITIAL		65536
	MINEXTENTS 1
	MAXEXTENTS 2147483645
	BUFFER_POOL DEFAULT 
		)