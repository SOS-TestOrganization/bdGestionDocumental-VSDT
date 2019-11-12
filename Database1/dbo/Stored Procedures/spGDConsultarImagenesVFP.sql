﻿
/*---------------------------------------------------------------------------------
* Metodo o PRG 	            :  spGDConsultarImagenesVFP
* Desarrollado por		 	: <\A Andres Taborda							A\>
* Descripcion			  	: <\D PERMITE CONSULTAR LAS IMAGENES Para Aplicaciones  Visual Fox PRO -VFP DESDE EL APLICATIVO DE RECOBROS	D\>
* Observaciones		        : <\O 							O\>
* Parametros			  	: <\P @mensaje											P\>
* Variables			  		: <\V  	V\>
* Fecha Creacion	        : <\FC 2017/01/27 FC\>
*
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------
*---------------------------------------------------------------------------------
* Modificado Por			: <\AM  		Andres Taborda 									AM\>
* Descripcion				: <\DM 			se actualiza el campo descripcion de imagen de acuerdo a la imagen asociada en la tabla de recobros (#recobros)	DM\>                            
* Nuevos Parametros			: <\PM 												PM\>
* Nuevas Variables			: <\VM 												VM\>
* Fecha Modificacion		: <\FM				2017/04/01								FM\>
*---------------------------------------------------------------------------------
*---------------------------------------------------------------------------------
* Modificado Por			: <\AM  		Andres Taborda 									AM\>
* Descripcion				: <\DM 			Ajuste Orden Imagenes primero debe visualizar las aprobadas CC 179
* Nuevos Parametros			: <\PM 												PM\>
* Nuevas Variables			: <\VM 												VM\>
* Fecha Modificacion		: <\FM				2017/06/07								FM\>
*---------------------------------------------------------------------------------

*/

/*
--test

Create table #recobros(cnsctvo_cdgo_imgn udtconsecutivo, cnsctvo_cdgo_tpo_dcmnto udtconsecutivo, cnsctvo_cdgo_estdo_imgn_rcbro udtconsecutivo, 
cnsctvo_cdgo_csa_estdo_imgn_rcbro udtconsecutivo,cnsctvo_cdgo_tpo_imgn udtconsecutivo, cnsctvo udtconsecutivo)

insert #recobros values (122247548,	2,	2,	2,	100,	3128346)


Create table #tmpValoresIndices (cnsctvo_vlr udtconsecutivo, ordn_indce int, cnsctvo_indce udtconsecutivo, cnsctvo_tpo_dcmntl udtconsecutivo, vlr varchar(50))
Insert into #tmpValoresIndices select 1,3,5,3,'8178' --numero notificacion
Insert into #tmpValoresIndices select 2,4,21,3,'2451' --consecutivo codi oficina
Insert into #tmpValoresIndices select 3,2,9,2,'1924519' --consecutivo recobro




Declare @msnje varchar(150), @imp int
*/

CREATE PROCEDURE [dbo].[spGDConsultarImagenesVFP] 
	 @msnje	varchar(150) output,
	@imp	Int = 0
