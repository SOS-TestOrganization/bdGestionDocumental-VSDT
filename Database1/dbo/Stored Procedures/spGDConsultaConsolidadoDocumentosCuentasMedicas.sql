/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDConsultaConsolidadoDocumentosCuentasMedicas
* Desarrollado por		 :  <\A   Ing. Jorge Marcos Rincón Árdila		A\>
* Descripcion			 :  <\D		D\>
* Parametros			 :  <\P		P\>
* Variables				 :  <\V		V\>
* Fecha Creacion		 :  <\FC 2009/03/30	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM   AM\>
* Descripcion			 : <\DM   DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM   FM\>
*---------------------------------------------------------------------------------*/
--exec spGDConsultaConsolidadoDocumentosCuentasMedicas null, null, '4991783', null, null, null, null, null, null
CREATE PROCEDURE [dbo].[spGDConsultaConsolidadoDocumentosCuentasMedicas] 
	/*1*/	@lcNumeroIdentificacion			Varchar(23)		= Null,
	/*2*/	@lcNumeroFactura				Varchar(23)		= Null,
	/*3*/	@lcNumeroRadicacion				Varchar(23)		= Null,
	/*4*/	@lcNumeroRecobro				Varchar(23)		= Null,
	/*5*/	@lnConsecutivoTipoDocumental	Int				= Null,
	/*6*/	@lcNumeroBolsa					Varchar(23)		= Null,
	/*7*/	@ldFechaInicioDigitalizacion	Datetime		= Null,
	/*8*/	@ldFechaFinDigitalizacion		Datetime		= Null,
	/*9*/	@lcError						Varchar(2)		Output 
