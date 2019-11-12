
/*---------------------------------------------------------------------------------
* Metodo o PRG:			spGDIngresarDocumentosAnexosRespondeWeb
* Desarrollado por:		<\A	Ing. Jorge Marcos Rincón Árdila	A\>
* Descripcion:			<\D	Graba un Documento Anexo	D\>
* Fecha Creacion:		<\FC	07/02/2011	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:			<\AM		AM\>
* Descripcion:				<\DM		DM\>
* Nuevos Parametros:		<\PM		PM\>
* Nuevas Variables:			<\VM		VM\>
* Fecha Modificacion:		<\FM		FM\>
*---------------------------------------------------------------------------------*/
CREATE Procedure [dbo].[spGDIngresarDocumentoAnexoRespondeWeb]
/*1*/	@cdgo_cntcto					Varchar(17),
/*2*/	@nmbre_dcmnto					Varchar(150),
/*3*/	@rta_dcmnto						Varchar(250),
/*4*/	@nmro_rdccn						varchar(50),
/*5*/	@nmro_unco_idntfccn				Int,
/*6*/	@orgn_dcmnto					Varchar(20),
/*7*/	@nmbre_dcmnto_orgnl				Varchar(150),
/*8*/	@extnsn							Varchar(4),
/*9*/	@cnsctvo_cdgo_tpo_nmro_rdccn	Int, 
/*10*/	@cnsctvo_cdgo_dcmnto			Int			Output
As
Set NoCount On

Declare		@cnsctvo_cdgo_tpo_dcmntl		Int, 
			@cnsctvo_cdgo_tpo_imgn			Int,
			@cnsctvo_cdgo_dgtlzdr			Int,
			@prncpl							Char(1),
			@nmro_imgns						Int,
			@fcha							Varchar(20),
			@cnsctvo_cdgo_nmro_rdccn		Int,
			@cnsctvo_nmro_rdccn				Int,
			@AnioChar						varchar(5), 
			@DiaChar						varchar(5), 
			@MesChar						varchar(5), 
			@fcha_rdccn						varchar(15),
			@cnsctvo_opcn_ejccn				Int
			
Set			@cnsctvo_cdgo_dgtlzdr		=	5	--SOS
Set			@cnsctvo_cdgo_tpo_dcmntl	=	21	--Documentos Anexos Responde
Set			@cnsctvo_cdgo_tpo_imgn		=	153 --Soporte Responde
Set			@prncpl						=	'S'
Set			@nmro_imgns					=	1
Set			@fcha						=	replace(convert(varchar, getdate(), 120), '-', '/')
Set			@cnsctvo_opcn_ejccn			=	1

Set @AnioChar = convert(varchar(5), DatePart(Year, Getdate()))
Set @MesChar = IsNull(bdGestionDocumental.dbo.fn_Devuelve_Abreviatura_Mes(DatePart(Month, Getdate())), '0')
Set @DiaChar = IsNull(bdGestionDocumental.dbo.fn_Devuelve_Dia_Completo(DatePart(Day, GetDate())), '0')

if (@AnioChar != '0' And @MesChar != '0' And @DiaChar != '0')
	Set @fcha_rdccn = @MesChar + ' ' + @DiaChar + ' ' + substring(@AnioChar, 3, 4)

If Not Exists(Select	1
			From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
			Where		cnsctvo_cdgo_tpo_dcmntl		=	@cnsctvo_cdgo_tpo_dcmntl
			And			cnsctvo_cdgo_tpo_indce		=	24
			And			vlr							=	@cdgo_cntcto)
Begin
	Begin Transaction
		Declare @cnsctvo_cdgo_imgn			Int,
				@cnsctvo_dcmnto				Int
		
		/*			  
		Select  @cnsctvo_dcmnto		= Max(cnsctvo_cdgo_dcmnto) + 1 From bdGestionDocumental.dbo.tbDocumentosDigitalizados
		Select  @cnsctvo_cdgo_imgn	= Max(cnsctvo_cdgo_imgn) + 1 From bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
		*/
		exec spGDCalcularConsecutivo @cnsctvo_dcmnto Output, @cnsctvo_cdgo_imgn Output,	@cnsctvo_opcn_ejccn
	
		Set @cnsctvo_cdgo_nmro_rdccn = IsNull((Select Max(cnsctvo_cdgo_nmro_rdccn) + 1 From tbNumeroRadicacion), 1)
		Set @cnsctvo_nmro_rdccn = IsNull((Select Max(cnsctvo_nmro_rdccn) + 1 From tbNumeroRadicacion), 1)
		
		Insert Into bdGestionDocumental.dbo.tbDocumentosDigitalizados(
				cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	nmro_imgns,		cnsctvo_cdgo_dgtlzdr,	fcha_dgtlzcn)
		Values(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,   @nmro_imgns,	@cnsctvo_cdgo_dgtlzdr,	getDate())
		  
		Insert Into bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados(
				cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_imgn,	rta_imgn,		prncpl)
		Values(	@cnsctvo_cdgo_imgn,		@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_imgn,	@rta_dcmnto,	@prncpl)
		
		Insert Into bdGestionDocumental.dbo.tbNumeroRadicacion(
			cnsctvo_cdgo_nmro_rdccn,	cnsctvo_cdgo_tpo_nmro_rdccn,	cnsctvo_nmro_rdccn, 
			fcha_rdccn,					nmro_rdccn,						cnsctvo_cdgo_dcmnto)
		Values (
			@cnsctvo_cdgo_nmro_rdccn,	@cnsctvo_cdgo_tpo_nmro_rdccn,	@cnsctvo_nmro_rdccn, 
			@fcha_rdccn,				@nmro_rdccn,					@cnsctvo_cdgo_dcmnto)
		
		 -- Insertar índices x documentos digitalizadas
		If @nmbre_dcmnto Is Not Null
		Begin
			Insert Into	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados(
					cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			Values(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	22,							@nmbre_dcmnto)
		End

		Insert Into	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados(
				cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr)
		Values(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	23,							@fcha)

		Insert Into	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados(
				cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr)
		Values(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	24,							@cdgo_cntcto)

		If @nmro_unco_idntfccn Is Not Null
		Begin
			Insert Into bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados(
					cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr)
			Values(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	25,							@nmro_unco_idntfccn)
		End
		  
		Insert Into bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados(
				cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr)
		Values(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	26,							@fcha)

		Insert Into bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados(
				cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr)
		Values(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	29,							@nmro_rdccn)
		
		If @orgn_dcmnto Is Not Null
		Begin
			Insert Into bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados(
					cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr)
			Values(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	30,							@orgn_dcmnto)
		End
		
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
    ON OBJECT::[dbo].[spGDIngresarDocumentoAnexoRespondeWeb] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumentoAnexoRespondeWeb] TO [Kiosko]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumentoAnexoRespondeWeb] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumentoAnexoRespondeWeb] TO [visosservice_role]
    AS [dbo];

