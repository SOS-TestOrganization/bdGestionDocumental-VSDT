/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDConsultaDocumentosAutoliquidacion
* Desarrollado por		 :  <\A   Ing. Samuel Muñoz		A\>
* Descripcion			 :  <\D  						D\>
* Observaciones		     :  <\O							O\>
* Parametros			 :  <\P   						P\>
* Variables				 :  <\V							V\>
* Fecha Creacion		 :  <\FC 20090318     			FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM   AM\>
* Descripcion			 : <\DM   DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM   FM\>
*---------------------------------------------------------------------------------*/
CREATE Procedure [dbo].[spGDConsultaDocumentosAutoliquidacion]
/*1*/	@lcNumeroIdentificacion			Varchar(23)		= Null,
/*2*/	@lcNumeroPlanilla				Varchar(23)		= Null,
/*3*/	@lnConsecutivoTipoDocumental	Int				= Null,
/*4*/	@lcNumeroBolsa					Varchar(23)		= Null,
/*5*/	@ldFechaInicioDigitalizacion	Datetime		= Null,
/*6*/	@ldFechaFinDigitalizacion		Datetime		= Null,
/*7*/	@lcError						Varchar(2)		Output
As
Set NoCount On

Declare @lnConsecutivoAgrupadorDocumentos	tinyint

Set @lnConsecutivoAgrupadorDocumentos = 3 -- Autoliquidaciones

Set @lcError = '0' -- Ok

If @ldFechaInicioDigitalizacion	Is Null 
	Set @ldFechaInicioDigitalizacion = '1995-01-01'

If @ldFechaFinDigitalizacion	Is Null 
	Set @ldFechaFinDigitalizacion = '9999-12-31'

Declare @tmpDocumentos Table(
		cnsctvo_cdgo_dcmnto		udtConsecutivo,
		dscrpcn_dgtlzdr			udtDescripcion,		
		dscrpcn_tpo_dcmnto		udtDescripcion, 
		fcha_dgtlzcn			Datetime,				
		blsa					udtDescripcion,		
		nmro_idntfccn			udtNumeroIdentificacion,
		nmro_plnlla				udtNumeroFormulario,
		tpo_idntfccn			char(2))

Declare @tmpConsecutivosDocumentos Table(cnsctvo_cdgo_dcmnto udtConsecutivo)

If @lcNumeroPlanilla	Is Not Null
	Begin
		Insert Into	@tmpConsecutivosDocumentos
		Select	cnsctvo_cdgo_dcmnto
		From	tbIndicesxDocumentosDigitalizados a
		Where	cnsctvo_cdgo_tpo_indce	=	12
		And		vlr						=	@lcNumeroPlanilla
		And		Exists (Select 1 
							From	tbTiposDocumento b 
							Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
							And		b.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos)	

		If @@Error != 0
			Set @lcError = '1'
	End
Else
	If @lcNumeroIdentificacion Is Not Null
		Begin
			Insert Into	@tmpConsecutivosDocumentos
			Select	cnsctvo_cdgo_dcmnto
			From	tbIndicesxDocumentosDigitalizados a
			Where	cnsctvo_cdgo_tpo_indce	=	1
			And		vlr						=	@lcNumeroIdentificacion
			And		Exists (Select 1 
							From	tbTiposDocumento b 
							Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
							And		b.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos)	

			If @@Error != 0
				Set @lcError = '1'
		End
	Else
		If @lcNumeroBolsa Is Not Null
			Begin
				Insert Into	@tmpConsecutivosDocumentos
				Select	cnsctvo_cdgo_dcmnto
				From	tbIndicesxDocumentosDigitalizados a
				Where	cnsctvo_cdgo_tpo_indce	=	14
				And		vlr						=	@lcNumeroBolsa
				And		Exists (Select 1 
							From	tbTiposDocumento b 
							Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
							And		b.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos)	

				If @@Error != 0
					Set @lcError = '1'
			End

