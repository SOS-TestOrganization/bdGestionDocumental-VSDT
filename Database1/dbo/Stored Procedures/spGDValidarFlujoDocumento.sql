Create Procedure	spGDValidarFlujoDocumento
@cnsctvo_cdgo_dcmnto	udtConsecutivo,
@cnsctvo_cdgo_fljo		Int	Output

As
Set Nocount On

If Exists	(	Select	1
				From	tbFlujosxDocumentos
				Where	cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
				And		vsble_usro			=	'S'
			)
	Begin
		Select	@cnsctvo_cdgo_fljo	=	cnsctvo_cdgo_fljo
		From	tbFlujosxDocumentos
		Where	cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
		And		vsble_usro			=	'S'
	End
Else
	Set	@cnsctvo_cdgo_fljo	=	0
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDValidarFlujoDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDValidarFlujoDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDValidarFlujoDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDValidarFlujoDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDValidarFlujoDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDValidarFlujoDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDValidarFlujoDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDValidarFlujoDocumento] TO [visosservice_role]
    AS [dbo];

