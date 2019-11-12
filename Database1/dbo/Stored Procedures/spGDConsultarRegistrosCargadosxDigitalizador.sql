

CREATE Procedure	[dbo].[spGDConsultarRegistrosCargadosxDigitalizador]
@cnsctvo_cdgo_dgtlzdr	Int
--@nmbre_archvo_indce		Varchar(100)

As
Set Nocount On


Declare		@srvdr						VarChar(50),
			@cnsctvo_cdgo_prmtro_gnrl	Int

/*
Declare	@cnsctvo_cdgo_dgtlzdr		Int,
Set		@cnsctvo_cdgo_dgtlzdr	=	9
*/

Set			@cnsctvo_cdgo_prmtro_gnrl	=	1

select	@srvdr	=	LTrim(Rtrim(vlr_prmtro_crctr))
From	tbParametrosGenerales_Vigencias	With(NoLock)
Where	cnsctvo_cdgo_prmtro_gnrl	=	@cnsctvo_cdgo_prmtro_gnrl


Declare	@tbregistros As Table
(
cnsctvo_cdgo_prcso_crga_imgn	Int,
nmbre_archvo_indce				Varchar(150),
cntdd_rgstrs_crgds				Int,
cnsctvo_cdgo_dgtlzdr			Int,
cnsctvo_cdgo_tpo_dcmnto			Int,
estdo_crga						Int,
crga_mlti_tff					Int,
rta_archvo_indce				Varchar(150)
)

Insert Into			@tbregistros
Select Distinct		cnsctvo_cdgo_prcso_crga_imgn,		Ltrim(Rtrim(nmbre_archvo_indce)),
					cntdd_rgstrs_crgds,					cnsctvo_cdgo_dgtlzdr,
					cnsctvo_cdgo_tpo_dcmnto,			0,
					0,									NULL
From				dbo.tbProcesosCargaImagenes	With(NoLock)
Where				cnsctvo_cdgo_dgtlzdr	=	@cnsctvo_cdgo_dgtlzdr
--Group By			Ltrim(Rtrim(nmbre_archvo_indce)),
--					cntdd_rgstrs_crgds,
--					cnsctvo_cdgo_dgtlzdr,
--					cnsctvo_cdgo_tpo_dcmnto

Update				@tbregistros
Set					estdo_crga			=	a.estdo_mgrcn,
					crga_mlti_tff		=	a.crga_mlti_tff,
					rta_archvo_indce	=	@srvdr+a.drccn_archvo_indce
From				dbo.tbConfiguracionMigracionArchivosIndices		a	With(NoLock)
Inner Join			@tbregistros									b	On	b.cnsctvo_cdgo_prcso_crga_imgn	=	a.cnsctvo_cdgo_prcso_crga

Select				cnsctvo_cdgo_prcso_crga_imgn,		nmbre_archvo_indce,			cntdd_rgstrs_crgds,			cnsctvo_cdgo_dgtlzdr,
					cnsctvo_cdgo_tpo_dcmnto,			estdo_crga,					crga_mlti_tff,				rta_archvo_indce
From				@tbregistros
Where				estdo_crga	In	(0,2)
Order By			cnsctvo_cdgo_prcso_crga_imgn
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosCargadosxDigitalizador] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosCargadosxDigitalizador] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosCargadosxDigitalizador] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosCargadosxDigitalizador] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosCargadosxDigitalizador] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosCargadosxDigitalizador] TO [visosservice_role]
    AS [dbo];

