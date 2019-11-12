
/*---------------------------------------------------------------------------------
* Metodo o PRG 	            :  spGDConsultaVisorImagenes2FOX
* Desarrollado por		 	: <\A Luis Fernando Benavides							A\>
* Descripcion			  	: <\D PERMITE CONSULTAR LAS IMAGENES DIGITALIZAS PARA	D\>
*							  <\D SER VISUALIZADAS DESDE EL APLICATIVO DE RECOBROS	D\>
* Observaciones		        : <\O RESOLUCION 458 CU-020								O\>
* Parametros			  	: <\P @mensaje											P\>
* Variables			  		: <\V  	V\>
* Fecha Creacion	        : <\FC 2014/03/20 FC\>
*
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------
* Modificado Por			: <\AM  Luis Fernando Benavides							AM\>
* Descripcion				: <\DM 	Consuta Imagenes x No Rad IQ					DM\>
* Nuevos Parametros			: <\PM 	PM\>
* Nuevas Variables			: <\VM 	VM\>
* Fecha Modificacion		: <\FM  2014/12/18 FM\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------
* Modificado Por			: <\AM  Luis Fernando Benavides							AM\>
* Descripcion				: <\DM 	Optimizacion procedimiento almacenado			
							  1. Remplazo #TiposImagenes X tbTiposImagenes para aprovecha indices PK de la tabla
							  2. Retiro de ltrim y rtrim en el Where
							  3. Cambio de logica para la consulta de indices individuales y combinados (sql dinamico) DM\>
* Nuevos Parametros			: <\PM 	PM\>
* Nuevas Variables			: <\VM 	VM\>
* Fecha Modificacion		: <\FM  2015/03/06 FM\>
*---------------------------------------------------------------------------------*/

/*
Create table #recobros(cnsctvo_cdgo_imgn udtconsecutivo, cnsctvo_cdgo_tpo_dcmnto udtconsecutivo, cnsctvo_cdgo_estdo_imgn_rcbro udtconsecutivo, cnsctvo_cdgo_csa_estdo_imgn_rcbro udtconsecutivo,
cnsctvo_cdgo_tpo_imgn udtconsecutivo, cnsctvo udtconsecutivo)

Create table #tmpValoresIndices (cnsctvo_vlr udtconsecutivo, ordn_indce int, cnsctvo_indce udtconsecutivo, cnsctvo_tpo_dcmntl udtconsecutivo, vlr varchar(50))

Insert into #tmpValoresIndices Select 1,1,5,1,'640579' union Select 2,2,8,1,'' union Select 3,3,19,1,'5' union Select 4,2,9,2,'1409572' 
union Select 5,2,64,32,'' union Select 6,1,2,2,'1000110647'

Declare @msnje varchar(150), @imp int
Exec	bdGestionDocumental.dbo.spGDConsultaVisorImagenes2FOX @msnje output, @imp
*/

CREATE PROCEDURE [dbo].[spGDConsultaVisorImagenes2FOX_sislbr01] 
--Declare 
	@msnje	varchar(150),
	@imp	Int = 0

AS
SET NOCOUNT ON

Declare @cantidadIndicesXTipoDocumento  int,
		@cantidadIndice					int,
		@contador						int,
		@tipodocumental					int,
		@maxcnsctvo_vlr					int,
		@Sentenciasql					NVARCHAR(4000),
		@contador1						int,
		@alias							int,
		@cnsctvo_indce					int

Set @alias = 98 --valor ascci b

--Tabla que almacena las Imagenes
CREATE TABLE #tbImagenes
(	accn								varchar(50),
	cnsctvo_ordn_imprsn					udtconsecutivo default 0,
	dscrpcn_tpo_dcmnto					udtDescripcion,
	rta_imgn							varchar(250), 
	dscrpcn_tpo_imgn					udtDescripcion,
	cnsctvo_cdgo_imgn					udtConsecutivo,
	cnsctvo_cdgo_tpo_imgn				udtconsecutivo,
	cnsctvo_cdgo_tpo_dcmnto				udtconsecutivo,
	cnsctvo_cdgo_dcmnto					int,
	cnsctvo_cdgo_estdo_imgn_rcbro		udtconsecutivo,
	cnsctvo_cdgo_csa_estdo_imgn_rcbro	udtconsecutivo,
	dscrpcn_estdo_imgn_rcbro			udtdescripcion,
	dscrpcn_csa_estdo_imgn_rcbro		udtdescripcion,
	cnsctvo								udtconsecutivo,
	cnsctvo_cdgo_estdo_imgn_rcbro1		udtconsecutivo,
	nmro_pgns_imgn						int
)

--Almacena la cantidad de indices x Cada tipo de documento
Create Table #cantidadIndices
(	cnsctvo_cntdd int identity(1,1),
	cntdd int,
	cnsctvo_tpo_dcmntl int
)

Create Table #tempDocumentos(cnsctvo_cdgo_dcmnto udtconsecutivo)

