prompt
prompt TYPE OBJECT:NE_TO_NE_TPSNE
prompt
CREATE OR REPLACE TYPE FS_PCRM_US.NE_TO_NE_TPSNE IS
OBJECT (
      PSNE_PSNE                        NUMBER(22),
      PSNE_CODE                        VARCHAR2(50),
      PSNE_NAME                        VARCHAR2(255)
   );
/