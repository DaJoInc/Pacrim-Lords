REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."NE_TINEM"
(
	"INEM_INEM" NUMBER(22) NOT NULL,    -- Identificador unico del inventario
	"INEM_NOIN" VARCHAR2(50) NULL,    -- Nombre del inventario
	"INEM_DEIN" VARCHAR2(50) NULL,    -- Descripcion del inventario
	"INEM_INCR" DATE NULL,    -- Fecha creacion del inventario
	"PVUS_PVUS" NUMBER(22) NOT NULL,
	"EMUS_EMUS" NUMBER(22) NOT NULL
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

COMMENT ON TABLE  "FS_PCRM_US"."NE_TINEM" IS 'Tabla que alamcena los inventarios de la empresa y relaciona los provedores con los productos y el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TINEM"."INEM_INEM" IS 'Identificador unico del inventario'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TINEM"."INEM_NOIN" IS 'Nombre del inventario'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TINEM"."INEM_DEIN" IS 'Descripcion del inventario'
;

COMMENT ON COLUMN  "FS_PCRM_US"."NE_TINEM"."INEM_INCR" IS 'Fecha creacion del inventario'
;

ALTER TABLE  "FS_PCRM_US"."NE_TINEM" 
 ADD CONSTRAINT "PK_INEM"
	PRIMARY KEY ("INEM_INEM") USING INDEX;
