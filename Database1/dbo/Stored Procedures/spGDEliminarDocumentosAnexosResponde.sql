
CREATE Procedure	[dbo].[spGDEliminarDocumentosAnexosResponde]
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
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosResponde] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosResponde] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosResponde] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosResponde] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosResponde] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosResponde] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosResponde] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosResponde] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosResponde] TO [Autorizador Validacion Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosResponde] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosResponde] TO [visosservice_role]
    AS [dbo];

