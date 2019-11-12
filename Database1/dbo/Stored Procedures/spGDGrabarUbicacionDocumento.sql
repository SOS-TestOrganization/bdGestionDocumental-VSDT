
CREATE Procedure [dbo].[spGDGrabarUbicacionDocumento]
@cnsctvo_cdgo_dcmnto		Int,
@cnsctvo_cdgo_fljo			Int,
@cnsctvo_cdgo_rta			Int,
@cnsctvo_cdgo_bdga			Int,
@cnsctvo_cdgo_estntra		Int,
@cnsctvo_cdgo_entrpno		Int,
@cnsctvo_cdgo_cja			Int,
@cnsctvo_cdgo_blsa			Int,
@usro_crcn					Varchar(15),
@estdo						Int	Output

As
Set Nocount On

Declare	@fcha_crcn		Datetime
Set		@fcha_crcn	=	Getdate()

If Exists	(	Select		1
				From		bdGestionDocumental.dbo.tbUbicacionDocumentosDigitalizados
				Where		cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
			)
	Set		@estdo	=	2
Else
	Begin
		Begin Transaction
			Insert Into	bdGestionDocumental.dbo.tbUbicacionDocumentosDigitalizados
			Values		(	@cnsctvo_cdgo_dcmnto,		@cnsctvo_cdgo_fljo,		@cnsctvo_cdgo_rta,		@cnsctvo_cdgo_bdga,
							@cnsctvo_cdgo_estntra,		@cnsctvo_cdgo_entrpno,	@cnsctvo_cdgo_cja,		@cnsctvo_cdgo_blsa,
							@fcha_crcn,					@usro_crcn
						)

				If @@error <> 0
					Begin
						Rollback Transaction
						Set	@estdo = 1
					End
				Else
					Begin
						Commit Transaction
						Set	@estdo = 0
					End
	End

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarUbicacionDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarUbicacionDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarUbicacionDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarUbicacionDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarUbicacionDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarUbicacionDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarUbicacionDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarUbicacionDocumento] TO [visosservice_role]
    AS [dbo];

