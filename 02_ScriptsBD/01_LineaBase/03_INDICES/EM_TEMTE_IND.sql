REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

CREATE INDEX "IXFK_EM_TEMTE_EM_TEMNE"   
 ON  "FS_PCRM_US"."EM_TEMTE" ("EMTE_EMNE") 
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
  
  
  CREATE INDEX "IXFK_EM_TEMTE_EM_TTPEM"   
 ON  "FS_PCRM_US"."EM_TEMTE" ("EMTE_TPEM") 
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
  
