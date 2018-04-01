# Instalación Base BD Pacrim-Lords

En esta parte se tratará el diseño inicial del modelo de datos de la aplicación

# Pre- instalación del esquema:
Pasos a seguir antes de la instalación:
-	Revisar la carpeta /00-SCHEMA en ella se encontrara un script denominado 01_TABLESPACES.sql en el se encontraran los TableSpace que se crearan para el esquema tener en cuenta que en este archivo se encuentre su carpeta inicial del motor de base de datos por default se encontrara en ‘'C:\oraclexe\app\oracle\oradata\XE\TPACRIM.dbf'’ para motores de desarrollo Oracle especialmente la versión XE

# Instalación del esquema:
Ejecutar SQLPLUS o si tiene un entorno de desarrollo SQL DEVELOPER y ejecutar el INSTALADOR_PACRIM.sql desde la ruta en la que se encuentre el repositorio, Ejemplo 
@@”D:\RepositoriosJoda\DajoInc\Pacrim-Lords\02_ScriptsBD\01_LineaBase\ INSTALADOR_PACRIM.sql”

-	Verificar si el archivo Spool encuentra errores graves de instalación 

# Usuario:
Luego se debería poder ingresar al esquema con el usuario creado : 

# FS_PCRM_US/ fs_pcrm_us


# Ejecutar Dos veces el script de datos por si el bloque anonimo no constracta con las tablas 