/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDConsultaDocumentosNotificacion
* Desarrollado por		 :  <\A   Ing. Jorge Marcos Rincón Árdila	A\>
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
CREATE Procedure [dbo].[spGDConsultaDocumentosNotificacion]
/*1*/	@lcNumeroIdentificacion			Varchar(23)		= Null, 
/*2*/	@lcNumeroNotificacion			Varchar(23)		= Null, 
/*3*/	@lcNumeroActa					Varchar(23)		= Null, 
/*4*/	@lnConsecutivoTipoDocumental	Int				= Null, 
/*5*/	@lnConsecutivoSede				Int				= Null, 
/*6*/	@lcNumeroBolsa					Varchar(23)		= Null, 
/*7*/	@ldFechaInicioDigitalizacion	Datetime		= Null, 
/*8*/	@ldFechaFinDigitalizacion		Datetime		= Null, 
/*9*/	@lcError						Varchar(2)		Output 
As
Set NoCount On

Declare @lnConsecutivoAgrupadorDocumentos	tinyint

Set @lnConsecutivoAgrupadorDocumentos = 2

Set @lcError = '0' -- Ok

If @ldFechaInicioDigitalizacion	Is Null 
	Set @ldFechaInicioDigitalizacion = '1995-01-01'

If @ldFechaFinDigitalizacion	Is Null 
	Set @ldFechaFinDigitalizacion = '9999-12-31'

Declare @tmpDocumentos Table(
		cnsctvo_cdgo_dcmnto		int, 
		dscrpcn_dgtlzdr			varchar(150), 
		dscrpcn_tpo_dcmnto		varchar(150), 
		fcha_dgtlzcn			Datetime, 
		blsa					varchar(150), 
		nmro_idntfccn			varchar(20), 
		nmro_ntfccn				varchar(20), 
		nmro_acta				varchar(20),
		sde_ntfccn				udtDescripcion)

Declare @tmpConsecutivosDocumentos Table(cnsctvo_cdgo_dcmnto int)

If @lcNumeroNotificacion Is Not Null
	Begin
		Insert Into	@tmpConsecutivosDocumentos
		Select	cnsctvo_cdgo_dcmnto
		From	tbIndicesxDocumentosDigitalizados a
		Where	cnsctvo_cdgo_tpo_indce	=	5 --Número de Notificación
		And		vlr						=	@lcNumeroNotificacion
		And		Exists (Select 1 
						From	tbTiposDocumento b 
						Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
						And		b.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos)	

		If @@Error != 0
			Set @lcError = '1'
	End
Else
	If @lcNumeroActa Is Not Null
		Begin
			Insert Into	@tmpConsecutivosDocumentos
			Select	cnsctvo_cdgo_dcmnto
			From	tbIndicesxDocumentosDigitalizados a
			Where	cnsctvo_cdgo_tpo_indce	=	8 --Número de Acta
			And		vlr						=	@lcNumeroActa
			And		Exists (Select 1 
							From	tbTiposDocumento b 
							Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
							And		b.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos)	

			If @@Error != 0
				Set @lcError = '1'


			select * from @tmpConsecutivosDocumentos
		End
	Else
		If @lcNumeroIdentificacion Is Not Null
			Begin
				Insert Into	@tmpConsecutivosDocumentos
				Select	cnsctvo_cdgo_dcmnto
				From	tbIndicesxDocumentosDigitalizados a
				Where	cnsctvo_cdgo_tpo_indce	=	1 --Número Identificación
				And		vlr						=	@lcNumeroIdentificacion
				And		Exists (Select 1 
								From	tbTiposDocumento b 
								Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
								And		b.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos)	

				If @@Error != 0
					Set @lcError = '1'
			End
		Else
			If @lnConsecutivoSede Is Not Null
				Begin
					Insert Into	@tmpConsecutivosDocumentos
					Select	cnsctvo_cdgo_dcmnto
					From	tbIndicesxDocumentosDigitalizados a
					Where	cnsctvo_cdgo_tpo_indce	=	19 --Consecutivo Codigo Sede
					And		vlr						=	@lnConsecutivoSede
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
						Where	cnsctvo_cdgo_tpo_indce	=	14 --Número de Bolsa
						And		vlr						=	@lcNumeroBolsa
						And		Exists (Select 1 
										From	tbTiposDocumento b 
										Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
										And		b.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos)	

						If @@Error != 0
							Set @lcError = '1'
					End

If @lcNumeroNotificacion Is Null And  @lcNumeroBolsa Is Null And @lcNumeroIdentificacion Is Null And @lcNumeroActa is Null And @lnConsecutivoSede Is Null
	Begin
		Insert Into	@tmpDocumentos
		Select	a. cnsctvo_cdgo_dcmnto,			b.dscrpcn_dgtlzdr,				d.dscrpcn_tpo_dcmnto, 
				a.fcha_dgtlzcn,					space(30) as blsa,				space(23) as nmro_idntfccn,
				space(23)  as nmro_ntfccn,		space(23)  as nmro_acta,		space(150) as sde_ntfccn 
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
		Select	a. cnsctvo_cdgo_dcmnto,			b.dscrpcn_dgtlzdr,				d.dscrpcn_tpo_dcmnto, 
				a.fcha_dgtlzcn,					space(30) as blsa,				space(23) as nmro_idntfccn,
				space(23)  as nmro_ntfccn,		space(23)  as nmro_acta,		space(150) as sde_ntfccn  
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
Set	blsa =(Select	ltrim(rtrim(vlr))
		From	tbIndicesxDocumentosDigitalizados b
		Where	b.cnsctvo_cdgo_tpo_indce	= 14 --Número de Bolsa
		And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From	@tmpDocumentos a

If @@Error != 0
	Set @lcError = '1'

Update	@tmpDocumentos
Set	nmro_ntfccn =(Select	ltrim(rtrim(vlr))
				From	tbIndicesxDocumentosDigitalizados b
				Where	b.cnsctvo_cdgo_tpo_indce	= 5 --Número de Notificación
				And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From	@tmpDocumentos a

If @@Error != 0
	Set @lcError = '1'

Update	@tmpDocumentos
Set	nmro_idntfccn =(Select	ltrim(rtrim(vlr))
				From	tbIndicesxDocumentosDigitalizados b
				Where	b.cnsctvo_cdgo_tpo_indce	= 1 --Número Identificación
				And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From	@tmpDocumentos a

If @@Error != 0
	Set @lcError = '1'

Update	@tmpDocumentos
Set	sde_ntfccn	 =(Select	ltrim(rtrim(vlr))
				From	tbIndicesxDocumentosDigitalizados b
				Where	b.cnsctvo_cdgo_tpo_indce	= 19 --Sede Notificación
				And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From	@tmpDocumentos a

If @@Error != 0
	Set @lcError = '1'

Update	@tmpDocumentos
Set	nmro_acta	 =(Select	ltrim(rtrim(vlr))
				From	tbIndicesxDocumentosDigitalizados b
				Where	b.cnsctvo_cdgo_tpo_indce	= 8 --Sede Notificación
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
    ON OBJECT::[dbo].[spGDConsultaDocumentosNotificacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosNotificacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosNotificacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosNotificacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosNotificacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosNotificacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosNotificacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosNotificacion] TO [visosservice_role]
    AS [dbo];

