REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."US_TUSNE"
(
	"USNE_USNE" NUMBER(22) NOT NULL,    -- Identificador  unico del usuario en el negocio
	"USNE_NOBE" VARCHAR2(70) NOT NULL,    -- Nombres del usuario en el negocio
	"USNE_APDO" VARCHAR2(70) NULL,    -- Apellidos del usuario en el negocio
	"USNE_DIRN" VARCHAR2(50) NULL,    -- Direccion  del usuario en el negocio
	"USNE_TLFN" VARCHAR2(50) NULL,    -- telefono del usuario en el negocio
	"USNE_EMAL" VARCHAR2(50) NULL,    -- Email  del usuario en el negocio
	"USNE_PAIS" VARCHAR2(50) NULL,    -- Pais  del usuario en el negocio
	"USNE_USAO" VARCHAR2(200) NULL,    -- Alias usuario en el negocio
	"USNE_NRID" NUMBER(22) NULL,    -- Numero de indentificacion del usuario
	"USNE_PSWD" VARCHAR2(200) NULL    -- Con ingreso app
)
TABLESPACE	TS_PACRIM
PCTFREE		10
INITRANS	1
MAXTRANS	255
STORAGE (
	INITIAL		65536
	MINEXTENTS	1
	MAXEXTENTS	2147483645
	BUFFER_POOL	DEFAULT
	)
LOGGING
NOCOMPRESS
NOCACHE
NOPARALLEL
MONITORING
;


/* Create Comments, Sequences and Triggers for Autonumber Columns */

COMMENT ON TABLE  "FS_PCRM_US"."US_TUSNE" IS 'Tabla que contendra los usuarios del negocio respectivo de empresa '
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TUSNE"."USNE_USNE" IS 'Identificador  unico del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TUSNE"."USNE_NOBE" IS 'Nombres del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TUSNE"."USNE_APDO" IS 'Apellidos del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TUSNE"."USNE_DIRN" IS 'Direccion  del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TUSNE"."USNE_TLFN" IS 'telefono del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TUSNE"."USNE_EMAL" IS 'Email  del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TUSNE"."USNE_PAIS" IS 'Pais  del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TUSNE"."USNE_USAO" IS 'Alias usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TUSNE"."USNE_NRID" IS 'Numero de indentificacion del usuario'
;
COMMENT ON COLUMN  "FS_PCRM_US"."US_TUSNE"."USNE_PSWD" IS 'Con ingreso app'
;

ALTER TABLE  "FS_PCRM_US"."US_TUSNE" 
 ADD CONSTRAINT "PK_USNE"
	PRIMARY KEY ("USNE_USNE") USING INDEX;
