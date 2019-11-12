/*--------------------------------------------------------------------------------------------------------------------------------------              
* Procedimiento		:  dbo.[spCTCActualizarRutaImagenesDocumentosDigitalizados]               
* Desarrollado por  : <\A Diego Cortés A\>                
* Descripción		: <\D Procedimiento que permite actualizar la ruta de los documentos digitalizados.D\>     
* Observaciones		: <\O    O\>                
* Parámetros		: <\P @estructuraXML contien los datos de los documentos para actualizar  P\>
* Fecha Creación   : <\FC 2015/07/03 FC\>                 
*                
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION
*---------------------------------------------------------------------------------
* Modificado Por		 : <\AM AM\>
* Descripcion			 : <\DM  DM\>
* Nuevos Parametros	 	 : <\PM PM\>
* Nuevas Variables		 : <\VM VM\>
* Fecha Modificacion	 : <\FM /M\>
*---------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[spCTCActualizarRutaImagenesDocumentosDigitalizados] (
	@estructuraXML	XML)	-- Indica los datos de los documentos que serán actualizados
AS
SET NOCOUNT ON

Declare @cmdstr			varchar(1000)
Declare @rutaImagen		varchar(max)
Declare @rutaDestino	varchar(max)
Declare @nombreArchivo	varchar(max)
Declare @salidaComando	Int

BEGIN

	-- Creación de tablas temporales para almacenar la estructura xml y los resultados de la consulta
	Create Table #tempDatosXML (
					consecutivoSolicitud	Int,
					consecutivoDocumento	Int,
					rutaImagen				Varchar(250),
					rutaDestino				Varchar(250),
					nombreArchivo			Varchar(250))

	-- Inserta los datos en el xml en la tabla temporal					
  	insert Into 
		#tempDatosXML 
		(consecutivoSolicitud, consecutivoDocumento, rutaImagen, rutaDestino)
	select
		cast(colx.query('data(consecutivoSolicitud)') as varchar)  as  consecutivoSolicitud,
		cast(colx.query('data(consecutivoDocumento)') as varchar)  as  consecutivoDocumento,
		cast(colx.query('data(rutaImagen)') as varchar(250))  as  rutaImagen,
		cast(colx.query('data(rutaDestino)') as varchar(250))  as  rutaDestino
	from @estructuraXML.nodes('datos/dato') as TABX(COLX);	


	-- Actualiza la ruta del archivo
	Update a
	Set			a.rta_imgn = b.rutaImagen
	From		tbImagenesxDocumentosDigitalizados a With (NoLock)
	Inner Join	#tempDatosXML b With (NoLock)
	On			a.cnsctvo_cdgo_dcmnto = b.consecutivoDocumento;	
		
	Drop Table	#tempDatosXML

END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCTCActualizarRutaImagenesDocumentosDigitalizados] TO [ctc_webusr]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCTCActualizarRutaImagenesDocumentosDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCTCActualizarRutaImagenesDocumentosDigitalizados] TO [visosservice_role]
    AS [dbo];