AS
SET NOCOUNT ON

 --Declare @msnje	varchar(150) , 	@imp	Int = 0

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
	cnsctvo_cdgo_estdo_imgn_rcbro1		udtconsecutivo,
	nmro_pgns_imgn						int
)


	CREATE TABLE #tbImagenesOrden
	(	
	nmr_rgstro							int identity(1,1),
	sel									int default 0,
	accn								varchar(50),
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
create table #cantidadIndices
(	cnsctvo_cntdd int identity(1,1),
	cntdd int,
	cnsctvo_tpo_dcmntl int
)



create table #tmpValoresIndicesv1 (
	cnsctvo_vlr int identity(1,1),
	ordn_indce int,
	cnsctvo_indce int,
	cnsctvo_tpo_dcmntl int,
	vlr varchar(50)
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

			/*select  identity(int,1,1) cnsctvo_vlr,	ordn_indce	,cnsctvo_indce	,cnsctvo_tpo_dcmntl	, vlr
			into	#tmpValoresIndicesv1
			from	#tmpValoresIndices
			where	1 = 2
			*/

			insert 	#tmpValoresIndicesv1 (ordn_indce	,cnsctvo_indce	,cnsctvo_tpo_dcmntl	, vlr)
			select  ordn_indce	,cnsctvo_indce	,cnsctvo_tpo_dcmntl	, vlr
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
	WHERE		cnsctvo_indce	<> 2 
	GROUP BY	cnsctvo_tpo_dcmntl

	set @contador = 1 --permite iterar sobre el WHILE

	--Indica la cantidad de indices
	select	@cantidadIndicesXTipoDocumento = count(*) from #cantidadIndices

	--Genera tabla temporal tipos imagenes
	--Select * into #TiposImagenes From tbTiposImagenes

	WHILE  @contador <= @cantidadIndicesXTipoDocumento
	BEGIN
		--Obtengo la cantidad de indices que maneja cada tipo de Documento
		select	@cantidadIndice = cntdd,	@tipodocumental = cnsctvo_tpo_dcmntl
		from	#cantidadIndices
		where	cnsctvo_cntdd  =  @contador
		
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
			INNER JOIN  tbTiposImagenes C
			ON			B.cnsctvo_cdgo_tpo_imgn		= C.cnsctvo_cdgo_tpo_imgn	
			Inner Join	tbTiposDocumento d						with (nolock)
			ON			d.cnsctvo_cdgo_tpo_dcmnto	= x.cnsctvo_tpo_dcmntl
			Where		X.cnsctvo_tpo_dcmntl			= @tipodocumental
			And			(B.estdo != 'I' or B.estdo is null)
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
		END
		ELSE
		BEGIN	
			-- si tiene un sòlo indice
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
			INNER JOIN  tbTiposImagenes C
			ON			B.cnsctvo_cdgo_tpo_imgn = C.cnsctvo_cdgo_tpo_imgn 
			Inner Join	tbTiposDocumento d						with (nolock)
			on			d.cnsctvo_cdgo_tpo_dcmnto = x.cnsctvo_tpo_dcmntl
			Where		X.cnsctvo_tpo_dcmntl = @tipodocumental
			And			(B.estdo != 'I' or B.estdo is null)
			ORDER BY	C.dscrpcn_tpo_imgn
		END
		SET @contador = @contador +1
			
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
	INNER JOIN  tbTiposImagenes C
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

	
	update #tbImagenes
	set dscrpcn_tpo_imgn = d2.dscrpcn_tpo_imgn
	from #tbImagenes d1 inner join tbTiposImagenes d2
	on d1.cnsctvo_cdgo_tpo_imgn= d2.cnsctvo_cdgo_tpo_imgn


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

	
	/*quitar si la consulta contiene documentos pdf*/
	delete #tbImagenes
	where charindex('.pdf',rta_imgn)!=0

	/*quitar si la consulta contiene docuemntos docx*/
	delete #tbImagenes
	where charindex('.docx',rta_imgn)!=0


--Tabla que almacena las Imagenes
--ajuste cc 179 orden imagenes aprobadas 
	insert #tbImagenesOrden(
	sel,
	accn,
	cnsctvo_ordn_imprsn,
	dscrpcn_tpo_dcmnto,
	rta_imgn,
	dscrpcn_tpo_imgn,
	cnsctvo_cdgo_imgn,
	cnsctvo_cdgo_tpo_imgn,
	cnsctvo_cdgo_tpo_dcmnto,
	cnsctvo_cdgo_dcmnto,
	cnsctvo_cdgo_estdo_imgn_rcbro,
	cnsctvo_cdgo_csa_estdo_imgn_rcbro,
	dscrpcn_estdo_imgn_rcbro,
	dscrpcn_csa_estdo_imgn_rcbro,
	cnsctvo,
	cnsctvo_cdgo_estdo_imgn_rcbro1,
	nmro_pgns_imgn
	)SELECT DISTINCT 0 as sel,
	accn,
	cnsctvo_ordn_imprsn,
	dscrpcn_tpo_dcmnto,
	rta_imgn,
	dscrpcn_tpo_imgn,
	cnsctvo_cdgo_imgn,
	cnsctvo_cdgo_tpo_imgn,
	cnsctvo_cdgo_tpo_dcmnto,
	cnsctvo_cdgo_dcmnto,
	cnsctvo_cdgo_estdo_imgn_rcbro,
	cnsctvo_cdgo_csa_estdo_imgn_rcbro,
	dscrpcn_estdo_imgn_rcbro,
	dscrpcn_csa_estdo_imgn_rcbro,
	cnsctvo,
	cnsctvo_cdgo_estdo_imgn_rcbro1,
	nmro_pgns_imgn 
	FROM #tbImagenes
	where cnsctvo_cdgo_estdo_imgn_rcbro=2 /*aprobado*/
	Order by dscrpcn_tpo_imgn

	insert #tbImagenesOrden(
	sel,
	accn,
	cnsctvo_ordn_imprsn,
	dscrpcn_tpo_dcmnto,
	rta_imgn,
	dscrpcn_tpo_imgn,
	cnsctvo_cdgo_imgn,
	cnsctvo_cdgo_tpo_imgn,
	cnsctvo_cdgo_tpo_dcmnto,
	cnsctvo_cdgo_dcmnto,
	cnsctvo_cdgo_estdo_imgn_rcbro,
	cnsctvo_cdgo_csa_estdo_imgn_rcbro,
	dscrpcn_estdo_imgn_rcbro,
	dscrpcn_csa_estdo_imgn_rcbro,
	cnsctvo,
	cnsctvo_cdgo_estdo_imgn_rcbro1,
	nmro_pgns_imgn
	)SELECT DISTINCT 0 as sel,
	accn,
	cnsctvo_ordn_imprsn,
	dscrpcn_tpo_dcmnto,
	rta_imgn,
	dscrpcn_tpo_imgn,
	cnsctvo_cdgo_imgn,
	cnsctvo_cdgo_tpo_imgn,
	cnsctvo_cdgo_tpo_dcmnto,
	cnsctvo_cdgo_dcmnto,
	cnsctvo_cdgo_estdo_imgn_rcbro,
	cnsctvo_cdgo_csa_estdo_imgn_rcbro,
	dscrpcn_estdo_imgn_rcbro,
	dscrpcn_csa_estdo_imgn_rcbro,
	cnsctvo,
	cnsctvo_cdgo_estdo_imgn_rcbro1,
	nmro_pgns_imgn 
	FROM #tbImagenes
	where cnsctvo_cdgo_estdo_imgn_rcbro!=2 /*No Aprobada aprobado*/
	Order by dscrpcn_tpo_imgn




	SELECT DISTINCT
			nmr_rgstro,	
			sel,
			dscrpcn_estdo_imgn_rcbro,
			dscrpcn_csa_estdo_imgn_rcbro,
			dscrpcn_tpo_imgn,
			rta_imgn,
			accn,
			cnsctvo_ordn_imprsn,
			dscrpcn_tpo_dcmnto,
			cnsctvo_cdgo_imgn,
			cnsctvo_cdgo_tpo_imgn,
			cnsctvo_cdgo_tpo_dcmnto,
			cnsctvo_cdgo_dcmnto,
			cnsctvo_cdgo_estdo_imgn_rcbro,
			cnsctvo_cdgo_csa_estdo_imgn_rcbro,
			cnsctvo,
			cnsctvo_cdgo_estdo_imgn_rcbro1,
			nmro_pgns_imgn	
	FROM #tbImagenesOrden 
	order by nmr_rgstro




	-- borra tablas temporales
	drop table #tbImagenes
	drop table #cantidadIndices	
	drop table #tbImagenesOrden

END TRY

BEGIN CATCH
	set @msnje = 'Se presento un error consultando las Imagenes para el Visor.'
	drop table #tbImagenes	
END CATCH





GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesVFP] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesVFP] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesVFP] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesVFP] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesVFP] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesVFP] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesVFP] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesVFP] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesVFP] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesVFP] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesVFP] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesVFP] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesVFP] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesVFP] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesVFP] TO [visosservice_role]
    AS [dbo];

