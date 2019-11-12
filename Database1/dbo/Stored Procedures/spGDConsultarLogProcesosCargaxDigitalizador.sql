
CREATE Procedure	[dbo].[spGDConsultarLogProcesosCargaxDigitalizador]
@cnsctvo_cdgo_dgtlzdr			udtConsecutivo	=	Null
--@cnsctvo_cdgo_prcso_crga_imgn	udtConsecutivo

As
Set Nocount On

/*
Declare	@cnsctvo_cdgo_dgtlzdr	Int
Set	@cnsctvo_cdgo_dgtlzdr = 4
*/

Declare	@tblog	As Table
(
cnsctvo_cdgo_lg					Int,
cdgo_lg							Char(4),
cnsctvo_cdgo_prcso_crga_imgn	Int,
dscrpcn_lg						Varchar(150),
dto								Varchar(150),
orgn_dto						Varchar(150),
idntfcdr_dto					Varchar(150),
cnsctvo_cdgo_tpo_errr			Int,
fcha_crcn						Datetime,
dscrpcn_tpo_errr				Varchar(150),
cnsctvo_cdgo_dgtlzdr			Int
)

Insert Into	@tblog
Select Distinct		l.*, '',	p.cnsctvo_cdgo_dgtlzdr
From				tblogprocesoscargaimagenes	l
Inner Join			tbProcesosCargaImagenes		p	On	p.cnsctvo_cdgo_prcso_crga_imgn	=	l.cnsctvo_cdgo_prcso_crga_imgn
Where				p.cnsctvo_cdgo_dgtlzdr			=	@cnsctvo_cdgo_dgtlzdr Or @cnsctvo_cdgo_dgtlzdr Is Null
--And				p.cnsctvo_cdgo_prcso_crga_imgn	=	@cnsctvo_cdgo_prcso_crga_imgn	

Update				@tblog
Set					dscrpcn_tpo_errr			=	t.dscrpcn_tpo_errr
From				tbTiposErrorLog_Vigencias	t
Inner Join			@tblog						l	On	l.cnsctvo_cdgo_tpo_errr	=	t.cnsctvo_cdgo_tpo_errr
Where				Getdate()	>=	t.inco_vgnca
And					Getdate()	<=	t.fn_vgnca

Select				cnsctvo_cdgo_lg,		Ltrim(Rtrim(dscrpcn_lg)) As dscrpcn_lg,				dto,
					orgn_dto,				idntfcdr_dto,										cnsctvo_cdgo_tpo_errr,
					fcha_crcn,				dscrpcn_tpo_errr,									cdgo_lg,
					cnsctvo_cdgo_prcso_crga_imgn,												cnsctvo_cdgo_dgtlzdr
From				@tblog





GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarLogProcesosCargaxDigitalizador] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarLogProcesosCargaxDigitalizador] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarLogProcesosCargaxDigitalizador] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarLogProcesosCargaxDigitalizador] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarLogProcesosCargaxDigitalizador] TO [visosservice_role]
    AS [dbo];

