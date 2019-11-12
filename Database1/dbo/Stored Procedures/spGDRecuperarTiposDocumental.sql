
CREATE Procedure [dbo].[spGDRecuperarTiposDocumental]

As
Set Nocount On


Select		dscrpcn_tpo_dcmntl,		cdgo_tpo_dcmntl,		cnsctvo_cdgo_tpo_dcmntl
From		tbTiposDocumental_Vigencias
Where		Getdate()	>=	inco_vgnca
And			Getdate()	<=	fn_vgnca
And			vsble_usro	=	'S'


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumental] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumental] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumental] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumental] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumental] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumental] TO [visosservice_role]
    AS [dbo];

