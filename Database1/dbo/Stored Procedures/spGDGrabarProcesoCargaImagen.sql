

-- =============================================
-- Author:		<sisogb01>
-- Create date: <20/03/2009>
-- Description:	<....>
-- =============================================
CREATE PROCEDURE [dbo].[spGDGrabarProcesoCargaImagen]
(
	@cnsctvo_cdgo_prcso_crga_imgn udtConsecutivo output,
	@cnsctvo_cdgo_dgtlzdr udtConsecutivo,
	@cnsctvo_cdgo_tpo_dcmnto udtConsecutivo,
	@dscrpcn_prcso_crga_imgn udtDescripcion
)
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO [bdGestionDocumental].[dbo].[tbProcesosCargaImagenes]
           ([cdgo_prcso_crga_imgn]
           ,[dscrpcn_prcso_crga_imgn]
           ,[usro_crcn]
           ,[vsble_usro]
           ,[cnsctvo_cdgo_dgtlzdr]
           ,[cnsctvo_cdgo_tpo_dcmnto]
--           ,[cntdd_rgstrs_crgds]
--           ,[estdo]
)
     VALUES
           ('000'
           ,@dscrpcn_prcso_crga_imgn
           ,'SSIS en ' + HOST_NAME()
           ,'S'
           ,@cnsctvo_cdgo_dgtlzdr
           ,@cnsctvo_cdgo_tpo_dcmnto
--           ,@cntdd_rgstrs_crgds
--           ,@estdo
)

SET @cnsctvo_cdgo_prcso_crga_imgn = @@IDENTITY

END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarProcesoCargaImagen] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarProcesoCargaImagen] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarProcesoCargaImagen] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarProcesoCargaImagen] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarProcesoCargaImagen] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarProcesoCargaImagen] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarProcesoCargaImagen] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarProcesoCargaImagen] TO [visosservice_role]
    AS [dbo];

