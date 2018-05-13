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
	"USNE_ALAS" VARCHAR2(100) NOT NULL,    -- Nombres del usuario en el negocio
	"USNE_PSWD" VARCHAR2(2000) NULL    -- password del usuario en el negocio
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

COMMENT ON TABLE  "FS_PCRM_US"."US_TPSNE" IS 'Tabla que contendra las personas del negocio respectivo '
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TPSNE"."PSNE_PSNE" IS 'Identificador  unico del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TPSNE"."PSNE_NOBE" IS 'Nombres del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TPSNE"."PSNE_APDO" IS 'Apellidos del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TPSNE"."PSNE_DIRN" IS 'Direccion  del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TPSNE"."PSNE_TLFN" IS 'telefono del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TPSNE"."PSNE_EMAL" IS 'Email  del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TPSNE"."PSNE_PAIS" IS 'Pais  del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TPSNE"."PSNE_NRID" IS 'Numero de indentificacion del usuario'
;


ALTER TABLE  "FS_PCRM_US"."US_TPSNE" 
 ADD CONSTRAINT "PK_PSNE"
	PRIMARY KEY ("PSNE_PSNE") 
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
;