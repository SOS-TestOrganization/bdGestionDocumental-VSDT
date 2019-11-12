


CREATE Procedure	[dbo].[spGDConsultarDetalleDocumentosxRuta]
--Declare		
@cnsctvo_cdgo_fljo		Int,
@cnsctvo_cdgo_dcmnto	Int,
@cnsctvo_cdgo_rta		Int

As
Set Nocount On

/*
Declare		
@cnsctvo_cdgo_fljo		Int,
@cnsctvo_cdgo_dcmnto	Int,
@cnsctvo_cdgo_rta		Int

Set	@cnsctvo_cdgo_fljo		= 1
Set	@cnsctvo_cdgo_dcmnto	= 89
Set	@cnsctvo_cdgo_rta		= 24
*/

Declare	@tmpdocumentos As Table
(
cnsctvo_cdgo_dcmnto				Int,
dscrpcn_fljo					Varchar(150),
dscrpcn_rta						Varchar(150),
dscrpcn_rta_antrr				Varchar(150),
fcha_asgncn						Datetime,
fcha_inco_gstn					Datetime,
fcha_fn_gstn					Datetime,
cmntro_fljo						Varchar(7500),
cnsctvo_cdgo_fljo				Int,
cnsctvo_cdgo_rta				Int,
cnsctvo_cdgo_rta_antrr			Int,
prcntje_avnce					Float,
usro_rta_antrr					Varchar(100),
cnsctvo_cdgo_tpo_gstn			Int,
dscrpcn_tpo_gstn				Varchar(20),
dscrpcn_gstn					Varchar(7500),
usro_gstn						Varchar(100),
cnsctvo_rgstro_gstn_dcmnto		Int,
hbltr_rta						Int
)


Insert Into	@tmpdocumentos
Select		r.cnsctvo_cdgo_dcmnto,					'',										'',
			'',										r.fcha_asgncn,							r.fcha_inco_gstn,
			fcha_fn_gstn,							r.cmntro_fljo,							rf.cnsctvo_cdgo_fljo,
			r.cnsctvo_cdgo_estdo_dcmnto,			r.cnsctvo_cdgo_estdo_dcmnto_antrr,		0,
			'',										r.cnsctvo_cdgo_tpo_gstn,				'',
			r.dscrpcn_gstn,							'',										r.cnsctvo_rgstro_gstn_dcmnto,
			1
From		tbRegistrosGestionxDocumento	r
Inner Join	dbo.tbRutasxFlujosDocumentos	rf	On	rf.cnsctvo_cdgo_fljo	=	r.cnsctvo_cdgo_fljo
												And	rf.cnsctvo_cdgo_dcmnto	=	r.cnsctvo_cdgo_dcmnto
												And	rf.cnsctvo_cdgo_rta		=	r.cnsctvo_cdgo_estdo_dcmnto
Where		r.cnsctvo_cdgo_fljo			=	@cnsctvo_cdgo_fljo
And			r.cnsctvo_cdgo_dcmnto		=	@cnsctvo_cdgo_dcmnto
And			r.cnsctvo_cdgo_estdo_dcmnto	=	@cnsctvo_cdgo_rta
Order By	rf.cnsctvo_cdgo_dcmnto,		rf.cnsctvo_cdgo_fljo,		rf.cnsctvo_cdgo_rta


Declare		@cnsctvo_cdgo_estdo_dcmnto				Int,
			@cnsctvo_cdgo_estdo_dcmnto_antrr		Int,
			@cnsctvo_cdgo_estdo_dcmnto_tmprl		Int,
			@cnsctvo_cdgo_estdo_dcmnto_antrr_tmprl	Int


Select		@cnsctvo_cdgo_estdo_dcmnto			=	Max(cnsctvo_cdgo_rta)
From		@tmpdocumentos
Where		cnsctvo_cdgo_tpo_gstn				<>	4

Select		@cnsctvo_cdgo_estdo_dcmnto_antrr	=	Max(cnsctvo_cdgo_rta_antrr)
From		@tmpdocumentos
Where		cnsctvo_cdgo_tpo_gstn				<>	4

