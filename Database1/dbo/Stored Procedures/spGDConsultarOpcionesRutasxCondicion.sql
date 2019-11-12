
CREATE Procedure	[dbo].[spGDConsultarOpcionesRutasxCondicion]
--Declare
@cnsctvo_cdgo_fljo		udtConsecutivo,
@cnsctvo_cdgo_rta		udtConsecutivo

As
Set Nocount On


--Set	@cnsctvo_cdgo_fljo		=	1
--Set	@cnsctvo_cdgo_rta		=	1

Declare	@cnsctvo_cdgo_pso_fnl	Int

Select	@cnsctvo_cdgo_pso_fnl	=	cnsctvo_cdgo_pso_fnl
From	tbRutas
Where	cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo
And		cnsctvo_cdgo_rta	=	@cnsctvo_cdgo_rta
And		vsble_usro			=	'S'

Declare	@tbrutaspasocondicion As Table
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
	rta_exclynte				Int,
	cdgo_pso_incl				Char(4),
	cdgo_pso_fnl				Char(4),
	cnsctvo_cdgo_tpo_rspnsble	Int,
	cmpo_cndcn2					Varchar(150),
	almcnr_dcmnto				Int,
	envo_ntfccn					Int
)

Insert Into	@tbrutaspasocondicion
Select		'NO SELECCIONADO',				f.cnsctvo_cdgo_fljo,			f.nmbre_fljo,				r.cnsctvo_cdgo_rta,
			r.cdgo_rta,						r.dscrpcn_rta,					r.cnsctvo_cdgo_pso_incl,	r.cnsctvo_cdgo_pso_fnl,
			r.cnsctvo_cdgo_cndcn,			p.nmbre,						'',							d.cmpo_cndcn1,
			d.oprdr_cndcn,					d.vlr_1,						r.rta_exclynte,				p.cdgo_pso,
			'',								r.cnsctvo_cdgo_tpo_rspnsble,	d.cmpo_cndcn2,				r.almcnr_dcmnto,
			r.envo_ntfccn
From		dbo.tbRutas					r
Inner Join	dbo.tbFlujos_Vigencias		f		On	f.cnsctvo_cdgo_fljo		=	r.cnsctvo_cdgo_fljo
Inner Join	dbo.tbPasos					p		On	p.cnsctvo_cdgo_pso		=	r.cnsctvo_cdgo_pso_incl
Inner Join	dbo.tbCondiciones			c		On	c.cnsctvo_cdgo_cndcn	=	r.cnsctvo_cdgo_cndcn
Inner Join	dbo.tbDetalleCondiciones	d		On	d.cnsctvo_cdgo_cndcn	=	c.cnsctvo_cdgo_cndcn
Where		f.cnsctvo_cdgo_fljo			=	@cnsctvo_cdgo_fljo
And			r.cnsctvo_cdgo_pso_incl		=	@cnsctvo_cdgo_pso_fnl
And			((r.cnsctvo_cdgo_cndcn <> 0)
Or			(r.cnsctvo_cdgo_cndcn = 0 And r.rta_exclynte Is Not Null))


Update		@tbrutaspasocondicion
Set			cdgo_pso_fnl	=	p.cdgo_pso,	
			dscrpcn_pso_fnl	=	p.nmbre
From		dbo.tbPasos				p
Inner Join	@tbrutaspasocondicion	t	On	t.cnsctvo_cdgo_pso_fnl	=	p.cnsctvo_cdgo_pso

Select		*
From		@tbrutaspasocondicion
Order By	cnsctvo_cdgo_rta














GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarOpcionesRutasxCondicion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarOpcionesRutasxCondicion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarOpcionesRutasxCondicion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarOpcionesRutasxCondicion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarOpcionesRutasxCondicion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarOpcionesRutasxCondicion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarOpcionesRutasxCondicion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarOpcionesRutasxCondicion] TO [visosservice_role]
    AS [dbo];

