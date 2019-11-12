
CREATE PROCEDURE [dbo].[spGDRecuperarTiposFlujo]

As
Set Nocount On

Select		cnsctvo_cdgo_tpo_fljo,		cdgo_tpo_fljo,		dscrpcn_tpo_fljo
From		dbo.tbTiposFlujo_Vigencias
Where		Getdate()	>=	inco_vgnca
And			Getdate()	<=	fn_vgnca
And			cnsctvo_cdgo_tpo_fljo	=	1	-- Condición adicionada para prueba

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposFlujo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposFlujo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposFlujo] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposFlujo] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposFlujo] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposFlujo] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposFlujo] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposFlujo] TO [visosservice_role]
    AS [dbo];

