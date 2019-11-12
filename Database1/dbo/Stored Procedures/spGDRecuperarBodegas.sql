CREATE PROCEDURE	spGDRecuperarBodegas

As
Set Nocount On


Select		dscrpcn_bdga,			cdgo_bdga,			cnsctvo_cdgo_bdga
From		bdGestionDocumental.dbo.tbBodegas



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarBodegas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarBodegas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarBodegas] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarBodegas] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarBodegas] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarBodegas] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarBodegas] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarBodegas] TO [visosservice_role]
    AS [dbo];

