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
--exec spGDConsultaConsolidadoDocumentosAfiliacionModif null, null, null, null, null, null, null, '2009-09-01', '2009-09-01', null
--exec spGDConsultaConsolidadoDocumentosAfiliacionModif 1, '14465227', null, null, null, null, null, null, null, null
--exec spGDConsultaConsolidadoDocumentosAfiliacionModif null, null, null, null, null, null, '-23', null, null, null
--exec spGDConsultaConsolidadoDocumentosAfiliacionModif null, null, null, null, '2010-029-113158', null, null, null, null, null
--exec spGDConsultaConsolidadoDocumentosAfiliacionModif null, null, '3291324', null, null, null, null, null, null, null
CREATE Procedure [dbo].[spGDConsultaConsolidadoDocumentosAfiliacionModif]
/*1*/	@lnConsecutivoTipoId			int				= Null, 
/*2*/	@lcNumeroIdentificacion			Varchar(23)		= Null,
/*3*/	@lcNumeroFormulario				Varchar(23)		= Null,
/*4*/	@lcNumeroNovedad				Varchar(23)		= Null, 
/*5*/	@lcNumeroSolicitud				Varchar(30)		= Null, 
/*6*/	@lnConsecutivoTipoDocumental	int				= Null,
/*7*/	@lcNumeroBolsa					Varchar(23)		= Null,
/*8*/	@ldFechaInicioDigitalizacion	Datetime		= Null,
/*9*/	@ldFechaFinDigitalizacion		Datetime		= Null,
/*10*/	@lcError						Varchar(2)		Output

