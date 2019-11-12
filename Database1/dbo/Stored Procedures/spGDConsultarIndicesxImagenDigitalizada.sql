
/*
-- =============================================
-- Author:		<sisogb01>
-- Create date: <16/04/2010>
-- Description:	<Consulta los Indices de una Imagen Anexo>
Exec spConsultaIndicesxImagenDigitalizada 800037659
-- =============================================
*/
CREATE PROCEDURE [dbo].[spGDConsultarIndicesxImagenDigitalizada]
	@cnsctvo_imgn udtConsecutivo	
AS
BEGIN
	SET NOCOUNT ON;
	/*Declare  @indices Table(
		cnsctvo_indce_dcmnto	Int,
		cnsctvo_cdgo_tpo_indce	Int,
		dscrpcn_tpo_indce		Varchar(300),
		vlr						Varchar(255)
	)*/

	Select		cnsctvo_indce_imgn_dgtlzda,a.cnsctvo_cdgo_tpo_indce,dscrpcn_tpo_indce,vlr
	From		(	SELECT	cnsctvo_indce_imgn_dgtlzda,cnsctvo_cdgo_tpo_indce,vlr
					From	BDGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas	With(NoLock)
					Where	cnsctvo_cdgo_imgn = @cnsctvo_imgn
				)										a
	Left Join	BDGestionDocumental.dbo.tbtiposIndices	b	With(NoLock)	On	(a.cnsctvo_cdgo_tpo_indce = b.cnsctvo_cdgo_tpo_indce)
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarIndicesxImagenDigitalizada] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarIndicesxImagenDigitalizada] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarIndicesxImagenDigitalizada] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarIndicesxImagenDigitalizada] TO [visosservice_role]
    AS [dbo];

