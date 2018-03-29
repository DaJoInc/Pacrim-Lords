REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."NE_TPVNE"
(
	"PVNE_PVNE" NUMBER(22) NOT NULL,    -- identificador unico del provedor
	"PVNE_NBPR" VARCHAR2(50) NULL,    --  Nombre del provedor
	"PVNE_DEPR" VARCHAR2(50) NULL,    -- Descripcion del provedor
	"PVNE_DTCR" DATE NULL,    -- Fecha creacion del provedor
	"PVNE_DTMO" DATE NULL    -- Fecha modificacion del provedor
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

COMMENT ON TABLE  "FS_PCRM_US"."NE_TPVNE" IS 'Tabla encargada de tener la informacion de los provedores del negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TPVNE"."PVNE_PVNE" IS 'identificador unico del provedor'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TPVNE"."PVNE_NBPR" IS ' Nombre del provedor'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TPVNE"."PVNE_DEPR" IS 'Descripcion del provedor'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TPVNE"."PVNE_DTCR" IS 'Fecha creacion del provedor'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TPVNE"."PVNE_DTMO" IS 'Fecha modificacion del provedor'
;

/* Create Primary Keys, Indexes, Uniques, Checks, Triggers */

ALTER TABLE  "FS_PCRM_US"."NE_TPVNE" 
 ADD CONSTRAINT "PK_PVNE"
	PRIMARY KEY ("PVNE_PVNE") 
 USING INDEX
;

