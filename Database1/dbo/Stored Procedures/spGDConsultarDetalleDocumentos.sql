

CREATE Procedure [dbo].[spGDConsultarDetalleDocumentos]
--Declare		
@cnsctvo_cdgo_fljo		Int,
@cnsctvo_cdgo_dcmnto	Int

As
Set Nocount On

--Set			@cnsctvo_cdgo_fljo		=	1
--Set			@cnsctvo_cdgo_dcmnto	=	3511

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
cnsctvo_rgstro_gstn_dcmnto		Int
)

Declare	@fcha_cnslta	Datetime
Set		@fcha_cnslta	=	Getdate()

Insert Into		@tmpdocumentos	
Select			rf.cnsctvo_cdgo_dcmnto,					'',									'',
				'',										r.fcha_asgncn,						r.fcha_inco_gstn,
				r.fcha_fn_gstn,							r.cmntro_fljo,						rf.cnsctvo_cdgo_fljo,
				rf.cnsctvo_cdgo_rta,					r.cnsctvo_cdgo_estdo_dcmnto_antrr,	0,
				'',										r.cnsctvo_cdgo_tpo_gstn,			'',
				r.dscrpcn_gstn,							'',									r.cnsctvo_rgstro_gstn_dcmnto
From			tbRegistrosGestionxDocumento		r
Inner Join		dbo.tbRutasxFlujosDocumentos		rf	On	rf.cnsctvo_cdgo_fljo	=	r.cnsctvo_cdgo_fljo
														And	rf.cnsctvo_cdgo_dcmnto	=	r.cnsctvo_cdgo_dcmnto
														And	rf.cnsctvo_cdgo_rta		=	r.cnsctvo_cdgo_estdo_dcmnto
Where			r.cnsctvo_cdgo_fljo		=	@cnsctvo_cdgo_fljo
And				r.cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
Order By		rf.cnsctvo_cdgo_dcmnto,		rf.cnsctvo_cdgo_fljo,		rf.cnsctvo_cdgo_rta


Insert Into		@tmpdocumentos	
Select			r.cnsctvo_cdgo_dcmnto,					'',									'',
				'',										r.fcha_asgncn,						r.fcha_inco_gstn,
				r.fcha_fn_gstn,							r.cmntro_fljo,						r.cnsctvo_cdgo_fljo,
				r.cnsctvo_cdgo_estdo_dcmnto,			r.cnsctvo_cdgo_estdo_dcmnto_antrr,	0,
				'',										r.cnsctvo_cdgo_tpo_gstn,			'',
				r.dscrpcn_gstn,							'',									r.cnsctvo_rgstro_gstn_dcmnto
From			tbRegistrosGestionxDocumento		r
Where			r.cnsctvo_cdgo_fljo			=	@cnsctvo_cdgo_fljo
And				r.cnsctvo_cdgo_dcmnto		=	@cnsctvo_cdgo_dcmnto
And				cnsctvo_cdgo_estdo_dcmnto	=	0
Order By		r.cnsctvo_cdgo_dcmnto,		r.cnsctvo_cdgo_fljo


Update			@tmpdocumentos
/*
Set				usro_rta_antrr		=	Case When r.cnsctvo_cdgo_estdo_dcmnto <> 0 Then u.dscrpcn_usro_rspnde--r.usro_gstn
											Else	''
										End
*/
Set				usro_rta_antrr		=	u.dscrpcn_usro_rspnde--r.usro_gstn
From			tbRegistrosGestionxDocumento	r
Inner Join		@tmpdocumentos					t	On	t.cnsctvo_cdgo_fljo			=	r.cnsctvo_cdgo_fljo
													And	t.cnsctvo_cdgo_dcmnto		=	r.cnsctvo_cdgo_dcmnto
													And	t.cnsctvo_cdgo_rta_antrr	=	r.cnsctvo_cdgo_estdo_dcmnto
Inner Join		bdServicioCliente.dbo.tbUsuariosResponde_Vigencias	u	On	Ltrim(Rtrim(u.lgn_usro_rspnde))	=	Ltrim(Rtrim(r.usro_gstn))
Where			t.cnsctvo_cdgo_tpo_gstn	<>	4


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


Select			dscrpcn_tpo_gstn,												dscrpcn_rta_antrr,											
				dscrpcn_rta,													usro_rta_antrr,
				Convert(Char(20),fcha_asgncn,120) As fcha_asgncn,				Convert(Char(20),fcha_inco_gstn,120) As fcha_inco_gstn,
				Convert(Char(20),fcha_fn_gstn,120) As fcha_fn_gstn,				cnsctvo_cdgo_dcmnto As cnsctvo_cdgo_imgn,
				dscrpcn_fljo,													cmntro_fljo,
				cnsctvo_cdgo_fljo,												cnsctvo_cdgo_rta,
				cnsctvo_cdgo_rta_antrr,											Convert(Decimal(6,2),prcntje_avnce)As prcntje_avnce,
				cnsctvo_cdgo_tpo_gstn,											dscrpcn_gstn,
				usro_gstn
From			@tmpdocumentos
Order By		cnsctvo_rgstro_gstn_dcmnto









GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleDocumentos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleDocumentos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleDocumentos] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleDocumentos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleDocumentos] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleDocumentos] TO [visosservice_role]
    AS [dbo];

