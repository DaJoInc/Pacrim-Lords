REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

CREATE INDEX "IXFK_NE_TPRNE_NE_TEMUS"   
 ON  "FS_PCRM_US"."NE_TPRNE" ("PRNE_EMUS") 
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

CREATE INDEX "IXFK_NE_TPRNE_NE_TINEM"   
 ON  "FS_PCRM_US"."NE_TPRNE" ("PRNE_INEM") 
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

CREATE INDEX "IXFK_NE_TPRNE_NE_TTPPR"   
 ON  "FS_PCRM_US"."NE_TPRNE" ("PRNE_TPPR") 
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
  

