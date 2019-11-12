

CREATE Procedure [dbo].[spGDCalcularIteracionxFlujoDocumento]
@cnsctvo_cdgo_fljo		Int,
@cnsctvo_cdgo_dcmnto	Int,
@usro_crcn				udtUsuario,
@nmro_idntfccn			Varchar(20),
@cnsctvo_cdgo_itrcn		Int	Output,
@ttl_itrcns				Int	Output,
@lnestdo				Int	Output

As
Set Nocount On

Declare	@cnsctvo_cdgo_fljo_pr_dcmnto	Int,
		@fcha_crcn						Datetime,
		@vsble_usro						Char(1)

Set		@fcha_crcn	=	Getdate()
Set		@vsble_usro	=	'S'
Set		@lnestdo	=	0

Select	@ttl_itrcns	=	nmro_itrcns
From	tbFlujos_Vigencias
Where	cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo

If Exists	(	Select	1
				From	tbFlujosxDocumentos
				Where	cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo
				And		cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
			)
	Begin
		Select	@cnsctvo_cdgo_fljo_pr_dcmnto	=	cnsctvo_cdgo_fljo_pr_dcmnto
		From	tbFlujosxDocumentos
		Where	cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo
		And		cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
		And		vsble_usro			=	'S'

		-- Si el flujo ya ha sido acotado, toma el ultimo registro para mostrar gestion
		If @cnsctvo_cdgo_fljo_pr_dcmnto Is Null
			Begin
				Set	@lnestdo = 1
				Select	@cnsctvo_cdgo_itrcn	=	@ttl_itrcns
			End		
		Else
			Begin
				Select	@cnsctvo_cdgo_itrcn	=	Max(cnsctvo_cdgo_itrcn)
				From	tbIteracionesxFlujoDocumentos
				Where	cnsctvo_cdgo_fljo_pr_dcmnto	=	@cnsctvo_cdgo_fljo_pr_dcmnto
				And		vsble_usro					=	'S'
				
				If	@cnsctvo_cdgo_itrcn Is Null
					Set	@cnsctvo_cdgo_itrcn	=	0
			End
	End
Else
	Begin
		Insert Into	tbFlujosxDocumentos	
		Values
		(
			@cnsctvo_cdgo_fljo,
			@cnsctvo_cdgo_dcmnto,
			@fcha_crcn,
			@usro_crcn,
			@vsble_usro,
			@nmro_idntfccn
		)
		Set	@cnsctvo_cdgo_itrcn	=	0
	End










GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularIteracionxFlujoDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularIteracionxFlujoDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularIteracionxFlujoDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularIteracionxFlujoDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularIteracionxFlujoDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularIteracionxFlujoDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularIteracionxFlujoDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularIteracionxFlujoDocumento] TO [visosservice_role]
    AS [dbo];

