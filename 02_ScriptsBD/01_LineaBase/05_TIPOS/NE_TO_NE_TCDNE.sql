prompt
prompt TYPE OBJECT:NE_TO_NE_TCDNE
prompt
CREATE OR REPLACE TYPE FS_PCRM_US.NE_TO_NE_TCDNE IS
OBJECT (
      CDNE_CDNE                        NUMBER(22),
      CDNE_LTUD                        NUMBER(10,8),
      CDNE_LOTD                        NUMBER(11,8),
      CDNE_NAME                        VARCHAR2(255),
      DENE_DENE                        NUMBER(22),
      PSNE_PSNE                        NUMBER(22)
   );
/