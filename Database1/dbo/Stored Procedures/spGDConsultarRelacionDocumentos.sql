


CREATE Procedure	[dbo].[spGDConsultarRelacionDocumentos]
@cnsctvo_cdgo_imgn		Int

As
Set Nocount On

Declare	@cnsctvo_cdgo_indce		Int,
		@vlr_indce				Varchar(30)

Select	@cnsctvo_cdgo_indce		=	cnsctvo_cdgo_indce
From	dbo.tbImagenesIndexadas
Where	cnsctvo_cdgo_imgn		=	@cnsctvo_cdgo_imgn

If @cnsctvo_cdgo_indce	=	1
	Begin
		Select		@vlr_indce	=	nmro_idntfccn
		From		dbo.tbImagenesIndexadas
		Where		cnsctvo_cdgo_indce	=	1
		And			cnsctvo_cdgo_imgn	=	@cnsctvo_cdgo_imgn

		Select		nmbre_imgn,					nmro_idntfccn,			nmro_fctra,				indice_3 as nmro_rdccn,
					indice_4 as nmro_atncn,		rta_fnl_imgn+Convert(Varchar(10),cnsctvo_imgn)+Ltrim(Rtrim(extnsn_imgn)) as rta_mstrr_imgn,
					i.dscrpcn_tpo_indce,			d.cnsctvo_imgn_pr_crtla
		From		dbo.tbImagenesIndexadas		d
		Inner Join	dbo.tbTiposIndices			i	On	i.cnsctvo_cdgo_tpo_indce	=	d.cnsctvo_cdgo_indce	
		Where		d.cnsctvo_cdgo_indce	=	1
		And			nmro_idntfccn		=	@vlr_indce
		And			crtla				=	'N'
		Order By	cnsctvo_imgn_pr_crtla

	End

If @cnsctvo_cdgo_indce	=	2
	Begin
		Select	@vlr_indce	=	indice_3
		From	dbo.tbImagenesIndexadas
		Where	cnsctvo_cdgo_indce	=	2
		And		cnsctvo_cdgo_imgn	=	@cnsctvo_cdgo_imgn

		Select		nmbre_imgn,					nmro_idntfccn,			nmro_fctra,				indice_3 as nmro_rdccn,
					indice_4 as nmro_atncn,		rta_fnl_imgn+Convert(Varchar(10),cnsctvo_imgn)+Ltrim(Rtrim(extnsn_imgn)) as rta_mstrr_imgn,
					i.dscrpcn_tpo_indce,			cnsctvo_imgn_pr_crtla
		From		dbo.tbImagenesIndexadas		d
		Inner Join	dbo.tbTiposIndices			i	On	i.cnsctvo_cdgo_tpo_indce	=	d.cnsctvo_cdgo_indce	
		Where		d.cnsctvo_cdgo_indce	=	2
		And			indice_3			=	@vlr_indce
		And			crtla				=	'N'
		Order By	cnsctvo_imgn_pr_crtla
	End


If @cnsctvo_cdgo_indce	=	3
	Begin
		Select	@vlr_indce	=	nmro_fctra
		From	dbo.tbImagenesIndexadas
		Where	cnsctvo_cdgo_indce	=	3
		And		cnsctvo_cdgo_imgn	=	@cnsctvo_cdgo_imgn

		Select		nmbre_imgn,					nmro_idntfccn,			nmro_fctra,				indice_3 as nmro_rdccn,
					indice_4 as nmro_atncn,		rta_fnl_imgn+Convert(Varchar(10),cnsctvo_imgn)+Ltrim(Rtrim(extnsn_imgn)) as rta_mstrr_imgn,
					i.dscrpcn_tpo_indce,			cnsctvo_imgn_pr_crtla
		From		dbo.tbImagenesIndexadas		d
		Inner Join	dbo.tbTiposIndices			i	On	i.cnsctvo_cdgo_tpo_indce	=	d.cnsctvo_cdgo_indce	
		Where		d.cnsctvo_cdgo_indce	=	3
		And			nmro_fctra			=	@vlr_indce
		And			crtla				=	'N'
		Order By	cnsctvo_imgn_pr_crtla
	End


If @cnsctvo_cdgo_indce	=	4
	Begin
		Select	@vlr_indce	=	indice_4
		From	dbo.tbImagenesIndexadas
		Where	cnsctvo_cdgo_indce	=	4
		And		cnsctvo_cdgo_imgn	=	@cnsctvo_cdgo_imgn

		Select		nmbre_imgn,					nmro_idntfccn,			nmro_fctra,				indice_3 as nmro_rdccn,
					indice_4 as nmro_atncn,		rta_fnl_imgn+Convert(Varchar(10),cnsctvo_imgn)+Ltrim(Rtrim(extnsn_imgn)) as rta_mstrr_imgn,
					i.dscrpcn_tpo_indce,			cnsctvo_imgn_pr_crtla
		From		dbo.tbImagenesIndexadas		d
		Inner Join	dbo.tbTiposIndices			i	On	i.cnsctvo_cdgo_tpo_indce	=	d.cnsctvo_cdgo_indce	
		Where		d.cnsctvo_cdgo_indce	=	3
		And			indice_4			=	@vlr_indce
		And			crtla				=	'N'
		Order By	cnsctvo_imgn_pr_crtla
	End



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRelacionDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRelacionDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRelacionDocumentos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRelacionDocumentos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRelacionDocumentos] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRelacionDocumentos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRelacionDocumentos] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRelacionDocumentos] TO [visosservice_role]
    AS [dbo];

