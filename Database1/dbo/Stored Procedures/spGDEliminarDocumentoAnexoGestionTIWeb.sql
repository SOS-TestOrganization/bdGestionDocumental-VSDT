/*---------------------------------------------------------------------------------
* Metodo o PRG:			spGDEliminarDocumentoAnexoGestionTIWeb
* Desarrollado por:		<\A	Jorge Marcos Rincón Ardila	A\>
* Descripcion:			<\D	Elimina un Documento por el Portal Web	D\>
* Parametros:			<\P   	P\>
* Fecha Creacion:		<\FC	26/01/2011	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:			<\AM		AM\>
* Descripcion:				<\DM		DM\>
* Nuevos Parametros:		<\PM		PM\>
* Fecha Modificacion:		<\FM		FM\>
*---------------------------------------------------------------------------------*/
--exec spGDEliminarDocumentoAnexoGestionTIWeb '2008-001-015994', null
CREATE PROCEDURE [dbo].[spGDEliminarDocumentoAnexoGestionTIWeb] 
/* 1 */	@cdgo_cntcto			varchar(20), 
/* 2 */	@error							varchar(10) output
AS
BEGIN
	SET NOCOUNT ON;
	
	--Se settea la variable @error en '0'
	Set @error = '0'
	
	Select	cnsctvo_cdgo_dcmnto
	Into	#tmpConsCodigoDoc
	From	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
	Where	cnsctvo_cdgo_tpo_indce		=	24
	And		vlr							=	@cdgo_cntcto
	
	Begin Transaction
		
		Delete tbIndicesxDocumentosDigitalizados From tbIndicesxDocumentosDigitalizados a
		Inner Join #tmpConsCodigoDoc b On (b.cnsctvo_cdgo_dcmnto = a.cnsctvo_cdgo_dcmnto)

		Delete tbIndicesxImagenesDigitalizadas From tbIndicesxImagenesDigitalizadas a
		Inner Join #tmpConsCodigoDoc b On (b.cnsctvo_cdgo_dcmnto = a.cnsctvo_cdgo_dcmnto)

		Delete tbImagenesxDocumentosDigitalizados From	tbImagenesxDocumentosDigitalizados a
		Inner Join #tmpConsCodigoDoc b On (b.cnsctvo_cdgo_dcmnto = a.cnsctvo_cdgo_dcmnto)

		Delete tbDocumentosDigitalizados From	tbDocumentosDigitalizados a
		Inner Join #tmpConsCodigoDoc b On (b.cnsctvo_cdgo_dcmnto = a.cnsctvo_cdgo_dcmnto)
		
		If @@Error <> 0
			Begin
				Set @error = '1'
				Rollback Transaction
				Return -1
			End
		else
			Begin
				Commit Transaction
			End
END




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentoAnexoGestionTIWeb] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentoAnexoGestionTIWeb] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentoAnexoGestionTIWeb] TO [quick_webusr]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentoAnexoGestionTIWeb] TO [visosservice_role]
    AS [dbo];

