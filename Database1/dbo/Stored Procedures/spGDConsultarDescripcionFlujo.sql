CREATE Procedure [dbo].[spGDConsultarDescripcionFlujo]
@cnsctvo_cdgo_fljo	Int,
@dscrpcn_fljo		Varchar(150) Output

As
Set Nocount On

Select		@dscrpcn_fljo	=	Ltrim(Rtrim(dscrpcn_fljo))
From		dbo.tbFlujos_Vigencias
Where		cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo
And			Getdate()	>= inco_vgnca
And			Getdate()	<= fn_vgnca
And			vsble_usro = 'S'


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDescripcionFlujo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDescripcionFlujo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDescripcionFlujo] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDescripcionFlujo] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDescripcionFlujo] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDescripcionFlujo] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDescripcionFlujo] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDescripcionFlujo] TO [visosservice_role]
    AS [dbo];

