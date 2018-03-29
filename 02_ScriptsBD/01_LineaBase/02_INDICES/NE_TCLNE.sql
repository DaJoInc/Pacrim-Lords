REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

CREATE INDEX "IXFK_NE_TCLNE_NE_TTPCL"   
 ON  "FS_PCRM_US"."NE_TCLNE" ("TPCL_TPCL") 
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
  
  
CREATE INDEX "IXFK_NE_TCLNE_NE_TTRPR"   
 ON  "FS_PCRM_US"."NE_TCLNE" ("TRPR_TRPR") 
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
  
CREATE INDEX "IXFK_NE_TCLNE_NE_TTSTC"   
 ON  "FS_PCRM_US"."NE_TCLNE" ("TSTC_TSTC") 
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
  
CREATE INDEX "IXFK_NE_TCLNE_US_TUSRL"   
 ON  "FS_PCRM_US"."NE_TCLNE" ("USRL_USRL") 
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
  
CREATE INDEX "PK_NE_TCLNE"   
 ON  "FS_PCRM_US"."NE_TCLNE" ("CLNE_CLNE") 
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