REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

CREATE INDEX "IXFK_NE_TTRPR_NE_TPRNE"   
 ON  "FS_PCRM_US"."NE_TTRPR" ("TRPR_PRNE") 
TABLESPACE	TS_IPACRIM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

  CREATE INDEX "IXFK_NE_TTRPR_NE_TCLNE"   
 ON  "FS_PCRM_US"."NE_TTRPR"  ("TRPR_CLNE") 
TABLESPACE	TS_IPACRIM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

  
