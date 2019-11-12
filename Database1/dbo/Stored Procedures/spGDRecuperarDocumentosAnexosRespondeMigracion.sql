Create Procedure	spGDRecuperarDocumentosAnexosRespondeMigracion
As
Set Nocount On

Select		*
From		tbDocumentosAnexosResponde
Order By	cnsctvo_cdgo_dcmnto
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosRespondeMigracion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosRespondeMigracion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosRespondeMigracion] TO [visosservice_role]
    AS [dbo];

