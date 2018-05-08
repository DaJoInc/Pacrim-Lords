REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************
CREATE INDEX "IXFK_NE_TEMUS_EM_TEMTE"   
 ON  "FS_PCRM_US"."NE_TEMUS" ("EMUS_EMTE") 
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
  
  
CREATE INDEX "IXFK_NE_TEMUS_NE_TSTNE"   
 ON  "FS_PCRM_US"."NE_TEMUS" ("EMUS_STNE") 
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
  
CREATE INDEX "IXFK_NE_TEMUS_US_TPUSR"   
 ON  "FS_PCRM_US"."NE_TEMUS" ("EMUS_PUSR") 
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
  

