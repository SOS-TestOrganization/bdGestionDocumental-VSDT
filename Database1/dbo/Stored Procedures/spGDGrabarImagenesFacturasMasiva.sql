/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
* Metodo o PRG 	               :  spGDGrabarImagenesFacturasMasiva
* Desarrollado por		 :  <\A   Luis Fernando Benavides				A\>
* Descripcion			 :  <\D   Mejora Imagenes						D\>
* Observaciones		         	 :  <\O									O\>
* Parametros			 :  <\P   									P\>		
* Fecha Creacion		 :  <\FC  2015/05/03							FC\>
*  
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION   
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM  Andres Taborda AM\>
* Descripcion			 : <\DM  Se cambia el begin tran por begin try DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM  2017/05/03 FM\>
*---------------------------------------------------------------------------------*/
CREATE Procedure	[dbo].[spGDGrabarImagenesFacturasMasiva]
@nmro_rdccn				Varchar(15),
@nmro_rcbro				Varchar(15),
@dscrpcn_tpo_anxo		Varchar(20),
@estdo_grbr				Int

As

Begin

	Set NoCount On


	Declare	@tbImagenesxDocumentosDigitalizados As Table
	(
	cnsctvo_cdgo_imgn		Int,
	cnsctvo_cdgo_dcmnto		Int,
	cnsctvo_cdgo_tpo_imgn	Int,
	rta_imgn				Varchar(250),
	prncpl					Char(1),
	estdo					Char(1),
	usro_crcn				Char(30)
	)

	Declare			@cnsctvo_dcmnto				Int,
					@fcha_crcn					Datetime,
					@nmro_imgns					Int,
					@cnsctvo_cdgo_tpo_dcmntl	Int,
					@cnsctvo_opcn_ejccn			Int,
					@cnsctvo_cdgo_imgn			Int,
					@consecFin					Int,
					@consecIni					Int,
					@usro_crcn					udtUsuario,
					@mensajeError				varchar(2000)

	Declare			@tbConsecutivos Table(consecFin Int,consecIni Int)

	Set				@fcha_crcn					=	GetDate()
	Set				@cnsctvo_cdgo_tpo_dcmntl	=	2
	Set				@cnsctvo_opcn_ejccn			=	3

	set				@usro_crcn     = Substring(System_User,CharIndex('\',System_User) + 1,Len(System_User))
			
	Begin try
		
		Exec			spGDCalcularConsecutivo @cnsctvo_dcmnto Output, @cnsctvo_cdgo_imgn Output,	@cnsctvo_opcn_ejccn

		Select			@nmro_imgns		=	Count(*)
		From			#tmpImagenesMasivas
	   
	----------------------------------------- Insertar en tbDocumentosDigitalizados -----------------------------------------
		Insert Into		bdGestionDocumental.dbo.tbDocumentosDigitalizados
						(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	nmro_imgns,			cnsctvo_cdgo_dgtlzdr,
							fcha_dgtlzcn
						)
		Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	@nmro_imgns,		5,
							@fcha_crcn
						)

		----------------------------------------- Insertar en tbImagenesxDocumentosDigitalizados -----------------------------------------
		Insert Into		@tbImagenesxDocumentosDigitalizados
		Select			0,			@cnsctvo_dcmnto,			999,			rta_dstno,			'N',		'A',
						@usro_crcn
		From			#tmpImagenesMasivas

		/** Calcular */
		
		/*
		Insert Into		@tbConsecutivos(consecFin,consecIni)
		Exec			spGDCalcularConsecutivosImagenesDigitalizadas @nmro_imgns
		*/

		Insert Into		@tbConsecutivos(consecFin,consecIni)
		Exec			spGDCalcularConsecutivoImagenDigitalizada @nmro_imgns

		Select			@consecFin = consecFin,
						@consecIni = consecIni
		From			@tbConsecutivos


		Update			@tbImagenesxDocumentosDigitalizados
		Set				@consecIni	=	cnsctvo_cdgo_imgn	=	@consecIni + 1


		Insert Into		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados(cnsctvo_cdgo_imgn,cnsctvo_cdgo_dcmnto,cnsctvo_cdgo_tpo_imgn,rta_imgn,prncpl,estdo,usro_crcn)
		Select			cnsctvo_cdgo_imgn,cnsctvo_cdgo_dcmnto, cnsctvo_cdgo_tpo_imgn, rta_imgn, prncpl, estdo, usro_crcn
		From			@tbImagenesxDocumentosDigitalizados



		----------------------------------------- Insertar en tbImagenesxDocumentosDigitalizados -----------------------------------------
	
		 -- Insertar índices x documentos digitalizadas

		Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
						(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,		cnsctvo_cdgo_tpo_indce,			vlr	)
		Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,		2,								@nmro_rdccn
						)

		Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
						(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,		cnsctvo_cdgo_tpo_indce,			vlr	)
		Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,		9,								@nmro_rcbro
						)

		Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
						(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,		cnsctvo_cdgo_tpo_indce,			vlr	)
		Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,		16,								@dscrpcn_tpo_anxo
						)

		Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
						(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,		cnsctvo_cdgo_tpo_indce,			vlr	)
		Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,		20,								Convert(Char(20),@fcha_crcn,120)
						)
		
	End Try

	Begin Catch
		Set @mensajeError = @mensajeError + ERROR_MESSAGE();
		RAISERROR (@mensajeError, 16, 2) WITH SETERROR
	End Catch

End


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesFacturasMasiva] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesFacturasMasiva] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesFacturasMasiva] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesFacturasMasiva] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesFacturasMasiva] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesFacturasMasiva] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesFacturasMasiva] TO [visosservice_role]
    AS [dbo];

