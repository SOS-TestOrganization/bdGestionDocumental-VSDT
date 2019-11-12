
CREATE Procedure [dbo].[spGDGrabarDocumentosAnexosResponde]
@cdgo_cntcto				Varchar(17),
@nmbre_dcmnto				Varchar(150),
@fcha_rdccn_dcmnto			Varchar(30),
@nmro_rdccn_dcmnto			Varchar(50),
@rta_dcmnto					Varchar(250),
@nmro_unco_idntfccn			Int,
@fcha_ingrso_cntcto			Datetime,
@opcn_ejccn					Int,
@cnsctvo_dcmnto				Int	=	Null,
@cnsctvo_cdgo_tpo_imgn		Int,
@orgn_dcmnto				Varchar(20),
@nmbre_dcmnto_orgnl			Varchar(250),
@extnsn						Char(4),
@nmro_unco_idntfccn_ctznte	Int	=	Null,
@cnsctvo_cdgo_dcmnto		Int		Output,
@estdo						Int		Output,
@cnsctvo_archvo				Int		Output

  
As
Set NoCount On

Declare		@cnsctvo_cdgo_tpo_dcmntl	Int,
			@cnsctvo_cdgo_dgtlzdr		Int,
			@prncpl						Char(1),
			@nmro_imgns					Int,
			@fcha_crcn					Datetime,
			@cnsctvo_opcn_ejccn			Int
			
Set			@cnsctvo_cdgo_dgtlzdr		=	5
Set			@cnsctvo_cdgo_tpo_dcmntl	=	21
Set			@prncpl						=	'S'
Set			@nmro_imgns					=	1
Set			@fcha_crcn					=	GetDate()
Set			@cnsctvo_opcn_ejccn			=	1

