
/* =============================================
-- Author:		<sisogb01>
-- Create date: 20/04/2010
-- Description:	<Procidimiento para buscar los anexos apartir de una lista de indices y entregar su respectivo documento digitalizado>
-- Parametros:

		@indcs_xml nvarchar					->  Cadena xml como el ejemplo siguiente: <Indices><Indice><id>1</id><valor>14621820</valor></Indice><Indice><id>7</id><valor>CC</valor></Indice></Indices>

		@cnsctvo_tpo_dcmnto udtConsecutivo	->  Buscar los Documentos Digitalizados  que tenga Tipo de Documental asociado al 'tipo de documento' enviado en este parametro.

		@indcs_excts char					->  'N': Debe buscar los documentos que tengan 'estos indices o mas'. 'S': Debe buscar documentos que tengan 'solo estos indices' ni mas, ni menos.

-- =============================================
*---------------------------------------------------------------------------------------------------------------------------------------   
*---------------------------------------------------------------------------------------------------------------------------------------   
* DATOS DE MODIFICACION   
* Modificado Por		: <\AM	Ing. Cesar Garcia															AM\>
* Descripcion			: <\DM	Optimización de sp. Se adicionan hints a las tablas y se cambia el			DM\>
						: <\DM	select * final por cada uno de los campos de la variable tabla @Documentos	DM\>
* Nuevos Parametros		: <\PM																				PM\>
* Nuevas Variables		: <\VM																				VM\>
* Fecha Modificacion	: <\FM	2017-07-10																	FM\>
*---------------------------------------------------------------------------------------------------------------------------------------  */
/*
DECLARE @indcs_xml NVARCHAR(3000)
SET @indcs_xml = N'<Indices>
					<Indice>
					<id>1</id>
					<valor>25651845</valor>
					</Indice>
					<Indice>
					<id>7</id>
					<valor>CC</valor>
					</Indice>
				 </Indices>'
Exec dbo.[spGDConsultarDocumentosDigitalizadosxIndicesAnexosXML] @indcs_xml,'N',Null,Null,Null,'N'
select * from dbo.tbIndicesxImagenesDigitalizadas where vlr = '25651845'
select * from dbo.tbIndicesxImagenesDigitalizadas where cnsctvo_cdgo_imgn = 60973139
*/
CREATE PROCEDURE [dbo].[spGDConsultarDocumentosDigitalizadosxIndicesAnexosXML]
	@indcs_xml				NVarchar(3000),
	@indcs_excts			Char(1)			= 'N',	-- 'N': Debe buscar los documentos que tengan 'estos indices o mas'. 'S': Debe buscar documentos que tengan 'solo estos indices' ni mas, ni menos.
	@cnsctvo_tpo_dcmnto		udtConsecutivo	= Null,
	@fcha_dgtlzcn			Datetime		= Null,
	@cnsctvo_cdgo_tpo_imgn	udtConsecutivo	= Null,
	@imgns_prncpls			Char(1)			= 'N'

