/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDConsultaDocumentosJuridico
* Desarrollado por		 :  <\A   Ing. Cesar Garcia		A\>
* Descripcion			 :  <\D  						D\>
* Observaciones		     :  <\O							O\>
* Parametros			 :  <\P   						P\>
* Variables				 :  <\V							V\>
* Fecha Creacion		 :  <\FC 2018-05-21     		FC\>
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
CREATE Procedure [dbo].[spGDConsultaDocumentosJuridico]
/*1*/	@lcNumeroRadicado				Varchar(30)		= Null,
/*2*/	@lnConsecutivoTipoDocumental	Int				= Null,
/*3*/	@ldFechaInicioDigitalizacion	Datetime		= Null,
/*4*/	@ldFechaFinDigitalizacion		Datetime		= Null,
/*5*/	@lcError						Varchar(2)		Output

As
Set NoCount On

Begin
	Declare @lnConsecutivoAgrupadorDocumentos	tinyint,
			@lcTipoIdentificacion				udtTipoIdentificacion,
			@cnsctvo_cdgo_tpo_indce_rdccn		Int

	Set		@lnConsecutivoAgrupadorDocumentos	=	11	--Jurídico
	Set		@lcError							=	'0' -- Ok
	Set		@cnsctvo_cdgo_tpo_indce_rdccn		=	88	-- Número de Radicación Tutela

	If	@ldFechaInicioDigitalizacion	Is Null 
		Set @ldFechaInicioDigitalizacion = '1995-01-01'

	If @ldFechaFinDigitalizacion	Is Null 
		Set @ldFechaFinDigitalizacion = '9999-12-31'

	Declare @tmpDocumentos Table(
			cnsctvo_cdgo_dcmnto		udtConsecutivo,
			dscrpcn_dgtlzdr			udtDescripcion,		
			dscrpcn_tpo_dcmnto		udtDescripcion, 
			fcha_dgtlzcn			Datetime,				
			nmro_rdcdo				udtNumeroFormulario
			)

	Declare @tmpConsecutivosDocumentos Table(cnsctvo_cdgo_dcmnto udtConsecutivo)

	If @lcNumeroRadicado Is Not Null
		Begin
			Insert Into	@tmpConsecutivosDocumentos
			Select		cnsctvo_cdgo_dcmnto
			From		tbIndicesxDocumentosDigitalizados	a	With(NoLock)
			Inner Join	tbTiposDocumento					b	With(NoLock)	On		a.cnsctvo_cdgo_tpo_dcmntl	=	b.cnsctvo_cdgo_tpo_dcmnto
			Where		a.cnsctvo_cdgo_tpo_indce	=	@cnsctvo_cdgo_tpo_indce_rdccn
			And			a.vlr						=	@lcNumeroRadicado
			And			b.cnsctvo_agrpdr_tpo_dcmntl	=	@lnConsecutivoAgrupadorDocumentos
		
			If @@Error != 0
				Set @lcError = '1'
		End

	Insert Into	@tmpDocumentos
			(	cnsctvo_cdgo_dcmnto,		dscrpcn_dgtlzdr,		dscrpcn_tpo_dcmnto,
				fcha_dgtlzcn
			)
	Select		a. cnsctvo_cdgo_dcmnto,		b.dscrpcn_dgtlzdr,		d.dscrpcn_tpo_dcmnto, 
				a.fcha_dgtlzcn
	From		dbo.tbDocumentosDigitalizados	a	With(NoLock)
	Inner Join	@tmpConsecutivosDocumentos		x					On	x.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
	Inner Join	dbo.tbDigitalizadores			b	With(NoLock)	On (a.cnsctvo_cdgo_dgtlzdr		= b.cnsctvo_cdgo_dgtlzdr)
	Inner Join	dbo.tbTiposDocumento			d	With(NoLock)	On (a.cnsctvo_cdgo_tpo_dcmntl	= d.cnsctvo_cdgo_tpo_dcmnto)
	Where		fcha_dgtlzcn Between @ldFechaInicioDigitalizacion And @ldFechaFinDigitalizacion
	And			a.cnsctvo_cdgo_tpo_dcmntl	= @lnConsecutivoTipoDocumental
	And			d.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos

	Update		@tmpDocumentos
	Set			nmro_rdcdo=	ltrim(rtrim(vlr))
	From		tbIndicesxDocumentosDigitalizados	b	With(NoLock)
	Inner Join	@tmpDocumentos						a	On	a.cnsctvo_cdgo_dcmnto	=	b.cnsctvo_cdgo_dcmnto
	Where		b.cnsctvo_cdgo_tpo_indce	= @cnsctvo_cdgo_tpo_indce_rdccn

	If @@Error != 0
		Set @lcError = '1'

	Select		a.cnsctvo_cdgo_dcmnto,		a.dscrpcn_dgtlzdr,		a.dscrpcn_tpo_dcmnto,	a.fcha_dgtlzcn,
				a.nmro_rdcdo,				i.dscrpcn_tpo_imgn,		b.rta_imgn,				b.prncpl
	From		@tmpDocumentos						a
	Inner Join	tbImagenesxDocumentosDigitalizados	b	With(NoLock)	On a.cnsctvo_cdgo_dcmnto	= b.cnsctvo_cdgo_dcmnto
	Inner Join	tbTiposImagenes						i	With(NoLock)	On b.cnsctvo_cdgo_tpo_imgn	= i.cnsctvo_cdgo_tpo_imgn
	Order by	a.fcha_dgtlzcn Desc
End
