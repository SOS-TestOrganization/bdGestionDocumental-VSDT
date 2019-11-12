CREATE PROCEDURE	spGDRecuperarEstanterias

As
Set Nocount On


Select		dscrpcn_estntra,			cdgo_estntra,			cnsctvo_cdgo_estntra
From		bdGestionDocumental.dbo.tbEstanterias



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarEstanterias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarEstanterias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarEstanterias] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarEstanterias] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarEstanterias] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarEstanterias] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarEstanterias] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarEstanterias] TO [visosservice_role]
    AS [dbo];

