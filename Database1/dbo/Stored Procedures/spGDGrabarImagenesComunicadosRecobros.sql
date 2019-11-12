/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
* Metodo o PRG 	               :  spGDGrabarImagenesComunicadosRecobros
* Desarrollado por		 :  <\A   Andres Taborda			A\>
* Descripcion			 :  <\D   Guarda Imagenes de Recobros			D\>
* Observaciones		         	 :  <\O									O\>
* Parametros			 :  <\P   										P\>		
* Fecha Creacion		 :  <\FC  2018/07/27							FC\>
*  
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION   
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM   AM\>
* Descripcion			 : <\DM   DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM	   FM\>
*---------------------------------------------------------------------------------*/
CREATE Procedure[dbo].[spGDGrabarImagenesComunicadosRecobros] 		
AS
BEGIN

	create table #tmpComunicadosRecobros(
		nmro_cmncdo			varchar(150),
		tpo_imgn			varchar(5),
		tpo_indce			varchar(5),
		rta_imgn			varchar(250),
		cnsctvo_dcmnto_ini	int,
		cnsctvo_cdgo_imgn_ini int
	)

	create table #tmpComunicadosRecobrosFinal(
		cnsctvo_cdgo_dcmnto int,
		nmro_cmncdo			varchar(150),
		tpo_imgn			varchar(5),
		tpo_indce			varchar(5),
		rta_imgn			varchar(250),
		cnsctvo_dcmnto_ini	int,
		cnsctvo_cdgo_imgn_ini int
	)

	create table #imagenes(
		cnsctvo_cdgo_imgn			int,
		cnsctvo_cdgo_dcmnto			int,
		cnsctvo_cdgo_tpo_imgn		int,
		rta_imgn					varchar(250),
		prncpl						char(1),
		estdo						char(1),
		usro_crcn					varchar(30),
		fcha_crcn					datetime,
		cnsctvo_cdgo_tpo_indce		int,
		nmro_cmncdo					varchar(150)
	)


	declare @nmro_imgns int 

	create table #tbConsecutivosIMG (consecFin Int,consecIni Int) 
	create table #tbConsecutivosDOC (cnsctvo_cdgo_dcmnto Int,cnsctvo_cdgo_dcmnto_antrr Int)

	Insert #tmpComunicadosRecobros(nmro_cmncdo,tpo_imgn,tpo_indce,rta_imgn,cnsctvo_dcmnto_ini,cnsctvo_cdgo_imgn_ini)
	Select * , 0 as cnsctvo_dcmnto_ini, 0 as cnsctvo_cdgo_imgn_ini 
	from temporal.dbo.tmpComunicadosRecobros  order by nmro_cmncdo

	
	--calcular consecutivos documentos
	Select @nmro_imgns= count(*)  from tmpComunicadosRecobros

	--calcular documentos digitalizados
	Insert Into		#tbConsecutivosDOC(cnsctvo_cdgo_dcmnto,cnsctvo_cdgo_dcmnto_antrr)
	Exec			spGDCalcularConsecutivoDocumentoDigitalizado @nmro_imgns

	--calculo consecutivos imagenes
	Insert Into		#tbConsecutivosIMG(consecFin,consecIni)
	Exec			spGDCalcularConsecutivoImagenDigitalizada @nmro_imgns


	update #tmpComunicadosRecobros
	set cnsctvo_dcmnto_ini= (Select cnsctvo_cdgo_dcmnto_antrr from #tbConsecutivosDOC)

	update #tmpComunicadosRecobros
	set cnsctvo_cdgo_imgn_ini= (Select consecIni from #tbConsecutivosIMG)

	Insert #tmpComunicadosRecobrosFinal(cnsctvo_cdgo_dcmnto,nmro_cmncdo,tpo_imgn,tpo_indce,rta_imgn,cnsctvo_dcmnto_ini,cnsctvo_cdgo_imgn_ini)
	Select  ROW_NUMBER() OVER(ORDER BY cnsctvo_dcmnto_ini ASC)+ cnsctvo_dcmnto_ini  AS cnsctvo_cdgo_dcmnto,*
	from #tmpComunicadosRecobros



	Insert tbDocumentosDigitalizados(
	cnsctvo_cdgo_dcmnto,
	cnsctvo_cdgo_tpo_dcmntl,
	nmro_imgns,
	cnsctvo_cdgo_dgtlzdr,
	fcha_dgtlzcn,
	cnsctvo_prcso_crga,
	estdo_rgstro
	)Select  cnsctvo_cdgo_dcmnto,
 		2 as cnsctvo_cdgo_tpo_dcmntl,
		1 as nmro_imgns,
		5 as cnsctvo_cdgo_dgtlzdr,
		getdate() as fcha_dgtlzcn,
		null as cnsctvo_prcso_crga,
		'S' asestdo_rgstro
	from #tmpComunicadosRecobrosFinal

	--Insertar Imagenes
	--drop table #imagenes


	Insert #imagenes(cnsctvo_cdgo_imgn,cnsctvo_cdgo_dcmnto,cnsctvo_cdgo_tpo_imgn,rta_imgn,prncpl,estdo,usro_crcn,fcha_crcn,cnsctvo_cdgo_tpo_indce,nmro_cmncdo)
	Select 
		 ROW_NUMBER() OVER(ORDER BY cnsctvo_cdgo_imgn_ini ASC)+ cnsctvo_cdgo_imgn_ini  AS cnsctvo_cdgo_imgn,
		cnsctvo_cdgo_dcmnto,
		tpo_imgn as cnsctvo_cdgo_tpo_imgn,
		rta_imgn,
		'S' as prncpl,
		'A' as estdo,
		'migra01' as usro_crcn,
		getdate() as fcha_crcn,
		tpo_indce as cnsctvo_cdgo_tpo_indce,
		nmro_cmncdo  --Into #imagenes
	from #tmpComunicadosRecobrosFinal

	Insert tbImagenesxDocumentosDigitalizados(
		cnsctvo_cdgo_imgn,
		cnsctvo_cdgo_dcmnto,
		cnsctvo_cdgo_tpo_imgn,
		rta_imgn,
		prncpl,
		estdo,
		usro_crcn,
		fcha_crcn
	)Select 
		 cnsctvo_cdgo_imgn,
		cnsctvo_cdgo_dcmnto,
		cnsctvo_cdgo_tpo_imgn,
		rta_imgn,
		prncpl,
		estdo,
		usro_crcn,
		fcha_crcn
	from #imagenes

	insert tbIndicesxImagenesDigitalizadas(
		cnsctvo_cdgo_imgn,
		cnsctvo_cdgo_dcmnto,
		cnsctvo_cdgo_tpo_dcmntl,
		cnsctvo_cdgo_tpo_indce,
		vlr
	)select cnsctvo_cdgo_imgn,
			cnsctvo_cdgo_dcmnto,
			2 as cnsctvo_cdgo_tpo_dcmntl,
			cnsctvo_cdgo_tpo_indce,
			nmro_cmncdo
	from #imagenes
END

