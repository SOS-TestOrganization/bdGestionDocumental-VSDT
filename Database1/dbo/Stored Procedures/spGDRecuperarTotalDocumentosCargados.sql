/*---------------------------------------------------------------------------------------------------------------------------                                       
* Procedimiento		:  dbo.spGDRecuperarTotalDocumentosCargados                                       
* Desarrollado por  : \A Ing. Cesar García   A\                                       
* Descripción		: \D valida indices  D\                                       
* Observaciones		: \O      O\                                       
* Parámetros		: \P  P\                                       
* Variables			: \V      V\                                       
* Fecha Creación	: \FC 2009/07/10  FC\                                       
*                                       
*----------------------------------------------------------------------------------------------------------------------------                                       
* DATOS DE MODIFICACION                                        
*----------------------------------------------------------------------------------------------------------------------------                                       
* Modificado Por	: \AM Ing. Cesar García   AM\                                       
* Descripción		: \DM Se adiciona ejecución de sp para eliminar registros temporales utilizados en el proceso de carga  DM\                                       
* Nuevos Parámetros : \PM  PM\                                       
* Nuevas Variables  : \VM  VM\                                       
* Fecha Modificación: \FM 2012-07-21  FM\                                       
*----------------------------------------------------------------------------------------------------------------------------
*/   
CREATE Procedure [dbo].[spGDRecuperarTotalDocumentosCargados]
@cnsctvo_cdgo_prcso_crga_imgn	Int,
@ttl_imgns_crgds				Int		Output

As
Set NoCount On

Select		@ttl_imgns_crgds	=	Count(a.cnsctvo_cdgo_dcmnto)
From		tbimagenesxdocumentosdigitalizados	a
Inner Join	tbDocumentosDigitalizados			b	On	b.cnsctvo_cdgo_dcmnto = a.cnsctvo_cdgo_dcmnto
Where		b.cnsctvo_prcso_crga =	@cnsctvo_cdgo_prcso_crga_imgn

EXEC spGDEliminarRegistrosArchivosIndices @cnsctvo_cdgo_prcso_crga_imgn


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTotalDocumentosCargados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTotalDocumentosCargados] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];

