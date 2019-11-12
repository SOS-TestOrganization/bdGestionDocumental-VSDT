/*---------------------------------------------------------------------------------
* Metodo o PRG:			spGDDuplicarDocumentoDigitalizado
* Desarrollado por:		<\A   Ing. Jorge Marcos Rincón Árdila		A\>
* Descripcion:			<\D		D\>
* Parametros:			<\P		P\>
* Variables:			<\V		V\>
* Fecha Creacion:		<\FC	04/05/2009	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM   AM\>
* Descripcion			 : <\DM   DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM   FM\>
*---------------------------------------------------------------------------------*/
-- exec spGDDuplicarDocumentoDigitalizado 2, 9, '261537', '261542', null
CREATE PROCEDURE [dbo].[spGDDuplicarDocumentoDigitalizado] 
/*1*/	@ConsecutivoCodigoTipoDocumento		Int, 
/*2*/	@ConsecutivoCodigoTipoIndice		Int, 
/*3*/	@IndiceAnterior						Varchar(30), 
/*4*/	@IndiceNuevo						Varchar(30), 
/*5*/	@Error								Varchar(10) output 

As

Begin
	
	Declare @ConsDocumentoAnterior	Int, 
			@ConsDocumentoNuevo		Int
	
	Set		@ConsDocumentoAnterior = IsNull((Select	cnsctvo_cdgo_dcmnto
									From	tbIndicesxDocumentosDigitalizados 
									Where	vlr						= @IndiceAnterior 
									And		cnsctvo_cdgo_tpo_dcmntl	= @ConsecutivoCodigoTipoDocumento 
									And		cnsctvo_cdgo_tpo_indce	= @ConsecutivoCodigoTipoIndice), null)	
	Set @Error = '0'
	
	Begin Transaction

		Set @ConsDocumentoNuevo = (Select Max(cnsctvo_cdgo_dcmnto) + 1 From tbIndicesxDocumentosDigitalizados)

		If @ConsDocumentoAnterior Is Not Null 
			Begin
				--Duplicación 
				--Documento Digitalizado
				Insert Into	tbDocumentosDigitalizados(
						cnsctvo_cdgo_dcmnto,			cnsctvo_cdgo_tpo_dcmntl,	nmro_imgns, 
						cnsctvo_cdgo_dgtlzdr,			fcha_dgtlzcn,				cnsctvo_prcso_crga)
				Select	@ConsDocumentoNuevo,			cnsctvo_cdgo_tpo_dcmntl,	nmro_imgns, 
						5,								GetDate(),					0 
				From	tbDocumentosDigitalizados 
				Where	cnsctvo_cdgo_dcmnto		= @ConsDocumentoAnterior 
				
				--Indices del Documento Digitalizado
				Insert Into	tbIndicesxDocumentosDigitalizados 
						(cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr )
				Select	@ConsDocumentoNuevo,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce, 	vlr 
				From	tbIndicesxDocumentosDigitalizados 
				Where	cnsctvo_cdgo_dcmnto		= @ConsDocumentoAnterior 
				

				--Cambio el valor por el nuevo valor
				Update	tbIndicesxDocumentosDigitalizados 
				Set		vlr						= @IndiceNuevo
				Where	cnsctvo_cdgo_dcmnto		= @ConsDocumentoNuevo 
				And		cnsctvo_cdgo_tpo_dcmntl	= @ConsecutivoCodigoTipoDocumento 
				And		cnsctvo_cdgo_tpo_indce	= @ConsecutivoCodigoTipoIndice
				
				Declare @rowsImagenesDocumento		Int, 
						@rowsIndicesImagenes		Int, 
						@ConsImagenDocumentoNuevo	Int, 
						@ConsIndiceImagenNuevo		Int
				
				Set @rowsImagenesDocumento	= IsNull((Select Count(*)
														From tbImagenesxDocumentosDigitalizados 
														Where cnsctvo_cdgo_dcmnto = @ConsDocumentoAnterior ), 0) 
				
				Set @rowsIndicesImagenes	= IsNull((Select Count(*) 
														From tbIndicesxImagenesDigitalizadas 
														Where cnsctvo_cdgo_dcmnto = @ConsDocumentoAnterior ), 0)
				
				--Imagenes del Documento Digitalizado
				If @rowsImagenesDocumento > 0 
					Begin
						Set @ConsImagenDocumentoNuevo = IsNull((Select Max(cnsctvo_cdgo_imgn) + 1 From tbImagenesxDocumentosDigitalizados), Null) 

						If (@ConsImagenDocumentoNuevo Is Not Null)
							Begin
								Declare @tmpImagenes Table (
									cnsctvo_cdgo_imgn		Int, 
									cnsctvo_cdgo_dcmnto		Int, 
									cnsctvo_cdgo_tpo_imgn	Int, 
									rta_imgn				Varchar(250), 
									prncpl					Char(1))
								
								Insert Into @tmpImagenes(
										cnsctvo_cdgo_imgn,	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_imgn, 
										rta_imgn,			prncpl)
								Select	cnsctvo_cdgo_imgn,	@ConsDocumentoNuevo,	cnsctvo_cdgo_tpo_imgn, 
										rta_imgn,			prncpl 
								From	tbImagenesxDocumentosDigitalizados 
								Where	cnsctvo_cdgo_dcmnto = @ConsDocumentoAnterior 
								
								--Update del consecutivo de la tabla temporal
								Update	@tmpImagenes 
								Set		@ConsImagenDocumentoNuevo = cnsctvo_cdgo_imgn = @ConsImagenDocumentoNuevo + 1
								
								--Inserto los datos de la temporal a tbImagenesxDocumentosDigitalizados
								Insert Into	tbImagenesxDocumentosDigitalizados(
										cnsctvo_cdgo_imgn,	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_imgn, 
										rta_imgn,			prncpl )
								Select	cnsctvo_cdgo_imgn,	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_imgn, 
										rta_imgn,			prncpl 
								From	@tmpImagenes 
							End 
					End
				
				--Indices de las Imagenes del Documento Digitalizado
				If @rowsIndicesImagenes > 0 
					Begin
						Set @ConsIndiceImagenNuevo = IsNull((Select Max(cnsctvo_indce_imgn_dgtlzda) + 1
															From tbIndicesxImagenesDigitalizadas), Null) 
						If @ConsIndiceImagenNuevo Is Not Null
							Begin

								Declare @tmpIndicesxImagenes Table (
									cnsctvo_indce_imgn_dgtlzda	Int, 
									cnsctvo_cdgo_imgn			Int, 
									cnsctvo_cdgo_dcmnto			Int, 
									cnsctvo_cdgo_tpo_dcmntl		Int, 
									cnsctvo_cdgo_tpo_indce		Int, 
									vlr							Varchar(255))
								
								Insert Into	@tmpIndicesxImagenes(
										cnsctvo_indce_imgn_dgtlzda,		cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto, 
										cnsctvo_cdgo_tpo_dcmntl,		cnsctvo_cdgo_tpo_indce,	vlr )
								Select	cnsctvo_indce_imgn_dgtlzda,		cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto, 
										cnsctvo_cdgo_tpo_dcmntl,		cnsctvo_cdgo_tpo_indce,	vlr 
								From	tbIndicesxImagenesDigitalizadas 
								Where	cnsctvo_cdgo_dcmnto = @ConsDocumentoAnterior 
								
								--Update del consecutivo de la tabla temporal
								Update	@tmpIndicesxImagenes 
								Set		@ConsIndiceImagenNuevo = cnsctvo_indce_imgn_dgtlzda = @ConsIndiceImagenNuevo + 1
								
								--Inserto los datos de la temporal a tbIndicesxImagenesDigitalizadas
								Insert Into	tbIndicesxImagenesDigitalizadas(
										cnsctvo_indce_imgn_dgtlzda,		cnsctvo_cdgo_imgn,			cnsctvo_cdgo_dcmnto, 
										cnsctvo_cdgo_tpo_dcmntl,		cnsctvo_cdgo_tpo_indce,		vlr )
								Select	cnsctvo_indce_imgn_dgtlzda,		cnsctvo_cdgo_imgn,			cnsctvo_cdgo_dcmnto, 
										cnsctvo_cdgo_tpo_dcmntl,		cnsctvo_cdgo_tpo_indce,		vlr 
								From	@tmpIndicesxImagenes
								
							End
					End
			End

		If @@Error != 0 
			Begin
				Set @Error = '1'
				Rollback Transaction
			End
		Else
			Commit Transaction
End

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDDuplicarDocumentoDigitalizado] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDDuplicarDocumentoDigitalizado] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDDuplicarDocumentoDigitalizado] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDDuplicarDocumentoDigitalizado] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDDuplicarDocumentoDigitalizado] TO [visosservice_role]
    AS [dbo];

