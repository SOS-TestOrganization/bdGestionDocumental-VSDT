CREATE Procedure [dbo].[spCARecuperarTiposDocumento]
As  
Set Nocount On  
  
Select		Upper(dscrpcn_tpo_dcmnto) As dscrpcn_tpo_dcmnto,		cdgo_tpo_dcmnto,		cnsctvo_cdgo_tpo_dcmnto,		rta_tpo_dcmnto
From		bdGestionDocumental.dbo.tbTiposDocumento_Vigencias
Where		Getdate()	>=	inco_vgnca
And			Getdate()	<=	fn_vgnca
And			vsble_usro	=	'S'
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCARecuperarTiposDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCARecuperarTiposDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCARecuperarTiposDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCARecuperarTiposDocumento] TO [visosservice_role]
    AS [dbo];