As
BEGIN
	Set NoCount On

	SET DATEFORMAT ymd;

	Declare @nmro_unco_idntfccn				int

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
		nmro_slctd				varchar(30), 
		tpo_idntfccn			Char(3),
		nmro_imgns				Int)

	Declare @tmpConsecutivosDocumentos Table(cnsctvo_cdgo_dcmnto udtConsecutivo)

	If @lcNumeroIdentificacion Is Not Null 
		Begin
			Insert Into	@tmpConsecutivosDocumentos
			Select	cnsctvo_cdgo_dcmnto
			From	tbIndicesxDocumentosDigitalizados a
			Where	a.cnsctvo_cdgo_tpo_indce	=	1  --Identificacion
			And		a.vlr						=	@lcNumeroIdentificacion
			And		Exists (Select 1 From	tbTiposDocumento b 
							Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
							And		b.cnsctvo_agrpdr_tpo_dcmntl	In (1, 5))

			if @lnConsecutivoTipoId is not null
			Begin
	
				--Buscar Nui de la Identificacion
				Set @nmro_unco_idntfccn = IsNull(bdAfiliacion.dbo.fnCalculaNui(@lnConsecutivoTipoId, @lcNumeroIdentificacion), Null)

				If @nmro_unco_idntfccn Is Not Null
				Begin
					Insert Into	@tmpConsecutivosDocumentos
					Select	cnsctvo_cdgo_dcmnto
					From	tbIndicesxDocumentosDigitalizados a
					Where	a.cnsctvo_cdgo_tpo_indce	=	34  --Numero Unico Identificacion Cotizante
					And		a.vlr						=	@nmro_unco_idntfccn
					And		Exists (Select 1 From	tbTiposDocumento b 
									Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
									And		b.cnsctvo_agrpdr_tpo_dcmntl	In (1, 5))
				End
				
				If @@Error != 0
					Set @lcError = '1'
			End
			Else
			Begin
				--Buscar Nui de la Identificacion
				select	@nmro_unco_idntfccn = nmro_unco_idntfccn
				from	bdafiliacion.dbo.tbvinculados
				where	nmro_idntfccn	=	ltrim(rtrim(@lcNumeroIdentificacion))
				and		vldo			=	'S'

				If @nmro_unco_idntfccn Is Not Null
				Begin
					Insert Into	@tmpConsecutivosDocumentos
					Select	cnsctvo_cdgo_dcmnto
					From	tbIndicesxDocumentosDigitalizados a
					Where	a.cnsctvo_cdgo_tpo_indce	=	34  --Numero Unico Identificacion Cotizante
					And		a.vlr						=	@nmro_unco_idntfccn
					And		Exists (Select 1 From	tbTiposDocumento b 
									Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
									And		b.cnsctvo_agrpdr_tpo_dcmntl	In (1, 5))
				End

				If @@Error != 0
					Set @lcError = '1'
			End
		End


	If @lcNumeroSolicitud Is Not Null
		Begin
			Insert Into	@tmpConsecutivosDocumentos
			Select	cnsctvo_cdgo_dcmnto
			From	tbIndicesxDocumentosDigitalizados a
			Where	a.cnsctvo_cdgo_tpo_indce	=	24	-- Codigo de Contacto
			And		a.vlr						=	@lcNumeroSolicitud 

			If @@Error != 0
				Set @lcError = '1'
		End

	If @lcNumeroFormulario Is Not Null
		Begin
			Insert Into	@tmpConsecutivosDocumentos
			Select	cnsctvo_cdgo_dcmnto
			From	tbIndicesxDocumentosDigitalizados a
			Where	a.cnsctvo_cdgo_tpo_indce	=	10  --Numero de Formulario
			And		a.vlr						=	@lcNumeroFormulario
			And		Exists (Select 1 From	tbTiposDocumento b 
							Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
			And		b.cnsctvo_agrpdr_tpo_dcmntl	In (1, 5))	

			If @@Error != 0
				Set @lcError = '1'
		End

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

	If @lcNumeroBolsa Is Not Null
		Begin
			Insert Into	@tmpConsecutivosDocumentos
			Select	cnsctvo_cdgo_dcmnto
			From	tbIndicesxDocumentosDigitalizados a
			Where	a.cnsctvo_cdgo_tpo_indce	=	14
			And		a.vlr						=	@lcNumeroBolsa
			And		Exists (Select 1 From tbTiposDocumento b 
							Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
			And		b.cnsctvo_agrpdr_tpo_dcmntl	In (1, 5))	

			If @@Error != 0
				Set @lcError = '1'
		End
	
	Insert Into @tmpDocumentos
	Select	a. cnsctvo_cdgo_dcmnto,		b.dscrpcn_dgtlzdr,			d.dscrpcn_tpo_dcmnto, 
			a.fcha_dgtlzcn,				space(30) as blsa,			space(23) as nmro_idntfccn,
			space(15) as tpo_frmlro,	space(15)  as nmro_frmlro,	space(15) as nmro_nvdd, 
			space(30) as nmro_slctd,	space(2) as tpo_idntfccn,	a.nmro_imgns		
	From		dbo.tbDocumentosDigitalizados a
	Inner Join	dbo.tbDigitalizadores b On (a.cnsctvo_cdgo_dgtlzdr		= b.cnsctvo_cdgo_dgtlzdr)
	Inner Join	dbo.tbTiposDocumento d	On (a.cnsctvo_cdgo_tpo_dcmntl	= d.cnsctvo_cdgo_tpo_dcmnto)
	Where fcha_dgtlzcn Between @ldFechaInicioDigitalizacion And @ldFechaFinDigitalizacion
	And	(@lnConsecutivoTipoDocumental Is Null Or a.cnsctvo_cdgo_tpo_dcmntl = @lnConsecutivoTipoDocumental)
	And	Exists (Select 1 From @tmpConsecutivosDocumentos e Where a.cnsctvo_cdgo_dcmnto = e.cnsctvo_cdgo_dcmnto)

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
	Set		tpo_frmlro =(Select	max(ltrim(rtrim(vlr)))
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
	Order by a.fcha_dgtlzcn Desc

END




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoDocumentosAfiliacionModif] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoDocumentosAfiliacionModif] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoDocumentosAfiliacionModif] TO [visosservice_role]
    AS [dbo];

