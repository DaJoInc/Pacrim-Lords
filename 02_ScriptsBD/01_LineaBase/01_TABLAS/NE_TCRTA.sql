Prompt 
Prompt Creando tabla NE_TCRTA
Prompt

create TABLE FS_PCRM_US.NE_TCRTA
(
  CRTA_CRTA         VARCHAR2(100 BYTE)     constraint NN_NE_TCRTA_CRTA      not null ,
  CRTA_PRCS         VARCHAR2(100 BYTE)     constraint NN_NE_TCRTA_PRCS      not null ,
  CRTA_HTTP_CODE    NUMBER                 constraint NN_NE_TCRTA_HTTP_CODE not null ,
  CRTA_USUA         VARCHAR2(30 BYTE)      constraint NN_NE_TCRTA_USUA      not null ,
  CRTA_DESCRI       VARCHAR2(256 BYTE)     constraint NN_NE_TCRTA_DESCRI    not null ,
  CRTA_FECCRE       DATE                   constraint NN_NE_TCRTA_FECCRE    not null ,
  CRTA_IDIOMA       VARCHAR2(10)           constraint NN_NE_TCRTA_IDIOMA    not null
) 
  TABLESPACE TS_PACRIM
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );

  
  
Prompt 
Prompt Comentarios tabla NE_TCRTA
Prompt
  
COMMENT ON TABLE FS_PCRM_US.NE_TCRTA                  IS 'Codigos de respuesta utilizados por los servicios de API';
COMMENT ON COLUMN  FS_PCRM_US.NE_TCRTA.CRTA_CRTA        IS 'Identificador interno para codigo de respuesta';
COMMENT ON COLUMN  FS_PCRM_US.NE_TCRTA.CRTA_PRCS        IS 'Proceso de API al cual esta asociado el codigo de respuesta';
COMMENT ON COLUMN  FS_PCRM_US.NE_TCRTA.CRTA_HTTP_CODE   IS 'Codigo http que se retorna como respuesta. Ver codificacion estandar http 2XX-Peticiones correctas, 3XX-Redirecciones, 4XX-Errores de usuario, 5XX-Errores de servidor' ;
COMMENT ON COLUMN  FS_PCRM_US.NE_TCRTA.CRTA_DESCRI      IS 'Descripcion funcional de codigo de respuesta. ';
COMMENT ON COLUMN  FS_PCRM_US.NE_TCRTA.CRTA_USUA        IS 'Usuario que crea el codigo de respuesta ';
COMMENT ON COLUMN  FS_PCRM_US.NE_TCRTA.CRTA_FECCRE      IS 'Fecha de creacion del codigo de respuesta';
COMMENT ON COLUMN  FS_PCRM_US.NE_TCRTA.CRTA_IDIOMA      IS 'Códigos de países e idiomas I18N';



Prompt 
Prompt Llave Primaria NE_TCRTA
Prompt

alter TABLE FS_PCRM_US.NE_TCRTA
  add constraint PK_NE_TCRTA primary key (CRTA_CRTA, CRTA_PRCS,CRTA_IDIOMA)
  using index 
  TABLESPACE TS_IPACRIM
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