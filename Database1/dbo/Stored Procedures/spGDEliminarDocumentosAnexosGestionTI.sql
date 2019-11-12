

CREATE Procedure	[dbo].[spGDEliminarDocumentosAnexosGestionTI]
@cnsctvo_cdgo_dcmnto	Int,
@cnsctvo_cdgo_imgn		Int

As
Set NoCount On


Update		tbImagenesxDocumentosDigitalizados
Set			estdo					=	'I'
Where		cnsctvo_cdgo_dcmnto		=	@cnsctvo_cdgo_dcmnto
And			cnsctvo_cdgo_imgn		=	@cnsctvo_cdgo_imgn



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosGestionTI] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosGestionTI] TO [Administrador Gestion IT]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosGestionTI] TO [Analista Gestion IT]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosGestionTI] TO [Administrador Planeacion Gestion IT]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosGestionTI] TO [Administrador Red Gestion IT]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosGestionTI] TO [Administrador Juridico Gestion IT]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosGestionTI] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosGestionTI] TO [visosservice_role]
    AS [dbo];

