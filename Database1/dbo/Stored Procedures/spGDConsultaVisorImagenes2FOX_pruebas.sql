
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
* Modificado Por			: <\AM  AM\>
* Descripcion				: <\DM 	DM\>
* Nuevos Parametros			: <\PM 	PM\>
* Nuevas Variables			: <\VM 	VM\>
* Fecha Modificacion		: <\FM  FM\>
*---------------------------------------------------------------------------------*/

CREATE PROCEDURE [dbo].[spGDConsultaVisorImagenes2FOX_pruebas] 
--CREATE PROCEDURE [dbo].[spGDConsultaVisorImagenes2FOX_pruebas] 
	@msnje	varchar(150) output,
	@imp	Int = 0
AS
SET NOCOUNT ON

declare @cantidadIndicesXTipoDocumento  int,
		@cantidadIndice					int,
		@contador						int,
		@tipodocumental					int,
		@maxcnsctvo_vlr					int

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
	cnsctvo_cdgo_estdo_imgn_rcbro1		udtconsecutivo
)

--Almacena la cantidad de indices x Cada tipo de documento
create table #cantidadIndices
(	cnsctvo_cntdd int identity(1,1),
	cntdd int,
	cnsctvo_tpo_dcmntl int
)

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
	insert		into #cantidadIndices (cntdd,cnsctvo_tpo_dcmntl)
	select		count(*) as cntdd,cnsctvo_tpo_dcmntl 
	from		#tmpValoresIndices
	group by	cnsctvo_tpo_dcmntl

	set @contador = 1 --permite iterar sobre el WHILE

	--Indica la cantidad de indices
	select	@cantidadIndicesXTipoDocumento = count(*) from #cantidadIndices


	--Genera tabla temporal tipos imagenes
	Select * into #TiposImagenes From tbTiposImagenes

		--select		* from #tmpValoresIndices
--		select		* from #cantidadIndices
--		return 