If @cnsctvo_cdgo_estdo_dcmnto <> 0
	Begin
		While	@cnsctvo_cdgo_estdo_dcmnto	<>	0
			Begin
				Select		@cnsctvo_cdgo_estdo_dcmnto_tmprl		=	Max(cnsctvo_cdgo_estdo_dcmnto)
				From		bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
				Where		cnsctvo_cdgo_estdo_dcmnto				=	@cnsctvo_cdgo_estdo_dcmnto_antrr
				And			cnsctvo_cdgo_tpo_gstn					<>	4
			
				Select		@cnsctvo_cdgo_estdo_dcmnto_antrr_tmprl	=	Max(cnsctvo_cdgo_estdo_dcmnto_antrr)
				From		bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
				Where		cnsctvo_cdgo_estdo_dcmnto	=	@cnsctvo_cdgo_estdo_dcmnto_tmprl
				And			cnsctvo_cdgo_tpo_gstn					<>	4
				
				Set			@cnsctvo_cdgo_estdo_dcmnto			=	@cnsctvo_cdgo_estdo_dcmnto_tmprl
				Set			@cnsctvo_cdgo_estdo_dcmnto_antrr	=	@cnsctvo_cdgo_estdo_dcmnto_antrr_tmprl

				Insert Into	@tmpdocumentos
				Select		r.cnsctvo_cdgo_dcmnto,					'',										'',
							'',										r.fcha_asgncn,							r.fcha_inco_gstn,
							fcha_fn_gstn,							r.cmntro_fljo,							rf.cnsctvo_cdgo_fljo,
							r.cnsctvo_cdgo_estdo_dcmnto,			r.cnsctvo_cdgo_estdo_dcmnto_antrr,		0,
							'',										r.cnsctvo_cdgo_tpo_gstn,				'',
							r.dscrpcn_gstn,							'',										r.cnsctvo_rgstro_gstn_dcmnto,
							1
				From		tbRegistrosGestionxDocumento	r
				Inner Join	dbo.tbRutasxFlujosDocumentos	rf	On	rf.cnsctvo_cdgo_fljo	=	r.cnsctvo_cdgo_fljo
																And	rf.cnsctvo_cdgo_dcmnto	=	r.cnsctvo_cdgo_dcmnto
																And	rf.cnsctvo_cdgo_rta		=	r.cnsctvo_cdgo_estdo_dcmnto
				Where		cnsctvo_cdgo_estdo_dcmnto			=	@cnsctvo_cdgo_estdo_dcmnto
				And			cnsctvo_cdgo_estdo_dcmnto_antrr		=	@cnsctvo_cdgo_estdo_dcmnto_antrr
				And			r.cnsctvo_cdgo_fljo					=	@cnsctvo_cdgo_fljo
				And			r.cnsctvo_cdgo_dcmnto				=	@cnsctvo_cdgo_dcmnto
				And			r.cnsctvo_cdgo_tpo_gstn				<>	4
			End
	End


Declare	@fcha_cnslta	Datetime
Set		@fcha_cnslta	=	Getdate()

Insert Into		@tmpdocumentos	
Select			r.cnsctvo_cdgo_dcmnto,					'',									'',
				'',										r.fcha_asgncn,						r.fcha_inco_gstn,
				r.fcha_fn_gstn,							r.cmntro_fljo,						r.cnsctvo_cdgo_fljo,
				r.cnsctvo_cdgo_estdo_dcmnto,			r.cnsctvo_cdgo_estdo_dcmnto_antrr,	0,
				'',										r.cnsctvo_cdgo_tpo_gstn,			'',
				r.dscrpcn_gstn,							'',									r.cnsctvo_rgstro_gstn_dcmnto,
				1
From			tbRegistrosGestionxDocumento		r
Where			r.cnsctvo_cdgo_fljo			=	@cnsctvo_cdgo_fljo
And				r.cnsctvo_cdgo_dcmnto		=	@cnsctvo_cdgo_dcmnto
And				r.cnsctvo_cdgo_estdo_dcmnto	=	0
And				r.cnsctvo_cdgo_tpo_gstn		=	4
Order By		r.cnsctvo_cdgo_dcmnto,		r.cnsctvo_cdgo_fljo


Update			@tmpdocumentos
Set				usro_rta_antrr		=	u.dscrpcn_usro_rspnde--r.usro_gstn
From			tbRegistrosGestionxDocumento	r
Inner Join		@tmpdocumentos					t	On	t.cnsctvo_cdgo_fljo			=	r.cnsctvo_cdgo_fljo
													And	t.cnsctvo_cdgo_dcmnto		=	r.cnsctvo_cdgo_dcmnto
													And	t.cnsctvo_cdgo_rta_antrr	=	r.cnsctvo_cdgo_estdo_dcmnto
Inner Join		bdServicioCliente.dbo.tbUsuariosResponde_Vigencias	u	On	Ltrim(Rtrim(u.lgn_usro_rspnde))	=	Ltrim(Rtrim(r.usro_gstn))
Where			t.cnsctvo_cdgo_tpo_gstn	<>	4
--And				r.cnsctvo_cdgo_fljo			=	@cnsctvo_cdgo_fljo
--And				r.cnsctvo_cdgo_dcmnto		=	@cnsctvo_cdgo_dcmnto


