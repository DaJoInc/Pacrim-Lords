REM ******************************************************************
REM Fecha         : 26/03/2018
REM Realizado por : TheOverLordKotan
REM Base de Datos : FS_PCRM_US
REM ******************************************************************

REM USUARIO DEL APLICATIVO PACRIM_US

drop user FS_PCRM_US cascade;

Create user FS_PCRM_US
 Identified by fs_pcrm_us
 Default tablespace TS_PACRIM
 Temporary tablespace TS_TPACRIM    
 account unlock;


Grant RESOURCE, 
  ALTER USER, CREATE CLUSTER, CREATE DATABASE LINK, CREATE PROFILE , ALTER PROFILE, 
  CREATE PROCEDURE, CREATE PUBLIC DATABASE LINK, 
  CREATE PUBLIC SYNONYM, CREATE ROLE, CREATE SEQUENCE, 
  CREATE SESSION, CREATE SYNONYM, CREATE TABLE, 
  CREATE TRIGGER, CREATE USER , CREATE VIEW, CREATE TYPE,
  DROP PUBLIC SYNONYM, EXECUTE ANY PROCEDURE, 
  SELECT ANY SEQUENCE, SELECT ANY TABLE, 
  UNLIMITED TABLESPACE to FS_PCRM_US;
