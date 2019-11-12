Create Procedure	[guest].spGDHomologarConsecutivoSedeIndices
@cnsctvo_cdgo_prcso_crga_imgn	Int,
@cnsctvo_cdgo_tpo_dcmnto		Int

As
Set Nocount On

If	@cnsctvo_cdgo_tpo_dcmnto	=	1
	Begin
		Update		tbRegistrosArchivosIndices
		Set			indce3		=	Convert(VarChar(2),s.cnsctvo_cdgo_sde)
		From		tbRegistrosArchivosIndices				r
		Inner Join	bdAfiliacion.dbo.tbSedes_vigencias		s	On	Ltrim(Rtrim(s.dscrpcn_sde))		Like	'%'+Ltrim(Rtrim(r.indce3))+'%'
		And			r.cnsctvo_cdgo_tpo_dcmnto		=	@cnsctvo_cdgo_tpo_dcmnto
		And			r.cnsctvo_cdgo_prcso_crga_imgn	=	@cnsctvo_cdgo_prcso_crga_imgn
	End