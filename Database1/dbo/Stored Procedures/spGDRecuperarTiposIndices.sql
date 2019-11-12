

CREATE Procedure [dbo].[spGDRecuperarTiposIndices]
As
Set Nocount On

Select		dscrpcn_tpo_indce,		cdgo_indce,			cnsctvo_cdgo_tpo_indce
From		bdGestionDocumental.dbo.tbTiposIndices
Where		vsble_usro	=	'S'


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIndices] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIndices] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIndices] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIndices] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIndices] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIndices] TO [visosservice_role]
    AS [dbo];

