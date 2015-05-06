&&Configuracion del Programa
PUBLIC Fun,pcSucursal,pcServidor,pcData,pcUsuario,pcContrasena,pcRuta,pnProgram,pcBarra,oApp,pcAccesSuc,pcUsuarioSystem,pcBarraEstado,pcSucursalDes
pcSucursalDes=""
&&Variables de acceso
PUBLIC plSucursales,plComisionistas,plParaComi,plProductos,plGrupos_prod,plClientes,plConfig_Calc,plCalculos,plReportes,plRespaldar,plRestaurar,plUsuarios,plTipoComisionistas,plBonos,plConfigSistema,plConfig_Import,plTiposCliente,plImportacion,plTipoMov,plDatosEmp,plSuplencias,plTiposDoc
plTipoMov=.f.
plSucursales=.f.
plComisionistas=.f.
plParaComi=.f.
plProductos=.f.
plGrupos_prod=.f.
plClientes=.f.
plConfig_Calc=.f.
plCalculos=.f.
plReportes=.f.
plRespaldar=.f.
plRestaurar=.f.
plUsuarios=.f.
plBonos=.f.
plConfigSistema=.f.
plConfig_Import=.f.
plTiposCliente=.f.
plImportacion=.f.
plDatosEmp=.f.
plSuplencias=.f.
plTiposDoc= .f.
LOCAL lcArchivo,lnCon,lnSize,lcTexto,lcEject
SET DATE BRITISH 
SET TALK OFF 
SET ESCAPE OFF 
SET CENTURY ON 
SET SAFETY OFF 
SET EXCLUSIVE OFF 
SET DELETED ON 
SET SYSMENU OFF 
SET STATUS BAR OFF 
ON SHUTDOWN Salirsp()
pnProgram=2
pcRuta = FULLPATH(CURDIR())
SET PATH TO Forms ,Images ,Menus ,Progs, Class
SET PROCEDURE TO Funciones.prg
SET CLASSLIB TO clcomisiones.vcx

_Screen.WindowState = 2
_screen.Closable = .f.
_Screen.Icon =LOCFILE("CUST.ICO")

&&Validando Servidor
lcTexto = ""
IF FILE("Config.txt") 
	lcEject="Import From " + CHR(34) + pcRuta + "Config.txt" + CHR(34) +" Type Xls"
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
			
	lcEject="EXPORT TO " + CHR(34) + pcRuta + "Config.txt" + CHR(34) +" Type Xls"
	&lcEject
	SELECT ttTemp
	USE 
ENDIF 
oapp = CREATEOBJECT("Principal")
_Screen.Caption ="Sistema de Comisiones"
lnConexion=CrearConexion()
IF lnConexion> 0 THEN 
*	lccmd ="insert into tusuarios(cid_login,cpassword,cDescripcion,nusuarios)values('admin','"+encriptar("admin")+"','Administrador',1)"
*	SQLEXEC(lnConexion,lccmd)
	Desconectar(lnConexion)
	DO FORM frmacceso.scx
ELSE 
	quit
ENDIF 


READ EVENTS