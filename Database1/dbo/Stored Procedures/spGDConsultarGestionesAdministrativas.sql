
CREATE Procedure [dbo].[spGDConsultarGestionesAdministrativas]
@nmro_idntfccn		Varchar(20)	=	Null,
@nmro_rdccn			Varchar(20)	=	Null,
@nmro_fctra			Varchar(20)	=	Null,
@nmro_atncn			Varchar(20)	=	Null,
@nmbre_dcmnto		Varchar(50)	=	Null,
@fcha_dsde			Datetime	=	Null,
@fcha_hsta			Datetime	=	Null

As
Set Nocount On

/*
Declare
@nmro_idntfccn		Varchar(20),
@nmro_rdccn			Varchar(20),
@nmro_fctra			Varchar(20),
@nmro_atncn			Varchar(20),
@nmbre_dcmnto		Varchar(50),
@fcha_dsde			Datetime,
@fcha_hsta			Datetime

Set		@nmro_idntfccn		=	'94526804'
Set		@nmro_rdccn			=	Null
Set		@nmro_fctra			=	Null
Set		@nmro_atncn			=	Null
Set		@nmbre_dcmnto		=	Null
Set		@fcha_dsde			=	Null
Set		@fcha_hsta			=	Null
*/

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
rta_dcmnto						Varchar(150),
cnsctvo_cdgo_indce				Int
)

Declare	@fcha_cnslta	Datetime
Set		@fcha_cnslta	=	Getdate()

Insert Into		@tmpdocumentos
Select Distinct	rf.cnsctvo_cdgo_dcmnto,				'',									'',
				'',									'',									'',
				rf.cnsctvo_cdgo_fljo,				Max(rf.cnsctvo_cdgo_rta),			0,
				0,									'NINGUNO',							'',
				0,									'',									0
From			tbImagenesIndexadas					i
Inner Join		dbo.tbRutasxFlujosDocumentos		rf	On		rf.cnsctvo_cdgo_dcmnto			=	i.cnsctvo_cdgo_imgn
														And		rf.cnsctvo_cdgo_fljo			=	i.cnsctvo_cdgo_fljo
Where			(i.nmro_idntfccn	=	@nmro_idntfccn	Or	@nmro_idntfccn Is Null)
And				(i.nmro_fctra		=	@nmro_fctra		Or	@nmro_fctra Is Null)
And				(i.indice_3			=	@nmro_rdccn		Or	@nmro_rdccn Is Null)
And				(i.indice_4			=	@nmro_atncn		Or	@nmro_atncn Is Null)
And				(i.nmbre_imgn like '%'+@nmbre_dcmnto+'%' Or @nmbre_dcmnto Is Null)
And				((Convert(char(8),i.fcha_crcn) Between Convert(char(8),@fcha_dsde) And Convert(char(8),@fcha_hsta)) Or (@fcha_dsde Is Null And @fcha_hsta Is Null))
And				i.crtla			=	'S'
And				rf.vsble_usro	=	'S'
Group By		rf.cnsctvo_cdgo_dcmnto,		rf.cnsctvo_cdgo_fljo

/*
-- Insertamos los registros en los cuales el usuario pertenece a un Grupo Administrativo
Insert Into		@tmpdocumentos
Select Distinct	rf.cnsctvo_cdgo_dcmnto,				'',									'',
				'',									'',									'',
				rf.cnsctvo_cdgo_fljo,				Max(rf.cnsctvo_cdgo_rta),			0,
				0,									p.dscrpcn_prcso_admnstrtvo,			'',
				p.cnsctvo_cdgo_prcso_admnstrtvo,	'',									0
From			tbImagenesIndexadas					i
Inner Join		dbo.tbRutasxFlujosDocumentos		rf	On		rf.cnsctvo_cdgo_dcmnto			=	i.cnsctvo_cdgo_imgn
														And		rf.cnsctvo_cdgo_fljo			=	i.cnsctvo_cdgo_fljo
Inner Join		tbRegistrosGestionxDocumento		r	On		r.cnsctvo_cdgo_dcmnto			=	rf.cnsctvo_cdgo_dcmnto
														And		r.cnsctvo_cdgo_fljo				=	rf.cnsctvo_cdgo_fljo
														And		r.cnsctvo_cdgo_estdo_dcmnto		=	rf.cnsctvo_cdgo_rta
Inner Join		bdGestionDocumental.dbo.tbProcesosAdministrativos_Vigencias		p	On	p.dscrpcn_prcso_admnstrtvo			=	Ltrim(Rtrim(r.usro_gstn))
Inner Join		bdGestionDocumental.dbo.tbResponsablesxProcesosAdministrativos	rp	On	rp.cnsctvo_cdgo_prcso_admnstrtvo	=	p.cnsctvo_cdgo_prcso_admnstrtvo
Inner Join		bdServicioCliente.dbo.tbUsuariosResponde_Vigencias				u	On	u.cnsctvo_cdgo_usro_rspnde			=	rp.cnsctvo_cdgo_rspnsble
Where			(i.nmro_idntfccn	=	@nmro_idntfccn	Or	@nmro_idntfccn Is Null)
And				(i.nmro_fctra		=	@nmro_fctra		Or	@nmro_fctra Is Null)
And				(i.indice_3			=	@nmro_rdccn		Or	@nmro_rdccn Is Null)
And				(i.indice_4			=	@nmro_atncn		Or	@nmro_atncn Is Null)
And				(i.nmbre_imgn like '%'+@nmbre_dcmnto+'%' Or @nmbre_dcmnto Is Null)
And				((Convert(char(8),i.fcha_crcn) Between Convert(char(8),@fcha_dsde) And Convert(char(8),@fcha_hsta)) Or (@fcha_dsde Is Null And @fcha_hsta Is Null))
And				i.crtla					=	'S'
And				rf.vsble_usro			=	'S'
And				r.cnsctvo_cdgo_tpo_gstn	<>	4
Group By		rf.cnsctvo_cdgo_dcmnto,		rf.cnsctvo_cdgo_fljo, p.dscrpcn_prcso_admnstrtvo, p.cnsctvo_cdgo_prcso_admnstrtvo
Order By		rf.cnsctvo_cdgo_dcmnto,		rf.cnsctvo_cdgo_fljo
*/

