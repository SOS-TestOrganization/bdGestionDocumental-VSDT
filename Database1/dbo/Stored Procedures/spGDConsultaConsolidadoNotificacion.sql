


/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDConsultaConsolidadoDocumentosNotificacion
* Desarrollado por		 :  <\A   Ing. Jorge Marcos Rincón Árdila		A\>
* Descripcion			 :  <\D		D\>
* Parametros			 :  <\P		P\>
* Variables				 :  <\V		V\>
* Fecha Creacion		 :  <\FC 2009/03/30	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM Ing. Cesar García  AM\>
* Descripcion			 : <\DM   DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM  2010/03/01 FM\>
*---------------------------------------------------------------------------------*/
--exec spGDConsultaConsolidadoDocumentosNotificacion null, '531673', null, null, null, null, null, null, null
CREATE PROCEDURE [dbo].[spGDConsultaConsolidadoNotificacion] 
	/*1*/	@lcNumeroIdentificacion			Varchar(23)		= Null, 
	/*2*/	@lcNumeroNotificacion			Varchar(23)		= Null, 
	/*3*/	@lcNumeroActa					Varchar(23)		= Null, 
	/*4*/	@lnConsecutivoTipoDocumental	Int				= Null, 
	/*5*/	@lnConsecutivoSede				Int				= Null, 
	/*6*/	@lcNumeroBolsa					Varchar(23)		= Null, 
	/*7*/	@ldFechaInicioDigitalizacion	Datetime		= Null, 
	/*8*/	@ldFechaFinDigitalizacion		Datetime		= Null, 
	/*9*/	@lcError						Varchar(2)		Output 
AS
BEGIN
	SET NOCOUNT ON;
	
	Declare @lnConsecutivoAgrupadorDocumentos	int
	
	Set @lnConsecutivoAgrupadorDocumentos = 2
	
	Set @lcError = '0' -- Ok
	
	If @ldFechaInicioDigitalizacion	Is Null 
		Set @ldFechaInicioDigitalizacion = '1995-01-01'
	
	If @ldFechaFinDigitalizacion	Is Null 
		Set @ldFechaFinDigitalizacion = '9999-12-31'

	If @lnConsecutivoTipoDocumental	= 0
		Set	@lnConsecutivoTipoDocumental = Null
	
	Declare @tmpDocumentos Table(
		cnsctvo_cdgo_dcmnto		int, 
		dscrpcn_dgtlzdr			varchar(150), 
		dscrpcn_tpo_dcmnto		varchar(150), 
		fcha_dgtlzcn			Datetime, 
		blsa					varchar(150), 
		nmro_idntfccn			varchar(20), 
		nmro_ntfccn				varchar(20), 
		nmro_acta				varchar(20), 
		nmro_imgns				Int)
	
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
		End
	
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
	
	-- Ajustado 01/03/2010 siscgm01 10:07am
	Insert Into	@tmpDocumentos
	Select		a. cnsctvo_cdgo_dcmnto,			b.dscrpcn_dgtlzdr,				d.dscrpcn_tpo_dcmnto, 
				a.fcha_dgtlzcn,					space(30) as blsa,				space(23) as nmro_idntfccn,
				space(23)  as nmro_ntfccn,		space(23)  as nmro_acta,		a.nmro_imgns 
	From		dbo.tbDocumentosDigitalizados a
	Inner Join	dbo.tbDigitalizadores b On (a.cnsctvo_cdgo_dgtlzdr		= b.cnsctvo_cdgo_dgtlzdr)
	Inner Join	dbo.tbTiposDocumento d	On (a.cnsctvo_cdgo_tpo_dcmntl = d.cnsctvo_cdgo_tpo_dcmnto)
	Where		fcha_dgtlzcn Between @ldFechaInicioDigitalizacion And @ldFechaFinDigitalizacion
	And			(a.cnsctvo_cdgo_tpo_dcmntl = @lnConsecutivoTipoDocumental Or @lnConsecutivoTipoDocumental Is Null)
	And			Exists (Select 1 From @tmpConsecutivosDocumentos e Where a.cnsctvo_cdgo_dcmnto = e.cnsctvo_cdgo_dcmnto)


		
	If @@Error != 0
		Set @lcError = '1'
	
	Update	@tmpDocumentos
	Set		blsa =(Select	max(ltrim(rtrim(vlr)))
				From	tbIndicesxDocumentosDigitalizados b
				Where	b.cnsctvo_cdgo_tpo_indce	= 14 --Número de Bolsa
				And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From	@tmpDocumentos a

	If @@Error != 0
		Set @lcError = '1'

	Update	@tmpDocumentos
	Set		nmro_ntfccn =(Select	max(ltrim(rtrim(vlr)))
						From	tbIndicesxDocumentosDigitalizados b
						Where	b.cnsctvo_cdgo_tpo_indce	= 5 --Número de Notificación
						And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From	@tmpDocumentos a

	If @@Error != 0
		Set @lcError = '1'

	Update	@tmpDocumentos
	Set		nmro_idntfccn =(Select	max(ltrim(rtrim(vlr)))
						From	tbIndicesxDocumentosDigitalizados b
						Where	b.cnsctvo_cdgo_tpo_indce	= 1 --Número Identificación
						And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From	@tmpDocumentos a

	If @@Error != 0
		Set @lcError = '1'

	Update	@tmpDocumentos
	Set		nmro_acta	 =(Select	max(ltrim(rtrim(vlr)))
						From	tbIndicesxDocumentosDigitalizados b
						Where	b.cnsctvo_cdgo_tpo_indce	= 8 --Sede Notificación
						And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From	@tmpDocumentos a

	If @@Error != 0
		Set @lcError = '1'

--------------------------
	Select		*
	From		@tmpDocumentos a
	Order by a.fcha_dgtlzcn Desc
	
END








GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoNotificacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoNotificacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoNotificacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoNotificacion] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoNotificacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoNotificacion] TO [visosservice_role]
    AS [dbo];

