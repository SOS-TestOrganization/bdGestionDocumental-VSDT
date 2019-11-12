/*---------------------------------------------------------------------------------
* Metodo o PRG:			spGDAnexarDocumentoRespondeWebService
* Desarrollado por:		<\A	Ing. Cesar García	A\>
* Descripcion:			<\D	Graba un Documento Anexo desde el Web Service de Responde		D\>
* Descripcion:			<\D   	D\>
* Observaciones:		<\O		O\>
* Parametros:			<\P   	P\>
* Variables:			<\V		V\>
* Fecha Creacion:		<\FC	22/02/2012	FC\>
*  
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:			<\AM		AM\>
* Descripcion:				<\DM		DM\>
* Nuevos Parametros:		<\PM		PM\>
* Nuevas Variables:			<\VM		VM\>
* Fecha Modificacion:		<\FM		FM\>
*---------------------------------------------------------------------------------*/
/*
Declare		@cnsctvo_cdgo_dcmnto	Int
Exec spGDAnexarDocumentoRespondeWebService '2012-2016-000316', 'prueba_doc', '2012-02-23', 'siscgm01', '\\atlas\RESPONDE_ANEXOS\2012\02\23\', '.txt', 79
print @cnsctvo_cdgo_dcmnto
*/
CREATE Procedure [dbo].[spGDAnexarDocumentoRespondeWebService]
@cdgo_cntcto				Varchar(17),
@nmbre_dcmnto				Varchar(150),
@fcha_crcn_dcmnto			Varchar(30),
@usro						Char(30),
@rta_dcmnto					Varchar(250), --'2012\02\23\'
@extnsn						Char(4),	  --'.ext'
@rmtnte						Int
  
As
Set NoCount On