If @lcNumeroPlanilla Is Null And  @lcNumeroBolsa Is Null And @lcNumeroIdentificacion Is Null
	Begin
		Insert Into	@tmpDocumentos
		Select		a. cnsctvo_cdgo_dcmnto,			b.dscrpcn_dgtlzdr,			d.dscrpcn_tpo_dcmnto, 
					a.fcha_dgtlzcn,					space(30) as blsa,			space(23) as nmro_idntfccn,
					space(15)  as nmro_plnlla,		space(2) as tpo_idntfccn 
		From		dbo.tbDocumentosDigitalizados a
		Inner Join	dbo.tbDigitalizadores b On (a.cnsctvo_cdgo_dgtlzdr		= b.cnsctvo_cdgo_dgtlzdr)
		Inner Join	dbo.tbTiposDocumento d	On (a.cnsctvo_cdgo_tpo_dcmntl	= d.cnsctvo_cdgo_tpo_dcmnto)
		Where		fcha_dgtlzcn Between @ldFechaInicioDigitalizacion And @ldFechaFinDigitalizacion
		And			(a.cnsctvo_cdgo_tpo_dcmntl	= @lnConsecutivoTipoDocumental Or @lnConsecutivoTipoDocumental Is Null)
		And			d.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos

		If @@Error != 0
			Set @lcError = '1'
	End
Else
	Begin
		Insert Into		@tmpDocumentos
		Select		a. cnsctvo_cdgo_dcmnto,			b.dscrpcn_dgtlzdr,			d.dscrpcn_tpo_dcmnto, 
					a.fcha_dgtlzcn,					space(30) as blsa,			space(23) as nmro_idntfccn,
					space(15)  as nmro_plnlla,		space(2) as tpo_idntfccn  
		From		dbo.tbDocumentosDigitalizados a
			Inner Join	dbo.tbDigitalizadores b On (a.cnsctvo_cdgo_dgtlzdr		= b.cnsctvo_cdgo_dgtlzdr)
			Inner Join	dbo.tbTiposDocumento d	On (a.cnsctvo_cdgo_tpo_dcmntl	= d.cnsctvo_cdgo_tpo_dcmnto)
		Where		fcha_dgtlzcn Between @ldFechaInicioDigitalizacion And @ldFechaFinDigitalizacion
		And			(a.cnsctvo_cdgo_tpo_dcmntl = @lnConsecutivoTipoDocumental Or @lnConsecutivoTipoDocumental Is Null)
		And			Exists (Select 1 From @tmpConsecutivosDocumentos e Where a.cnsctvo_cdgo_dcmnto = e.cnsctvo_cdgo_dcmnto)
		And			d.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos
				
		If @@Error != 0
			Set @lcError = '1'
	End

Update	@tmpDocumentos
Set	blsa =(Select	ltrim(rtrim(vlr))
		From	tbIndicesxDocumentosDigitalizados b
		Where	b.cnsctvo_cdgo_tpo_indce	= 14 --Bolsa
		And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From	@tmpDocumentos a

If @@Error != 0
	Set @lcError = '1'

Update	@tmpDocumentos
Set	nmro_plnlla =(Select	ltrim(rtrim(vlr))
				From	tbIndicesxDocumentosDigitalizados b
				Where	b.cnsctvo_cdgo_tpo_indce	= 12 -- Número Planilla
				And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From	@tmpDocumentos a

If @@Error != 0
	Set @lcError = '1'

Update	@tmpDocumentos
Set	nmro_idntfccn =(Select	ltrim(rtrim(vlr))
				From	tbIndicesxDocumentosDigitalizados b
				Where	b.cnsctvo_cdgo_tpo_indce	= 1 -- Númmero Identificación
				And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From	@tmpDocumentos a

If @@Error != 0
	Set @lcError = '1'


Update	@tmpDocumentos
Set	tpo_idntfccn =(Select	ltrim(rtrim(vlr))
				From	tbIndicesxDocumentosDigitalizados b
				Where	b.cnsctvo_cdgo_tpo_indce	= 7 -- Tipo Identificación
				And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From	@tmpDocumentos a

If @@Error != 0
	Set @lcError = '1'

Select	top 2000 a.*, i.dscrpcn_tpo_imgn, b.rta_imgn, b.prncpl
From		@tmpDocumentos a
Inner Join	tbImagenesxDocumentosDigitalizados b	On a.cnsctvo_cdgo_dcmnto	= b.cnsctvo_cdgo_dcmnto
Inner Join	tbTiposImagenes i						On b.cnsctvo_cdgo_tpo_imgn	= i.cnsctvo_cdgo_tpo_imgn
Order by a.fcha_dgtlzcn Desc



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAutoliquidacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAutoliquidacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAutoliquidacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAutoliquidacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAutoliquidacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAutoliquidacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAutoliquidacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAutoliquidacion] TO [visosservice_role]
    AS [dbo];

