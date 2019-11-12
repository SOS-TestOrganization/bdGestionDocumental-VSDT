
create Procedure	[dbo].[spGDEliminarDocumentosAnexosEP]
@cnsctvo_cdgo_dcmnto	Int,
@cnsctvo_cdgo_imgn		Int

As
Set NoCount On


Update		tbImagenesxDocumentosDigitalizados
Set			estdo		=	'I'
Where		cnsctvo_cdgo_dcmnto		=	@cnsctvo_cdgo_dcmnto
And			cnsctvo_cdgo_imgn		=	@cnsctvo_cdgo_imgn


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosEP] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosEP] TO [Consultor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosEP] TO [Auxiliar Sipres Analista Notificaciones]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosEP] TO [Auxiliar de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosEP] TO [Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosEP] TO [Validador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosEP] TO [Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosEP] TO [Auditor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosEP] TO [Autorizadora Notificacion]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosEP] TO [Auditoria Interna Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosEP] TO [Auxiliar Prestaciones Medicas y Validacion de Derechos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosEP] TO [Administrador Notificaciones Atep SOA]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosEP] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosEP] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentosAnexosEP] TO [visosservice_role]
    AS [dbo];

