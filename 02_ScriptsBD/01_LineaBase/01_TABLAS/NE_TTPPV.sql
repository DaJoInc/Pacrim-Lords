REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."NE_TTPPV"
(
	"TPPV_TPPV" NUMBER(22) NOT NULL,    -- identificador unico del tipo de provedor
	"TPPV_TPNB" VARCHAR2(50) NULL,    -- Tipo de provedor Nombre 
	"TPPV_DEPV" VARCHAR2(50) NULL,    -- Tipo de provedor descripcion
	"TPPV_FECR" DATE NULL,    -- Tipo de provedor fecha Creacion
	"TPPV_FEMO" DATE NULL    -- Tipo de provedor fecha Modificacion
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

COMMENT ON TABLE  "FS_PCRM_US"."NE_TTPPV" IS 'Tabla que establece los tipos de provedores para el negocio Pacrim'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTPPV"."TPPV_TPPV" IS 'identificador unico del tipo de provedor'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTPPV"."TPPV_TPNB" IS 'Tipo de provedor Nombre '
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTPPV"."TPPV_DEPV" IS 'Tipo de provedor descripcion'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTPPV"."TPPV_FECR" IS 'Tipo de provedor fecha Creacion'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TTPPV"."TPPV_FEMO" IS 'Tipo de provedor fecha Modificacion'
;

ALTER TABLE  "FS_PCRM_US"."NE_TTPPV" 
 ADD CONSTRAINT "PK_TPPV"
	PRIMARY KEY ("TPPV_TPPV") USING INDEX;