-- Si el usuario que envía es un proceso administrativo
Update			@tmpdocumentos
Set				usro_rta_antrr		=	r.usro_gstn
From			tbRegistrosGestionxDocumento	r
Inner Join		@tmpdocumentos					t	On	t.cnsctvo_cdgo_fljo			=	r.cnsctvo_cdgo_fljo
													And	t.cnsctvo_cdgo_dcmnto		=	r.cnsctvo_cdgo_dcmnto
													And	t.cnsctvo_cdgo_rta_antrr	=	r.cnsctvo_cdgo_estdo_dcmnto
Where			t.cnsctvo_cdgo_tpo_gstn	<>	4
And				usro_rta_antrr = ''


Update			@tmpdocumentos
Set				usro_gstn		=	u.dscrpcn_usro_rspnde--r.usro_gstn
From			tbRegistrosGestionxDocumento	r
Inner Join		@tmpdocumentos					t	On	t.cnsctvo_cdgo_fljo			=	r.cnsctvo_cdgo_fljo
													And	t.cnsctvo_cdgo_dcmnto		=	r.cnsctvo_cdgo_dcmnto
Inner Join		bdServicioCliente.dbo.tbUsuariosResponde_Vigencias	u	On	Ltrim(Rtrim(u.lgn_usro_rspnde))	=	Ltrim(Rtrim(r.usro_gstn))
Where			t.cnsctvo_cdgo_tpo_gstn	=	4


Update			@tmpdocumentos
Set				dscrpcn_fljo	=		f.dscrpcn_fljo
From			tbFlujos_Vigencias		f
Inner Join		@tmpdocumentos			t	On	t.cnsctvo_cdgo_fljo	=	f.cnsctvo_cdgo_fljo


Update			@tmpdocumentos
Set				dscrpcn_rta	=		r.dscrpcn_rta
From			tbRutas				r
Inner Join		@tmpdocumentos		t	On	t.cnsctvo_cdgo_fljo	=	r.cnsctvo_cdgo_fljo
										And	t.cnsctvo_cdgo_rta	=	r.cnsctvo_cdgo_rta


Update			@tmpdocumentos
Set				dscrpcn_rta_antrr	=	r.dscrpcn_rta
From			tbRutas				r
Inner Join		@tmpdocumentos		t	On	t.cnsctvo_cdgo_fljo			=	r.cnsctvo_cdgo_fljo
										And	t.cnsctvo_cdgo_rta_antrr	=	r.cnsctvo_cdgo_rta


Update			@tmpdocumentos
Set				prcntje_avnce		=	dbo.fnTiemposMaximosRuta(cnsctvo_cdgo_fljo,cnsctvo_cdgo_rta,fcha_asgncn,@fcha_cnslta)
From			@tmpdocumentos

Update			@tmpdocumentos
Set				dscrpcn_tpo_gstn	=	Case When cnsctvo_cdgo_tpo_gstn = 4 Then 'GESTIÓN'
										Else 'TRÁMITE FLUJO'
										End

Update			@tmpdocumentos
Set				hbltr_rta	=	Case	When r.cnsctvo_cdgo_pso_fnl <> 99999 Then 1
										Else	0
								End
From			@tmpdocumentos	t
Inner Join		tbRutas			r	On		r.cnsctvo_cdgo_rta	=	t.cnsctvo_cdgo_rta
Inner Join		tbPasos			p	On		p.cnsctvo_cdgo_pso	=	r.cnsctvo_cdgo_pso_fnl
	

Select			dscrpcn_tpo_gstn,												dscrpcn_rta_antrr,											
				dscrpcn_rta,													usro_rta_antrr,
				Convert(Char(20),fcha_asgncn,120) As fcha_asgncn,				Convert(Char(20),fcha_inco_gstn,120) As fcha_inco_gstn,
				Convert(Char(20),fcha_fn_gstn,120) As fcha_fn_gstn,				cnsctvo_cdgo_dcmnto As cnsctvo_cdgo_imgn,
				dscrpcn_fljo,													cmntro_fljo,
				cnsctvo_cdgo_fljo,												cnsctvo_cdgo_rta,
				cnsctvo_cdgo_rta_antrr,											Convert(Decimal(6,2),prcntje_avnce)As prcntje_avnce,
				cnsctvo_cdgo_tpo_gstn,											dscrpcn_gstn,
				usro_gstn,														hbltr_rta,
				'N' As prsnta_incnsstnca,										'N' As cndcn1,
				'N' As cndcn2,													'N' As prsnta_incnsstnca2,
				'N' As rps,														'N' As rps_prsnta_incnsstnca,
				'N' As atncn_audtda,											'N' As prsnta_glsa,
				'N' As aprba_nta
From			@tmpdocumentos
Order By		cnsctvo_rgstro_gstn_dcmnto






GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleDocumentosxRuta] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleDocumentosxRuta] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleDocumentosxRuta] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleDocumentosxRuta] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleDocumentosxRuta] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleDocumentosxRuta] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleDocumentosxRuta] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleDocumentosxRuta] TO [visosservice_role]
    AS [dbo];

