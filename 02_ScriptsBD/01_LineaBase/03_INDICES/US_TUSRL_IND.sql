REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

CREATE INDEX "IXFK_US_TUSRL_US_TTPRL"   
 ON  "FS_PCRM_US"."US_TUSRL" ("TPRL_TPRL") 
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



CREATE INDEX "IXFK_US_TUSRL_US_TUSNE"   
 ON  "FS_PCRM_US"."US_TUSRL" ("USNE_USNE") 
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

