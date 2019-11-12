
-- =============================================
-- Author:		<sisogb01>
-- Create date: <16/04/2010>
-- Description:	<Consulta el concecutivo del tipo documental al que pertenec un tipo de documento>
-- =============================================
CREATE FUNCTION [dbo].[fnGDCalcularTipoDocumentalxTipoDocumento]
(
	@cnsctvo_tpo_dcmnto udtConsecutivo
)
RETURNS int
AS
BEGIN
	Declare @cnsctvo_tpo_dcmtl udtConsecutivo
	Select	@cnsctvo_tpo_dcmtl = cnsctvo_agrpdr_tpo_dcmntl
	From	dbo.tbTiposDocumento
	Where	cnsctvo_cdgo_tpo_dcmnto = @cnsctvo_tpo_dcmnto 

	RETURN  @cnsctvo_tpo_dcmtl

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnGDCalcularTipoDocumentalxTipoDocumento] TO [Gestion Documental Web]
    AS [dbo];