Begin
	Declare		@cnsctvo_cdgo_tpo_dcmntl	Int,
				@cnsctvo_cdgo_dgtlzdr		Int,
				@prncpl						Char(1),
				@nmro_imgns					Int,
				@fcha_crcn					Datetime,
				@nmro_dcmnto				Int,
				@nmro_imgn					Int,
				@cnsctvo_opcn_ejccn			Int,
				@cnsctvo_cdgo_tpo_imgn		Int,
				@cnsctvo_archvo				Int,
				@cnsctvo_dcmnto				Int,
				@cnsctvo_cdgo_imgn			Int,
				@estdo_rgsro				Char(1),
				@cnsctvo_cdgo_dcmnto		Int
				
	Set			@cnsctvo_cdgo_dgtlzdr		=	5
	Set			@cnsctvo_cdgo_tpo_dcmntl	=	21--5
	Set			@prncpl						=	'S'
	Set			@nmro_imgns					=	1
	Set			@fcha_crcn					=	GetDate()
	Set			@nmro_dcmnto				=	1
	Set			@nmro_imgn					=	1
	Set			@cnsctvo_cdgo_tpo_imgn		=	79 -- Imágen Responde
	Set			@estdo_rgsro				=	'S'
	Set			@cnsctvo_cdgo_dcmnto		=	0

	--If @exste_dcmnto = 0
	--	Begin
			Set		@cnsctvo_archvo			=	1
			Set		@cnsctvo_opcn_ejccn		=	1
			--Set		@rta_dcmnto			=	@srvdr+@crpta_dcmnto+@rta_dcmnto+@cdgo_cntcto+'_'+Convert(Varchar(3),@cnsctvo_archvo)+@extnsn
			-- Se deshabilita por estar solo operativo en desarrollo - siscgm01 - 20120502 - 8:17pm
			--Exec spGDCalcularConsecutivo @cnsctvo_dcmnto Output, @cnsctvo_cdgo_imgn Output,	@cnsctvo_opcn_ejccn


			Select  @cnsctvo_dcmnto = Max(cnsctvo_cdgo_dcmnto)+1
			From	bdGestionDocumental.dbo.tbDocumentosDigitalizados

			Select  @cnsctvo_cdgo_imgn = Max(cnsctvo_cdgo_imgn)+1
			From	bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados	


			Insert Into		bdGestionDocumental.dbo.tbDocumentosDigitalizados
							(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	nmro_imgns,     cnsctvo_cdgo_dgtlzdr,
								fcha_dgtlzcn,			cnsctvo_prcso_crga,			estdo_rgstro
							)
			Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,   @nmro_imgns,    @cnsctvo_cdgo_dgtlzdr,
								@fcha_crcn_dcmnto,		Null,						@estdo_rgsro
							)
			  
			Insert Into		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
							(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_imgn,		rta_imgn,
								prncpl
							)
			Values			(	@cnsctvo_cdgo_imgn,		@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_imgn,		@rta_dcmnto,
								@prncpl
							)
			  
			 -- Insertar índices x documentos digitalizados
			Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
							(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	22,							@nmbre_dcmnto
							)

			Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
							(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	23,							@fcha_crcn_dcmnto
							)

			Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
							(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	24,							@cdgo_cntcto
							)
		
			-- Insertar índices x imágenes digitalizados
			Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
							(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			Values			(	@cnsctvo_cdgo_imgn,		@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	32,							Convert(Varchar(3),@cnsctvo_archvo)
							)

			 -- Insertar índices x imágenes digitalizados
			Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
							(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			Values			(	@cnsctvo_cdgo_imgn,		@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	33,							@nmbre_dcmnto
							)

			 If @@error != 0
				Begin
					Set		@cnsctvo_cdgo_dcmnto = 0
					Return -1
				End
			Else
				Begin
					Set		@cnsctvo_cdgo_dcmnto = @cnsctvo_dcmnto
				End
			Select	@cnsctvo_cdgo_dcmnto As cnsctvo_cdgo_dcmnto
	--	End
	/*
	Else
		Begin
			Declare		@cnsctvo_cdgo_imgn_1			Int,
						@cnsctvo_cdgo_dcmnto_actl		Int

			-- Calculamos el ultimo consecutivo documento para el código del contacto
			Select		@cnsctvo_cdgo_dcmnto_actl	=	Max(cnsctvo_cdgo_dcmnto)
			From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
			Where		cnsctvo_cdgo_tpo_dcmntl		=	@cnsctvo_cdgo_tpo_dcmntl
			And			cnsctvo_cdgo_tpo_indce		=	24
			And			vlr							=	@cdgo_cntcto

			-- Calculamos el ultimo consecutivo archivo para el documento
			Select		@cnsctvo_archvo			=	IsNull(Max(Convert(Int,vlr)),0)+1
			From		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
			Where		cnsctvo_cdgo_dcmnto		=	@cnsctvo_cdgo_dcmnto_actl
			And			cnsctvo_cdgo_tpo_indce	=	32


			--Set			@rta_dcmnto				=	@srvdr+@crpta_dcmnto+@rta_dcmnto+@cdgo_cntcto+'_'+Convert(Varchar(3),@cnsctvo_archvo)+@extnsn
			Set			@cnsctvo_opcn_ejccn		=	2
			-- Ajuste Cesar García 2011-09-12
			exec spGDCalcularConsecutivo @cnsctvo_dcmnto Output, @cnsctvo_cdgo_imgn_1 Output, @cnsctvo_opcn_ejccn

			Insert Into		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
							(	cnsctvo_cdgo_imgn,			cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_imgn,		rta_imgn,
								prncpl
							)
			Values			(	@cnsctvo_cdgo_imgn_1,		@cnsctvo_cdgo_dcmnto_actl,	@cnsctvo_cdgo_tpo_imgn,		@rta_dcmnto,
								@prncpl
							)
			  
			-- Insertar índices x imágenes digitalizados
			Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
							(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,			cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			Values			(	@cnsctvo_cdgo_imgn_1,	@cnsctvo_cdgo_dcmnto_actl,		@cnsctvo_cdgo_tpo_dcmntl,	32,							Convert(Varchar(3),@cnsctvo_archvo)
							)

			 -- Insertar índices x imágenes digitalizados
			Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
							(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,			cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			Values			(	@cnsctvo_cdgo_imgn_1,	@cnsctvo_cdgo_dcmnto_actl,		@cnsctvo_cdgo_tpo_dcmntl,	33,							@nmbre_dcmnto
							)

			 If @@error != 0
				Begin
					Set @cnsctvo_cdgo_dcmnto = 0
					Return -1
				End
			 Else
				Set @cnsctvo_cdgo_dcmnto = @cnsctvo_cdgo_dcmnto_actl
			Select	@cnsctvo_cdgo_dcmnto As cnsctvo_cdgo_dcmnto
		End
	*/
End


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDAnexarDocumentoRespondeWebService] TO [RespondeService]
    AS [dbo];