Update			@tmpdocumentos
Set				cnsctvo_cdgo_prcso_admnstrtvo	=	p.cnsctvo_cdgo_prcso_admnstrtvo,
				prcso_admnstrtvo				=	p.dscrpcn_prcso_admnstrtvo
From			@tmpdocumentos			i
Inner Join		tbRegistrosGestionxDocumento									r	On		r.cnsctvo_cdgo_dcmnto			=	i.cnsctvo_cdgo_dcmnto
																					And		r.cnsctvo_cdgo_fljo				=	i.cnsctvo_cdgo_fljo
																					And		r.cnsctvo_cdgo_estdo_dcmnto		=	i.cnsctvo_cdgo_rta
Inner Join		bdGestionDocumental.dbo.tbProcesosAdministrativos_Vigencias		p	On		p.dscrpcn_prcso_admnstrtvo			=	Ltrim(Rtrim(r.usro_gstn))
Inner Join		bdGestionDocumental.dbo.tbResponsablesxProcesosAdministrativos	rp	On		rp.cnsctvo_cdgo_prcso_admnstrtvo	=	p.cnsctvo_cdgo_prcso_admnstrtvo
Inner Join		bdServicioCliente.dbo.tbUsuariosResponde_Vigencias				u	On		u.cnsctvo_cdgo_usro_rspnde			=	rp.cnsctvo_cdgo_rspnsble
Where			r.cnsctvo_cdgo_tpo_gstn	<>	4



Update			@tmpdocumentos
Set				cnsctvo_cdgo_rta_antrr			=	r.cnsctvo_cdgo_estdo_dcmnto_antrr,
				fcha_asgncn						=	r.fcha_asgncn,
				cmntro_fljo						=	r.cmntro_fljo
From			@tmpdocumentos						t
Inner Join		tbRegistrosGestionxDocumento		r	On	r.cnsctvo_cdgo_fljo				=	t.cnsctvo_cdgo_fljo
														And	r.cnsctvo_cdgo_dcmnto			=	t.cnsctvo_cdgo_dcmnto
														And	r.cnsctvo_cdgo_estdo_dcmnto		=	t.cnsctvo_cdgo_rta
Where			r.cnsctvo_cdgo_tpo_gstn	<>	4


Update			@tmpdocumentos
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

Select			cnsctvo_cdgo_dcmnto As cnsctvo_cdgo_imgn,				dscrpcn_fljo,					dscrpcn_rta,
				Convert(Char(20),fcha_asgncn,120) As fcha_asgncn,		cmntro_fljo,					cnsctvo_cdgo_fljo,
				cnsctvo_cdgo_rta,										cnsctvo_cdgo_rta_antrr,			dscrpcn_rta_antrr,
				Convert(Decimal(6,2),prcntje_avnce)As prcntje_avnce,	prcso_admnstrtvo,				usro_rta_antrr,
				cnsctvo_cdgo_prcso_admnstrtvo,							rta_dcmnto,						'N' As prsnta_incnsstnca,
				'N' As cndcn1,											'N' As cndcn2,					'N' As prsnta_incnsstnca2,
				cnsctvo_cdgo_indce,										'N' As rps,						'N' As rps_prsnta_incnsstnca,
				'N' As atncn_audtda
From			@tmpdocumentos
Order By		cnsctvo_cdgo_dcmnto




















GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarGestionesAdministrativas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarGestionesAdministrativas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarGestionesAdministrativas] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarGestionesAdministrativas] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarGestionesAdministrativas] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarGestionesAdministrativas] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarGestionesAdministrativas] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarGestionesAdministrativas] TO [visosservice_role]
    AS [dbo];

