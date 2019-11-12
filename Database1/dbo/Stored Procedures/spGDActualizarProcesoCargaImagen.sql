





-- =============================================
-- Author:		<sisogb01>
-- Create date: <24/03/2009>
-- Description:	<....>
-- =============================================
CREATE PROCEDURE [dbo].[spGDActualizarProcesoCargaImagen]
(
	@cnsctvo_cdgo_prcso_crga_imgn udtConsecutivo,
	@cntdd_rgstrs_crgds udtConsecutivo,
	@estdo udtConsecutivo = 1,
	@dscrpcn_prcso_crga_imgn udtDescripcion = NULL,
	@var udtDescripcion = NULL,
	@fcha_crga_prvdr Datetime = NULL
)
AS
BEGIN
SET NOCOUNT ON;
UPDATE	[dbo].[tbProcesosCargaImagenes]
SET		[cdgo_prcso_crga_imgn]		=	'000'
       ,[dscrpcn_prcso_crga_imgn]	=	isNull(@dscrpcn_prcso_crga_imgn,dscrpcn_prcso_crga_imgn) + ' ' + isNull(@var,'')
       ,[usro_crcn]					=	'SSIS en ATENEA'
       ,[vsble_usro]				=	'S'
--       ,[cnsctvo_cdgo_dgtlzdr]	=	@cnsctvo_cdgo_dgtlzdr
--       ,[cnsctvo_cdgo_tpo_dcmnto]	=	@cnsctvo_cdgo_tpo_dcmnto
       ,[cntdd_rgstrs_crgds]		=	@cntdd_rgstrs_crgds
		,[estdo]					=	@estdo
		,fcha_fn_prcso				=	getDate()
		,nmbre_archvo_indce			=	@var
		,fcha_crga_prvdr			=	@fcha_crga_prvdr
WHERE	cnsctvo_cdgo_prcso_crga_imgn	=	 @cnsctvo_cdgo_prcso_crga_imgn
END







GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarProcesoCargaImagen] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarProcesoCargaImagen] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarProcesoCargaImagen] TO [visosservice_role]
    AS [dbo];

