
CREATE Procedure	[dbo].[spGDConsultarProcesosCargaxDigitalizador]
@cnsctvo_cdgo_dgtlzdr		udtConsecutivo	=	Null,
@fcha_inco_crga				Datetime		=	Null,
@fcha_fn_crga				Datetime		=	Null
--@cnsctvo_cdgo_tpo_dcmnto	udtConsecutivo	=	Null

As
Set Nocount On

/*
Declare
@cnsctvo_cdgo_dgtlzdr		udtConsecutivo,
@fcha_inco_crga				Datetime,
@fcha_fn_crga				Datetime,
@cnsctvo_cdgo_tpo_dcmnto	udtConsecutivo


Set	@cnsctvo_cdgo_dgtlzdr		=	4--Null
Set	@fcha_inco_crga				=	'2009/04/01'--Null
Set	@fcha_fn_crga				=	'2009/04/24'--Null
Set	@cnsctvo_cdgo_tpo_dcmnto	=	Null
*/

Declare	@tbprocesoscargasdigitalizador	As Table
(
cnsctvo_cdgo_prcso_crga_imgn	Int,
nmbre_archvo_indce				Varchar(100),
fcha_crga						Datetime,
cntdd_rgstrs_crgds				Int,
estdo							Int,
dscrpcn_estdo					Varchar(20),
cnsctvo_cdgo_dgtlzdr			Int
)

Insert Into			@tbprocesoscargasdigitalizador
Select Distinct		q.cnsctvo_cdgo_prcso_crga_imgn,	'',							Null,
					0,								0,							'',
					q.cnsctvo_cdgo_dgtlzdr
From				dbo.tbProcesosCargaImagenes		q
--Inner Join			dbo.tbRegistrosArchivosIndices	r	On	r.cnsctvo_cdgo_prcso_crga_imgn	=	q.cnsctvo_cdgo_prcso_crga_imgn
Where				((q.cnsctvo_cdgo_dgtlzdr	=	@cnsctvo_cdgo_dgtlzdr)		Or	(@cnsctvo_cdgo_dgtlzdr	Is Null))
And					((q.fcha_crcn	>=	@fcha_inco_crga)						Or	(@fcha_inco_crga	Is Null))
And					((q.fcha_crcn	<=	@fcha_fn_crga)							Or	(@fcha_fn_crga		Is Null))
--And					((r.cnsctvo_cdgo_tpo_dcmnto	=	@cnsctvo_cdgo_tpo_dcmnto)	Or	(@cnsctvo_cdgo_tpo_dcmnto	Is Null))
Group By			q.cnsctvo_cdgo_prcso_crga_imgn,		q.cnsctvo_cdgo_dgtlzdr--r.nmbre_archvo_indce,		r.fcha_crga

Update				@tbprocesoscargasdigitalizador
Set 				nmbre_archvo_indce				=	r.nmbre_archvo_indce,
					fcha_crga						=	r.fcha_fn_prcso
From				@tbprocesoscargasdigitalizador	p
Inner Join			dbo.tbProcesosCargaImagenes	r	On	r.cnsctvo_cdgo_prcso_crga_imgn	=	p.cnsctvo_cdgo_prcso_crga_imgn

Update				@tbprocesoscargasdigitalizador
Set					cntdd_rgstrs_crgds		=	q.cntdd_rgstrs_crgds,
					estdo					=	q.estdo
From				@tbprocesoscargasdigitalizador	p
Inner Join			dbo.tbProcesosCargaImagenes		q	On	q.cnsctvo_cdgo_prcso_crga_imgn	=	p.cnsctvo_cdgo_prcso_crga_imgn

Update				@tbprocesoscargasdigitalizador
Set					dscrpcn_estdo			=	Case	When	estdo	=	1	Then	'Válido'
														When	estdo	=	2	Then	'Inválido'
														Else	'Sin información'
												End

Select				*
From				@tbprocesoscargasdigitalizador




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarProcesosCargaxDigitalizador] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarProcesosCargaxDigitalizador] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarProcesosCargaxDigitalizador] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarProcesosCargaxDigitalizador] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarProcesosCargaxDigitalizador] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarProcesosCargaxDigitalizador] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarProcesosCargaxDigitalizador] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarProcesosCargaxDigitalizador] TO [visosservice_role]
    AS [dbo];

