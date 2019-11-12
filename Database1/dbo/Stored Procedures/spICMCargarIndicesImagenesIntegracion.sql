
/*----------------------------------------------------------------------------------------------------------------------------------------   
* Metodo o PRG 	         : spICMCargarIndicesImagenesIntegracionCM
* Desarrollado por		 : <\A Ing. Omar Granados 	A\>
* Descripcion			 : <\D 
                               Procedimiento que permite cargar los indices de las imagenes
                            D\>
* Observaciones		     : <\O	O\>
* Parametros			 : <\P  
                               @cnsctvo_prcso   Int     -- Consecutivo del proceso que agrupa los registros a utilizar
						   P\>		
* Fecha Creacion		 : <\FC  2014/06/15								FC\>
*-----------------------------------------------------------------------------------------------------------------------------------------   
* DATOS DE MODIFICACION   
*-----------------------------------------------------------------------------------------------------------------------------------------
* Modificado Por		 : <\AM AM\>
* Descripcion			 : <\DM DM\>
* Nuevos Parametros	 	 : <\PM PM\>
* Nuevas Variables		 : <\VM VM\>
* Fecha Modificacion	 : <\FM FM\>
*-----------------------------------------------------------------------------------------------------------------------------------------*/
/*
begin transaction
Exec [dbo].[spICMCargarIndicesImagenesIntegracion] 34
rollback
*/

CREATE Procedure [dbo].[spICMCargarIndicesImagenesIntegracion]
  @cnsctvo_prcso Int
AS
Begin

Set nocount on

Declare @mensajeError varchar(255)
Declare @cantImagenes Int
Declare @cantDocumentos Int
Declare @ultmo_cnsctvo_dcmnto Int
Declare @ultmo_cnsctvo_imgn Int
Declare @cnsctvo_cdgo_dgtlzdr Int
Declare @tipoDocumentoCTCGestionDocumental Int
Declare @tipoDocumentoCTCIQ int
Declare @tipoDocumentoFacturaGestionDocumental Int
Declare @tipoDocumentoFacturaIQ Int

Set @tipoDocumentoCTCGestionDocumental = 1
Set @tipoDocumentoCTCIQ = 2
Set @tipoDocumentoFacturaGestionDocumental = 2
Set @tipoDocumentoFacturaIQ = 1

Declare @tbValorEscalar table(
   vlr Int,
   vlr_ds int
)

Create Table #tmpDocumentosDigitalizados(
	indx Int Identity(1,1),
	cnsctvo_cdgo_dcmnto udtConsecutivo,
	nmro_imgns int,
	fcha_dgtlzcn datetime,
	cnsctvo_lte_imgns udtConsecutivo,
	cnsctvo_cdgo_tpo_dcmnto udtConsecutivo,
	cnsctvo_cdgo_tpo_dcmntl udtConsecutivo,
	cnsctvo_cdgo_dcmnto_nvo udtConsecutivo
)

Create Table #tmpICMImagenesxDocumentosDigitalizados(
	indx Int Identity(1,1),
	cnsctvo_cdgo_imgn udtConsecutivo,
	cnsctvo_cdgo_dcmnto udtConsecutivo,
	cnsctvo_cdgo_tpo_imgn udtConsecutivo,
	rta_imgn varchar(250),
	prncpl udtLogico,
	cnsctvo_cdgo_imgn_nvo udtConsecutivo,
	cnsctvo_cdgo_dcmnto_nvo udtConsecutivo
)


Create Table #tmpICMIndicesxImagenesDigitalizadas(
	cnsctvo_indce_imgn_dgtlzda udtConsecutivo,
	cnsctvo_cdgo_imgn udtConsecutivo,
	cnsctvo_cdgo_tpo_indce udtConsecutivo,
	vlr varchar(255),
	cnsctvo_cdgo_tpo_dcmntl udtConsecutivo,
	cnsctvo_cdgo_imgn_nvo udtConsecutivo,
	cnsctvo_cdgo_dcmnto_nvo udtConsecutivo
)

Create Table #tmpICMIndicesxDocumentosDigitalizados(
	cnsctvo_indce_dcmnto  udtConsecutivo,
	cnsctvo_cdgo_dcmnto  udtConsecutivo,
	cnsctvo_cdgo_tpo_indce udtConsecutivo,
	vlr varchar(255),
	cnsctvo_cdgo_dcmnto_nvo udtConsecutivo
)

Set @mensajeError = ''
Set @cnsctvo_cdgo_dgtlzdr = 10

