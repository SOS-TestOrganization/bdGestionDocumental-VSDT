CREATE PROCEDURE spGDGrabarAsociacionFlujoDocumento
@cnsctvo_cdgo_dcmnto	Int,
@cnsctvo_cdgo_fljo		Int,
@estdo					Int Output

As
Set Nocount On

Begin Transaction
	Update	bdGestionDocumental.dbo.tbImagenesIndexadas
	Set		cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo
	Where	cnsctvo_cdgo_imgn	=	@cnsctvo_cdgo_dcmnto

	If @@error <> 0
		Begin
			Set	@estdo = 1
			Rollback Transaction
		End
	Else
		Begin
			Set	@estdo = 0
			Commit Transaction
		End
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarAsociacionFlujoDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarAsociacionFlujoDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarAsociacionFlujoDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarAsociacionFlujoDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarAsociacionFlujoDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarAsociacionFlujoDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarAsociacionFlujoDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarAsociacionFlujoDocumento] TO [visosservice_role]
    AS [dbo];

