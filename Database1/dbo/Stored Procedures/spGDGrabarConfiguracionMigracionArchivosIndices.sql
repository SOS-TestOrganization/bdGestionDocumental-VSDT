
-- =============================================
-- Author:		<sisogb01>
-- Create date: <27/04/2009>
-- Description:	<Inserta nuevo registro en la configuracion activa del DTS para migrar indices>
-- =============================================
CREATE PROCEDURE [dbo].[spGDGrabarConfiguracionMigracionArchivosIndices]
		@srvdr_indce				Varchar(150),
		@drccn_archvo_indce			Varchar(150),
		@nmbre_archvo_indce			Varchar(150),
		@srvdr_archvs				Varchar(150)	=	Null,
		@drccn_archvo_fsco			Varchar(150)	=	Null,
		@cnsctvo_cdgo_tpo_dcmnto	Int,
		@cnsctvo_cdgo_dgtlzdr		Int,
		@vldcn_actva				Char(1),
		@usro_crcn					Char(30),
		@fcha						Varchar(10),
		@mlti_tff					Int				=	Null,
		@cnsctvo_cdgo_cnfgrcn		Int	Output

As
Begin
	Set NoCount On

	declare	@fcha_crgda	Datetime
	set		@fcha_crgda	=	Convert(Datetime,@fcha)

	Set @srvdr_archvs		= IsNull(@srvdr_archvs,@srvdr_indce)
	Set @drccn_archvo_fsco	= IsNull(@drccn_archvo_fsco,Replace(@drccn_archvo_indce,'Indexacion','Digitalizacion'))

	Declare @fchaactual Datetime
	Set @fchaactual = getDate()

	Execute [dbo].[spGDTraerParametroGeneral] 
		@lcConsecutivoParametro		= 1,
		@ldFechaReferencia			= @fchaactual,
		@lcTipoParametro			= 'C',
		@lcValorParametroCaracter	= @srvdr_archvs Output
	
	Execute [dbo].[spGDTraerParametroGeneral] 
		@lcConsecutivoParametro		= 1,
		@ldFechaReferencia			= @fchaactual,
		@lcTipoParametro			= 'C',
		@lcValorParametroCaracter	= @srvdr_indce Output


	Insert
	Into	bdGestionDocumental.dbo.tbConfiguracionMigracionArchivosIndices
           (srvdr_archvs,				drccn_archvo_fsco,			fncn_clclo_drccn,
			srvdr_indce,				drccn_archvo_indce,			nmbre_archvo_indce,
			fncn_clclo_drccn_indce,		cnsctvo_cdgo_tpo_dcmnto,	cnsctvo_cdgo_dgtlzdr,
			cnsctvo_imgn_incl,			cnfgrcn_actva_indce,		cnfgrcn_actva_mgrcn,
			vldcn_actva,				estdo_mgrcn,				fcha_rta_fsco,
			fcha_rta_indce,				usro_crcn,					fcha_crcn,
			vsble_usro,					fcha_crgda,					crga_mlti_tff)
     Values
           (@srvdr_archvs,				@drccn_archvo_fsco,			Null,
			@srvdr_indce,				@drccn_archvo_indce,		@nmbre_archvo_indce,
			Null,						@cnsctvo_cdgo_tpo_dcmnto,	@cnsctvo_cdgo_dgtlzdr,
			0,							'S',				        'S',
			@vldcn_actva,				0,							Null,
			Null,						@usro_crcn,					GetDate(),
			'S',						@fcha_crgda,				@mlti_tff)

	Select	@cnsctvo_cdgo_cnfgrcn	=	Max(cnsctvo_cdgo_cnfgrcn)
	From	bdGestionDocumental.dbo.tbConfiguracionMigracionArchivosIndices
	Where	cnsctvo_cdgo_tpo_dcmnto	=	@cnsctvo_cdgo_tpo_dcmnto
	And		cnsctvo_cdgo_dgtlzdr	=	@cnsctvo_cdgo_dgtlzdr
	And		nmbre_archvo_indce		=	@nmbre_archvo_indce
End


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarConfiguracionMigracionArchivosIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarConfiguracionMigracionArchivosIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarConfiguracionMigracionArchivosIndices] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarConfiguracionMigracionArchivosIndices] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarConfiguracionMigracionArchivosIndices] TO [visosservice_role]
    AS [dbo];