--  1 <= 2
	WHILE  @contador <= @cantidadIndicesXTipoDocumento
	BEGIN
		--Obtengo la cantidad de indices que maneja cada tipo de Documento
		select	@cantidadIndice = cntdd,	@tipodocumental = cnsctvo_tpo_dcmntl
		from	#cantidadIndices
		where	cnsctvo_cntdd  =  @contador

		--select	cntdd, cnsctvo_tpo_dcmntl
		--from	#cantidadIndices
		--where	cnsctvo_cntdd  =  @contador
		--select		* from #tmpValoresIndices
		--select		* from #cantidadIndices
		--return 
		
		--Si maneja un indice compuesto
		IF @cantidadIndice > 1
		BEGIN
			-- si tienes varios ìndices
			INSERT INTO #tbImagenes (accn, rta_imgn,dscrpcn_tpo_imgn, dscrpcn_tpo_dcmnto, cnsctvo_cdgo_imgn, cnsctvo_cdgo_tpo_imgn, cnsctvo_cdgo_tpo_dcmnto,	cnsctvo_cdgo_dcmnto)
			SELECT DISTINCT 'NO SELECCIONADO' AS accn, 
			B.rta_imgn, 
			C.dscrpcn_tpo_imgn, 
			d.dscrpcn_tpo_dcmnto, 
			b.cnsctvo_cdgo_imgn , 
			C.cnsctvo_cdgo_tpo_imgn, 		
			d.cnsctvo_cdgo_tpo_dcmnto,		
			B.cnsctvo_cdgo_dcmnto
			FROM		#tmpValoresIndices	X																	
			INNER JOIN	tbIndicesxDocumentosDigitalizados	A	with (nolock)
			ON			A.cnsctvo_cdgo_tpo_dcmntl	= X.cnsctvo_tpo_dcmntl
			And			A.cnsctvo_cdgo_tpo_indce	= X.cnsctvo_indce	
			And			rtrim(ltrim(A.vlr))			= rtrim(ltrim(X.vlr))
			INNER JOIN	tbImagenesxDocumentosDigitalizados	B	with (nolock)
			ON			A.cnsctvo_cdgo_dcmnto		= B.cnsctvo_cdgo_dcmnto
			INNER JOIN  #TiposImagenes C
			ON			B.cnsctvo_cdgo_tpo_imgn		= C.cnsctvo_cdgo_tpo_imgn	
			Inner Join	tbTiposDocumento d						with (nolock)
			ON			d.cnsctvo_cdgo_tpo_dcmnto	= x.cnsctvo_tpo_dcmntl
			Where		X.cnsctvo_tpo_dcmntl			= @tipodocumental
			GROUP BY	B.rta_imgn, 
						C.dscrpcn_tpo_imgn, 
						a.cnsctvo_cdgo_dcmnto,
						a.cnsctvo_cdgo_tpo_dcmntl, 
						d.dscrpcn_tpo_dcmnto, 
						b.cnsctvo_cdgo_imgn,
						C.cnsctvo_cdgo_tpo_imgn, 					
						d.cnsctvo_cdgo_tpo_dcmnto,		
						B.cnsctvo_cdgo_dcmnto
			HAVING COUNT(*) = @cantidadIndice
			ORDER BY	C.dscrpcn_tpo_imgn
			
			-- ANTES
			--INSERT INTO #tbImagenes (accn, rta_imgn,dscrpcn_tpo_imgn, dscrpcn_tpo_dcmnto, cnsctvo_cdgo_imgn, cnsctvo_cdgo_tpo_imgn, cnsctvo_cdgo_tpo_dcmnto,	cnsctvo_cdgo_dcmnto)
			--SELECT DISTINCT 'NO SELECCIONADO' AS accn, B.rta_imgn, C.dscrpcn_tpo_imgn, d.dscrpcn_tpo_dcmnto, b.cnsctvo_cdgo_imgn , 
			--	C.cnsctvo_cdgo_tpo_imgn, 		d.cnsctvo_cdgo_tpo_dcmnto,		B.cnsctvo_cdgo_dcmnto
			--FROM	#tmpValoresIndices	X																	
			--			INNER JOIN tbIndicesxDocumentosDigitalizados	A
			--				ON	X.cnsctvo_tpo_dcmntl	= A.cnsctvo_cdgo_tpo_dcmntl
			--				And	X.cnsctvo_indce			= A.cnsctvo_cdgo_tpo_indce
			--				And LTRIM(RTRIM(X.vlr))		= LTRIM(RTRIM(A.vlr))							
			--			INNER JOIN	tbImagenesxDocumentosDigitalizados	B
			--				ON ( A.cnsctvo_cdgo_dcmnto = B.cnsctvo_cdgo_dcmnto)
			--			INNER JOIN  #TiposImagenes C
			--				ON ( B.cnsctvo_cdgo_tpo_imgn = C.cnsctvo_cdgo_tpo_imgn ) 
			--			Inner Join	tbTiposDocumento d with (nolock)
			--				on	d.cnsctvo_cdgo_tpo_dcmnto = x.cnsctvo_tpo_dcmntl
			--Where	X.cnsctvo_tpo_dcmntl = @tipodocumental
			--GROUP BY B.rta_imgn, C.dscrpcn_tpo_imgn, a.cnsctvo_cdgo_dcmnto,
			--a.cnsctvo_cdgo_tpo_dcmntl, d.dscrpcn_tpo_dcmnto, b.cnsctvo_cdgo_imgn,
			--C.cnsctvo_cdgo_tpo_imgn, 					d.cnsctvo_cdgo_tpo_dcmnto,		B.cnsctvo_cdgo_dcmnto
			--HAVING COUNT(*) = @cantidadIndice
			--ORDER BY C.dscrpcn_tpo_imgn
		
		END
		ELSE
		BEGIN	
			-- si tiene un sòlo indice
			--INSERT INTO #tbImagenes (accn, rta_imgn,dscrpcn_tpo_imgn, dscrpcn_tpo_dcmnto, cnsctvo_cdgo_imgn, cnsctvo_cdgo_tpo_imgn, cnsctvo_cdgo_tpo_dcmnto,	cnsctvo_cdgo_dcmnto)
			--SELECT DISTINCT 'NO SELECCIONADO' AS accn, 
			--B.rta_imgn, 
			--C.dscrpcn_tpo_imgn, 
			--d.dscrpcn_tpo_dcmnto, 
			--b.cnsctvo_cdgo_imgn , 
			--C.cnsctvo_cdgo_tpo_imgn, 		
			--d.cnsctvo_cdgo_tpo_dcmnto,		
			--B.cnsctvo_cdgo_dcmnto
			--FROM		#tmpValoresIndices	X																	
			--INNER JOIN	tbIndicesxDocumentosDigitalizados	A	with (nolock)
			--ON			A.cnsctvo_cdgo_tpo_dcmntl	= X.cnsctvo_tpo_dcmntl
			--And			A.cnsctvo_cdgo_tpo_indce	= X.cnsctvo_indce	
			--And			rtrim(ltrim(A.vlr))			= rtrim(ltrim(X.vlr))
			--INNER JOIN	tbImagenesxDocumentosDigitalizados	B	with (nolock)
			--ON			A.cnsctvo_cdgo_dcmnto		= B.cnsctvo_cdgo_dcmnto
			--INNER JOIN  #TiposImagenes C
			--ON			B.cnsctvo_cdgo_tpo_imgn		= C.cnsctvo_cdgo_tpo_imgn	
			--Inner Join	tbTiposDocumento d						with (nolock)
			--ON			d.cnsctvo_cdgo_tpo_dcmnto	= x.cnsctvo_tpo_dcmntl
			--Where		X.cnsctvo_tpo_dcmntl			= @tipodocumental
			--GROUP BY	B.rta_imgn, 
			--			C.dscrpcn_tpo_imgn, 
			--			a.cnsctvo_cdgo_dcmnto,
			--			a.cnsctvo_cdgo_tpo_dcmntl, 
			--			d.dscrpcn_tpo_dcmnto, 
			--			b.cnsctvo_cdgo_imgn,
			--			C.cnsctvo_cdgo_tpo_imgn, 					
			--			d.cnsctvo_cdgo_tpo_dcmnto,		
			--			B.cnsctvo_cdgo_dcmnto
			--HAVING COUNT(*) = @cantidadIndice
			--ORDER BY	C.dscrpcn_tpo_imgn

			INSERT INTO #tbImagenes (accn, rta_imgn,dscrpcn_tpo_imgn, dscrpcn_tpo_dcmnto, cnsctvo_cdgo_imgn, cnsctvo_cdgo_tpo_imgn, cnsctvo_cdgo_tpo_dcmnto,	cnsctvo_cdgo_dcmnto )	
			SELECT  DISTINCT 'NO SELECCIONADO' AS accn, 
			B.rta_imgn, 
			C.dscrpcn_tpo_imgn, 
			d.dscrpcn_tpo_dcmnto, 
			b.cnsctvo_cdgo_imgn,
			C.cnsctvo_cdgo_tpo_imgn, 		
			d.cnsctvo_cdgo_tpo_dcmnto,		
			B.cnsctvo_cdgo_dcmnto
			FROM		#tmpValoresIndices	X
			INNER JOIN	tbIndicesxDocumentosDigitalizados	A	with (nolock)
			ON			A.cnsctvo_cdgo_tpo_dcmntl	= X.cnsctvo_tpo_dcmntl
			And			A.cnsctvo_cdgo_tpo_indce	= X.cnsctvo_indce			
			And			ltrim(rtrim(A.vlr))			= ltrim(rtrim(X.vlr))											
			INNER JOIN	tbImagenesxDocumentosDigitalizados	B	with (nolock)
			ON			A.cnsctvo_cdgo_dcmnto		= B.cnsctvo_cdgo_dcmnto
			INNER JOIN  #TiposImagenes C
			ON			B.cnsctvo_cdgo_tpo_imgn = C.cnsctvo_cdgo_tpo_imgn 
			Inner Join	tbTiposDocumento d						with (nolock)
			on			d.cnsctvo_cdgo_tpo_dcmnto = x.cnsctvo_tpo_dcmntl
			Where		X.cnsctvo_tpo_dcmntl = @tipodocumental
			ORDER BY	C.dscrpcn_tpo_imgn

			--Select * from #tbImagenes

		END
		SET @contador = @contador +1

	--Select * from #tbImagenes
	--return 

	END

	INSERT INTO #tbImagenes (accn, rta_imgn,dscrpcn_tpo_imgn, dscrpcn_tpo_dcmnto, cnsctvo_cdgo_imgn, cnsctvo_cdgo_tpo_imgn, cnsctvo_cdgo_tpo_dcmnto,	cnsctvo_cdgo_dcmnto )	
	SELECT  DISTINCT 'NO SELECCIONADO' AS accn, B.rta_imgn, 
	C.dscrpcn_tpo_imgn , 
	d.dscrpcn_tpo_dcmnto, 
	b.cnsctvo_cdgo_imgn,
	C.cnsctvo_cdgo_tpo_imgn, 		
	d.cnsctvo_cdgo_tpo_dcmnto,		
	B.cnsctvo_cdgo_dcmnto
	FROM		#recobros	A
	INNER JOIN	tbImagenesxDocumentosDigitalizados	B	with (nolock)
	ON			B.cnsctvo_cdgo_imgn	= A.cnsctvo_cdgo_imgn
	INNER JOIN  #TiposImagenes C
	ON			B.cnsctvo_cdgo_tpo_imgn = C.cnsctvo_cdgo_tpo_imgn
	inner join	tbTiposDocumento d						with (nolock)
	on			d.cnsctvo_cdgo_tpo_dcmnto = a.cnsctvo_cdgo_tpo_dcmnto
	where		A.cnsctvo_cdgo_imgn not in(Select cnsctvo_cdgo_imgn From #tbImagenes)

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

	if @imp = 1
	begin
		update		#tbImagenes
		set			accn					= 'SELECCIONADO',
					cnsctvo_ordn_imprsn		= b.cnsctvo_ordn_imprsn
		from		#tbImagenes a 
		inner join	#recobros b
		on			a.cnsctvo_cdgo_imgn = b.cnsctvo_cdgo_imgn
	end

	SELECT DISTINCT 0 as sel, * FROM #tbImagenes

	-- borra tablas temporales
	drop table #tbImagenes
	drop table #cantidadIndices	
	drop table #TiposImagenes
END TRY

BEGIN CATCH
	set @msnje = 'Se presento un error consultando las Imagenes para el Visor.'
	drop table #tbImagenes	
END CATCH
