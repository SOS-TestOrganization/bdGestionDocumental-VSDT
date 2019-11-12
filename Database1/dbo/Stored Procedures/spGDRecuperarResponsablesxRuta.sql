
CREATE Procedure	[dbo].[spGDRecuperarResponsablesxRuta]
--Declare
	@cnsctvo_cdgo_fljo	udtConsecutivo,
	@cnsctvo_cdgo_rta	udtConsecutivo

As
Set Nocount On

/*
Set	@cnsctvo_cdgo_fljo	=	1
Set	@cnsctvo_cdgo_rta	=	1	
*/

Declare	@tbResponsables As Table
(
accn							Varchar(15),
dscrpcn_usro_rspnde				Varchar(100),
lgn_usro_rspnde					Varchar(30),
cnsctvo_cdgo_prcso_admnstrtvo	Int,
cnsctvo_cdgo_tpo_rspnsble		Int
)

Insert Into	@tbResponsables
Select		'NO SELECCIONADO' As accn,			u.dscrpcn_usro_rspnde,					u.lgn_usro_rspnde,
			0,									r.cnsctvo_cdgo_tpo_rspnsble
From		bdGestionDocumental.dbo.tbResponsablesRutasxFlujos	r
Inner Join	bdServicioCliente.dbo.tbUsuariosResponde_Vigencias	u	On	u.cnsctvo_cdgo_usro_rspnde		=	r.cnsctvo_cdgo_rspnsble
Inner Join	bdGestionDocumental.dbo.tbRutas						a	On	a.cnsctvo_cdgo_fljo				=	r.cnsctvo_cdgo_fljo
																	And	a.cnsctvo_cdgo_rta				=	r.cnsctvo_cdgo_rta
																	And	a.cnsctvo_cdgo_tpo_rspnsble		=	r.cnsctvo_cdgo_tpo_rspnsble
Where		r.cnsctvo_cdgo_fljo			=	@cnsctvo_cdgo_fljo
And			r.cnsctvo_cdgo_rta			=	@cnsctvo_cdgo_rta
And			r.vsble_usro				=	'S'

	If @@rowcount	= 0
		Begin
			Insert Into	@tbResponsables
			Select		'NO SELECCIONADO' As accn,					u.dscrpcn_prcso_admnstrtvo,					'',
						u.cnsctvo_cdgo_prcso_admnstrtvo,			r.cnsctvo_cdgo_tpo_rspnsble
			From		bdGestionDocumental.dbo.tbResponsablesRutasxFlujos			r
			Inner Join	bdGestionDocumental.dbo.tbProcesosAdministrativos_Vigencias	u	On	u.cnsctvo_cdgo_prcso_admnstrtvo		=	r.cnsctvo_cdgo_prcso_admnstrtvo
			Where		r.cnsctvo_cdgo_fljo			=	@cnsctvo_cdgo_fljo
			And			r.cnsctvo_cdgo_rta			=	@cnsctvo_cdgo_rta
			And			r.vsble_usro				=	'S'
		End

Select	*
From	@tbResponsables
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarResponsablesxRuta] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarResponsablesxRuta] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarResponsablesxRuta] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarResponsablesxRuta] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarResponsablesxRuta] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarResponsablesxRuta] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarResponsablesxRuta] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarResponsablesxRuta] TO [visosservice_role]
    AS [dbo];

