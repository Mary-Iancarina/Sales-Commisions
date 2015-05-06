&&Configuracion del Programa
PUBLIC Fun,pcServidor,pcData,pcUsuario,pcContrasena,;
	pcServidor1,pcData1,pcUsuario1,pcContrasena
LOCAL lcArchivo,lnCon,lnSize,lcTexto,lcCmd,lcValores
SET DATE BRITISH 
SET CENTURY ON 
SET EXCLUSIVE OFF 
SET PATH TO \Forms \Progs
SET PROCEDURE TO Funciones.prg
_Screen.WindowState = 2
&&Validando Servidor
_Screen.Caption ="Sistema de Comisiones"
DO FORM LOCFILE("FrmConfigIni.scx") TO lcValores
lnConexion=CrearConexion()
IF lnConexion> 0 THEN 
	lcCmd = "Create Database BDComisiones"
	lcCmd = "GRANT ALL PRIVILEGES ON BDComisiones.* TO 'iancarina'@'localhost'" ;
			+"  IDENTIFIED BY '426227462'" 

	SQLEXEC(lnConexion,lcCmd)
ELSE 
	QUIT	
ENDIF 

*!*	DO Menu.mpr
*!*	ON SHUTDOWN Salir()
READ EVENTS