# Pacrim-Lords
La empresa PACRIM SAS cuenta con un equipo de desarrollo de software encargado de la producción de todos los sistemas de información para su propia empresa, PACRIM es una empresa que se dedica a la comercialización de productos a través de importaciones y exportaciones y bodegaje de productos para sus clientes.

PACRIM SAS ha fortalecido su comercio en otros países especialmente en China y otros de Asia, para lo cual necesita ampliar su portafolio de productos y realizar innovaciones a nivel tecnológico.
Definir el proyecto (El cual debe ser un desarrollo de un sistema de información)
Entre los requerimientos realizados por las directivas de PACRIM SAS está el desarrollo de un software para el control de inventarios de productos de los clientes y registro de movimientos de mercancía desde las bodegas hasta las transportadoras, así mismo se debe llevar un registro de clientes, proveedores, productos, transportadoras. Durante el desarrollo se define que se utilizara una metodología de desarrollo ágil.
Requerimientos funcionales específicos para el desarrollo del proyecto
A usted le corresponde diseñar, desarrollar y TESTEAR:
- Control de clientes: Inserción de datos principales (código único, nombres, apellidos, dirección, teléfono, email, país, tipo de cliente, username y contraseña, estado), modificación de datos (todos los anteriores excepto código único y username), inactivación de cliente, listado con filtros de búsqueda. Debe realizar el sistema una verificación antes de crear un cliente nuevo comparando email para reconocer si ya se encuentra registrado.
- Control de proveedor: Inserción de datos principales (código único, nombre, tipo de proveedor (fabricante o distribuidor), dirección, teléfono, email, país, estado), modificación de datos (todos los anteriores excepto código único), inactivación de proveedor, listado con filtros de búsqueda. Debe realizar el sistema una verificación antes de crear un proveedor nuevo comparando nombre, email para reconocer si ya se encuentra registrado.
- Control de productos: Inserción de datos principales (código único, nombre del producto, descripción, marca, tipo de producto, proveedor, valor de compra, valor de venta), modificación de datos (todos los anteriores excepto código único), no se puede eliminar ningún producto una vez registrado, listado con filtros de búsqueda. Debe realizar el sistema una verificación antes de crear un producto nuevo comparando nombre y marca para reconocer si ya se encuentra registrado.



Requerimientos no funcionales específicos para el desarrollo del proyecto
Se define que se utilizara software libre para el desarrollo de este proyecto de la siguiente forma:
REQUERIMIENTO	DESCRIPCION
SERVIDOR	XEON 2 DE 8 NUCLEOS CON RAM 8GB
CONTENEDOR DE APLICACIONES	APACHE
LENGUAJE DE PROGRAMACION	PHP 7, js, jq
MOTOR DE BASES DE DATOS	Oracle
DOMINIO	www.pacrimsas.com
USUARIOS DEL SISTEMA	10000
USUARIOS CONCURRENTES	10

Planificación general de la iteración
Según el requerimiento del cliente se realizará una iteración con el desarrollo de la funcionalidad de gestión de proveedores.
Actividad	Tiempo	Entregable
Diagrama conceptual	2 hrs	Documento con diagrama conceptual
Flujograma funcional	2hrs	Documento con descripción funcional y flujograma del procedimiento
Diagrama de Casos de uso	3hrs	Documento con diagramación de los casos de uso y sus respectivas descripciones
Diseño grafico	6hrs	Carta de imagen corporativa y diseño en html de la función
Diseño de base de datos	6hrs	Modelo relacional, Modelo entidad relación y diccionario de datos
Desarrollo funcionalidades
-	Construcción BD
-	Autenticación
-	Clientes
-	Proveedores
-	Productos
-	Eliminar proveedores	24hrs	Módulo de gestión de inventarios cargado en el servidor de prueba.
Aplicación de pruebas	24hrs	Modulo probado
Migración de datos	4hrs	Información cargada en la base de datos
Implementación	8hrs	Puesta del módulo en servidor de producción
Capacitación a usuarios
Acta de entrega

Plan de testing para la funcionalidad a desarrollar en la iteración:
Para el desarrollo de este ítem se deben tener en cuenta los aspectos básicos del testing ágil.
Para aplicar las pruebas unitarias puede hacer uso de SimpleTest o PHPUnit.
Debe especificar en el formato a continuación las pruebas unitarias a ejecutar (por lo menos 2 pruebas por funcionalidad):

Definir estrategia	Diseño de casos de prueba	Gestión de pruebas	Herramientas de pruebas
Pruebas en inserción de registros a BD	Inserción de datos directamente a la BD y luego por medio de la aplicación	Funciona: sale a producción
No funciona: se devuelve a desarrollador	Motor Bd y aplicación en desarrollo
			
