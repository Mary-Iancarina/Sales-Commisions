SET DEFAULT TO C:\COMISIONESVEND\FORMS
CLOSE DATABASES ALL 
PUBLIC nCantArchivos
DIMENSION  ArrArchivos(1)
CREATE CURSOR ttArchivos(cnombre C(100))  
SELECT * FROM c:\COMISIONESVEND\TABLAS_CAMPOS INTO CURSOR ttTablasCampos

CargarArchivos()
*SELECT ttArchivos
*SET FILTER TO cnombre  = "FRMBONOS.SCX"
LeerArchivos()

CLOSE DATABASES ALL 
FUNCTION CargarArchivos()
	nCantArchivos= ADIR(ArrArchivos, '*.scx')  
	FOR nCount = 1 TO nCantArchivos
		INSERT INTO ttArchivos (cnombre) values(ArrArchivos(nCount,1))
	ENDFOR
ENDFUNC

FUNCTION LeerArchivos()
	
	SELECT ttArchivos
	GO TOP 
	DO WHILE !EOF()
		ModificarArchivo(ttArchivos.cnombre)
		SELECT ttArchivos
		SKIP 1
	ENDDO 
	
ENDFUNC 

FUNCTION ModificarArchivo(lcValor)
	WAIT "modificando " + lcValor  NOWAIT WINDOW 
	*SELECT * FROM &lcValor
	SELECT ttTablasCampos
	GO TOP 
	DO WHILE !EOF()
		UPDATE &lcValor set methods = STRTRAN(methods , ALLTRIM(ttTablasCampos.table), ALLTRIM(ttTablasCampos.table),1,9999,1),;
							methods = STRTRAN(methods , ALLTRIM(ttTablasCampos.column_m), ALLTRIM(ttTablasCampos.column_m),1,9999,1),;
							properties = STRTRAN(properties , ALLTRIM(ttTablasCampos.table), ALLTRIM(ttTablasCampos.table),1,9999,1),;
							properties = STRTRAN(properties , ALLTRIM(ttTablasCampos.column_m), ALLTRIM(ttTablasCampos.column_m),1,9999,1)
		SELECT ttTablasCampos 
		SKIP 
	enddo 
	*SELECT * FROM &lcValor
	wait clear 
ENDFUNC 
