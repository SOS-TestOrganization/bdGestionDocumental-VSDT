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
CREATE Procedure [dbo].[spGDConsultaDocumentosAfiliacion]
/*1*/	@lcNumeroIdentificacion			Varchar(23)		= Null,
/*2*/	@lcNumeroFormulario				Varchar(23)		= Null,
/*3*/	@lcNumeroNovedad				Varchar(23)		= Null,
/*4*/	@lnConsecutivoTipoDocumental	Int				= Null,
/*5*/	@lcNumeroBolsa					Varchar(23)		= Null,
/*6*/	@ldFechaInicioDigitalizacion	Datetime		= Null,
/*7*/	@ldFechaFinDigitalizacion		Datetime		= Null,
/*8*/	@lcError						Varchar(2)		Output

As

Set NoCount On

Declare @lnConsecutivoAgrupadorDocumentos	tinyint

Set @lnConsecutivoAgrupadorDocumentos = 1 --Afiliacion

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
		tpo_frmlro				udtDescripcion,
		nmro_frmlro				udtNumeroFormulario,
		nmro_nvdd				udtNumeroFormulario,
		tpo_idntfccn			Char(2))

Declare @tmpConsecutivosDocumentos Table(cnsctvo_cdgo_dcmnto udtConsecutivo)

If @lcNumeroNovedad	Is Not Null
	Begin
		Insert Into	@tmpConsecutivosDocumentos
		Select	cnsctvo_cdgo_dcmnto
		From	tbIndicesxDocumentosDigitalizados a
		Where	a.cnsctvo_cdgo_tpo_indce	=	13	-- Numero de Novedad
		And		a.vlr						=	@lcNumeroNovedad -- Aplica como Numero de Novedad
		And		a.cnsctvo_cdgo_tpo_dcmntl	=   8	-- Novedades
		
		If @@Error != 0
			Set @lcError = '1'
	End

If @lcNumeroFormulario	Is Not Null
	Begin
		Insert Into	@tmpConsecutivosDocumentos
		Select	cnsctvo_cdgo_dcmnto
		From	tbIndicesxDocumentosDigitalizados a
		Where	a.cnsctvo_cdgo_tpo_indce	=	10
		And		a.vlr						=	@lcNumeroFormulario
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
			Where	a.cnsctvo_cdgo_tpo_indce	=	1
			And		a.vlr						=	@lcNumeroIdentificacion
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
				Where	a.cnsctvo_cdgo_tpo_indce	=	14
				And		a.vlr						=	@lcNumeroBolsa
				And		Exists (Select 1 
								From	tbTiposDocumento b 
								Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
								And		b.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos)	

				If @@Error != 0
					Set @lcError = '1'
			End

If @lcNumeroFormulario Is Null And  @lcNumeroBolsa Is Null And @lcNumeroIdentificacion Is Null And @lcNumeroNovedad is Null
	Begin
		Insert Into	@tmpDocumentos
		Select	a. cnsctvo_cdgo_dcmnto,		b.dscrpcn_dgtlzdr,		d.dscrpcn_tpo_dcmnto, 
				a.fcha_dgtlzcn,				space(30) as blsa,		space(23) as nmro_idntfccn,
				space(15)  as nmro_frmlro,	space(15) as nmro_nvdd,	space(2) as tpo_idntfccn ,
				space(15) as tpo_frmlro
		From	dbo.tbDocumentosDigitalizados a
			Inner Join	dbo.tbDigitalizadores b On (a.cnsctvo_cdgo_dgtlzdr		= b.cnsctvo_cdgo_dgtlzdr)
			Inner Join	dbo.tbTiposDocumento d	On (a.cnsctvo_cdgo_tpo_dcmntl	= d.cnsctvo_cdgo_tpo_dcmnto)
		Where	fcha_dgtlzcn Between @ldFechaInicioDigitalizacion And @ldFechaFinDigitalizacion
		And		(a.cnsctvo_cdgo_tpo_dcmntl	= @lnConsecutivoTipoDocumental Or @lnConsecutivoTipoDocumental Is Null)
		And		d.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos

		If @@Error != 0
			Set @lcError = '1'
	End
