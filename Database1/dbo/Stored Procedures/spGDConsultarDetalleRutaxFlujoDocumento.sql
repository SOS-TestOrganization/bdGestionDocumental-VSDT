






CREATE Procedure	[dbo].[spGDConsultarDetalleRutaxFlujoDocumento]
--Declare
@cnsctvo_cdgo_fljo			udtConsecutivo,
@cnsctvo_cdgo_rta			udtConsecutivo,
@cnsctvo_cdgo_opcn			udtConsecutivo

As
Set Nocount On

/*
Set @cnsctvo_cdgo_fljo	= 1
Set @cnsctvo_cdgo_rta	= 2
Set @cnsctvo_cdgo_opcn	= 1
*/
Declare	@tbinforuta As Table
(
	accn						Varchar(15),
	cnsctvo_cdgo_fljo			Int,
	dscrpcn_fljo				Varchar(150),
	cnsctvo_cdgo_rta			Int,
	cdgo_rta					Char(4),
	dscrpcn_rta					Varchar(250),
	cnsctvo_cdgo_pso_incl		Int,
	cnsctvo_cdgo_pso_fnl		Int,
	cnsctvo_cdgo_cndcn			Int,
	dscrpcn_pso_incl			Varchar(250),		
	dscrpcn_pso_fnl				Varchar(250),
	cmpo_cndcn1					Varchar(150),
	oprdr_cndcn					Varchar(250),
	vlr_1						Varchar(250),
	cdgo_pso_incl				Char(4),
	cdgo_pso_fnl				Char(4),
	dscrpcn_obsrvcn				Varchar(250),
	usro_rspnsble				Varchar(100),
	cnsctvo_cdgo_tpo_rspnsble	Int,
	cmpo_cndcn2					Varchar(150),
	almcnr_dcmnto				Int,
	envo_ntfccn					Int
)

Declare	@mxmo_cnsctvo_rta		Int,
		@cnsctvo_cdgo_pso_incl	Int,
		@cnsctvo_cdgo_pso_fnl	Int

If @cnsctvo_cdgo_opcn = 1
	Begin
		Select		@cnsctvo_cdgo_pso_incl	=	cnsctvo_cdgo_pso_incl
		From		tbrutas
		Where		cnsctvo_cdgo_rta		=	@cnsctvo_cdgo_rta
		And			cnsctvo_cdgo_fljo		=	@cnsctvo_cdgo_fljo

		Select		@cnsctvo_cdgo_pso_fnl	=	cnsctvo_cdgo_pso_fnl
		From		tbrutas
		Where		cnsctvo_cdgo_rta		=	@cnsctvo_cdgo_rta
		And			cnsctvo_cdgo_fljo		=	@cnsctvo_cdgo_fljo

--		If @cnsctvo_cdgo_pso_incl	<	@cnsctvo_cdgo_pso_fnl
--			Begin
				Insert Into	@tbinforuta
				Select		'NO SELECCIONADO',			f.cnsctvo_cdgo_fljo,		f.nmbre_fljo,					r.cnsctvo_cdgo_rta,
							r.cdgo_rta,					r.dscrpcn_rta,				r.cnsctvo_cdgo_pso_incl,		r.cnsctvo_cdgo_pso_fnl,
							r.cnsctvo_cdgo_cndcn,		p.nmbre,					'',								d.cmpo_cndcn1,
							d.oprdr_cndcn,				d.vlr_1,					p.cdgo_pso,						'',
							'',							'',							r.cnsctvo_cdgo_tpo_rspnsble,	d.cmpo_cndcn2,
							r.almcnr_dcmnto,			r.envo_ntfccn
				From		dbo.tbRutas					r
				Inner Join	dbo.tbFlujos_Vigencias		f		On	f.cnsctvo_cdgo_fljo		=	r.cnsctvo_cdgo_fljo
				Inner Join	dbo.tbPasos					p		On	p.cnsctvo_cdgo_pso		=	r.cnsctvo_cdgo_pso_incl
				Inner Join	dbo.tbCondiciones			c		On	c.cnsctvo_cdgo_cndcn	=	r.cnsctvo_cdgo_cndcn
				Inner Join	dbo.tbDetalleCondiciones	d		On	d.cnsctvo_cdgo_cndcn	=	c.cnsctvo_cdgo_cndcn
				Where		f.cnsctvo_cdgo_fljo		=	@cnsctvo_cdgo_fljo
				And			r.cnsctvo_cdgo_rta		=	@cnsctvo_cdgo_rta
				And			r.cnsctvo_cdgo_pso_fnl	!=	99999

				Update		@tbinforuta
				Set			dscrpcn_pso_fnl	=	p.nmbre,
							cdgo_pso_fnl	=	p.cdgo_pso	
				From		dbo.tbPasos		p
				Inner Join	@tbinforuta		t	On	t.cnsctvo_cdgo_pso_fnl	=	p.cnsctvo_cdgo_pso
			End
