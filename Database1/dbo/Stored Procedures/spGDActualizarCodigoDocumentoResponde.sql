

CREATE Procedure	[dbo].[spGDActualizarCodigoDocumentoResponde]
@cnsctvo_archvo_dcmnto		Varchar(10),
@cnsctvo_cdgo_nmro_rdccn	Int

As
Set Nocount On

Update		bdGestionDocumental.dbo.tbDocumentos
Set			cdgo_dcmnto	=	@cnsctvo_archvo_dcmnto
Where		cnsctvo_cdgo_nmro_rdccn	=	@cnsctvo_cdgo_nmro_rdccn

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarCodigoDocumentoResponde] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarCodigoDocumentoResponde] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarCodigoDocumentoResponde] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarCodigoDocumentoResponde] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarCodigoDocumentoResponde] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarCodigoDocumentoResponde] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarCodigoDocumentoResponde] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarCodigoDocumentoResponde] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarCodigoDocumentoResponde] TO [Autorizador Validacion Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarCodigoDocumentoResponde] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarCodigoDocumentoResponde] TO [visosservice_role]
    AS [dbo];

