CREATE PROCEDURE spGDRecuperarFlujos

As
Set Nocount On

Select		dscrpcn_fljo,		cdgo_fljo,		cnsctvo_cdgo_fljo
From		bdGestionDocumental.dbo.tbFlujos_Vigencias
Where		Getdate()	>=	inco_vgnca
And			Getdate()	<=	fn_vgnca
And			vsble_usro	=	'S'

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarFlujos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarFlujos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarFlujos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarFlujos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarFlujos] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarFlujos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarFlujos] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarFlujos] TO [visosservice_role]
    AS [dbo];