AS
BEGIN
	SET NOCOUNT ON;

	SET DATEFORMAT ymd;
	
	Declare @lnConsecutivoAgrupadorDocumentos	int
	
	Set @lnConsecutivoAgrupadorDocumentos = 4 --Cuentas Medicas
	
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
		nmro_fctra				udtNumeroFormulario, 
		nmro_rdccn				udtNumeroFormulario, 
		nmro_rcbro				udtNumeroFormulario, 
		tpo_idntfccn			Char(2), 
		nmro_imgns				Int)
	
	Declare @tmpConsecutivosDocumentos Table(cnsctvo_cdgo_dcmnto udtConsecutivo)
	
	If @lcNumeroRecobro	Is Not Null
		Begin
			Insert Into	@tmpConsecutivosDocumentos
			Select	cnsctvo_cdgo_dcmnto
			From	tbIndicesxDocumentosDigitalizados a
			Where	a.cnsctvo_cdgo_tpo_indce	=	9	-- Numero de Recobro
			And		a.vlr						=	@lcNumeroRecobro
			And		Exists (Select 1 
							From	tbTiposDocumento b 
							Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
							And		b.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos)
		
			If @@Error != 0
				Set @lcError = '1'
		End
	
	If @lcNumeroFactura	Is Not Null
		Begin
			Insert Into	@tmpConsecutivosDocumentos
			Select	cnsctvo_cdgo_dcmnto
			From	tbIndicesxDocumentosDigitalizados a
			Where	a.cnsctvo_cdgo_tpo_indce	=	3
			And		a.vlr						=	@lcNumeroFactura
			And		Exists (Select 1 
							From	tbTiposDocumento b 
							Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
							And		b.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos)	

			If @@Error != 0
				Set @lcError = '1'
		End
	
	If @lcNumeroRadicacion Is Not Null
		Begin
			Insert Into	@tmpConsecutivosDocumentos
			Select	cnsctvo_cdgo_dcmnto
			From	tbIndicesxDocumentosDigitalizados a
			Where	a.cnsctvo_cdgo_tpo_indce	=	2
			And		a.vlr						=	@lcNumeroRadicacion
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
			Where	a.cnsctvo_cdgo_tpo_indce	=	1
			And		a.vlr						=	@lcNumeroIdentificacion
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
			Where	a.cnsctvo_cdgo_tpo_indce	=	14
			And		a.vlr						=	@lcNumeroBolsa
			And		Exists (Select 1 
							From	tbTiposDocumento b 
							Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
							And		b.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos)	

			If @@Error != 0
				Set @lcError = '1'
		End


	Insert Into @tmpDocumentos
	Select		a. cnsctvo_cdgo_dcmnto,			b.dscrpcn_dgtlzdr,			d.dscrpcn_tpo_dcmnto, 
				a.fcha_dgtlzcn,					space(30) as blsa,			space(23) as nmro_idntfccn,
				space(23)	as nmro_fctra,		space(15) as nmro_rdccn,	space(23)	as nmro_rcbro,		
				space(2) as tpo_idntfccn,		a.nmro_imgns 
	From		dbo.tbDocumentosDigitalizados a 
	Inner Join	dbo.tbDigitalizadores b On (a.cnsctvo_cdgo_dgtlzdr		= b.cnsctvo_cdgo_dgtlzdr)
	Inner Join	dbo.tbTiposDocumento d	On (a.cnsctvo_cdgo_tpo_dcmntl	= d.cnsctvo_cdgo_tpo_dcmnto)
	Where		fcha_dgtlzcn Between @ldFechaInicioDigitalizacion And @ldFechaFinDigitalizacion
	And			(a.cnsctvo_cdgo_tpo_dcmntl = @lnConsecutivoTipoDocumental Or @lnConsecutivoTipoDocumental Is Null)
	And			Exists (Select 1 From @tmpConsecutivosDocumentos e Where a.cnsctvo_cdgo_dcmnto = e.cnsctvo_cdgo_dcmnto)

		
	If @@Error != 0
		Set @lcError = '1'
	
	Update	@tmpDocumentos
	Set		blsa =(Select	max(ltrim(rtrim(vlr)))
				From	tbIndicesxDocumentosDigitalizados b
				Where	b.cnsctvo_cdgo_tpo_indce	= 14
				And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From	@tmpDocumentos a
	
	If @@Error != 0
		Set @lcError = '1'
	
	Update	@tmpDocumentos
	Set		nmro_fctra =(Select	max(ltrim(rtrim(vlr)))
						From	tbIndicesxDocumentosDigitalizados b
						Where	b.cnsctvo_cdgo_tpo_indce	= 3
						And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From	@tmpDocumentos a
	
	If @@Error != 0
		Set @lcError = '1'
	
	Update	@tmpDocumentos
	Set		nmro_rdccn =(Select	max(ltrim(rtrim(vlr)))
						From	tbIndicesxDocumentosDigitalizados b
						Where	b.cnsctvo_cdgo_tpo_indce	= 2
						And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From	@tmpDocumentos a
	
	If @@Error != 0
		Set @lcError = '1'
	
	Update	@tmpDocumentos
	Set		nmro_rcbro =(Select	max(ltrim(rtrim(vlr)))
						From	tbIndicesxDocumentosDigitalizados b
						Where	b.cnsctvo_cdgo_tpo_indce	= 9
						And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From	@tmpDocumentos a
	
	If @@Error != 0
		Set @lcError = '1'
	
	Update	@tmpDocumentos
	Set		nmro_idntfccn =(Select	max(ltrim(rtrim(vlr)))
						From	tbIndicesxDocumentosDigitalizados b
						Where	b.cnsctvo_cdgo_tpo_indce	= 1
						And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From	@tmpDocumentos a
	
	If @@Error != 0
		Set @lcError = '1'
	
	Update	@tmpDocumentos
	Set		tpo_idntfccn =(Select	max(ltrim(rtrim(vlr)))
						From	tbIndicesxDocumentosDigitalizados b
						Where	b.cnsctvo_cdgo_tpo_indce	= 7 -- Tipo Identificación
						And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From	@tmpDocumentos a
	
	If @@Error != 0
		Set @lcError = '1'
	
------------------------------
	Select		*
	From		@tmpDocumentos a
	Order by a.fcha_dgtlzcn Desc
	
END









GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoDocumentosCuentasMedicas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoDocumentosCuentasMedicas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoDocumentosCuentasMedicas] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoDocumentosCuentasMedicas] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoDocumentosCuentasMedicas] TO [visosservice_role]
    AS [dbo];

