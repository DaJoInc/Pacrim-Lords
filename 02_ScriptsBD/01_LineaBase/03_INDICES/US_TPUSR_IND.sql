REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

CREATE INDEX "IXFK_US_TPUSR_US_TPSNE"   
 ON  "FS_PCRM_US"."US_TPUSR" ("PSNE_PSNE") 
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
  
  
CREATE INDEX "IXFK_US_TPUSR_US_TRLNE"   
 ON  "FS_PCRM_US"."US_TPUSR" ("PSNE_RLNE") 
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
  
CREATE INDEX "IXFK_US_TPUSR_US_TUSNE"   
 ON  "FS_PCRM_US"."US_TPUSR" ("PSNE_USNE") 
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