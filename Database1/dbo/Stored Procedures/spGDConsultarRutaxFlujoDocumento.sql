

CREATE Procedure	[dbo].[spGDConsultarRutaxFlujoDocumento]
@cnsctvo_cdgo_fljo		Int,
@cnsctvo_cdgo_dcmnto	Int,
@cnsctvo_cdgo_rta		Int

As
Set Nocount On

Declare	@tmprutas As Table
(
cnsctvo_cdgo_fljo		Int,
cnsctvo_cdgo_rta		Int
)

If	@cnsctvo_cdgo_rta	= 0
	Begin
		Insert Into	@tmprutas
		Select		rf.cnsctvo_cdgo_fljo,		rf.cnsctvo_cdgo_rta
		From		tbRutasxFlujosDocumentos	rf
		Inner Join	tbRutas						r	On	r.cnsctvo_cdgo_rta	=	rf.cnsctvo_cdgo_rta
		Where		rf.cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo
		And			rf.cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
		And			rf.vsble_usro			=	'S'
		And			r.cnsctvo_cdgo_pso_fnl <> 99999

			If @@rowcount = 0
				Select @cnsctvo_cdgo_fljo As cnsctvo_cdgo_fljo, 0 as cnsctvo_cdgo_rta
			Else
				Select cnsctvo_cdgo_fljo, cnsctvo_cdgo_rta From @tmprutas
	End

If	@cnsctvo_cdgo_rta	<> 0
	Begin
		Insert Into	@tmprutas
		Select		rf.cnsctvo_cdgo_fljo,		rf.cnsctvo_cdgo_rta
		From		tbRutasxFlujosDocumentos	rf
		Inner Join	tbRutas						r	On	r.cnsctvo_cdgo_rta	=	rf.cnsctvo_cdgo_rta
		Where		rf.cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo
		And			rf.cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
		And			rf.cnsctvo_cdgo_rta		=	@cnsctvo_cdgo_rta
		And			rf.vsble_usro			=	'S'
		And			r.cnsctvo_cdgo_pso_fnl <> 99999

			If @@rowcount = 0
				Select @cnsctvo_cdgo_fljo As cnsctvo_cdgo_fljo, 0 as cnsctvo_cdgo_rta
			Else
				Select cnsctvo_cdgo_fljo, cnsctvo_cdgo_rta From @tmprutas
	End

	

/*
Insert Into	@tmprutas
Select		cnsctvo_cdgo_fljo, cnsctvo_cdgo_rta
From		tbRutasxFlujosDocumentos
Where		cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo
And			cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
And			vsble_usro			=	'S'
*/



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRutaxFlujoDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRutaxFlujoDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRutaxFlujoDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRutaxFlujoDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRutaxFlujoDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRutaxFlujoDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRutaxFlujoDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRutaxFlujoDocumento] TO [visosservice_role]
    AS [dbo];

