-- =============================================
-- Author:		<sisogb01>
-- Create date: <25/03/2009>
-- Description:	<....>
-- =============================================
CREATE PROCEDURE dbo.spGDGrabarLogProcesosCargaImagen(
		   @cdgo_lg char(4),
           @cnsctvo_cdgo_prcso_crga_imgn udtConsecutivo,
           @dscrpcn_lg udtDescripcion,
           @dto udtDescripcion,
           @orgn_dto udtDescripcion,
           @idntfcdr_dto udtDescripcion,
           @cnsctvo_cdgo_tpo_errr udtConsecutivo
)
AS
BEGIN
SET NOCOUNT ON;

	INSERT INTO [bdGestionDocumental].[dbo].[tbLogProcesosCargaImagenes]
    (		[cdgo_lg]
           ,[cnsctvo_cdgo_prcso_crga_imgn]  ,[dscrpcn_lg]          ,[dto]
           ,[orgn_dto]						,[idntfcdr_dto]        ,[cnsctvo_cdgo_tpo_errr]
	)
     VALUES (
			@cdgo_lg
           ,@cnsctvo_cdgo_prcso_crga_imgn   ,@dscrpcn_lg           ,@dto
           ,@orgn_dto						,@idntfcdr_dto         ,@cnsctvo_cdgo_tpo_errr
	)
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarLogProcesosCargaImagen] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarLogProcesosCargaImagen] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarLogProcesosCargaImagen] TO [visosservice_role]
    AS [dbo];