Begin Try

 Insert Into #tmpDocumentosDigitalizados(
	cnsctvo_cdgo_dcmnto, 	nmro_imgns, 
	fcha_dgtlzcn,			cnsctvo_lte_imgns, 
	cnsctvo_cdgo_tpo_dcmnto
 )
 Select cnsctvo_cdgo_dcmnto, nmro_imgns, 
		fcha_dgtlzcn,        cnsctvo_lte_imgns, 
		cnsctvo_cdgo_tpo_dcmnto
 From dbo.tmpICMDocumentosDigitalizados
 Where cnsctvo_prcso = @cnsctvo_prcso

 Insert Into #tmpICMImagenesxDocumentosDigitalizados(
		cnsctvo_cdgo_imgn, 	cnsctvo_cdgo_dcmnto, 
		cnsctvo_cdgo_tpo_imgn, 	rta_imgn, 
		prncpl	
 )
 Select i.cnsctvo_cdgo_imgn, i.cnsctvo_cdgo_dcmnto, 
		i.cnsctvo_cdgo_tpo_imgn, i.rta_imgn, 
		i.prncpl
 From dbo.tmpICMImagenesxDocumentosDigitalizados i
 Inner Join dbo.tmpICMDocumentosDigitalizados d
 On (d.cnsctvo_cdgo_dcmnto = i.cnsctvo_cdgo_dcmnto)
 Where d.cnsctvo_prcso = @cnsctvo_prcso

 Insert Into #tmpICMIndicesxDocumentosDigitalizados(
	cnsctvo_indce_dcmnto,	cnsctvo_cdgo_dcmnto, 
	cnsctvo_cdgo_tpo_indce,	vlr
 )
 Select cnsctvo_indce_dcmnto,	cnsctvo_cdgo_dcmnto, 
		cnsctvo_cdgo_tpo_indce,	vlr
 From [dbo].[tmpICMIndicesxDocumentosDigitalizados]

 Insert Into #tmpICMIndicesxImagenesDigitalizadas(
		cnsctvo_indce_imgn_dgtlzda, cnsctvo_cdgo_imgn, 
		cnsctvo_cdgo_tpo_indce,		vlr
 )
 Select cnsctvo_indce_imgn_dgtlzda, cnsctvo_cdgo_imgn, 
		cnsctvo_cdgo_tpo_indce,		vlr
 From [dbo].[tmpICMIndicesxImagenesDigitalizadas]
 
 Select @cantDocumentos = count(*)
 From #tmpDocumentosDigitalizados d
 
 Select @cantImagenes = count(*) 
 From	#tmpICMImagenesxDocumentosDigitalizados

 Insert Into @tbValorEscalar(vlr,vlr_ds)
 Exec dbo.spGDCalcularConsecutivoDocumentoDigitalizado @cantDocumentos
 
 Select @ultmo_cnsctvo_dcmnto = vlr 
 From @tbValorEscalar

 Delete From @tbValorEscalar

 Insert Into @tbValorEscalar(vlr,vlr_ds)
 Exec dbo.spGDCalcularConsecutivoImagenDigitalizada @cantImagenes
 
 Select @ultmo_cnsctvo_imgn = vlr 
 From @tbValorEscalar

 Update #tmpDocumentosDigitalizados
 Set  cnsctvo_cdgo_dcmnto_nvo = (@ultmo_cnsctvo_dcmnto-@cantDocumentos)+indx,
	  cnsctvo_cdgo_tpo_dcmntl = CASE 
									WHEN cnsctvo_cdgo_tpo_dcmnto = @tipoDocumentoFacturaIQ THEN @tipoDocumentoFacturaGestionDocumental
									WHEN cnsctvo_cdgo_tpo_dcmnto = @tipoDocumentoCTCIQ THEN @tipoDocumentoCTCGestionDocumental
									ELSE cnsctvo_cdgo_tpo_dcmnto	
								END 

 Update #tmpICMImagenesxDocumentosDigitalizados
 Set	cnsctvo_cdgo_imgn_nvo = (@ultmo_cnsctvo_imgn-@cantImagenes)+im.indx,
		cnsctvo_cdgo_dcmnto_nvo = d.cnsctvo_cdgo_dcmnto_nvo
 From	#tmpICMImagenesxDocumentosDigitalizados im
 Inner Join #tmpDocumentosDigitalizados d
 On		d.cnsctvo_cdgo_dcmnto = im.cnsctvo_cdgo_dcmnto

 Update #tmpICMIndicesxDocumentosDigitalizados
 Set cnsctvo_cdgo_dcmnto_nvo = dd.cnsctvo_cdgo_dcmnto_nvo
 From #tmpICMIndicesxDocumentosDigitalizados id
 Inner Join #tmpDocumentosDigitalizados dd
 On (id.cnsctvo_cdgo_dcmnto =  dd.cnsctvo_cdgo_dcmnto)

 Update #tmpICMIndicesxImagenesDigitalizadas
 Set cnsctvo_cdgo_imgn_nvo = im.cnsctvo_cdgo_imgn_nvo,
	 cnsctvo_cdgo_dcmnto_nvo = im.cnsctvo_cdgo_dcmnto_nvo,
	 cnsctvo_cdgo_tpo_dcmntl = dd.cnsctvo_cdgo_tpo_dcmntl
 From #tmpICMIndicesxImagenesDigitalizadas id
 Inner Join #tmpICMImagenesxDocumentosDigitalizados im
 On (id.cnsctvo_cdgo_imgn =  im.cnsctvo_cdgo_imgn)
 Inner Join #tmpDocumentosDigitalizados dd
 On (dd.cnsctvo_cdgo_dcmnto = im.cnsctvo_cdgo_dcmnto)

 Insert Into dbo.tbDocumentosDigitalizados(
  cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl, 
  nmro_imgns, cnsctvo_cdgo_dgtlzdr, 
  fcha_dgtlzcn, cnsctvo_prcso_crga, 
  estdo_rgstro
 )
 Select cnsctvo_cdgo_dcmnto_nvo, cnsctvo_cdgo_tpo_dcmntl,
		nmro_imgns,				@cnsctvo_cdgo_dgtlzdr as cnsctvo_cdgo_dgtlzdr, 
		fcha_dgtlzcn,			@cnsctvo_prcso as cnsctvo_prcso_crga, 
		'A' as estdo_rgstro
 From #tmpDocumentosDigitalizados

 Insert Into dbo.tbImagenesxDocumentosDigitalizados(
		cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto, 
		cnsctvo_cdgo_tpo_imgn,	rta_imgn, 
		prncpl,					estdo, 
		usro_crcn
 )
 Select cnsctvo_cdgo_imgn_nvo,	cnsctvo_cdgo_dcmnto_nvo, 
		cnsctvo_cdgo_tpo_imgn,	rta_imgn, 
		prncpl,					'A' as estdo, 
		'proceso_icm' as usro_crcn
 From #tmpICMImagenesxDocumentosDigitalizados

 Insert Into dbo.tbIndicesxDocumentosDigitalizados(
	cnsctvo_cdgo_dcmnto, cnsctvo_cdgo_tpo_dcmntl,	
	cnsctvo_cdgo_tpo_indce, vlr
 )
 Select a.cnsctvo_cdgo_dcmnto_nvo, (CASE 
									WHEN b.cnsctvo_cdgo_tpo_dcmnto = @tipoDocumentoFacturaIQ THEN @tipoDocumentoFacturaGestionDocumental
									WHEN b.cnsctvo_cdgo_tpo_dcmnto = @tipoDocumentoCTCIQ THEN @tipoDocumentoCTCGestionDocumental
									ELSE b.cnsctvo_cdgo_tpo_dcmnto	
								END) as cnsctvo_cdgo_tpo_dcmntl,
	a.cnsctvo_cdgo_tpo_indce, a.vlr
 From #tmpICMIndicesxDocumentosDigitalizados a 
	  inner join #tmpDocumentosDigitalizados b on a.cnsctvo_cdgo_dcmnto = b.cnsctvo_cdgo_dcmnto
 
 Insert Into dbo.tbIndicesxImagenesDigitalizadas(
	cnsctvo_cdgo_imgn,			cnsctvo_cdgo_dcmnto, 
	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce, 
	vlr
 )
 Select id.cnsctvo_cdgo_imgn_nvo, id.cnsctvo_cdgo_dcmnto_nvo,
		id.cnsctvo_cdgo_tpo_dcmntl, id.cnsctvo_cdgo_tpo_indce,
		id.vlr
 From #tmpICMIndicesxImagenesDigitalizadas id

 
End Try
Begin Catch
 Set @mensajeError = @mensajeError + ERROR_MESSAGE();
 RAISERROR (@mensajeError, 16, 2) WITH SETERROR
End Catch


Insert tmpProceso(cnsctvo_prcso) values (@cnsctvo_prcso)


drop Table #tmpDocumentosDigitalizados
drop Table #tmpICMImagenesxDocumentosDigitalizados
drop Table #tmpICMIndicesxImagenesDigitalizadas
drop Table #tmpICMIndicesxDocumentosDigitalizados
End