Else
	Begin
		Insert Into	@tmpDocumentos
		Select	a. cnsctvo_cdgo_dcmnto,		b.dscrpcn_dgtlzdr,		d.dscrpcn_tpo_dcmnto, 
				a.fcha_dgtlzcn,				space(30) as blsa,		space(23) as nmro_idntfccn,
				space(15)  as nmro_frmlro,	space(15) as nmro_nvdd,	space(2) as tpo_idntfccn,
				space(15) as tpo_frmlro  
		From	dbo.tbDocumentosDigitalizados a
			Inner Join	dbo.tbDigitalizadores b On (a.cnsctvo_cdgo_dgtlzdr		= b.cnsctvo_cdgo_dgtlzdr)
			Inner Join	dbo.tbTiposDocumento d	On (a.cnsctvo_cdgo_tpo_dcmntl	= d.cnsctvo_cdgo_tpo_dcmnto)
		Where	fcha_dgtlzcn Between @ldFechaInicioDigitalizacion And @ldFechaFinDigitalizacion
		And		(a.cnsctvo_cdgo_tpo_dcmntl = @lnConsecutivoTipoDocumental Or @lnConsecutivoTipoDocumental Is Null)
		And		Exists (Select 1 From @tmpConsecutivosDocumentos e Where a.cnsctvo_cdgo_dcmnto = e.cnsctvo_cdgo_dcmnto)
		And		d.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos
		
		If @@Error != 0
			Set @lcError = '1'
	End

Update	@tmpDocumentos
Set		blsa =(Select	ltrim(rtrim(vlr))
					From	tbIndicesxDocumentosDigitalizados b
					Where	b.cnsctvo_cdgo_tpo_indce	= 14
					And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From	@tmpDocumentos a

If @@Error != 0
	Set @lcError = '1'

Update	@tmpDocumentos
Set	tpo_frmlro =(Select	ltrim(rtrim(vlr))
				From	tbIndicesxDocumentosDigitalizados b
				Where	b.cnsctvo_cdgo_tpo_indce	= 11 -- Tipo Formulario
				And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From	@tmpDocumentos a

If @@Error != 0
	Set @lcError = '1'

Update	@tmpDocumentos
Set	nmro_frmlro =(Select	ltrim(rtrim(vlr))
				From	tbIndicesxDocumentosDigitalizados b
				Where	b.cnsctvo_cdgo_tpo_indce	= 10 -- Número Formulario
				And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From	@tmpDocumentos a

If @@Error != 0
	Set @lcError = '1'

Update	@tmpDocumentos
Set nmro_nvdd =(Select	ltrim(rtrim(vlr))
			From	tbIndicesxDocumentosDigitalizados b
			Where	b.cnsctvo_cdgo_tpo_indce	= 13
			And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From	@tmpDocumentos a

If @@Error != 0
	Set @lcError = '1'

Update	@tmpDocumentos
Set	nmro_idntfccn =(Select	max(ltrim(rtrim(vlr)))
				From	tbIndicesxDocumentosDigitalizados b
				Where	b.cnsctvo_cdgo_tpo_indce	= 1
				And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From	@tmpDocumentos a

If @@Error != 0
	Set @lcError = '1'

Update	@tmpDocumentos
Set	tpo_idntfccn =(Select	max(ltrim(rtrim(vlr)))
				From	tbIndicesxDocumentosDigitalizados b
				Where	b.cnsctvo_cdgo_tpo_indce	= 7 -- Tipo Identificación
				And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From	@tmpDocumentos a

If @@Error != 0
	Set @lcError = '1'

Select top 2000 a.*, i.dscrpcn_tpo_imgn, b.rta_imgn, b.prncpl
From		@tmpDocumentos a
	Inner Join	tbImagenesxDocumentosDigitalizados b	On a.cnsctvo_cdgo_dcmnto	= b.cnsctvo_cdgo_dcmnto
	Inner Join	tbTiposImagenes i						On b.cnsctvo_cdgo_tpo_imgn	= i.cnsctvo_cdgo_tpo_imgn
Order by a.fcha_dgtlzcn Desc













GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAfiliacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAfiliacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAfiliacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAfiliacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAfiliacion] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAfiliacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAfiliacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAfiliacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAfiliacion] TO [visosservice_role]
    AS [dbo];

