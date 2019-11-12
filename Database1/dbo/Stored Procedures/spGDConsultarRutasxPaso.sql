
CREATE Procedure	[dbo].[spGDConsultarRutasxPaso]
@cnsctvo_cdgo_fljo		udtConsecutivo,
@cnsctvo_cdgo_pso_fnl	udtConsecutivo

As
Set Nocount On

Declare	@tbrutaspaso As Table
(
	cnsctvo_cdgo_fljo		Int,
	dscrpcn_fljo			Varchar(150),
	cnsctvo_cdgo_rta		Int,
	cdgo_rta				Char(4),
	dscrpcn_rta				Varchar(250),
	cnsctvo_cdgo_pso_incl	Int,
	cnsctvo_cdgo_pso_fnl	Int,
	cnsctvo_cdgo_cndcn		Int,
	dscrpcn_pso_incl		Varchar(250),		
	dscrpcn_pso_fnl			Varchar(250),
	cmpo_cndcn1				Varchar(150),
	oprdr_cndcn				Varchar(250),
	vlr_1					Varchar(250)
)

Insert Into	@tbrutaspaso
Select		f.cnsctvo_cdgo_fljo,			f.nmbre_fljo,				r.cnsctvo_cdgo_rta,			r.cdgo_rta,
			r.dscrpcn_rta,					r.cnsctvo_cdgo_pso_incl,	r.cnsctvo_cdgo_pso_fnl,		r.cnsctvo_cdgo_cndcn,
			p.nmbre,						'',							d.cmpo_cndcn1,				d.oprdr_cndcn,
			d.vlr_1	
From		dbo.tbRutas					r
Inner Join	dbo.tbFlujos1				f		On	f.cnsctvo_cdgo_fljo		=	r.cnsctvo_cdgo_fljo
Inner Join	dbo.tbPasos					p		On	p.cnsctvo_cdgo_pso		=	r.cnsctvo_cdgo_pso_incl
Inner Join	dbo.tbCondiciones			c		On	c.cnsctvo_cdgo_cndcn	=	r.cnsctvo_cdgo_cndcn
Inner Join	dbo.tbDetalleCondiciones	d		On	d.cnsctvo_cdgo_cndcn	=	c.cnsctvo_cdgo_cndcn
Where		f.cnsctvo_cdgo_fljo			=	@cnsctvo_cdgo_fljo
And			r.cnsctvo_cdgo_pso_incl		=	@cnsctvo_cdgo_pso_fnl

Update		@tbrutaspaso
Set			dscrpcn_pso_fnl	=	p.nmbre
From		dbo.tbPasos			p
Inner Join	@tbrutaspaso		t	On	t.cnsctvo_cdgo_pso_fnl	=	p.cnsctvo_cdgo_pso

Select		*
From		@tbrutaspaso
Order By	cnsctvo_cdgo_rta


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRutasxPaso] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRutasxPaso] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRutasxPaso] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRutasxPaso] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRutasxPaso] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRutasxPaso] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRutasxPaso] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRutasxPaso] TO [visosservice_role]
    AS [dbo];