/*
		Else
			Begin
				Insert Into	@tbinforuta
				Select		'NO SELECCIONADO',			f.cnsctvo_cdgo_fljo,		f.nmbre_fljo,				r.cnsctvo_cdgo_rta,
							r.cdgo_rta,					r.dscrpcn_rta,				r.cnsctvo_cdgo_pso_incl,	r.cnsctvo_cdgo_pso_fnl,
							r.cnsctvo_cdgo_cndcn,		p.nmbre,					'',							d.cmpo_cndcn1,
							d.oprdr_cndcn,				d.vlr_1,					p.cdgo_pso,					'',
							''
				From		dbo.tbRutas					r
				Inner Join	dbo.tbFlujos1				f		On	f.cnsctvo_cdgo_fljo		=	r.cnsctvo_cdgo_fljo
				Inner Join	dbo.tbPasos					p		On	p.cnsctvo_cdgo_pso		=	r.cnsctvo_cdgo_pso_incl
				Inner Join	dbo.tbCondiciones			c		On	c.cnsctvo_cdgo_cndcn	=	r.cnsctvo_cdgo_cndcn
				Inner Join	dbo.tbDetalleCondiciones	d		On	d.cnsctvo_cdgo_cndcn	=	c.cnsctvo_cdgo_cndcn
				Where		f.cnsctvo_cdgo_fljo		=	@cnsctvo_cdgo_fljo
				And			r.cnsctvo_cdgo_rta		<=	@cnsctvo_cdgo_rta
				And			r.cnsctvo_cdgo_pso_incl	=	@cnsctvo_cdgo_pso_fnl
				
				Update		@tbinforuta
				Set			dscrpcn_pso_fnl	=	p.nmbre,
							cdgo_pso_fnl	=	p.cdgo_pso	
				From		dbo.tbPasos		p
				Inner Join	@tbinforuta		t	On	t.cnsctvo_cdgo_pso_fnl	=	p.cnsctvo_cdgo_pso
			End
	End
*/
Else
	Begin
		Select	@mxmo_cnsctvo_rta	=	Max(cnsctvo_cdgo_rta)
		From	tbRutas
		Where	cnsctvo_cdgo_fljo = @cnsctvo_cdgo_fljo
					
		If	@cnsctvo_cdgo_rta < @mxmo_cnsctvo_rta
			Set	@cnsctvo_cdgo_rta	=	@cnsctvo_cdgo_rta + 1

		Insert Into	@tbinforuta
		Select		'NO SELECCIONADO',				f.cnsctvo_cdgo_fljo,		f.nmbre_fljo,					r.cnsctvo_cdgo_rta,
					r.cdgo_rta,						r.dscrpcn_rta,				r.cnsctvo_cdgo_pso_incl,		r.cnsctvo_cdgo_pso_fnl,
					r.cnsctvo_cdgo_cndcn,			p.nmbre,					'',								d.cmpo_cndcn1,
					d.oprdr_cndcn,					d.vlr_1,					p.cdgo_pso,						'',
					'',								'',							r.cnsctvo_cdgo_tpo_rspnsble,	d.cmpo_cndcn2,
					r.almcnr_dcmnto,				r.envo_ntfccn
		From		dbo.tbRutas					r
		Inner Join	dbo.tbFlujos_Vigencias		f		On	f.cnsctvo_cdgo_fljo		=	r.cnsctvo_cdgo_fljo
		Inner Join	dbo.tbPasos					p		On	p.cnsctvo_cdgo_pso		=	r.cnsctvo_cdgo_pso_incl
		Inner Join	dbo.tbCondiciones			c		On	c.cnsctvo_cdgo_cndcn	=	r.cnsctvo_cdgo_cndcn
		Inner Join	dbo.tbDetalleCondiciones	d		On	d.cnsctvo_cdgo_cndcn	=	c.cnsctvo_cdgo_cndcn
		Where		f.cnsctvo_cdgo_fljo		=	@cnsctvo_cdgo_fljo
		And			r.cnsctvo_cdgo_rta		=	@cnsctvo_cdgo_rta
		And			r.cnsctvo_cdgo_pso_fnl	!=	99999

		Update		@tbinforuta
		Set			dscrpcn_pso_fnl	=	p.nmbre,
					cdgo_pso_fnl	=	p.cdgo_pso	
		From		dbo.tbPasos		p
		Inner Join	@tbinforuta		t	On	t.cnsctvo_cdgo_pso_fnl	=	p.cnsctvo_cdgo_pso
	End


Select		*
From		@tbinforuta
Order By	cnsctvo_cdgo_rta






GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleRutaxFlujoDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleRutaxFlujoDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleRutaxFlujoDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleRutaxFlujoDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleRutaxFlujoDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleRutaxFlujoDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleRutaxFlujoDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleRutaxFlujoDocumento] TO [visosservice_role]
    AS [dbo];

