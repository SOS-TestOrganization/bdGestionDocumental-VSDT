
/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDConsultaConsolidadoDocumentosJuridico
* Desarrollado por		 :  <\A	Ing. Cesar Garcia	A\>
* Descripcion			 :  <\D  					D\>
* Observaciones		     :  <\O						O\>
* Parametros			 :  <\P   					P\>
* Variables				 :  <\V						V\>
* Fecha Creacion		 :  <\FC 2018-05-21     	FC\>
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
--exec dbo.spGDConsultaConsolidadoDocumentosJuridico '59176440', '2017-11-01', '2017-11-29', null
CREATE Procedure [dbo].[spGDConsultaConsolidadoDocumentosJuridico]
/*1*/	@lcNumeroRadicado				Varchar(30)		= Null,
/*2*/	@ldFechaInicioDigitalizacion	Datetime		= Null,
/*3*/	@ldFechaFinDigitalizacion		Datetime		= Null,
/*4*/	@lcError						Varchar(2)		Output

AS
	BEGIN
		Set NoCount On

		SET DATEFORMAT ymd;

		Declare @lnConsecutivoAgrupadorDocumentos	int,
				@lcTipoIdentificacion				udtTipoIdentificacion,
				@cnsctvo_cdgo_tpo_indce_rdccn		Int

		Set		@lnConsecutivoAgrupadorDocumentos	=	11 --Jurídico
		Set		@lcError							=	'0' -- Ok
		Set		@cnsctvo_cdgo_tpo_indce_rdccn		=	88	 -- Número de Radicación Tutela

		If @ldFechaInicioDigitalizacion	Is Null 
			Set @ldFechaInicioDigitalizacion = '1995-01-01'

		If @ldFechaFinDigitalizacion	Is Null 
			Set @ldFechaFinDigitalizacion = '9999-12-31'

		Declare @tmpDocumentos Table(
			cnsctvo_cdgo_dcmnto		udtConsecutivo,
			dscrpcn_dgtlzdr			udtDescripcion,
			dscrpcn_tpo_dcmnto		udtDescripcion,
			fcha_dgtlzcn			Datetime,
			nmro_rdcdo				Varchar(30), 
			nmro_imgns				Int
		)

		Declare @tmpConsecutivosDocumentos Table(cnsctvo_cdgo_dcmnto udtConsecutivo)

		If @lcNumeroRadicado Is Not Null
			Begin
				Insert Into @tmpConsecutivosDocumentos
				Select		cnsctvo_cdgo_dcmnto
				From		tbIndicesxDocumentosDigitalizados a	With(NoLock)
				Where		a.cnsctvo_cdgo_tpo_indce	=	@cnsctvo_cdgo_tpo_indce_rdccn
				And			a.vlr						=	@lcNumeroRadicado 
			
				If @@Error != 0
					Set @lcError = '1'
			End

		Insert Into	@tmpDocumentos
				(	cnsctvo_cdgo_dcmnto,		dscrpcn_dgtlzdr,	dscrpcn_tpo_dcmnto,		fcha_dgtlzcn,
					nmro_imgns
				)
		Select		a. cnsctvo_cdgo_dcmnto,		b.dscrpcn_dgtlzdr,	d.dscrpcn_tpo_dcmnto,	a.fcha_dgtlzcn,
					a.nmro_imgns
		From		dbo.tbDocumentosDigitalizados	a	With(NoLock)
		Inner Join	@tmpConsecutivosDocumentos		c					On	c.cnsctvo_cdgo_dcmnto		=	a.cnsctvo_cdgo_dcmnto
		Inner Join	dbo.tbDigitalizadores			b	With(NoLock)	On	(a.cnsctvo_cdgo_dgtlzdr		=	b.cnsctvo_cdgo_dgtlzdr)
		Inner Join	dbo.tbTiposDocumento			d	With(NoLock)	On	(a.cnsctvo_cdgo_tpo_dcmntl	=	d.cnsctvo_cdgo_tpo_dcmnto)
		Where		fcha_dgtlzcn Between @ldFechaInicioDigitalizacion And @ldFechaFinDigitalizacion

		If @@Error != 0
			Set @lcError = '1'

		Update		@tmpDocumentos
		Set			nmro_rdcdo =	ltrim(rtrim(vlr))
		From		tbIndicesxDocumentosDigitalizados	b	With(NoLock)
		Inner Join	@tmpDocumentos						a	On	a.cnsctvo_cdgo_dcmnto	=	b.cnsctvo_cdgo_dcmnto
		Where		b.cnsctvo_cdgo_tpo_indce	=	@cnsctvo_cdgo_tpo_indce_rdccn

		If @@Error != 0
			Set @lcError = '1'

	------------------------------------------------------------------
		Select		cnsctvo_cdgo_dcmnto,	dscrpcn_dgtlzdr,	dscrpcn_tpo_dcmnto,			fcha_dgtlzcn,
					nmro_rdcdo,				nmro_imgns
		From		@tmpDocumentos a
		Order by	a.fcha_dgtlzcn Desc
	END
