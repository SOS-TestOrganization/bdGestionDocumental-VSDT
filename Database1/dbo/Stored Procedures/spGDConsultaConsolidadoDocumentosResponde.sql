
/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDConsultaConsolidadoDocumentosResponde
* Desarrollado por		 :  <\A	Jorge Marcos Rincón Árdila	A\>
* Descripcion			 :  <\D  						D\>
* Observaciones		     :  <\O							O\>
* Parametros			 :  <\P   						P\>
* Variables				 :  <\V							V\>
* Fecha Creacion		 :  <\FC 04/06/2009     			FC\>
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
--exec spGDConsultaConsolidadoDocumentosResponde null, null, null, '2009-10-23', '2009-10-27', null
--exec spGDConsultaConsolidadoDocumentosResponde null, '2009-005-706928', null, null, null, null
--exec spGDConsultaConsolidadoDocumentosResponde null, '2010-029-113158', null, null, null, null
CREATE Procedure [dbo].[spGDConsultaConsolidadoDocumentosResponde]
/*1*/	@lcNumeroIdentificacion			Varchar(30)		= Null,
/*2*/	@lcNumeroSolicitud				Varchar(30)		= Null,
/*3*/	@lcNumeroRadicacion				Varchar(30)		= Null,
/*4*/	@ldFechaInicioDigitalizacion	Datetime		= Null,
/*5*/	@ldFechaFinDigitalizacion		Datetime		= Null,
/*6*/	@lcError						Varchar(2)		Output

As
BEGIN
	Set NoCount On

	SET DATEFORMAT ymd;

	Declare @lnConsecutivoAgrupadorDocumentos	int

	Set @lnConsecutivoAgrupadorDocumentos = 5 --Responde

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
		nmro_idntfccn			udtNumeroIdentificacion, 
		tpo_idntfccn			Varchar(10), 
		cdgo_contcto			Varchar(30), 
		nmro_rdccn				Varchar(30), 
		fcha_ingrso_contcto		Datetime, 
		fcha_rdccn				Varchar(50), 
		nmro_unco_idntfccn		Int, 
		nmro_imgns				Int
	)


	Declare @tmpConsecutivosDocumentos Table(cnsctvo_cdgo_dcmnto udtConsecutivo)

	If @lcNumeroSolicitud Is Not Null
		Begin
			print @lcNumeroSolicitud
			Insert Into @tmpConsecutivosDocumentos
			Select	cnsctvo_cdgo_dcmnto
			From	tbIndicesxDocumentosDigitalizados a
			Where	a.cnsctvo_cdgo_tpo_indce	=	24	-- Codigo de Contacto
			And		a.vlr						=	@lcNumeroSolicitud 
			
			If @@Error != 0
				Set @lcError = '1'
		End

	If @lcNumeroRadicacion	Is Not Null
		Begin
			Insert Into @tmpConsecutivosDocumentos
			Select	cnsctvo_cdgo_dcmnto
			From	tbIndicesxDocumentosDigitalizados a
			Where	a.cnsctvo_cdgo_tpo_indce	=	2 --Numero de Radicacion
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
			Insert Into @tmpConsecutivosDocumentos
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

	Insert Into	@tmpDocumentos
	Select	a. cnsctvo_cdgo_dcmnto,		b.dscrpcn_dgtlzdr,					d.dscrpcn_tpo_dcmnto, 
			a.fcha_dgtlzcn,				space(30) as nmro_idntfccn,			space(10) as tpo_idntfccn, 
			space(30)  as cdgo_contcto,	space(30) as nmro_rdccn,			space(30) as fcha_ingrso_contcto, 
			space(30) as fcha_rdccn,	space(30) as nmro_unco_idntfccn,	a.nmro_imgns 
	From	dbo.tbDocumentosDigitalizados a
	Inner Join	dbo.tbDigitalizadores b On (a.cnsctvo_cdgo_dgtlzdr		= b.cnsctvo_cdgo_dgtlzdr)
	Inner Join	dbo.tbTiposDocumento d	On (a.cnsctvo_cdgo_tpo_dcmntl	= d.cnsctvo_cdgo_tpo_dcmnto)
	Where	fcha_dgtlzcn Between @ldFechaInicioDigitalizacion And @ldFechaFinDigitalizacion
	And		Exists (Select 1 From @tmpConsecutivosDocumentos e Where a.cnsctvo_cdgo_dcmnto = e.cnsctvo_cdgo_dcmnto)

	If @@Error != 0
		Set @lcError = '1'

	Update		@tmpDocumentos
	Set			cdgo_contcto =(Select	max(ltrim(rtrim(vlr)))
								From	tbIndicesxDocumentosDigitalizados b
								Where	b.cnsctvo_cdgo_tpo_indce	= 24 --Codigo de Contacto
								And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From		@tmpDocumentos a

	If @@Error != 0
		Set @lcError = '1'

	Update		@tmpDocumentos
	Set			nmro_rdccn =(Select	max(ltrim(rtrim(vlr)))
								From	tbIndicesxDocumentosDigitalizados b
								Where	b.cnsctvo_cdgo_tpo_indce	= 2 --Numero de Radicacion
								And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From		@tmpDocumentos a

	If @@Error != 0
		Set @lcError = '1'

	Update		@tmpDocumentos
	Set			nmro_idntfccn =(Select	Max(ltrim(rtrim(vlr)))
								From	tbIndicesxDocumentosDigitalizados b
								Where	b.cnsctvo_cdgo_tpo_indce	= 1 --Numero de Identificacion
								And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From		@tmpDocumentos a

	If @@Error != 0
		Set @lcError = '1'

	Update		@tmpDocumentos
	Set			tpo_idntfccn =(Select	max(ltrim(rtrim(vlr)))
								From	tbIndicesxDocumentosDigitalizados b
								Where	b.cnsctvo_cdgo_tpo_indce	= 7 -- Tipo Identificación
								And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From		@tmpDocumentos a

	If @@Error != 0
		Set @lcError = '1'

	Update		@tmpDocumentos
	Set			fcha_ingrso_contcto =(Select	max(ltrim(rtrim(vlr)))
								From	tbIndicesxDocumentosDigitalizados b
								Where	b.cnsctvo_cdgo_tpo_indce	= 26 -- Fecha Ingreso Contacto
								And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From		@tmpDocumentos a

	If @@Error != 0
		Set @lcError = '1'

	Update		@tmpDocumentos
	Set			fcha_rdccn =(Select	max(ltrim(rtrim(vlr)))
								From	tbIndicesxDocumentosDigitalizados b
								Where	b.cnsctvo_cdgo_tpo_indce	= 23 -- Fecha Radicacion 
								And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From		@tmpDocumentos a

	If @@Error != 0
		Set @lcError = '1'

	Update		@tmpDocumentos
	Set			nmro_unco_idntfccn =(Select	max(ltrim(rtrim(vlr)))
								From	tbIndicesxDocumentosDigitalizados b
								Where	b.cnsctvo_cdgo_tpo_indce	= 25 -- Número Único Identificación 
								And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
	From		@tmpDocumentos a

	If @@Error != 0
		Set @lcError = '1'

------------------------------------------------------------------
	Select		*
	From		@tmpDocumentos a
	Order by a.fcha_dgtlzcn Desc

END

















GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoDocumentosResponde] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoDocumentosResponde] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoDocumentosResponde] TO [visosservice_role]
    AS [dbo];