BEGIN TRY
	-- 2011-001-009189
	If exists (select 1 from #tmpValoresIndices
		where cnsctvo_tpo_dcmntl = 9)
		And Not exists (select 1 from #tmpValoresIndices
		where cnsctvo_tpo_dcmntl IN (17, 18))
		Begin
			select @maxcnsctvo_vlr = max(cnsctvo_vlr) 
			from #tmpValoresIndices

			select @maxcnsctvo_vlr = isnull(@maxcnsctvo_vlr,0) 

			select  identity(int,1,1) cnsctvo_vlr,	ordn_indce	,cnsctvo_indce	,cnsctvo_tpo_dcmntl	, vlr
			into	#tmpValoresIndicesv1
			from	#tmpValoresIndices
			where	1 = 2

			If Not exists (select 1 from #tmpValoresIndices	where cnsctvo_tpo_dcmntl = 17)
				Begin 
					-- se inserta indice como 17  	EP
					insert into	#tmpValoresIndicesv1
					select	ordn_indce	,cnsctvo_indce	,17	, vlr	
					from	#tmpValoresIndices
					where	cnsctvo_tpo_dcmntl = 9
				End

			If Not exists (select 1 from #tmpValoresIndices where cnsctvo_tpo_dcmntl = 18)
				Begin 
					-- se inserta indice como 18  	AT
					insert	into	#tmpValoresIndicesv1
					select  ordn_indce	,cnsctvo_indce	,18	, vlr
					from	#tmpValoresIndices
					where	cnsctvo_tpo_dcmntl = 9
				End

			insert	into #tmpValoresIndices
			select	@maxcnsctvo_vlr+ cnsctvo_vlr,	ordn_indce	,cnsctvo_indce,	cnsctvo_tpo_dcmntl, vlr
			from	#tmpValoresIndicesv1                                                                                                                                              
		End

	--Calculo la cantidad de indices por tipo de documento
	--2014-12-18 sislbr01 Consuta Imagenes x No Rad IQ
	INSERT		INTO #cantidadIndices (cntdd,cnsctvo_tpo_dcmntl)
	SELECT		count(*) AS cntdd,cnsctvo_tpo_dcmntl
	FROM		#tmpValoresIndices
	GROUP BY	cnsctvo_tpo_dcmntl

	Set @contador = 1 --permite iterar sobre el WHILE

	--Indica la cantidad de indices
	Select	@cantidadIndicesXTipoDocumento = count(*) from #cantidadIndices

	--Genera tabla temporal tipos imagenes
	--Select * into #TiposImagenes From tbTiposImagenes
	
	WHILE  @contador <= @cantidadIndicesXTipoDocumento
	BEGIN
	
		--Obtengo la cantidad de indices que maneja cada tipo de Documento
		Select	@cantidadIndice = cntdd,	@tipodocumental = cnsctvo_tpo_dcmntl
		from	#cantidadIndices
		where	cnsctvo_cntdd  =  @contador
		
		Set @Sentenciasql ='
		Select      a.cnsctvo_cdgo_dcmnto
		From		tbIndicesxDocumentosDigitalizados a with (nolock)'

		Set @contador1	= 1 --permite iterar sobre WHILE

		WHILE  @contador1 <= @cantidadIndicesXTipoDocumento
		BEGIN
			-- trae indice por tipo documental
			Select @cnsctvo_indce = cnsctvo_indce
			From #tmpValoresIndices Where cnsctvo_tpo_dcmntl = @tipodocumental And ordn_indce = @contador1

			Set @Sentenciasql = @Sentenciasql + ' Inner join (Select a.cnsctvo_cdgo_dcmnto From #tmpValoresIndices x with (nolock)
			Inner Join tbIndicesxDocumentosDigitalizados a with (nolock) On a.cnsctvo_cdgo_tpo_dcmntl = x.cnsctvo_tpo_dcmntl
			And a.cnsctvo_cdgo_tpo_indce = x.cnsctvo_indce And a.vlr = x.vlr where x.cnsctvo_tpo_dcmntl = '+ cast(@tipodocumental as varchar(20)) + 
			' and x.cnsctvo_indce ='+ cast(@cnsctvo_indce as varchar(20)) +') ' + char(@alias) +
			' On ' + char(@alias) + '.cnsctvo_cdgo_dcmnto = a.cnsctvo_cdgo_dcmnto'

			Set @contador1 = @contador1 + 1
			Set @alias     = @alias + 1
		END

		-- Concatena en temporal los consecutivos de documentos
		Insert into #tempDocumentos(cnsctvo_cdgo_dcmnto)
		EXECUTE SP_EXECUTESQL @Sentenciasql

		SET @contador = @contador + 1
	END

	-- Consolido documentos 
	Select distinct cnsctvo_cdgo_dcmnto into #tempDocumentosConsolidado from #tempDocumentos

	-- Inserto datos tabla temporal
	Insert into #tbImagenes(accn,rta_imgn,cnsctvo_cdgo_imgn,cnsctvo_cdgo_dcmnto,cnsctvo_cdgo_tpo_imgn,dscrpcn_tpo_imgn,dscrpcn_tpo_dcmnto,cnsctvo_cdgo_tpo_dcmnto)
	Select 'NO SELECCIONADO' AS accn
	,b.rta_imgn
	,b.cnsctvo_cdgo_imgn
	,b.cnsctvo_cdgo_dcmnto
	,c.cnsctvo_cdgo_tpo_imgn
	,c.dscrpcn_tpo_imgn
	,e.dscrpcn_tpo_dcmnto
	,e.cnsctvo_cdgo_tpo_dcmnto
	From #tempDocumentosConsolidado a
	Inner join tbImagenesxDocumentosDigitalizados b with(nolock)
	On a.cnsctvo_cdgo_dcmnto = b.cnsctvo_cdgo_dcmnto
	Inner join tbTiposImagenes c with(nolock)
	On b.cnsctvo_cdgo_tpo_imgn = c.cnsctvo_cdgo_tpo_imgn 
	Inner join tbDocumentosDigitalizados d with(nolock)
	On a.cnsctvo_cdgo_dcmnto = d.cnsctvo_cdgo_dcmnto
	Inner Join	tbTiposDocumento e with (nolock)
	On e.cnsctvo_cdgo_tpo_dcmnto = d.cnsctvo_cdgo_tpo_dcmntl

	/*
	INSERT INTO #tbImagenes (accn, rta_imgn,dscrpcn_tpo_imgn, dscrpcn_tpo_dcmnto, cnsctvo_cdgo_imgn, cnsctvo_cdgo_tpo_imgn, cnsctvo_cdgo_tpo_dcmnto,	cnsctvo_cdgo_dcmnto )	
	SELECT  DISTINCT 'NO SELECCIONADO' AS accn, B.rta_imgn, 
	C.dscrpcn_tpo_imgn , 
	d.dscrpcn_tpo_dcmnto, 
	b.cnsctvo_cdgo_imgn,
	C.cnsctvo_cdgo_tpo_imgn, 		
	d.cnsctvo_cdgo_tpo_dcmnto,		
	B.cnsctvo_cdgo_dcmnto
	FROM		#recobros A
	INNER JOIN	tbImagenesxDocumentosDigitalizados	B with (nolock)
	ON			B.cnsctvo_cdgo_imgn	= A.cnsctvo_cdgo_imgn
	INNER JOIN  tbTiposImagenes C with(nolock)
	ON			B.cnsctvo_cdgo_tpo_imgn = C.cnsctvo_cdgo_tpo_imgn
	inner join	tbTiposDocumento d with (nolock)
	on			d.cnsctvo_cdgo_tpo_dcmnto = a.cnsctvo_cdgo_tpo_dcmnto
	where		A.cnsctvo_cdgo_imgn not in(Select cnsctvo_cdgo_imgn From #tbImagenes)
	*/

	-- X default tenga el estado 1 - Sin clasificar 
	Update		#tbImagenes
	Set			cnsctvo_cdgo_estdo_imgn_rcbro		= 1,
				cnsctvo_cdgo_csa_estdo_imgn_rcbro	= 1

	-- Cruza con tabla temporal que viene de la tabla tbRecobrosImagenes y deja el estado que tenga asignado
	Update		#tbImagenes
	Set			cnsctvo_cdgo_estdo_imgn_rcbro		= a.cnsctvo_cdgo_estdo_imgn_rcbro,
				cnsctvo_cdgo_csa_estdo_imgn_rcbro	= a.cnsctvo_cdgo_csa_estdo_imgn_rcbro,
				cnsctvo_cdgo_tpo_imgn				= a.cnsctvo_cdgo_tpo_imgn,
				cnsctvo								= a.cnsctvo
	--			cnsctvo_cdgo_estdo_imgn_rcbro1		= a.cnsctvo_cdgo_estdo_imgn_rcbro
	From		#recobros	a	
	Inner join	#tbImagenes	b	On	a.cnsctvo_cdgo_imgn = b.cnsctvo_cdgo_imgn

	Update		#tbImagenes
	Set			cnsctvo_cdgo_estdo_imgn_rcbro1		= cnsctvo_cdgo_estdo_imgn_rcbro

	If @imp = 1
	begin
		update		#tbImagenes
		set			accn					= 'SELECCIONADO',
					cnsctvo_ordn_imprsn		= b.cnsctvo_ordn_imprsn
		from		#tbImagenes a 
		inner join	#recobros b
		on			a.cnsctvo_cdgo_imgn = b.cnsctvo_cdgo_imgn
	end

	SELECT DISTINCT 0 as sel, * FROM #tbImagenes
	print 'pase por aqui sin error'
	-- borra tablas temporales
	drop table #tbImagenes
	--drop table #cantidadIndices	
	--drop table #TiposImagenes
	--drop table #recobros
	--drop table #tmpValoresIndices
END TRY

BEGIN CATCH
	set @msnje = 'Se presento un error consultando las Imagenes para el Visor.'
		SELECT 
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;

	print 'pase por aqui con error'
	drop table #tbImagenes	
END CATCH

