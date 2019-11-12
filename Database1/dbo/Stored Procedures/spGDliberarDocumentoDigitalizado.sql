

/*----------------------------------------------------------------------------------------------------------------- 
* Procedimiento		: [spGDliberarDocumentoDigitalizado]
* Desarrollado por	: <\A Andres Taborda  	A\> 
* Descripción		: <\D Libera el documento digitalizado si hay un error en la copia		D\> 
* Observaciones		: <\O        					O\>        
* Parámetros		: <\P           				P\>        
* Variables 		: <\V           				V\>        
* Fecha Creación	: <\FC 20130829			FC\>        
*        
*------------------------------------------------------------------------------------------------------------------
* DATOS DE MODIFICACION         
*------------------------------------------------------------------------------------------------------------------
* Modificado Por	: <\AM   AM\>        
* Descripción		: <\DM  DM\>        
* Nuevos Parámetros	: <\PM  PM\>        
* Nuevas Variables	: <\VM  VM\>        
* Fecha Modificación	: <\FM FM\>     
*------------------------------------------------------------------------------------------------------------------
*/        
--
--exec spGDliberarDocumentoDigitalizado 
CREATE procedure [dbo].[spGDliberarDocumentoDigitalizado]       
	@cnsctvo_cdgo_imgn			udtConsecutivo,
	@cnsctvo_dcmnto					udtConsecutivo


	

As        

SET NOCOUNT ON



--borrar documentos digitalizados que no se pueden copiar

delete bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
where cnsctvo_cdgo_imgn= @cnsctvo_cdgo_imgn
and cnsctvo_cdgo_dcmnto=@cnsctvo_dcmnto



delete bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
where cnsctvo_cdgo_imgn= @cnsctvo_cdgo_imgn
and cnsctvo_cdgo_dcmnto=@cnsctvo_dcmnto

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDliberarDocumentoDigitalizado] TO [Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDliberarDocumentoDigitalizado] TO [Auditor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDliberarDocumentoDigitalizado] TO [310018 Auditor Salud Central]
    AS [dbo];

