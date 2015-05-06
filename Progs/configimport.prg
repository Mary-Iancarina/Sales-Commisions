&&Configuracion del Programa
PUBLIC Fun,pcSucursal,pcServidor,pcData,pcUsuario,pcContrasena,pcRuta,pnProgram,pcBarra,oApp
LOCAL lcArchivo,lnCon,lnSize,lcTexto,lcEject
SET DATE BRITISH 
SET ANSI ON 
SET CENTURY ON 
SET SAFETY OFF 
SET EXCLUSIVE OFF 
SET DELETED ON 
SET SYSMENU OFF 
SET TALK OFF 
ON SHUTDOWN Salirsp()
ON ESCAPE SalirConf()
pnProgram=1
pcRuta = FULLPATH(CURDIR())
SET PATH TO Forms ,Images ,Menus ,Progs, Class
SET PROCEDURE TO Funciones.prg
*SET CLASSLIB TO clcomisiones.vcx
_Screen.WindowState = 2
&&Validando Servidor
lcTexto = ""
IF FILE("Config.txt") 
	lcEject="Import From " + pcRuta + "Config.txt Type Xls"
	&lcEject
	GO BOTTOM 
	pcServidor=DesEncriptar(ALLTRIM(a))
	pcData=DesEncriptar(ALLTRIM(d))
	pcUsuario=DesEncriptar(ALLTRIM(b))
	pcContrasena=DesEncriptar(ALLTRIM(c))
	SELECT config
	USE 
ELSE 
	CREATE CURSOR ttTemp (cServidor C(60),cUsuario C(30),cContrasena C(30),cDatabase C(60))
	SELECT ttTemp
	APPEND BLANK
	BROWSE
	pcServidor=cServidor
	pcData=cDataBase
	pcUsuario=cUsuario
	pcContrasena=cContrasena
	Replace cServidor WITH Encriptar(ALLTRIM(cServidor)),;
			cUsuario  WITH Encriptar(ALLTRIM(cUsuario)), ;
			cContrasena WITH Encriptar(ALLTRIM(cContrasena)),;
			cDatabase WITH Encriptar(ALLTRIM(cDatabase)) IN ttTemp
			
	lcEject="EXPORT TO " + pcRuta + "Config.txt Type Xls"
	&lcEject
	SELECT ttTemp
	USE 
ENDIF 

_Screen.Caption ="Sistema de Comisiones"
lnConexion=CrearConexion()
IF lnConexion> 0 THEN 
	Desconectar(lnConexion)
	DO FORM frmimportacion_automatica.scx
ENDIF 


READ EVENTS