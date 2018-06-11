prompt
prompt TYPE OBJECT:NE_TO_NE_TDENE
prompt
CREATE OR REPLACE TYPE FS_PCRM_US.NE_TO_NE_TDENE IS
OBJECT (
      DENE_DENE                        NUMBER(22),
      DENE_CODE                        VARCHAR2(50),
      DENE_NAME                        VARCHAR2(255),
      PSNE_PSNE                        NUMBER(22)
   );
/