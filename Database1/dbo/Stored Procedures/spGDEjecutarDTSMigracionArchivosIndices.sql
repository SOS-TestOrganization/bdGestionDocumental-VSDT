



-- =============================================
-- Author:		<sisogb01>
-- Create date: <13/04/2009>
-- Description:	<Ejecuta los DTS's para migrar los indices de las imagenes a la base de datos>
-- 
-- =============================================
CREATE PROCEDURE [dbo].[spGDEjecutarDTSMigracionArchivosIndices]
AS
--BEGIN
--	SET NOCOUNT ON;
----	Exec dbo.SpEjecutaDTS_cmdshell null, '\\APOLO\tmp\DTSGD\DTS_ImportarIndices.dtsx',null,null, 1,'','APOLO.bdGestionDocumental','Data Source=ATENEA;Initial Catalog=bdGestionDocumental;Provider=SQLNCLI.1;Integrated Security=SSPI;Auto Translate=False;',null,null,null,null,null,null
--	-- Ya esta funcionando el reemplazo de las conexiones.
---- 27/07/2010 Nota inactivan estas 4 lineas mientras se realiza el mantenimiento 

--	Insert Into dbo.tbResultadoEjecucion(slda)
--	exec SpEjecutaDTS_cmdshell 'AZ-ESKOL','\GestionDocumental\ImportarIndices',null,null, 1,'','APOLO.bdGestionDocumental','Data Source=AZ-NIORD\Desarrollo;Initial Catalog=bdGestionDocumental;Provider=SQLNCLI.1;Integrated Security=SSPI;Auto Translate=False;',null,null,null,null,null,null

--	Insert Into dbo.tbResultadoEjecucion(slda)
--	exec SpEjecutaDTS_cmdshell 'AZ-ESKOL','\GestionDocumental\TraspasarRegistrosIndices',null,null, 1,'','APOLO.bdGestionDocumental','Data Source=AZ-NIORD\Desarrollo;Initial Catalog=bdGestionDocumental;Provider=SQLNCLI.1;Integrated Security=SSPI;Auto Translate=False;',null,null,null,null,null,null
----	Exec dbo.SpEjecutaDTS_cmdshell null, '\\ATENEA\tmp\DTSGD\DTS_TraspasarRegistrosIndices.dtsx',null,null, 1,'','APOLO.bdGestionDocumental','Data Source=ATENEA;Initial Catalog=bdGestionDocumental;Provider=SQLNCLI.1;Integrated Security=SSPI;Auto Translate=False;',null,null,null,null,null,null
--END
BEGIN
	SET NOCOUNT ON;

	Exec bdSeguridad.dbo.SpEjecutaDTS_cmdshell_Catalogo -- '\GestionDocumental\ImportarIndices',null,null, 1,'','APOLO.bdGestionDocumental','Data Source=AZ-NIORD\Desarrollo;Initial Catalog=bdGestionDocumental;Provider=SQLNCLI.1;Integrated Security=SSPI;Auto Translate=False;',null,null,null,null,null,null
			@Server  = 'CLNIORD',
			@PkgName = '\SSISDB\GestionDocumental\CargaImagenes\ImportarIndices.dtsx',
			@ServerUser		= Null,		
			@ServerPWD		= Null,		
			@IntSecurity = 1 ,			-- 0 = SQL Server Security, 1 = Integrated Security
			@PkgPWD = '',		
			@G_Connection_name_1 = 'APOLO.bdGestionDocumental',
			@G_Connection_value_1 = 'Data Source=CLNIORD\DEV_OPERACIONES;Initial Catalog=bdGestionDocumental;Provider=SQLNCLI.1;Integrated Security=SSPI;Auto Translate=False;'
	
	Exec bdSeguridad.dbo.SpEjecutaDTS_cmdshell_Catalogo -- '\GestionDocumental\ImportarIndices',null,null, 1,'','APOLO.bdGestionDocumental','Data Source=AZ-NIORD\Desarrollo;Initial Catalog=bdGestionDocumental;Provider=SQLNCLI.1;Integrated Security=SSPI;Auto Translate=False;',null,null,null,null,null,null
			@Server  = 'CLNIORD',
			@PkgName = '\SSISDB\GestionDocumental\TraspasarImagenes\TraspasarRegistrosIndices.dtsx', 	
			@ServerUser		= Null,		
			@ServerPWD		= Null,		
			@IntSecurity = 1 ,			-- 0 = SQL Server Security, 1 = Integrated Security
			@PkgPWD = '',		
			@G_Connection_name_1 = 'APOLO.bdGestionDocumental',
			@G_Connection_value_1 = 'Data Source=CLNIORD\DEV_OPERACIONES;Initial Catalog=bdGestionDocumental;Provider=SQLNCLI.1;Integrated Security=SSPI;Auto Translate=False;'
	

END




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEjecutarDTSMigracionArchivosIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEjecutarDTSMigracionArchivosIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEjecutarDTSMigracionArchivosIndices] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEjecutarDTSMigracionArchivosIndices] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEjecutarDTSMigracionArchivosIndices] TO [visosservice_role]
    AS [dbo];

