REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/
CREATE TABLE  "FS_PCRM_US"."US_TPSNA"
(
	"PSNA_PSNA" NUMBER(22) NOT NULL,    -- Identificador  unico del usuario en el negocio
	"PSNA_NOBE" VARCHAR2(70) NOT NULL,    -- Nombres del usuario en el negocio
	"PSNA_APDO" VARCHAR2(70) NULL,    -- Apellidos del usuario en el negocio
	"PSNA_DIRN" VARCHAR2(50) NULL,    -- Direccion  del usuario en el negocio
	"PSNA_TLFN" VARCHAR2(50) NULL,    -- telefono del usuario en el negocio
	"PSNA_EMAL" VARCHAR2(50) NULL,    -- Email  del usuario en el negocio
	"PSNA_PAIS" VARCHAR2(50) NULL,    -- Pais  del usuario en el negocio
	"PSNA_NRID" VARCHAR2(50) NULL    -- Numero de indentificacion del usuario
)
TABLESPACE	TS_PACRIM
PCTFREE	10 
INITRANS	2 
MAXTRANS	255 
STORAGE ( 
	INITIAL	65536
	MINEXTENTS 1
	MAXEXTENTS 2147483645
	BUFFER_POOL DEFAULT 
	)
;

/* Create Comments, Sequences and Triggers for Autonumber Columns */

COMMENT ON TABLE  "FS_PCRM_US"."US_TPSNA" IS 'Tabla que contendra las personas del negocio respectivo '
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TPSNA"."PSNA_PSNA" IS 'Identificador  unico del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TPSNA"."PSNA_NOBE" IS 'Nombres del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TPSNA"."PSNA_APDO" IS 'Apellidos del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TPSNA"."PSNA_DIRN" IS 'Direccion  del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TPSNA"."PSNA_TLFN" IS 'telefono del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TPSNA"."PSNA_EMAL" IS 'Email  del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TPSNA"."PSNA_PAIS" IS 'Pais  del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_PCRM_US"."US_TPSNA"."PSNA_NRID" IS 'Numero de indentificacion del usuario'
;

/* Create Primary Keys, Indexes, Uniques, Checks, Triggers */

ALTER TABLE  "FS_PCRM_US"."US_TPSNA" 
 ADD CONSTRAINT "PK_PSNA"
	PRIMARY KEY ("PSNA_PSNA") 
USING INDEX 
LOGGING 
TABLESPACE	TS_IPACRIM 
PCTFREE	10 
INITRANS	2 
MAXTRANS	255 
STORAGE ( 
	INITIAL	65536
	MINEXTENTS 1
	MAXEXTENTS 2147483645
	BUFFER_POOL DEFAULT 
	)
;