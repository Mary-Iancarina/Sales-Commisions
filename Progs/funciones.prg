FUNCTION CrearConexion()
LOCAL lnConex
	lnConex=SQLSTRINGCONNECT("DRIVER={MySQL ODBC 3.51 Driver}; SERVER=" + ALLTRIM(pcServidor)+ "; option =3;DATABASE=" + ALLTRIM(pcData) + ";UID=" + ALLTRIM(pcUsuario) + ";PWD=" + ALLTRIM(pcContrasena) + "")
	IF lnConex < 0 
		MESSAGEBOX("No se pudo establecer la conexi�n con el servidor de datos",0+16,"Error")
	ENDIF 
	RETURN lnConex	
ENDFUNC 

FUNCTION Desconectar(tnConexion)
	LOCAL lnConex
	lnConex=SQLDISCONNECT(tnConexion)
	IF lnConex <> 1
		MESSAGEBOX("No se pudo desconectar",0+48,"Atenci�n")
	ENDIF 
ENDFUNC


FUNCTION Salir()
	IF MESSAGEBOX("�Desea Salir?",4+32,"Informaci�n")=6
*!*			RELEASE ALL 
*!*			CLEAR EVENTS
*!*			CLOSE DATABASES all 
		QUIT
	ELSE 
		RETURN 
	ENDIF 
ENDFUNC

FUNCTION Salirsp()
		QUIT
ENDFUNC
Function Encriptar(tcValor)
    LOCAL lcValor, lnPos, lnTam
    lnTam = Len(tcValor)
    lcValor = ""
    For lnPos = 1 To lnTam Step 1
        lcValor = lcValor + Chr(255 - Asc(Substr(tcValor, lnPos, 1)))
    Next
    Return lcValor
EndFunc

Function DesEncriptar(tcValor)
    Local lcValor, lnPos, lnTam
    lnTam = Len(tcValor)
    lcValor = ""
    For lnPos = 1 To lnTam Step 1
        lcValor = lcValor + Chr(255 - Asc(Substr(tcValor, lnPos, 1)))
    Next
    Return lcValor
ENDFUNC


PROCEDURE Activar_BarraExploracion()
	_Screen.ActiveForm.BarraExp.cmdPrimero.Enabled = .T.
	_Screen.ActiveForm.BarraExp.cmdAnterior.Enabled = .T.
	_Screen.ActiveForm.BarraExp.cmdSiguiente.Enabled = .T.
	_Screen.ActiveForm.BarraExp.cmdUltimo.Enabled = .T.
	_Screen.ActiveForm.BarraExp.cmdNuevo.Enabled = .T.
	_Screen.ActiveForm.BarraExp.cmdModificar.Enabled = .T.
	_Screen.ActiveForm.BarraExp.cmdEliminar.Enabled = .T.
	_Screen.ActiveForm.BarraExp.cmdGuardar.Enabled = .F.
	_Screen.ActiveForm.BarraExp.cmdCancelar.Enabled = .F.
	_Screen.ActiveForm.BarraExp.cmdImprimir.Enabled = .T.
	_Screen.ActiveForm.BarraExp.cmdBuscar.Enabled = .T.
	_Screen.ActiveForm.BarraExp.cmdCerrar.Enabled = .T.
ENDPROC 

PROCEDURE DesActivar_BarraExploracion()
	_Screen.ActiveForm.BarraExp.cmdPrimero.Enabled = .F.
	_Screen.ActiveForm.BarraExp.cmdAnterior.Enabled = .F.
	_Screen.ActiveForm.BarraExp.cmdSiguiente.Enabled = .F.
	_Screen.ActiveForm.BarraExp.cmdUltimo.Enabled = .F.
	_Screen.ActiveForm.BarraExp.cmdNuevo.Enabled = .F.
	_Screen.ActiveForm.BarraExp.cmdModificar.Enabled = .F.
	_Screen.ActiveForm.BarraExp.cmdEliminar.Enabled = .F.
	_Screen.ActiveForm.BarraExp.cmdGuardar.Enabled = .T.
	_Screen.ActiveForm.BarraExp.cmdCancelar.Enabled = .T.
	_Screen.ActiveForm.BarraExp.cmdImprimir.Enabled = .F.
	_Screen.ActiveForm.BarraExp.cmdBuscar.Enabled = .F.
	_Screen.ActiveForm.BarraExp.cmdCerrar.Enabled = .F.
ENDPROC 

PROCEDURE AccesoBarra()
	pcBarra.CmdComisionistas.Enabled = plComisionistas
	pcBarra.cmdProductos.Enabled=plProductos
	pcBarra.cmdGruposProd.Enabled = plGrupos_prod
	pcBarra.cmdClientes.enabled=plClientes
	pcBarra.cmdCuotas.enabled=plConfig_Calc
	pcBarra.cmdCalculos.enabled=plCalculos
	
*	plSucursales,plProductos,plGrupos_prod,plClientes,plConfig_Calc,plCalculos,plReportes,plRespaldar,plRestaurar,plUsuarios
ENDPROC 


FUNCTION CrearConexionSystem()
LOCAL lnConex
	lnConex=SQLSTRINGCONNECT("DRIVER={MySQL ODBC 3.51 Driver}; SERVER=" + ALLTRIM(pcServidor)+ "; DATABASE=information_schema;UID=" + ALLTRIM(pcUsuario) + "; PWD=" + ALLTRIM(pcContrasena) + "")
	IF lnConex < 0 
		MESSAGEBOX("No se pudo establecer la conexi�n con el servidor de datos",0+16,"Error")
	ENDIF 
	RETURN lnConex	
ENDFUNC 

FUNCTION CrearConexionOtraData(tcConexion)
LOCAL lnConex
	lnConex=SQLSTRINGCONNECT(tcConexion)
	IF lnConex < 0 
		MESSAGEBOX("No se pudo establecer la conexi�n con el servidor de datos",0+16,"Error")
	ENDIF 
	RETURN lnConex	
ENDFUNC 

FUNCTION ConvertirApostrofe(tcValor)
	lcValor = ""
	lcValor = STRTRAN(tcValor,"'",CHR(34))
	RETURN lcValor 	
ENDFUNC 

PROCEDURE  ErrProc()
ENDPROC 

FUNCTION SalirConf()
	IF MESSAGEBOX("�Desea cancelar el proceso?",4+32,"Informaci�n")=6
*!*			RELEASE ALL 
*!*			CLEAR EVENTS
*!*			CLOSE DATABASES all 
		QUIT
	ELSE 
		RETURN 
	ENDIF 
ENDFUNC