
CREATE Procedure	[dbo].[spGDConsultarLogValidacionxProcesoCarga]
@cnsctvo_cdgo_prcso_crga_imgn	Int

As
Set Nocount On

Declare		@tbLogValidacion As Table
(
	nmbre_archvo					Varchar(50),
	dscrpcn_tpo_vldcn				Varchar(150),
	nmbre_archvo_indce				Varchar(150),
	cnsctvo_cdgo_tpo_vldcn			Int,
	cnsctvo_cdgo_prcso_crga_imgn	Int,
	indce1							Varchar(50),
	indce2							Varchar(50),
	indce3							Varchar(50),
	indce4							Varchar(50),
	rta_imgn						Varchar(150)
)

Insert Into	@tbLogValidacion
Select		l.nmbre_archvo,						t.dscrpcn_tpo_vldcn,			r.nmbre_archvo_indce,		l.cnsctvo_cdgo_tpo_vldcn,
			l.cnsctvo_cdgo_prcso_crga_imgn,		r.indce1,						r.indce2,					r.indce3,
			r.indce4,							''
From		bdGestionDocumental.dbo.tbLogValidaciones			l
Inner Join	bdGestionDocumental.dbo.tbTiposValidacion			t	On	t.cnsctvo_cdgo_tpo_vldcn		=	l.cnsctvo_cdgo_tpo_vldcn
Inner Join	bdGestionDocumental.dbo.tbRegistrosArchivosIndices	r	On	r.cnsctvo_cdgo_prcso_crga_imgn	=	l.cnsctvo_cdgo_prcso_crga_imgn
																	And	Ltrim(Rtrim(r.nmbre_archvo))	=	Ltrim(Rtrim(l.nmbre_archvo))
Where		l.cnsctvo_cdgo_prcso_crga_imgn	=	@cnsctvo_cdgo_prcso_crga_imgn
And			r.estdo_vldcn					=	1


Update		@tbLogValidacion
Set			rta_imgn	=	Ltrim(Rtrim(a.srvdr_archvs))+Ltrim(Rtrim(a.drccn_archvo_fsco))+b.nmbre_archvo
From		bdGestionDocumental.dbo.tbConfiguracionMigracionArchivosIndices	a
Inner Join	@tbLogValidacion												b	On	b.cnsctvo_cdgo_prcso_crga_imgn	=	a.cnsctvo_cdgo_prcso_crga


Select		*
from		@tbLogValidacion



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarLogValidacionxProcesoCarga] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarLogValidacionxProcesoCarga] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarLogValidacionxProcesoCarga] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarLogValidacionxProcesoCarga] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarLogValidacionxProcesoCarga] TO [visosservice_role]
    AS [dbo];

