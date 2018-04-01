REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."NE_TTSTC"
(
	"TSTC_TSTC" NUMBER(22) NOT NULL,    -- identificador unico del estado del cliente
	"TSTC_NOST" VARCHAR2(50) NULL,    -- nombre estado cliente 
	"TSTC_DEST" VARCHAR2(50) NULL,    -- descripcion estado cliente
	"TSTC_DACR" DATE NULL,    -- Dia de creacion de estado cliente
	"TSTC_DAMO" DATE NULL,    -- dia estado modificacion cliente
	"CLNE_CLNE" NUMBER(22) NOT NULL
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

COMMENT ON TABLE  "FS_PCRM_US"."NE_TTSTC" IS 'Tabla que establece el tipo de estado para el cliente'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTSTC"."TSTC_TSTC" IS 'identificador unico del estado del cliente'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTSTC"."TSTC_NOST" IS 'nombre estado cliente '
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTSTC"."TSTC_DEST" IS 'descripcion estado cliente'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTSTC"."TSTC_DACR" IS 'Dia de creacion de estado cliente'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTSTC"."TSTC_DAMO" IS 'dia estado modificacion cliente'
;

ALTER TABLE  "FS_PCRM_US"."NE_TTSTC" 
 ADD CONSTRAINT "PK_TSTC"
	PRIMARY KEY ("TSTC_TSTC") USING INDEX;