AS
BEGIN
	SET NOCOUNT ON;

	Declare @Indices table
			(	cnsctvo						int identity(1,1),
				cnsctvo_tpo_indce			int,
				vlr							varchar(255)
			)

	Declare @Documentos Table
			(	tmp							int default(1),
				cnsctvo_cdgo_dcmnto			int,
				cnsctvo_cdgo_tpo_dcmntl		int,
				dscrpcn_tpo_dcmntl			varchar(300),
				nmro_imgns					int,
				cnsctvo_cdgo_dgtlzdr		int,
				dscrpcn_dgtlzdr				varchar(300),
				fcha_dgtlzcn				datetime,
				cnsctvo_cdgo_imgn			int,
				cnsctvo_cdgo_tpo_imgn		int,
				dscrpcn_tpo_imgn			varchar(300),
				rta_imgn					varchar(250),
				prncpl						char(1),
				estdo						char(1)
			)

	Declare @totalIndices			Int
	Declare	@handle					Int
	Declare	@cnsctvo_tpo_dcmtl		Int

	-- Llenar los Indices apartir del documento xml. 
	EXEC sp_xml_preparedocument @handle OUTPUT, @indcs_xml

	Insert Into @Indices(cnsctvo_tpo_indce,vlr)
	Select Distinct id,valor From OPENXML (@handle, '/Indices/Indice', 2) 
	With   (id Int, valor NVarchar(255))

	EXEC sp_xml_removedocument @handle

	Select @totalIndices = count(1) From @Indices

	--insert into dbo.tmpIndicesUsados(cnsctvo_tpo_indce,vlr,sp)

	--select cnsctvo_tpo_indce,vlr,'2' from @Indices

	-- 3. Generar consulta dinamica que consulta los documentos que tengan los indices indicados y despues retorna lo que tienen todos los indices

	Declare		@count	Int,
				@tpo	Int,
				@vlr	Varchar (200)

	Set			@count = @totalIndices

	Declare		@query		Varchar(350),
				@queryTotal Varchar(max),
				@separador	Varchar(20)
	Set			@queryTotal = ''
	Set			@query = 'Select 0,cnsctvo_cdgo_imgn From bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas	A With(NoLock) Where (A.cnsctvo_cdgo_tpo_indce = 1? AND  A.vlr = ''2?'')'

	Set @separador = ''

	While(@count > 0)
		Begin
			Select @tpo= cnsctvo_tpo_indce,@vlr=vlr  From @Indices
			Where  @count = cnsctvo

			Set @queryTotal = @queryTotal + @separador + Replace( Replace(@query,'1?',cast(@tpo as varchar(3))),'2?',Ltrim(Rtrim(@vlr)))

			Set @separador = ' INTERSECT '

			Set @count = @count-1
		End

	--Print @queryTotal

	Insert Into @Documentos(tmp,cnsctvo_cdgo_imgn)
	EXECUTE(@queryTotal)

	If(@indcs_excts = 'S') --Se consultan los todos los indices vinculados a los anexos encontrados, para descartar los anexos que tienen mas indices de los requeridos
		Begin
			/* ANTIGUA VERSION ANTES DE '2010/11/23' */

			/*Insert Into @Documentos(cnsctvo_cdgo_imgn,tmp)

			Select		cnsctvo_cdgo_imgn,0

			From		dbo.tbIndicesxImagenesDigitalizadas id

			Inner Join	@Indices  indices

			On			(id.cnsctvo_cdgo_tpo_indce = indices.cnsctvo_tpo_indce AND id.vlr = indices.vlr)

			Group by	cnsctvo_cdgo_imgn  

			Having		(count(cnsctvo_cdgo_imgn) >= @totalIndices)

			*/

			--print @indcs_excts

			Insert Into @Documentos(cnsctvo_cdgo_imgn,tmp)
			Select		docs.cnsctvo_cdgo_imgn,-1
			From		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas id	With(NoLock)
			Inner Join	@Documentos							docs	On	(docs.cnsctvo_cdgo_imgn = id.cnsctvo_cdgo_imgn)
			Group by	docs.cnsctvo_cdgo_imgn 
			Having		(count(*) = @totalIndices)

			Delete
			From		@Documentos
			Where		tmp = 0
		End

	Select	@cnsctvo_tpo_dcmtl = bdGestionDocumental.dbo.fnGDCalcularTipoDocumentalxTipoDocumento(@cnsctvo_tpo_dcmnto)

	If @cnsctvo_cdgo_tpo_imgn Is Not Null
		Begin
			Insert Into @Documentos
			(	cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_imgn,			cnsctvo_cdgo_tpo_imgn,			rta_imgn,			prncpl,
				estdo,						tmp
			)
			Select      i.cnsctvo_cdgo_dcmnto,		i.cnsctvo_cdgo_imgn,		i.cnsctvo_cdgo_tpo_imgn,		i.rta_imgn,			i.prncpl,
						i.estdo,					1
			From		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados	i	With(NoLock)
			Right Join	@Documentos													d	On	(d.cnsctvo_cdgo_imgn = i.cnsctvo_cdgo_imgn)
			Where		i.cnsctvo_cdgo_tpo_imgn = @cnsctvo_cdgo_tpo_imgn
			And			@imgns_prncpls = 'N'
			Union
			Select      i.cnsctvo_cdgo_dcmnto,		i.cnsctvo_cdgo_imgn,		i.cnsctvo_cdgo_tpo_imgn,		i.rta_imgn,			i.prncpl,
						i.estdo,					1
			From		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados	i	With(NoLock)
			Right Join	@Documentos													d	On	(d.cnsctvo_cdgo_imgn = i.cnsctvo_cdgo_imgn)
			Where		i.cnsctvo_cdgo_tpo_imgn = @cnsctvo_cdgo_tpo_imgn
			And			i.prncpl = 'S'
		End
	Else
		Begin
			Insert Into @Documentos
			(	cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_imgn,			cnsctvo_cdgo_tpo_imgn,			rta_imgn,			prncpl,
				estdo,						tmp
			)
			Select      i.cnsctvo_cdgo_dcmnto,		i.cnsctvo_cdgo_imgn,		i.cnsctvo_cdgo_tpo_imgn,		i.rta_imgn,			i.prncpl,
						i.estdo,					1
			From		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados	i	With(NoLock)
			Right Join	@Documentos													d	On	(d.cnsctvo_cdgo_imgn = i.cnsctvo_cdgo_imgn)
			Where		@cnsctvo_cdgo_tpo_imgn is null
			And			@imgns_prncpls = 'N'
			Union
			Select      i.cnsctvo_cdgo_dcmnto,		i.cnsctvo_cdgo_imgn,		i.cnsctvo_cdgo_tpo_imgn,		i.rta_imgn,			i.prncpl,
						i.estdo,					1
			From		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados	i	With(NoLock)
			Right Join	@Documentos													d	On	(d.cnsctvo_cdgo_imgn = i.cnsctvo_cdgo_imgn)
			Where		@cnsctvo_cdgo_tpo_imgn is null
			And			i.prncpl = 'S'
		End
	
		--Insert Into @Documentos
		--		(	cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_imgn,			cnsctvo_cdgo_tpo_imgn,			rta_imgn,			prncpl,
		--			estdo,						tmp
		--		)
		--Select      i.cnsctvo_cdgo_dcmnto,		i.cnsctvo_cdgo_imgn,		i.cnsctvo_cdgo_tpo_imgn,		i.rta_imgn,			i.prncpl,
		--			i.estdo,					1
		--From		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados	i	With(NoLock)
		--Right Join	@Documentos													d	On	(d.cnsctvo_cdgo_imgn = i.cnsctvo_cdgo_imgn)
		--Where		(@cnsctvo_cdgo_tpo_imgn is null Or i.cnsctvo_cdgo_tpo_imgn = @cnsctvo_cdgo_tpo_imgn)
		--And			(@imgns_prncpls = 'N' Or i.prncpl = 'S')

	Delete
	From		@Documentos
	Where		tmp <= 0

	If @cnsctvo_tpo_dcmnto Is Not Null
		Begin
			Insert Into @Documentos
			(	cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_dgtlzdr,			nmro_imgns,			fcha_dgtlzcn,
				cnsctvo_cdgo_imgn,			cnsctvo_cdgo_tpo_imgn,		rta_imgn,						prncpl,				estdo,
				tmp
			)
			Select		dd.cnsctvo_cdgo_dcmnto,		dd.cnsctvo_cdgo_tpo_dcmntl,	dd.cnsctvo_cdgo_dgtlzdr,		dd.nmro_imgns,		dd.fcha_dgtlzcn,
						d.cnsctvo_cdgo_imgn,		d.cnsctvo_cdgo_tpo_imgn,	d.rta_imgn,						d.prncpl,			d.estdo,
						2
			From		bdGestionDocumental.dbo.tbdocumentosdigitalizados	dd	With(NoLock)
			Inner Join	@Documentos											d	On	(d.cnsctvo_cdgo_dcmnto = dd.cnsctvo_cdgo_dcmnto)
			Where		dd.cnsctvo_cdgo_tpo_dcmntl	= @cnsctvo_tpo_dcmnto
			And			dd.fcha_dgtlzcn				= @fcha_dgtlzcn
			Union
			Select		dd.cnsctvo_cdgo_dcmnto,		dd.cnsctvo_cdgo_tpo_dcmntl,	dd.cnsctvo_cdgo_dgtlzdr,		dd.nmro_imgns,		dd.fcha_dgtlzcn,
						d.cnsctvo_cdgo_imgn,		d.cnsctvo_cdgo_tpo_imgn,	d.rta_imgn,						d.prncpl,			d.estdo,
						2
			From		bdGestionDocumental.dbo.tbdocumentosdigitalizados	dd	With(NoLock)
			Inner Join	@Documentos											d	On	(d.cnsctvo_cdgo_dcmnto = dd.cnsctvo_cdgo_dcmnto)
			Where		dd.cnsctvo_cdgo_tpo_dcmntl = @cnsctvo_tpo_dcmnto
			And			@fcha_dgtlzcn		Is Null
		End
	Else
		Begin
			Insert Into @Documentos
			(	cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_dgtlzdr,			nmro_imgns,			fcha_dgtlzcn,
				cnsctvo_cdgo_imgn,			cnsctvo_cdgo_tpo_imgn,		rta_imgn,						prncpl,				estdo,
				tmp
			)
			Select		dd.cnsctvo_cdgo_dcmnto,		dd.cnsctvo_cdgo_tpo_dcmntl,	dd.cnsctvo_cdgo_dgtlzdr,		dd.nmro_imgns,		dd.fcha_dgtlzcn,
						d.cnsctvo_cdgo_imgn,		d.cnsctvo_cdgo_tpo_imgn,	d.rta_imgn,						d.prncpl,			d.estdo,
						2
			From		bdGestionDocumental.dbo.tbdocumentosdigitalizados	dd	With(NoLock)
			Inner Join	@Documentos											d	On	(d.cnsctvo_cdgo_dcmnto = dd.cnsctvo_cdgo_dcmnto)
			Where		@cnsctvo_tpo_dcmnto Is Null
			And			dd.fcha_dgtlzcn = @fcha_dgtlzcn
			Union
			Select		dd.cnsctvo_cdgo_dcmnto,		dd.cnsctvo_cdgo_tpo_dcmntl,	dd.cnsctvo_cdgo_dgtlzdr,		dd.nmro_imgns,		dd.fcha_dgtlzcn,
						d.cnsctvo_cdgo_imgn,		d.cnsctvo_cdgo_tpo_imgn,	d.rta_imgn,						d.prncpl,			d.estdo,
						2
			From		bdGestionDocumental.dbo.tbdocumentosdigitalizados	dd	With(NoLock)
			Inner Join	@Documentos											d	On	(d.cnsctvo_cdgo_dcmnto = dd.cnsctvo_cdgo_dcmnto)
			Where		@cnsctvo_tpo_dcmnto Is Null
			And			@fcha_dgtlzcn		Is Null
		End

		--Insert Into @Documentos
		--		(	cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_dgtlzdr,			nmro_imgns,			fcha_dgtlzcn,
		--			cnsctvo_cdgo_imgn,			cnsctvo_cdgo_tpo_imgn,		rta_imgn,						prncpl,				estdo,
		--			tmp
		--		)
		--Select		dd.cnsctvo_cdgo_dcmnto,		dd.cnsctvo_cdgo_tpo_dcmntl,	dd.cnsctvo_cdgo_dgtlzdr,		dd.nmro_imgns,		dd.fcha_dgtlzcn,
		--			d.cnsctvo_cdgo_imgn,		d.cnsctvo_cdgo_tpo_imgn,	d.rta_imgn,						d.prncpl,			d.estdo,
		--			2
		--From		bdGestionDocumental.dbo.tbdocumentosdigitalizados	dd	With(NoLock)
		--Inner Join	@Documentos											d	On	(d.cnsctvo_cdgo_dcmnto = dd.cnsctvo_cdgo_dcmnto)
		--Where		(@cnsctvo_tpo_dcmnto Is Null Or dd.cnsctvo_cdgo_tpo_dcmntl = @cnsctvo_tpo_dcmnto)
		--And			(@fcha_dgtlzcn		Is Null	Or dd.fcha_dgtlzcn = @fcha_dgtlzcn)

	Delete
	From		@Documentos
	Where		tmp <= 1

	Insert Into @Documentos
			(	cnsctvo_cdgo_dcmnto,				cnsctvo_cdgo_tpo_dcmntl,	dscrpcn_tpo_dcmntl,				cnsctvo_cdgo_dgtlzdr,	dscrpcn_dgtlzdr,
				nmro_imgns,							fcha_dgtlzcn,				cnsctvo_cdgo_imgn,				cnsctvo_cdgo_tpo_imgn,	dscrpcn_tpo_imgn,
				rta_imgn,							prncpl,						estdo,							tmp
			)
	Select		d.cnsctvo_cdgo_dcmnto,				d.cnsctvo_cdgo_tpo_dcmntl,	tdl.dscrpcn_tpo_dcmnto,			d.cnsctvo_cdgo_dgtlzdr,		dg.dscrpcn_dgtlzdr,
				d.nmro_imgns,						d.fcha_dgtlzcn,				d.cnsctvo_cdgo_imgn,			d.cnsctvo_cdgo_tpo_imgn,	ti.dscrpcn_tpo_imgn,
				ltrim(rtrim(rta_imgn)),				prncpl,						estdo,							3
	From		@Documentos				d
	Left Join	bdGestionDocumental.dbo.tbTiposDocumento	tdl	With(NoLock)	On	(d.cnsctvo_cdgo_tpo_dcmntl = tdl.cnsctvo_cdgo_tpo_dcmnto)
	Left Join   bdGestionDocumental.dbo.tbDigitalizadores	dg	With(NoLock)	On	(d.cnsctvo_cdgo_dgtlzdr = dg.cnsctvo_cdgo_dgtlzdr)
	Left Join   bdGestionDocumental.dbo.tbTiposImagenes		ti	With(NoLock)	On	(ti.cnsctvo_cdgo_tpo_imgn = d.cnsctvo_cdgo_tpo_imgn)
	Where		d.estdo = 'A'

	Delete
	From		@Documentos
	Where		tmp <= 2

	Select		tmp,					cnsctvo_cdgo_dcmnto,			cnsctvo_cdgo_tpo_dcmntl,			dscrpcn_tpo_dcmntl,
				nmro_imgns,				cnsctvo_cdgo_dgtlzdr,			dscrpcn_dgtlzdr,					fcha_dgtlzcn,
				cnsctvo_cdgo_imgn,		cnsctvo_cdgo_tpo_imgn,			dscrpcn_tpo_imgn,					rta_imgn,
				prncpl,					estdo
	From		@Documentos
	Order  By  cnsctvo_cdgo_tpo_dcmntl,cnsctvo_cdgo_imgn ASC
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosDigitalizadosxIndicesAnexosXML] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosDigitalizadosxIndicesAnexosXML] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosDigitalizadosxIndicesAnexosXML] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosDigitalizadosxIndicesAnexosXML] TO [visosservice_role]
    AS [dbo];

