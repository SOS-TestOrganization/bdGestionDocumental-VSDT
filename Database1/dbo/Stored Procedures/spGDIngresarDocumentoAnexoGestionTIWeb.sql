
/*---------------------------------------------------------------------------------
* Metodo o PRG:			spGDIngresarDocumentoAnexoGestionTIWeb
* Desarrollado por:		<\A	Ing. Jorge Marcos Rincón Árdila	A\>
* Descripcion:			<\D	Graba un Documento Anexo	D\>
* Fecha Creacion:		<\FC	24/01/2011	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:			<\AM		AM\>
* Descripcion:				<\DM		DM\>
* Nuevos Parametros:		<\PM		PM\>
* Nuevas Variables:			<\VM		VM\>
* Fecha Modificacion:		<\FM		FM\>
*---------------------------------------------------------------------------------*/
CREATE Procedure [dbo].[spGDIngresarDocumentoAnexoGestionTIWeb]  
/*1*/	@cdgo_cntcto			Varchar(20),
/*2*/	@nmbre_dcmnto			Varchar(150),
/*3*/	@nmro_rdccn_dcmnto		Varchar(20) = Null,
/*4*/	@rta_dcmnto				Varchar(250),
/*5*/	@usro_slctnte			Varchar(15),
/*6*/	@cnsctvo_cdgo_tpo_imgn	Int,
/*7*/	@orgn_dcmnto			Varchar(255),
/*8*/	@extnsn					Char(4),
/*9*/	@nmbre_dcmnto_orgnl		Varchar(255),
/*10*/	@nmro_imgn				Varchar(255),
/*11*/	@cnsctvo_cdgo_dcmnto	Int		Output,
/*12*/	@estdo					Int		Output
As
Begin
	Set NoCount On

	Declare		@cnsctvo_cdgo_tpo_dcmntl	Int,
				@cnsctvo_cdgo_dgtlzdr		Int,
				@prncpl						Char(1),
				@nmro_imgns					Int,
				@fcha						Varchar(20),
				@fcha_crcn					datetime,
				@cnsctvo_opcn_ejccn			Int


	Set			@cnsctvo_cdgo_dgtlzdr		=	5
	Set			@cnsctvo_cdgo_tpo_dcmntl	=	6	
	Set			@prncpl						=	'S'
	Set			@nmro_imgns					=	1
	Set			@fcha						=	replace(convert(varchar, getdate(), 120), '-', '\')
	Set			@fcha_crcn					=	getDate()
	Set			@cnsctvo_opcn_ejccn			=	1

	Begin Transaction
		Declare @cnsctvo_cdgo_imgn			Int,
				@cnsctvo_dcmnto				Int
		
		/*
		Select  @cnsctvo_dcmnto = Max(cnsctvo_cdgo_dcmnto) + 1 From bdGestionDocumental.dbo.tbDocumentosDigitalizados
		
		Select  @cnsctvo_cdgo_imgn = Max(cnsctvo_cdgo_imgn) + 1 From bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
		*/
		-- Ajuste Cesar García 2011-10-05
		exec spGDCalcularConsecutivo @cnsctvo_dcmnto Output, @cnsctvo_cdgo_imgn Output,	@cnsctvo_opcn_ejccn
		
		Insert Into	bdGestionDocumental.dbo.tbDocumentosDigitalizados(
				cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	nmro_imgns, 
				cnsctvo_cdgo_dgtlzdr,	fcha_dgtlzcn)
		Values(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,   @nmro_imgns, 
				@cnsctvo_cdgo_dgtlzdr,	@fcha_crcn)
		
		Insert Into	bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados(
				cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_imgn, 
				rta_imgn,				prncpl)
		Values(	@cnsctvo_cdgo_imgn,		@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_imgn, 
				@rta_dcmnto,			@prncpl)
		
		 -- Insertar índices x documentos digitalizadas
		Insert Into	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados(
				cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,	vlr	)
		Values(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	22,						@nmbre_dcmnto)
		
		Insert Into bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados(
				cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,	vlr)
		Values(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	23,						@fcha)
		
		Insert Into	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados(
				cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,	vlr	)
		Values(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	24,						@cdgo_cntcto)
		
		Insert Into	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados(
				cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,	vlr	)
		Values(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	31,						@usro_slctnte)
		
		Insert Into bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados(
				cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,	vlr	)
		Values(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	26,						@fcha)
		
		If @nmro_rdccn_dcmnto Is Not Null
			Begin
				Insert Into bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados(
						cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr)
				Values(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	29,							@nmro_rdccn_dcmnto)
			End
		
		Insert Into bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados(
				cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,	vlr	)
		Values(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	30,						@orgn_dcmnto)
		
		-- Insertar índices x imágenes digitalizados
		Insert Into	bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas(
				cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,	vlr	)
		Values(	@cnsctvo_cdgo_imgn,		@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	32,						@nmro_imgn)
		
		 -- Insertar índices x imágenes digitalizados
		Insert Into	bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas(
				cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,	vlr	)
		Values(	@cnsctvo_cdgo_imgn,		@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	33,						@nmbre_dcmnto_orgnl)
		
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


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumentoAnexoGestionTIWeb] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumentoAnexoGestionTIWeb] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumentoAnexoGestionTIWeb] TO [quickweb]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumentoAnexoGestionTIWeb] TO [quick_webusr]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumentoAnexoGestionTIWeb] TO [visosservice_role]
    AS [dbo];

