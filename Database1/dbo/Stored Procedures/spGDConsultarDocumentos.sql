



CREATE Procedure [dbo].[spGDConsultarDocumentos]
--Declare		
@usro_gstn	Varchar(20)

As
Set Nocount On

--Set			@usro_gstn	= 'siscgm01'
Declare	@tmpdocumentos As Table
(
cnsctvo_cdgo_dcmnto				Int,
dscrpcn_fljo					Varchar(150),
dscrpcn_rta						Varchar(150),
dscrpcn_rta_antrr				Varchar(150),
fcha_asgncn						Datetime,
cmntro_fljo						Varchar(7500),
cnsctvo_cdgo_fljo				Int,
cnsctvo_cdgo_rta				Int,
cnsctvo_cdgo_rta_antrr			Int,
prcntje_avnce					Float,
prcso_admnstrtvo				Varchar(20),
usro_rta_antrr					Varchar(100),
cnsctvo_cdgo_prcso_admnstrtvo	Int,
accn							Varchar(15),
rta_dcmnto						Varchar(150),
cnsctvo_cdgo_indce				Int,
dcmnto_almcndo					Char(1)
)

Declare	@fcha_cnslta	Datetime,
		@accn			Varchar(16)
Set		@fcha_cnslta	=	Getdate()
Set		@accn			=	'NO SELECCIONADO'

Insert Into		@tmpdocumentos	
Select Distinct	rf.cnsctvo_cdgo_dcmnto,					'',									'',
				'',										r.fcha_asgncn,						r.cmntro_fljo,
				rf.cnsctvo_cdgo_fljo,					rf.cnsctvo_cdgo_rta,				r.cnsctvo_cdgo_estdo_dcmnto_antrr,
				0,										'NINGUNO',							'',
				0,										@accn,								'',
				0,										'N'
From			tbRegistrosGestionxDocumento		r
Inner Join		dbo.tbRutasxFlujosDocumentos		rf	On	rf.cnsctvo_cdgo_fljo	=	r.cnsctvo_cdgo_fljo
														And	rf.cnsctvo_cdgo_dcmnto	=	r.cnsctvo_cdgo_dcmnto
														And	rf.cnsctvo_cdgo_rta		=	r.cnsctvo_cdgo_estdo_dcmnto
Where			r.usro_gstn				=	@usro_gstn
And				rf.vsble_usro			=	'S'
And				cnsctvo_cdgo_tpo_gstn	<>	4
Order By		rf.cnsctvo_cdgo_dcmnto,		rf.cnsctvo_cdgo_fljo,		rf.cnsctvo_cdgo_rta



-- Insertamos los registros en los cuales el usuario pertenece a un Grupo Administrativo
Insert Into		@tmpdocumentos	
Select Distinct	rf.cnsctvo_cdgo_dcmnto,					'',									'',
				'',										r.fcha_asgncn,						r.cmntro_fljo,
				rf.cnsctvo_cdgo_fljo,					rf.cnsctvo_cdgo_rta,				r.cnsctvo_cdgo_estdo_dcmnto_antrr,
				0,										p.dscrpcn_prcso_admnstrtvo,			'',
				p.cnsctvo_cdgo_prcso_admnstrtvo,		@accn,								'',
				0,										'N'

From			tbRegistrosGestionxDocumento		r
Inner Join		dbo.tbRutasxFlujosDocumentos		rf	On	rf.cnsctvo_cdgo_fljo	=	r.cnsctvo_cdgo_fljo
														And	rf.cnsctvo_cdgo_dcmnto	=	r.cnsctvo_cdgo_dcmnto
														And	rf.cnsctvo_cdgo_rta		=	r.cnsctvo_cdgo_estdo_dcmnto
Inner Join		bdGestionDocumental.dbo.tbProcesosAdministrativos_Vigencias		p	On	p.dscrpcn_prcso_admnstrtvo			=	Ltrim(Rtrim(r.usro_gstn))
Inner Join		bdGestionDocumental.dbo.tbResponsablesxProcesosAdministrativos	rp	On	rp.cnsctvo_cdgo_prcso_admnstrtvo	=	p.cnsctvo_cdgo_prcso_admnstrtvo
Inner Join		bdServicioCliente.dbo.tbUsuariosResponde_Vigencias				u	On	u.cnsctvo_cdgo_usro_rspnde			=	rp.cnsctvo_cdgo_rspnsble
Where			u.lgn_usro_rspnde		=	@usro_gstn
And				rf.vsble_usro			=	'S'
And				cnsctvo_cdgo_tpo_gstn	<>	4
Order By		rf.cnsctvo_cdgo_dcmnto,		rf.cnsctvo_cdgo_fljo,		rf.cnsctvo_cdgo_rta


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
Where			r.cnsctvo_cdgo_tpo_gstn	<>	4


-- Si el usuario que envía es un proceso administrativo
Update			@tmpdocumentos
Set				usro_rta_antrr		=	r.usro_gstn
From			tbRegistrosGestionxDocumento	r
Inner Join		@tmpdocumentos					t	On	t.cnsctvo_cdgo_fljo			=	r.cnsctvo_cdgo_fljo
													And	t.cnsctvo_cdgo_dcmnto		=	r.cnsctvo_cdgo_dcmnto
													And	t.cnsctvo_cdgo_rta_antrr	=	r.cnsctvo_cdgo_estdo_dcmnto
Where			r.cnsctvo_cdgo_tpo_gstn	<>	4
And				usro_rta_antrr = ''


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
Set				cnsctvo_cdgo_indce		=	i.cnsctvo_cdgo_indce,
				rta_dcmnto				=	i.rta_fnl_imgn+Convert(Varchar(10),i.cnsctvo_imgn)+Ltrim(Rtrim(i.extnsn_imgn))
From			@tmpdocumentos								t
Inner join		bdGestionDocumental.dbo.tbImagenesIndexadas	i	On	i.cnsctvo_cdgo_imgn		=	t.cnsctvo_cdgo_dcmnto


Update			@tmpdocumentos
Set				dcmnto_almcndo	=	Case	When u.cnsctvo_cdgo_dcmnto Is Not Null Then 'S'
											Else 'N'
									End
From			@tmpdocumentos								t
Inner Join		dbo.tbUbicacionDocumentosDigitalizados		u	On	u.cnsctvo_cdgo_dcmnto	=	t.cnsctvo_cdgo_dcmnto


Select			cnsctvo_cdgo_dcmnto As cnsctvo_cdgo_imgn,				dscrpcn_fljo,					dscrpcn_rta,
				Convert(Char(20),fcha_asgncn,120) As fcha_asgncn,		cmntro_fljo,					cnsctvo_cdgo_fljo,
				cnsctvo_cdgo_rta,										cnsctvo_cdgo_rta_antrr,			dscrpcn_rta_antrr,
				Convert(Decimal(6,2),prcntje_avnce)As prcntje_avnce,	prcso_admnstrtvo,				usro_rta_antrr,
				cnsctvo_cdgo_prcso_admnstrtvo,							accn,							rta_dcmnto,
				'N' As prsnta_incnsstnca,								'N' As cndcn1,					'N' As cndcn2,
				'N' As prsnta_incnsstnca2,								cnsctvo_cdgo_indce,				'N' As rps,
				'N' As rps_prsnta_incnsstnca,							'N' As atncn_audtda,			dcmnto_almcndo,
				'N' As prsnta_glsa,										'N' As aprba_nta
From			@tmpdocumentos
Order By		cnsctvo_cdgo_dcmnto






















GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentos] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentos] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentos] TO [visosservice_role]
    AS [dbo];

