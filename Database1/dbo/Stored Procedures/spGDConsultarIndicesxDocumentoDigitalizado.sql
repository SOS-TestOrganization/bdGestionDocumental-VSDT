
-- =============================================
-- Author:		<sisogb01>
-- Create date: <16/04/2010>
-- Description:	<Consulta los Indices de un Documento>
-- =============================================
CREATE PROCEDURE [dbo].[spGDConsultarIndicesxDocumentoDigitalizado]
	@cnsctvo_dcmnto udtConsecutivo	
AS
BEGIN
	SET NOCOUNT ON;
/*Declare  @indices Table(
	cnsctvo_indce_dcmnto	Int,
	cnsctvo_cdgo_tpo_indce	Int,
	dscrpcn_tpo_indce		Varchar(300),
	vlr						Varchar(255)
)*/

	Select		cnsctvo_indce_dcmnto,a.cnsctvo_cdgo_tpo_indce,dscrpcn_tpo_indce,vlr
	From		(	SELECT		cnsctvo_indce_dcmnto,cnsctvo_cdgo_tpo_indce,vlr
					From		BDGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	With(NoLock)
					Where		cnsctvo_cdgo_dcmnto = @cnsctvo_dcmnto
				)										a
	Left Join	BDGestionDocumental.dbo.tbtiposIndices	b	With(NoLock)	On	(a.cnsctvo_cdgo_tpo_indce = b.cnsctvo_cdgo_tpo_indce)
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarIndicesxDocumentoDigitalizado] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarIndicesxDocumentoDigitalizado] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarIndicesxDocumentoDigitalizado] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarIndicesxDocumentoDigitalizado] TO [visosservice_role]
    AS [dbo];