If	@opcn_ejccn	=	1
	Begin
		If Not Exists	(	Select		1
							From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
							Where		cnsctvo_cdgo_tpo_dcmntl		=	@cnsctvo_cdgo_tpo_dcmntl
							And			cnsctvo_cdgo_tpo_indce		=	24
							And			vlr							=	@cdgo_cntcto
						)
			Begin
				Begin Transaction
					Declare	--@cnsctvo_dcmnto				Int,
							@cnsctvo_cdgo_imgn			Int

					Set		@cnsctvo_archvo		=	1
					Set		@rta_dcmnto			=	@rta_dcmnto+Convert(Varchar(3),@cnsctvo_archvo)+Lower(@extnsn)
					
					/*
					Select  @cnsctvo_dcmnto = Max(cnsctvo_cdgo_dcmnto)+1
					From	bdGestionDocumental.dbo.tbDocumentosDigitalizados

					Select  @cnsctvo_cdgo_imgn = Max(cnsctvo_cdgo_imgn)+1
					From	bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
					 */
				
					-- Ajuste siscgm01 2012-07-18
					exec spGDCalcularConsecutivo @cnsctvo_dcmnto Output, @cnsctvo_cdgo_imgn Output,	@cnsctvo_opcn_ejccn
					-- Ajuste siscgm01 2012-07-18 

					Insert Into		bdGestionDocumental.dbo.tbDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	nmro_imgns,     cnsctvo_cdgo_dgtlzdr,
										fcha_dgtlzcn
									)
					Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,   @nmro_imgns,    @cnsctvo_cdgo_dgtlzdr,
										@fcha_crcn
									)
					  
					Insert Into		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
									(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_imgn,		rta_imgn,
										prncpl
									)
					Values			(	@cnsctvo_cdgo_imgn,		@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_imgn,		@rta_dcmnto,
										@prncpl
									)
					  
					 -- Insertar índices x documentos digitalizadas
					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	22,							@nmbre_dcmnto
									)

					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	23,							@fcha_rdccn_dcmnto
									)

					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	24,							@cdgo_cntcto
									)
					  
					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	25,							@nmro_unco_idntfccn
									)
					  
					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	26,							@fcha_ingrso_cntcto
									)

					Insert			Into bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	29,							@nmro_rdccn_dcmnto
									)

					Insert			Into bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	30,							@orgn_dcmnto
									)

					Insert			Into bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	34,							@nmro_unco_idntfccn_ctznte
									)


					-- Insertar índices x imágenes digitalizados
					Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
									(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_cdgo_imgn,		@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	32,							Convert(Varchar(3),@cnsctvo_archvo)
									)

					 -- Insertar índices x imágenes digitalizados
					Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
									(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_cdgo_imgn,		@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	33,							@nmbre_dcmnto_orgnl
									)

					 
					 If @@error != 0
						Begin
							Set @cnsctvo_cdgo_dcmnto = 0
							Rollback Transaction
						End
					 Else
						Begin
							Set @cnsctvo_cdgo_dcmnto = @cnsctvo_dcmnto
							Commit Transaction
						End
			End
		Else
			Begin
				If	Exists	(	Select		1
								From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
								Where		cnsctvo_cdgo_tpo_dcmntl		=	@cnsctvo_cdgo_tpo_dcmntl
								And			cnsctvo_cdgo_tpo_indce		=	29
								And			vlr							=	@nmro_rdccn_dcmnto
							)
					Begin
						Set	@estdo	=	2
					End
				Else
					Begin
						Begin Transaction
							Declare	--@cnsctvo_dcmnto				Int,
									@cnsctvo_cdgo_imgn_1			Int,
									@cnsctvo_cdgo_dcmnto_actl		Int
		
							-- Calculamos el ultimo consecutivo documento para el código del contacto
							Select		@cnsctvo_cdgo_dcmnto_actl	=	Max(cnsctvo_cdgo_dcmnto)
							From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
							Where		cnsctvo_cdgo_tpo_dcmntl		=	@cnsctvo_cdgo_tpo_dcmntl
							And			cnsctvo_cdgo_tpo_indce		=	24
							And			vlr							=	@cdgo_cntcto

							-- Calculamos el ultimo consecutivo archivo para el documento
							Select	@cnsctvo_archvo	=	IsNull(Max(Convert(Int,vlr)),0)+1
							From	bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
							Where	cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto_actl
							And		cnsctvo_cdgo_tpo_indce	=	32

							Set		@rta_dcmnto			=	@rta_dcmnto+(Convert(Varchar(3),@cnsctvo_archvo))+Lower(@extnsn)

							/*  
							Select  @cnsctvo_dcmnto = Max(cnsctvo_cdgo_dcmnto)+1
							From	bdGestionDocumental.dbo.tbDocumentosDigitalizados

							Select  @cnsctvo_cdgo_imgn_1 = Max(cnsctvo_cdgo_imgn)+1
							From	bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
							*/

							-- Ajuste siscgm01 2012-07-18
							exec spGDCalcularConsecutivo @cnsctvo_dcmnto Output, @cnsctvo_cdgo_imgn_1 Output, @cnsctvo_opcn_ejccn
							-- Ajuste siscgm01 2012-07-18
 
							Insert Into		bdGestionDocumental.dbo.tbDocumentosDigitalizados
											(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	nmro_imgns,     cnsctvo_cdgo_dgtlzdr,
												fcha_dgtlzcn
											)
							Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,   @nmro_imgns,    @cnsctvo_cdgo_dgtlzdr,
												@fcha_crcn
											)
							  
							Insert Into		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
											(	cnsctvo_cdgo_imgn,			cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_imgn,		rta_imgn,
												prncpl
											)
							Values			(	@cnsctvo_cdgo_imgn_1,		@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_imgn,		@rta_dcmnto,
												@prncpl
											)
							  
							 -- Insertar índices x documentos digitalizadas
							Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
											(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
							Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	22,							@nmbre_dcmnto
											)

							Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
											(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
							Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	23,							@fcha_rdccn_dcmnto
											)

							Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
											(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
							Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	24,							@cdgo_cntcto
											)
							  
							Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
											(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
							Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	25,							@nmro_unco_idntfccn
											)
							  
							Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
											(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
							Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	26,							@fcha_ingrso_cntcto
											)

							Insert			Into bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
											(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
							Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	29,							@nmro_rdccn_dcmnto
											)

							Insert			Into bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
											(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
							Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	30,							@orgn_dcmnto
											)

							Insert			Into bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
											(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
							Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	34,							@nmro_unco_idntfccn_ctznte
											)

							-- Insertar índices x imágenes digitalizados
							Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
											(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
							Values			(	@cnsctvo_cdgo_imgn_1,	@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	32,							Convert(Varchar(3),@cnsctvo_archvo)
											)

							 -- Insertar índices x imágenes digitalizados
							Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
											(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
							Values			(	@cnsctvo_cdgo_imgn_1,	@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	33,							@nmbre_dcmnto_orgnl
											)

							 
							 If @@error != 0
								Begin
									Set @cnsctvo_cdgo_dcmnto = 0
									Rollback Transaction
								End
							 Else
								Begin
									Set @cnsctvo_cdgo_dcmnto = @cnsctvo_dcmnto
									Commit Transaction
								End
					End
			End
	End
Else
	Begin
		Begin Transaction
			Declare	@cnsctvo_cdgo_imgn_2	Int
			Set		@cnsctvo_opcn_ejccn	=	2
			
			/*
			Select  @cnsctvo_cdgo_imgn_2	=	Max(cnsctvo_cdgo_imgn)+1
			From	bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
			*/

			-- Ajuste siscgm01 2012-07-18
			exec spGDCalcularConsecutivo @cnsctvo_dcmnto, @cnsctvo_cdgo_imgn_2 Output,	@cnsctvo_opcn_ejccn
			-- Ajuste siscgm01 2012-07-18

			-- Calculamos el ultimo consecutivo archivo para el documento
			Select	@cnsctvo_archvo	=	IsNull(Max(Convert(Int,vlr)),0)+1
			From	bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
			Where	cnsctvo_cdgo_dcmnto	=	@cnsctvo_dcmnto
			And		cnsctvo_cdgo_tpo_indce	=	32

			Set		@rta_dcmnto			=	@rta_dcmnto+(Convert(Varchar(3),@cnsctvo_archvo))+Lower(@extnsn)



			Insert Into		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
							(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_imgn,		rta_imgn,
								prncpl
							)
			Values			(	@cnsctvo_cdgo_imgn_2,	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_imgn,		@rta_dcmnto,
								@prncpl
							)

			-- Insertar índices x imágenes digitalizados
			Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
							(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			Values			(	@cnsctvo_cdgo_imgn_2,	@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	32,							Convert(Varchar(3),@cnsctvo_archvo)
							)


			 -- Insertar índices x imágenes digitalizados
					Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
									(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_cdgo_imgn_2,	@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	33,							@nmbre_dcmnto_orgnl
									)
		
			 If @@error != 0
				Begin
					Set @cnsctvo_cdgo_dcmnto = 0
					Rollback Transaction
				End
			 Else
				Begin
					Set @cnsctvo_cdgo_dcmnto = @cnsctvo_dcmnto
					Commit Transaction
				End
	End
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosResponde] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosResponde] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosResponde] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosResponde] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosResponde] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosResponde] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosResponde] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosResponde] TO [900005 Consultor Asesor Comercial]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosResponde] TO [Consultor Asesor Comercial]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosResponde] TO [Consultor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosResponde] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosResponde] TO [Autorizador Validacion Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosResponde] TO [Consultor Salud Privilegiado]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosResponde] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosResponde] TO [visosservice_role]
    AS [dbo];

