/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDConsultaDocumentosPrestacionesEconimicas
* Desarrollado por		 :  <\A   Ing. Cesar Garcia		A\>
* Descripcion			 :  <\D  						D\>
* Observaciones		     :  <\O							O\>
* Parametros			 :  <\P   						P\>
* Variables				 :  <\V							V\>
* Fecha Creacion		 :  <\FC 2018-01-15     		FC\>
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
CREATE Procedure [dbo].[spGDConsultaDocumentosPrestacionesEconomicas]
/*1*/	@lnTipoIdentificacion			udtConsecutivo	= Null,
/*2*/	@lcNumeroIdentificacion			Varchar(23)		= Null,
/*3*/	@lcNumeroFolio					Varchar(30)		= Null,
/*4*/	@lnConsecutivoTipoDocumental	Int				= Null,
/*5*/	@ldFechaInicioIncapacidad		Datetime		= Null,
/*6*/	@ldFechaInicioDigitalizacion	Datetime		= Null,
/*7*/	@ldFechaFinDigitalizacion		Datetime		= Null,
/*8*/	@lcError						Varchar(2)		Output

As
Set NoCount On

Begin
	Declare @lnConsecutivoAgrupadorDocumentos	tinyint,
			@lcTipoIdentificacion				udtTipoIdentificacion

	Set		@lnConsecutivoAgrupadorDocumentos = 9 --Salud

	Set		@lcError = '0' -- Ok

	If	@ldFechaInicioDigitalizacion	Is Null 
		Set @ldFechaInicioDigitalizacion = '1995-01-01'

	If @ldFechaFinDigitalizacion	Is Null 
		Set @ldFechaFinDigitalizacion = '9999-12-31'

	Declare @tmpDocumentos Table(
			cnsctvo_cdgo_dcmnto		udtConsecutivo,
			dscrpcn_dgtlzdr			udtDescripcion,		
			dscrpcn_tpo_dcmnto		udtDescripcion, 
			fcha_dgtlzcn			Datetime,				
			nmro_idntfccn			udtNumeroIdentificacion,
			nmro_unco_idntfccn		udtConsecutivo,
			nmro_flo				udtNumeroFormulario,
			cdgo_ofcna				Char(5),
			fcha_inco_incpcdd		DateTime,
			tpo_idntfccn			Char(2))

	Declare @tmpConsecutivosDocumentos Table(cnsctvo_cdgo_dcmnto udtConsecutivo)

	If @lcNumeroFolio Is Not Null
		Begin
			Insert Into	@tmpConsecutivosDocumentos
			Select		cnsctvo_cdgo_dcmnto
			From		tbIndicesxDocumentosDigitalizados	a	With(NoLock)
			Inner Join	tbTiposDocumento					b	With(NoLock)	On		a.cnsctvo_cdgo_tpo_dcmntl	=	b.cnsctvo_cdgo_tpo_dcmnto
			Where		a.cnsctvo_cdgo_tpo_indce	=	53	-- Numero de Novedad
			And			a.vlr						=	@lcNumeroFolio -- Aplica como Numero de Novedad
			And			b.cnsctvo_agrpdr_tpo_dcmntl	=	@lnConsecutivoAgrupadorDocumentos
		
			If @@Error != 0
				Set @lcError = '1'
		End
	Else
		If @lnTipoIdentificacion Is Not Null And @lcNumeroIdentificacion Is Not Null
			Begin
				Select	@lcTipoIdentificacion	=	Ltrim(Rtrim(cdgo_tpo_idntfccn))
				From	bdAfiliacion.dbo.tbTiposIdentificacion_Vigencias	With(NoLock)
				Where	cnsctvo_cdgo_tpo_idntfccn = @lnTipoIdentificacion
				And		getdate() Between inco_vgnca And fn_vgnca

				Insert Into @tmpConsecutivosDocumentos
				Select		a.cnsctvo_cdgo_dcmnto
				From		tbIndicesxDocumentosDigitalizados	a	With(NoLock)
				Inner Join	(	Select	c.cnsctvo_cdgo_dcmnto
								From	tbIndicesxDocumentosDigitalizados	c	With(NoLock)
								Where	cnsctvo_cdgo_tpo_indce	=	7
								And		c.vlr	=	@lcTipoIdentificacion
							)									d					On		d.cnsctvo_cdgo_dcmnto		=	a.cnsctvo_cdgo_dcmnto
				Inner Join	tbTiposDocumento					b	With(NoLock)	On		a.cnsctvo_cdgo_tpo_dcmntl	=	b.cnsctvo_cdgo_tpo_dcmnto
				Where		a.cnsctvo_cdgo_tpo_indce	=	1
				And			a.vlr						=	@lcNumeroIdentificacion
				And			b.cnsctvo_agrpdr_tpo_dcmntl	=	@lnConsecutivoAgrupadorDocumentos

				If @@Error != 0
					Set @lcError = '1'
			End
		Else
			If @lnTipoIdentificacion Is Null And @lcNumeroIdentificacion Is Not Null
					Begin
						Insert Into @tmpConsecutivosDocumentos
						Select		a.cnsctvo_cdgo_dcmnto
						From		tbIndicesxDocumentosDigitalizados	a	With(NoLock)
						Inner Join	tbTiposDocumento					b	With(NoLock)	On		a.cnsctvo_cdgo_tpo_dcmntl	=	b.cnsctvo_cdgo_tpo_dcmnto
						Where		a.cnsctvo_cdgo_tpo_indce	=	1
						And			a.vlr						=	@lcNumeroIdentificacion
						And			b.cnsctvo_agrpdr_tpo_dcmntl	=	@lnConsecutivoAgrupadorDocumentos
					End

			Else
				If @ldFechaInicioIncapacidad Is Not Null
					Begin
						Insert Into	@tmpConsecutivosDocumentos
						Select		cnsctvo_cdgo_dcmnto
						From		tbIndicesxDocumentosDigitalizados a
						Where		a.cnsctvo_cdgo_tpo_indce	=	85
						And			a.vlr						=	@ldFechaInicioIncapacidad
						And			Exists	(	Select 1 
												From	tbTiposDocumento b 
												Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
												And		b.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos
											)	

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
	And			d.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos

	Update		@tmpDocumentos
	Set			tpo_idntfccn =	ltrim(rtrim(vlr))
	From		tbIndicesxDocumentosDigitalizados	b	With(NoLock)
	Inner Join	@tmpDocumentos						a					On	a.cnsctvo_cdgo_dcmnto	=	b.cnsctvo_cdgo_dcmnto
	Where		b.cnsctvo_cdgo_tpo_indce	= 7 -- Tipo Identificación

	If @@Error != 0
		Set @lcError = '1'

	Update		@tmpDocumentos
	Set			nmro_idntfccn =	ltrim(rtrim(vlr))
	From		tbIndicesxDocumentosDigitalizados	b	With(NoLock)
	Inner Join	@tmpDocumentos						a					On	a.cnsctvo_cdgo_dcmnto	=	b.cnsctvo_cdgo_dcmnto
	Where		b.cnsctvo_cdgo_tpo_indce	= 1

	If @@Error != 0
		Set @lcError = '1'

	Update		@tmpDocumentos
	Set			nmro_flo =	ltrim(rtrim(vlr))
	From		tbIndicesxDocumentosDigitalizados	b	With(NoLock)
	Inner Join	@tmpDocumentos						a	On	a.cnsctvo_cdgo_dcmnto	=	b.cnsctvo_cdgo_dcmnto
	Where		b.cnsctvo_cdgo_tpo_indce	= 53 -- Número Único Identificación 

	If @@Error != 0
		Set @lcError = '1'

	Update		@tmpDocumentos
	Set			fcha_inco_incpcdd =	ltrim(rtrim(b.vlr))
	From		tbIndicesxDocumentosDigitalizados	b	With(NoLock)
	Inner Join	@tmpDocumentos						a	On	a.cnsctvo_cdgo_dcmnto	=	b.cnsctvo_cdgo_dcmnto
	Where		b.cnsctvo_cdgo_tpo_indce	= 85 -- Fecha Inicio Incapacidad

	If @@Error != 0
		Set @lcError = '1'

	Update		@tmpDocumentos
	Set			nmro_unco_idntfccn =	b.nmro_unco_idntfccn
	From		bdAfiliacion.dbo.tbVinculados						b	With(NoLock)
	Inner Join	bdAfiliacion.dbo.tbTiposIdentificacion_Vigencias	t	With(NoLock)	On	t.cnsctvo_cdgo_tpo_idntfccn	=	b.cnsctvo_cdgo_tpo_idntfccn
	Inner Join	@tmpDocumentos										a					On	a.tpo_idntfccn				=	t.cdgo_tpo_idntfccn
																						And	a.nmro_idntfccn				=	b.nmro_idntfccn

	If @@Error != 0
		Set @lcError = '1'

	Update		@tmpDocumentos
	Set			cdgo_ofcna =	ltrim(rtrim(c.cdgo_ofcna))
	From		BDSisalud.dbo.tbMaestroIncapacidades	b	With(NoLock)
	Inner Join	@tmpDocumentos							a					On	a.nmro_flo				=	b.nmro_flo
																			And	a.nmro_unco_idntfccn	=	b.nmro_unco_idntfccn_ctznte
	Inner Join	BDAfiliacion.dbo.tbOficinas_Vigencias	c	With(NoLock)	On	c.cnsctvo_cdgo_ofcna	=	b.cnsctvo_cdgo_ofcna

	If @@Error != 0
		Set @lcError = '1'

	Select		a.cnsctvo_cdgo_dcmnto,			a.dscrpcn_dgtlzdr,		a.dscrpcn_tpo_dcmnto,	a.fcha_dgtlzcn,
				a.nmro_idntfccn,				a.nmro_flo,				a.fcha_inco_incpcdd,	a.tpo_idntfccn,
				a.cdgo_ofcna,					i.dscrpcn_tpo_imgn,		b.rta_imgn,				b.prncpl
	From		@tmpDocumentos						a
	Inner Join	tbImagenesxDocumentosDigitalizados	b	With(NoLock)	On a.cnsctvo_cdgo_dcmnto	= b.cnsctvo_cdgo_dcmnto
	Inner Join	tbTiposImagenes						i	With(NoLock)	On b.cnsctvo_cdgo_tpo_imgn	= i.cnsctvo_cdgo_tpo_imgn
	Order by	a.fcha_dgtlzcn Desc
End
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosPrestacionesEconomicas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosPrestacionesEconomicas] TO [ServicioClientePortal]
    AS [dbo];

