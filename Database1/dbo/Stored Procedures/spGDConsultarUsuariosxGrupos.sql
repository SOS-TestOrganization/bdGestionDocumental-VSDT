CREATE Procedure spGDConsultarUsuariosxGrupos
@cnsctvo_cdgo_fljo			Int,
@cnsctvo_cdgo_rta			Int,
@cnsctvo_cdgo_tpo_rspnsble	Int

As
Set Nocount On

Select		Ltrim(Rtrim(u.lgn_usro_rspnde)) As usro_rspnsble,		Ltrim(Rtrim(u.eml_usro_rspnde)) As eml_rspnsble
From		bdGestionDocumental.dbo.tbResponsablesRutasxFlujos		r
Inner Join	dbo.tbResponsablesxProcesosAdministrativos				rp	On	rp.cnsctvo_cdgo_prcso_admnstrtvo	=	r.cnsctvo_cdgo_prcso_admnstrtvo
Inner Join	bdServicioCliente.dbo.tbUsuariosResponde_Vigencias		u	On	u.cnsctvo_cdgo_usro_rspnde			=	rp.cnsctvo_cdgo_rspnsble
Where		r.cnsctvo_cdgo_fljo			=	@cnsctvo_cdgo_fljo
And			r.cnsctvo_cdgo_rta			=	@cnsctvo_cdgo_rta
And			r.cnsctvo_cdgo_tpo_rspnsble	=	@cnsctvo_cdgo_tpo_rspnsble
And			Getdate()					>=	u.inco_vgnca
And			Getdate()					<=	u.fn_vgnca
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarUsuariosxGrupos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarUsuariosxGrupos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarUsuariosxGrupos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarUsuariosxGrupos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarUsuariosxGrupos] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarUsuariosxGrupos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarUsuariosxGrupos] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarUsuariosxGrupos] TO [visosservice_role]
    AS [dbo];

