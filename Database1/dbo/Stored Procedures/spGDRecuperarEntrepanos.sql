
CREATE PROCEDURE	[dbo].[spGDRecuperarEntrepanos]

As
Set Nocount On


Select		dscrpcn_entrpno,			cdgo_entrpno,			cnsctvo_cdgo_entrpno
From		bdGestionDocumental.dbo.tbEntrepanos




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarEntrepanos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarEntrepanos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarEntrepanos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarEntrepanos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarEntrepanos] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarEntrepanos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarEntrepanos] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarEntrepanos] TO [visosservice_role]
    AS [dbo];

