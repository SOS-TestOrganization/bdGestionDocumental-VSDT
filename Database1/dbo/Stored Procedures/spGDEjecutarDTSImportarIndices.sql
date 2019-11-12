/*
---------------------------------------------------------------------------------
* Metodo o PRG 	         : spGDEjecutarDTSImportarIndices 
* Desarrollado por		 :  <\A Omar Granados  A\>
* Descripcion			 :  <\D   D\>
* Observaciones		     :  <\O	  O\>
* Parametros			 :  <\P   P\>
							<\P   P\>
							<\P   P\>
* Variables				 :  <\V	  V\>
* Fecha Creacion		 :  <\FC 2010  FC\>
* ---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM Omar Granados  AM\>
* Descripcion			 : <\DM  Se modifica para que use el procedimiento de ejecución por catalogo en lugar de la ejecución antigua (SSIS 2005) DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM 2017/05/25  FM\>
*----------------------------------------------------------------------------------------------------------------------------------
* DATOS DE MODIFICACION    
*----------------------------------------------------------------------------------------------------------------------------------
* Modificado Por:		<\AM Ing. Cesar García													AM\>
* Descripcion:			<\DM Se modifica servidor de base de datos por migración a IBM Cloud	DM\>
* Nuevos Parametros:	<\PM																	PM\>
* Nuevas Variables:		<\VM																	VM\>
* Fecha Modificacion:	<\FM 2018-11-14															FM\>
*---------------------------------------------------------------------------------
*/
-- exec spGDEjecutarDTSImportarIndices 11296
CREATE Procedure [dbo].[spGDEjecutarDTSImportarIndices]
@cnsctvo_cdgo_cnfgrcn	udtConsecutivo
As
Begin
	Set Nocount On;

		Declare		@Server		VarChar(50)	= @@SERVERNAME,
					@datasource	Varchar(250);

		SET			@datasource	= 'Data Source='+@server+';Initial Catalog=bdGestionDocumental;Provider=SQLNCLI11.1;Integrated Security=SSPI;Auto Translate=False;';

		Insert Into dbo.tbResultadoEjecucion(slda)
		Exec		bdSeguridad.dbo.SpEjecutaDTS_cmdshell_Catalogo 
					@Server,
					@PkgName = '\SSISDB\GestionDocumental\SSISIndicesImagenesDigitalizadas01\ImportarIndices.dtsx',
					@ServerUser		= Null,		
					@ServerPWD		= Null,		
					@IntSecurity = 1 ,			-- 0 = SQL Server Security, 1 = Integrated Security
					@PkgPWD = '',		
					@G_Connection_name_1 = 'APOLO.bdGestionDocumental',
					@G_Connection_value_1 = @datasource,
					@GlobalVariableName1 = 'lnConfiguracion',
					@GlobalVariableValue1 = @cnsctvo_cdgo_cnfgrcn;
	
End

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEjecutarDTSImportarIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEjecutarDTSImportarIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEjecutarDTSImportarIndices] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEjecutarDTSImportarIndices] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEjecutarDTSImportarIndices] TO [visosservice_role]
    AS [dbo];

