/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDConsultaDocumentos
* Desarrollado por		 :  <\A	Ing. Jorge Marcos Rincon Ardila	A\>
* Descripcion			 :  <\D  						D\>
* Observaciones		     :  <\O							O\>
* Parametros			 :  <\P   						P\>
* Variables				 :  <\V							V\>
* Fecha Creacion		 :  <\FC	10/11/2009	FC\>
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
--exec spGDConsultaConsolidadoDocumentos null, null, '2009-09-01', '2009-09-01', null
--exec spGDConsultaConsolidadoDocumentos 1, '14465227', null, null, null
CREATE Procedure [dbo].[spGDConsultaConsolidadoDocumentos]
/*1*/	@lnConsecutivoTipoId			int				= Null, 
/*2*/	@lcNumeroIdentificacion			Varchar(23)		= Null,
/*3*/	@ldFechaInicioDigitalizacion	Datetime		= Null,
/*4*/	@ldFechaFinDigitalizacion		Datetime		= Null,
/*5*/	@lcError						Varchar(2)		Output

As
Begin
	Set NoCount On

	SET DATEFORMAT ymd;

	Declare @nmro_unco_idntfccn					int 

	Set @lcError = '0' --- Ok

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
			
			--Buscar Nui de la Identificacion
			Set @nmro_unco_idntfccn = IsNull(bdAfiliacion.dbo.fnCalculaNui(@lnConsecutivoTipoId, @lcNumeroIdentificacion), Null)
			If @nmro_unco_idntfccn Is Not Null And @nmro_unco_idntfccn != 0
			Begin
				Insert Into	@tmpConsecutivosDocumentos
				Select	cnsctvo_cdgo_dcmnto
				From	tbIndicesxDocumentosDigitalizados a
				Where	a.cnsctvo_cdgo_tpo_indce	=	34  --Numero Unico Identificacion Cotizante
				And		a.vlr						=	@nmro_unco_idntfccn 
			End
			
			If @@Error != 0
				Set @lcError = '1'
		End

	Insert Into @tmpDocumentos
	Select		a. cnsctvo_cdgo_dcmnto,		b.dscrpcn_dgtlzdr,			d.dscrpcn_tpo_dcmnto, 
				a.fcha_dgtlzcn,				space(30) as blsa,			space(23) as nmro_idntfccn,
				space(2) as tpo_idntfccn,	a.nmro_imgns		
	From		dbo.tbDocumentosDigitalizados a
	Inner Join	dbo.tbDigitalizadores b On (a.cnsctvo_cdgo_dgtlzdr		= b.cnsctvo_cdgo_dgtlzdr)
	Inner Join	dbo.tbTiposDocumento d	On (a.cnsctvo_cdgo_tpo_dcmntl	= d.cnsctvo_cdgo_tpo_dcmnto)
	Where		fcha_dgtlzcn Between @ldFechaInicioDigitalizacion And @ldFechaFinDigitalizacion
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
	Set		nmro_idntfccn =(Select	Max(ltrim(rtrim(vlr)))
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

	Select	* 
	From	@tmpDocumentos a
	Order by a.fcha_dgtlzcn Desc

End


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoDocumentos] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaConsolidadoDocumentos] TO [visosservice_role]
    AS [dbo];

