/*--------------------------------------------------------------------------------------------------------------------------------------              
* Procedimiento		:  dbo.[spCTCConsultarRutaImagenesDocumentosDigitalizados]               
* Desarrollado por  : <\A Diego Cortés A\>                
* Descripción		: <\D Procedimiento que permite consultar la ruta de los documentos digitalizados.D\>     
* Observaciones		: <\O    O\>                
* Parámetros		: <\P @estructuraXML contien los datos de los documentos a consultar  P\>
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
CREATE PROCEDURE [dbo].[spCTCConsultarRutaImagenesDocumentosDigitalizados] (
	@estructuraXML	XML)	-- Indica los datos de los documentos a consultar
AS
SET NOCOUNT ON
BEGIN

	-- Creación de tablas temporales para almacenar la estructura xml y los resultados de la consulta
	Create Table #tempDatosXML (
					consecutivoSolicitud	Int,
					consecutivoDocumento	Int)

	Create Table #tempResultados (
					cnsctvo_slctd_srvco_sld_rcbda	Int,
					cnsctvo_cdgo_dcmnto				Int,
					rta_imgn						Varchar(250))
					
	-- Inserta los datos en el xml en la tabla temporal					
  	insert Into 
		#tempDatosXML 
		(consecutivoSolicitud, consecutivoDocumento)
	select
		cast(colx.query('data(consecutivoSolicitud)') as varchar)  as  consecutivoSolicitud,
		cast(colx.query('data(consecutivoDocumento)') as varchar)  as  consecutivoDocumento
	from @estructuraXML.nodes('datos/dato') as TABX(COLX);		
		
	-- Inserta el cnsctvo_dcmnto en la tabla temporal
	Insert Into 
				#tempResultados 
				(cnsctvo_slctd_srvco_sld_rcbda, cnsctvo_cdgo_dcmnto, rta_imgn)
	Select 
				b.consecutivoSolicitud, a.cnsctvo_cdgo_dcmnto, a.rta_imgn
	From		tbImagenesxDocumentosDigitalizados a With (NoLock)
	Inner Join	#tempDatosXML b With (NoLock)
	On			a.cnsctvo_cdgo_dcmnto = b.consecutivoDocumento;				

	-- Realiza la consulta en tabla resultados
	Select		cnsctvo_slctd_srvco_sld_rcbda, cnsctvo_cdgo_dcmnto, rta_imgn
	From		#tempResultados With (NoLock); 

	-- Elimina las tablas temporales que no son necesarias 
	Drop Table	#tempDatosXML	
	Drop Table	#tempResultados

END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCTCConsultarRutaImagenesDocumentosDigitalizados] TO [ctc_webusr]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCTCConsultarRutaImagenesDocumentosDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCTCConsultarRutaImagenesDocumentosDigitalizados] TO [visosservice_role]
    AS [dbo];

