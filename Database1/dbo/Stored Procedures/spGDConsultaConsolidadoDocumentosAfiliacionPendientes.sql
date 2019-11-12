/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDConsultaDocumentosAfiliacion
* Desarrollado por		 :  <\A   Ing. Samuel Muñoz		A\>
* Descripcion			 :  <\D  						D\>
* Observaciones		     :  <\O							O\>
* Parametros			 :  <\P   						P\>
* Variables				 :  <\V							V\>
* Fecha Creacion		 :  <\FC 20090318     			FC\>
*  
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM   AM\>
* Descripcion			 : <\DM   DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM   FM\>
*---------------------------------------------------------------------------------*/
--exec spGDConsultaConsolidadoDocumentosAfiliacionPendientes null, null, null, null, null, null, '29916', null, null, null
CREATE Procedure [dbo].[spGDConsultaConsolidadoDocumentosAfiliacionPendientes]
/* 1 */		@lnConsecutivoTipoId			int				= Null, 
/* 2 */		@lcNumeroIdentificacion			Varchar(23)		= Null,
/* 3 */		@lcNumeroFormulario				Varchar(23)		= Null,
/* 4 */		@lcNumeroNovedad				Varchar(23)		= Null, 
/* 5 */		@lcNumeroSolicitud				Varchar(30)		= Null, 
/* 6 */		@lnConsecutivoTipoDocumental	int				= Null,
/* 7 */		@lcNumeroBolsa					Varchar(23)		= Null,
/* 8 */		@ldFechaInicioDigitalizacion	Datetime		= Null,
/* 9 */		@ldFechaFinDigitalizacion		Datetime		= Null,
/* 10 */	@lcError						Varchar(2)	Output
As
BEGIN
	Set NoCount On
	
	SET DATEFORMAT ymd;

	Declare @nmro_unco_idntfccn				int
	
	Set @lcError = '0' -- Ok
	
	--Posibilitar la consulta de todos.
	If @lcNumeroBolsa = '0'
		Set @lcNumeroBolsa = null
	
	Declare @tmpBeneficiarios Table(codiTipoId varchar(10), numeroId varchar(50), cnsctvo_cdgo_dcmnto int)
	
	Declare @tmpConseDocumentos Table(cnsctvo_cdgo_dcmnto int, blsa varchar(20), codiTipoId varchar(10), numeroId varchar(50))
	
	Declare @tmpDocumentos Table(
		cnsctvo_cdgo_dcmnto		udtConsecutivo,
		dscrpcn_dgtlzdr			udtDescripcion,		
		dscrpcn_tpo_dcmnto		udtDescripcion, 
		fcha_dgtlzcn			Datetime,				
		blsa					udtDescripcion,		
		nmro_idntfccn			udtNumeroIdentificacion,
		tpo_frmlro				udtDescripcion,
		nmro_frmlro				udtNumeroFormulario,
		nmro_nvdd				udtNumeroFormulario, 
		nmro_slctd				varchar(30), 
		tpo_idntfccn			Char(3),
		nmro_imgns				Int)
	
		
	-- Adicionado Cesar Garcia
	Insert Into		@tmpConseDocumentos
	Select			a.cnsctvo_cdgo_dcmnto, a.vlr, '', ''
	From			tbIndicesxDocumentosDigitalizados	a
	Where			a.cnsctvo_cdgo_tpo_indce	=	14
	And				a.cnsctvo_cdgo_tpo_dcmntl	=	4
	And				a.vlr						=	@lcNumeroBolsa

	Update			@tmpConseDocumentos
	Set				codiTipoId	=	i.vlr
	From			tbIndicesxDocumentosDigitalizados	i
	Inner Join		@tmpConseDocumentos					t	On	t.cnsctvo_cdgo_dcmnto = i.cnsctvo_cdgo_dcmnto
	Where			i.cnsctvo_cdgo_tpo_indce	=	7
	And				i.cnsctvo_cdgo_tpo_dcmntl	=	4
	
	Update			@tmpConseDocumentos
	Set				numeroId	=	i.vlr
	From			tbIndicesxDocumentosDigitalizados	i
	Inner Join		@tmpConseDocumentos					t	On	t.cnsctvo_cdgo_dcmnto = i.cnsctvo_cdgo_dcmnto
	Where			i.cnsctvo_cdgo_tpo_indce	=	1
	And				i.cnsctvo_cdgo_tpo_dcmntl	=	4

	Insert Into		@tmpBeneficiarios
	Select			i.cdgo_tpo_idntfccn, v.nmro_idntfccn, x.cnsctvo_cdgo_dcmnto
	From			bdConsulta.dbo.tbBeneficiarios			b
	Inner Join		bdConsulta.dbo.tbPersonas				p	On	b.nmro_unco_idntfccn_bnfcro	=	p.nmro_unco_idntfccn
	Inner Join		bdConsulta.dbo.tbContratos				c	On	b.cnsctvo_cdgo_tpo_cntrto	=	c.cnsctvo_cdgo_tpo_cntrto
																And b.nmro_cntrto= c.nmro_cntrto
	Inner Join		bdConsulta.dbo.tbVinculados				v	On	c.nmro_unco_idntfccn_afldo	=	v.nmro_unco_idntfccn
	Inner Join		bdAfiliacion.dbo.tbTiposIdentificacion	i	On	i.cnsctvo_cdgo_tpo_idntfccn	=	v.cnsctvo_cdgo_tpo_idntfccn
	Inner Join		@tmpConseDocumentos						x	On	x.numeroId					=	v.nmro_idntfccn
																--And	x.codiTipoId				=	i.cdgo_tpo_idntfccn
	Where			b.cnsctvo_cdgo_tpo_cntrto	= 1
	And				b.fn_vgnca_bnfcro			= '9999-12-31'
	And				p.fcha_ncmnto				> '2002-12-31'

	-- Adicionado Cesar Garcia
	
	Insert Into @tmpDocumentos
	Select	a. cnsctvo_cdgo_dcmnto,		b.dscrpcn_dgtlzdr,			d.dscrpcn_tpo_dcmnto, 
			a.fcha_dgtlzcn,				space(30) as blsa,			space(23) as nmro_idntfccn,
			space(15) as tpo_frmlro,	space(15)  as nmro_frmlro,	space(15) as nmro_nvdd, 
			space(30) as nmro_slctd,	space(2) as tpo_idntfccn,	a.nmro_imgns		
	From		dbo.tbDocumentosDigitalizados a
	Inner Join	dbo.tbDigitalizadores b On (a.cnsctvo_cdgo_dgtlzdr		= b.cnsctvo_cdgo_dgtlzdr)
	Inner Join	dbo.tbTiposDocumento d	On (a.cnsctvo_cdgo_tpo_dcmntl	= d.cnsctvo_cdgo_tpo_dcmnto)
	Where Exists (Select 1 From @tmpBeneficiarios e Where a.cnsctvo_cdgo_dcmnto = e.cnsctvo_cdgo_dcmnto)

	If @@Error != 0
		Set @lcError = '1'
	
	Update	@tmpDocumentos
	Set		blsa =(Select max(ltrim(rtrim(vlr)))
				From	tbIndicesxDocumentosDigitalizados b
				Where	b.cnsctvo_cdgo_tpo_indce	= 14
				And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From	@tmpDocumentos a

	If @@Error != 0
		Set @lcError = '1'

	Update	@tmpDocumentos
	Set		tpo_frmlro =(Select max(ltrim(rtrim(vlr)))
						From	tbIndicesxDocumentosDigitalizados b
						Where	b.cnsctvo_cdgo_tpo_indce	= 11 -- Tipo Formulario
						And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From	@tmpDocumentos a

	If @@Error != 0
		Set @lcError = '1'

	Update	@tmpDocumentos
	Set		nmro_frmlro =(Select max(ltrim(rtrim(vlr)))
						From tbIndicesxDocumentosDigitalizados b
						Where b.cnsctvo_cdgo_tpo_indce	= 10
						And b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From	@tmpDocumentos a

	If @@Error != 0
		Set @lcError = '1'

	Update	@tmpDocumentos
	Set		nmro_nvdd =(Select max(ltrim(rtrim(vlr)))
						From tbIndicesxDocumentosDigitalizados b
						Where b.cnsctvo_cdgo_tpo_indce	= 13
						And b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From	@tmpDocumentos a

	If @@Error != 0
		Set @lcError = '1'

	Update	@tmpDocumentos
	Set		nmro_slctd =(Select	max(ltrim(rtrim(vlr)))
						From tbIndicesxDocumentosDigitalizados b
						Where b.cnsctvo_cdgo_tpo_indce	= 24
						And b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From	@tmpDocumentos a

	If @@Error != 0
		Set @lcError = '1'


	Update	@tmpDocumentos
	Set		nmro_idntfccn =(Select max(ltrim(rtrim(vlr)))
							From tbIndicesxDocumentosDigitalizados b
							Where b.cnsctvo_cdgo_tpo_indce	= 1
							And b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From	@tmpDocumentos a

	If @@Error != 0
		Set @lcError = '1'

	Update	@tmpDocumentos
	Set		tpo_idntfccn =(Select max(ltrim(rtrim(vlr)))
							From tbIndicesxDocumentosDigitalizados b
							Where b.cnsctvo_cdgo_tpo_indce	= 7 -- Tipo Identificación
							And b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From	@tmpDocumentos a

	If @@Error != 0
		Set @lcError = '1'

--------------------------
	Select	* 
	From	@tmpDocumentos a
	--Order by a.fcha_dgtlzcn Desc

END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoDocumentosAfiliacionPendientes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoDocumentosAfiliacionPendientes] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoDocumentosAfiliacionPendientes] TO [visosservice_role]
    AS [dbo];

