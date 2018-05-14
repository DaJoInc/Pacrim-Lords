REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

 
/

/* Create Tables */

CREATE TABLE  "FS_PCRM_US"."US_TROLL"
(
	"ROLL_ROLL" NUMBER(22) NOT NULL,    -- Codigo unico tipo Rol asignado por el sistema
	"ROLL_RLDN" VARCHAR2(50) NOT NULL,    -- Descripcion del rol asignado por el sistema
	"ROLL_FCMO" DATE NOT NULL    -- Fecha de Modificacion del tipo rol
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

COMMENT ON TABLE  "US_TROLL" IS 'Tipo de Rol usuarios AUWEB'
;

COMMENT ON COLUMN  "US_TROLL"."ROLL_ROLL" IS 'Codigo unico tipo Rol asignado por el sistema'
;

COMMENT ON COLUMN  "US_TROLL"."ROLL_RLDN" IS 'Descripcion del rol asignado por el sistema'
;

COMMENT ON COLUMN  "US_TROLL"."ROLL_FCMO" IS 'Fecha de Modificacion del tipo rol'
;

/* Create Primary Keys, Indexes, Uniques, Checks, Triggers */

ALTER TABLE  "US_TROLL" 
 ADD CONSTRAINT "PK_TROLL"
	PRIMARY KEY ("ROLL_ROLL") 
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