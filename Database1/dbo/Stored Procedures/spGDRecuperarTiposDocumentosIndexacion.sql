CREATE PROCEDURE dbo.spGDRecuperarTiposDocumentosIndexacion
As
Set Nocount On
  
Select  dscrpcn_tpo_dcmnto,  cnsctvo_cdgo_tpo_dcmnto,  cdgo_tpo_dcmnto,
		rta_tpo_dcmnto
From	bdGestionDocumental.dbo.tbTiposDocumento_Vigencias
Where	Getdate() >= inco_vgnca
And		Getdate() <= fn_vgnca
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumentosIndexacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumentosIndexacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumentosIndexacion] TO [visosservice_role]
    AS [dbo];

