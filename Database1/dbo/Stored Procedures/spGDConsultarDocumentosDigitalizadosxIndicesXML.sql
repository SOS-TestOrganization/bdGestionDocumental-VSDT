/* =============================================
-- Author:		<sisogb01>
-- Create date: 16/04/2010
-- Description:	<Procidimiento para buscar documentos digitalizados apartir de una lista de indices>
-- Parametros:
		@indcs_xml nvarchar					->  Cadena xml como el ejemplo siguiente: <Indices><Indice><id>1</id><valor>14621820</valor></Indice><Indice><id>7</id><valor>CC</valor></Indice></Indices>
		@cnsctvo_tpo_dcmnto udtConsecutivo	->  Buscar los Documentos Digitalizados  que tenga Tipo de Documental asociado al 'tipo de documento' enviado en este parametro.
		@indcs_excts char					->  'N': Debe buscar los documentos que tengan 'estos indices o mas'. 'S': Debe buscar documentos que tengan 'solo estos indices' ni mas, ni menos.
-- =============================================
DECLARE @indcs_xml NVARCHAR(3000)
SET @indcs_xml = N'<Indices>
					<Indice>
					<id>1</id>
					<valor>14621820</valor>
					</Indice>
					<Indice>
					<id>7</id>
					<valor>CC</valor>
					</Indice>
				 </Indices>'
Exec dbo.spGDConsultarDocumentosDigitalizadosxIndicesXML @indcs_xml,'N',18
*/
CREATE PROCEDURE [dbo].[spGDConsultarDocumentosDigitalizadosxIndicesXML]
	@indcs_xml				NVarchar(3000),
	@indcs_excts			Char(1)			= 'N',	-- 'N': Debe buscar los documentos que tengan 'estos indices o mas'. 'S': Debe buscar documentos que tengan 'solo estos indices' ni mas, ni menos.
	@cnsctvo_tpo_dcmnto		udtConsecutivo	= Null,
	@fcha_dgtlzcn			Datetime		= Null
AS
BEGIN
	SET NOCOUNT ON;
	Declare @Indices table
				(	cnsctvo				int identity(1,1),
					cnsctvo_tpo_indce	int,
					vlr					varchar(255)
				)

	Declare @DocumentosIndices Table
				(	cnsctvo_cdgo_dcmnto	int,
					count_				int,
					cnsctvo_tpo_indce	int,
					vlr					varchar(250)
				)

	Declare @Documentos Table
				(	tmp						int default(1),
					cnsctvo_cdgo_dcmnto		int,
					cnsctvo_cdgo_tpo_dcmntl	int,
					dscrpcn_tpo_dcmntl		varchar(300),
					nmro_imgns				int,
					cnsctvo_cdgo_dgtlzdr	int,
					dscrpcn_dgtlzdr			varchar(300),
					fcha_dgtlzcn			datetime,
					cnsctvo_cdgo_imgn		int,
					cnsctvo_cdgo_tpo_imgn	int,
					dscrpcn_tpo_imgn		varchar(300),
					rta_imgn				varchar(250),
					prncpl					char(1),
					estdo					char(1)
				)

	Declare @totalIndices			Int
	Declare	@handle					Int
	Declare	@cnsctvo_tpo_dcmtl		Int

	-- 1.Poblar Tabla de Indices a partir del XML ingresado.
	EXEC sp_xml_preparedocument @handle OUTPUT, @indcs_xml

	INSERT INTO @Indices(cnsctvo_tpo_indce,vlr)
	SELECT distinct id,valor FROM OPENXML (@handle, '/Indices/Indice', 2) 
	WITH   (id Int,   valor NVARCHAR(255))

	EXEC sp_xml_removedocument @handle

	-- 2.Calcular Total de Indices.
	Select @totalIndices = count(1) From @Indices

	-- --Auditoria:
	-- Insert into dbo.tmpIndicesUsados(cnsctvo_tpo_indce,vlr,sp) --select cnsctvo_tpo_indce,vlr,'3' from @Indices
	-- 3. Generar consulta dinamica que consulta los documentos que tengan los indices indicados y despues retorna lo que tienen todos los indices
	Declare		@count		Int,
				@tpo		Int,
				@vlr		Varchar (200)

	Set			@count = @totalIndices

	Declare		@query		Varchar(350),
				@queryTotal Varchar(max),
				@separador	Varchar(20)

	Set			@queryTotal = ''
	Set			@query = 'Select 0,cnsctvo_cdgo_dcmnto From BDGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	A With(NoLock) Where (A.cnsctvo_cdgo_tpo_indce = 1? AND  A.vlr = ''2?'')'
	Set			@separador = ''

	While(@count > 0)
		Begin
			Select @tpo= cnsctvo_tpo_indce,@vlr=vlr  From @Indices
			Where  @count = cnsctvo
			Set @queryTotal = @queryTotal + @separador + Replace( Replace(@query,'1?',cast(@tpo as varchar(3))),'2?',@vlr)
			Set @separador = ' INTERSECT '
			Set @count = @count-1
		End
	
	--Print @queryTotal
	
	Insert Into @Documentos(tmp,cnsctvo_cdgo_dcmnto)
	EXECUTE(@queryTotal)

	If(@indcs_excts = 'S') --Se consultan los todos los indices vinculados a los documentos, para descartar los docs que tienen mas indices de los requeridos
		Begin
			-- Antigua Version: 2010/11/23
			/** 
			Insert Into @DocumentosIndices(cnsctvo_cdgo_dcmnto,cnsctvo_tpo_indce,vlr)
			Select		Distinct
						cnsctvo_cdgo_dcmnto,
						indices.cnsctvo_tpo_indce,indices.vlr
			From		dbo.tbIndicesxDocumentosDigitalizados id
			Inner Join	@Indices  indices
			On			(id.cnsctvo_cdgo_tpo_indce = indices.cnsctvo_tpo_indce AND id.vlr = indices.vlr)
			*/
			--print @indcs_excts
			Insert Into @Documentos(cnsctvo_cdgo_dcmnto,tmp)
			Select		docs.cnsctvo_cdgo_dcmnto,-1
			From		BDGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	id		With(NoLock)
			Inner Join	@Documentos													docs	On	(docs.cnsctvo_cdgo_dcmnto = id.cnsctvo_cdgo_dcmnto)
			Group by	docs.cnsctvo_cdgo_dcmnto  
			Having		(count(docs.cnsctvo_cdgo_dcmnto) = @totalIndices)
	
			Delete
			From		@Documentos Where tmp = 0
		End

	Select		@cnsctvo_tpo_dcmtl = BDGestionDocumental.dbo.fnGDCalcularTipoDocumentalxTipoDocumento(@cnsctvo_tpo_dcmnto) 

	If @cnsctvo_tpo_dcmtl Is not Null
		Begin
			Insert Into @Documentos
			(	cnsctvo_cdgo_dcmnto,			cnsctvo_cdgo_tpo_dcmntl,			cnsctvo_cdgo_dgtlzdr,			nmro_imgns,			fcha_dgtlzcn,
				estdo,							tmp
			)
			Select		dd.cnsctvo_cdgo_dcmnto,			dd.cnsctvo_cdgo_tpo_dcmntl,			dd.cnsctvo_cdgo_dgtlzdr,		dd.nmro_imgns,		dd.fcha_dgtlzcn,
						estdo,							1
			From		BDGestionDocumental.dbo.tbdocumentosdigitalizados	dd	With(NoLock)
			Inner Join	@Documentos											d	On	(d.cnsctvo_cdgo_dcmnto = dd.cnsctvo_cdgo_dcmnto)
			Where		dd.cnsctvo_cdgo_tpo_dcmntl = @cnsctvo_tpo_dcmtl
			And			dd.fcha_dgtlzcn = @fcha_dgtlzcn
			Union
			Select		dd.cnsctvo_cdgo_dcmnto,			dd.cnsctvo_cdgo_tpo_dcmntl,			dd.cnsctvo_cdgo_dgtlzdr,		dd.nmro_imgns,		dd.fcha_dgtlzcn,
						estdo,							1
			From		BDGestionDocumental.dbo.tbdocumentosdigitalizados	dd	With(NoLock)
			Inner Join	@Documentos											d	On	(d.cnsctvo_cdgo_dcmnto = dd.cnsctvo_cdgo_dcmnto)
			Where		dd.cnsctvo_cdgo_tpo_dcmntl = @cnsctvo_tpo_dcmtl
			And			@fcha_dgtlzcn		Is Null
		End
	Else
		Begin
			Insert Into @Documentos
			(	cnsctvo_cdgo_dcmnto,			cnsctvo_cdgo_tpo_dcmntl,			cnsctvo_cdgo_dgtlzdr,			nmro_imgns,			fcha_dgtlzcn,
				estdo,							tmp
			)
			Select		dd.cnsctvo_cdgo_dcmnto,			dd.cnsctvo_cdgo_tpo_dcmntl,			dd.cnsctvo_cdgo_dgtlzdr,		dd.nmro_imgns,		dd.fcha_dgtlzcn,
				estdo,							1
			From		BDGestionDocumental.dbo.tbdocumentosdigitalizados	dd	With(NoLock)
			Inner Join	@Documentos											d	On	(d.cnsctvo_cdgo_dcmnto = dd.cnsctvo_cdgo_dcmnto)
			Where		dd.fcha_dgtlzcn = @fcha_dgtlzcn
			Union
			Select		dd.cnsctvo_cdgo_dcmnto,			dd.cnsctvo_cdgo_tpo_dcmntl,			dd.cnsctvo_cdgo_dgtlzdr,		dd.nmro_imgns,		dd.fcha_dgtlzcn,
						estdo,							1
			From		BDGestionDocumental.dbo.tbdocumentosdigitalizados	dd	With(NoLock)
			Inner Join	@Documentos											d	On	(d.cnsctvo_cdgo_dcmnto = dd.cnsctvo_cdgo_dcmnto)
			Where		@fcha_dgtlzcn		Is Null
		End

		--Insert Into @Documentos
		--		(	cnsctvo_cdgo_dcmnto,			cnsctvo_cdgo_tpo_dcmntl,			cnsctvo_cdgo_dgtlzdr,			nmro_imgns,			fcha_dgtlzcn,
		--			estdo,							tmp
		--		)
		--Select		dd.cnsctvo_cdgo_dcmnto,			dd.cnsctvo_cdgo_tpo_dcmntl,			dd.cnsctvo_cdgo_dgtlzdr,		dd.nmro_imgns,		dd.fcha_dgtlzcn,
		--			estdo,							1
		--From		BDGestionDocumental.dbo.tbdocumentosdigitalizados	dd	With(NoLock)
		--Inner Join	@Documentos											d	On	(d.cnsctvo_cdgo_dcmnto = dd.cnsctvo_cdgo_dcmnto)
		--Where		(@cnsctvo_tpo_dcmtl Is Null Or dd.cnsctvo_cdgo_tpo_dcmntl = @cnsctvo_tpo_dcmtl)
		--And			(@fcha_dgtlzcn		Is Null	Or dd.fcha_dgtlzcn = @fcha_dgtlzcn)

	Delete
	From		@Documentos
	Where		tmp <= 0

	Insert Into @Documentos
			(	cnsctvo_cdgo_dcmnto,			cnsctvo_cdgo_tpo_dcmntl,			cnsctvo_cdgo_dgtlzdr,			nmro_imgns,			fcha_dgtlzcn,
				cnsctvo_cdgo_imgn,				cnsctvo_cdgo_tpo_imgn,				rta_imgn,						prncpl,				estdo,
				tmp
			)
	Select      d.cnsctvo_cdgo_dcmnto,			d.cnsctvo_cdgo_tpo_dcmntl,			d.cnsctvo_cdgo_dgtlzdr,			d.nmro_imgns,		d.fcha_dgtlzcn,
				i.cnsctvo_cdgo_imgn,			i.cnsctvo_cdgo_tpo_imgn,			i.rta_imgn,						i.prncpl,			i.estdo,
				2
	From		BDGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados	i	With(NoLock)
	Inner Join	@Documentos													d	On	(d.cnsctvo_cdgo_dcmnto = i.cnsctvo_cdgo_dcmnto)
	Where		i.estdo = 'A'
	Union
	Select      d.cnsctvo_cdgo_dcmnto,			d.cnsctvo_cdgo_tpo_dcmntl,			d.cnsctvo_cdgo_dgtlzdr,			d.nmro_imgns,		d.fcha_dgtlzcn,
				i.cnsctvo_cdgo_imgn,			i.cnsctvo_cdgo_tpo_imgn,			i.rta_imgn,						i.prncpl,			i.estdo,
				2
	From		BDGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados	i	With(NoLock)
	Inner Join	@Documentos													d	On	(d.cnsctvo_cdgo_dcmnto = i.cnsctvo_cdgo_dcmnto)
	Where		i.estdo Is Null

	--Where		(@cnsctvo_cdgo_tpo_imgn is null Or i.cnsctvo_cdgo_tpo_imgn = @cnsctvo_cdgo_tpo_imgn)
	--And			(@imgns_prncpls = 'N' Or i.prncpl = 'S')

	Delete
	From		@Documentos
	Where		tmp = 1

	Insert Into @Documentos
			(	cnsctvo_cdgo_dcmnto,			cnsctvo_cdgo_tpo_dcmntl,			dscrpcn_tpo_dcmntl,			cnsctvo_cdgo_dgtlzdr,		dscrpcn_dgtlzdr,
				nmro_imgns,						fcha_dgtlzcn,						cnsctvo_cdgo_imgn,			cnsctvo_cdgo_tpo_imgn,		dscrpcn_tpo_imgn,
				rta_imgn,						prncpl,								estdo,						tmp
	)
	Select		d.cnsctvo_cdgo_dcmnto,			d.cnsctvo_cdgo_tpo_dcmntl,			tdl.dscrpcn_tpo_dcmnto,		d.cnsctvo_cdgo_dgtlzdr,		dg.dscrpcn_dgtlzdr,
				d.nmro_imgns,					d.fcha_dgtlzcn,						d.cnsctvo_cdgo_imgn,		d.cnsctvo_cdgo_tpo_imgn,	ti.dscrpcn_tpo_imgn,
				ltrim(rtrim(rta_imgn)),			prncpl,								estdo,						3
	From		@Documentos									d
	Left Join   BDGestionDocumental.dbo.tbTiposDocumento	tdl	With(NoLock)	On	(d.cnsctvo_cdgo_tpo_dcmntl = tdl.cnsctvo_cdgo_tpo_dcmnto)
	Left Join   BDGestionDocumental.dbo.tbDigitalizadores	dg	With(NoLock)	On	(d.cnsctvo_cdgo_dgtlzdr = dg.cnsctvo_cdgo_dgtlzdr)
	Left Join  BDGestionDocumental. dbo.tbTiposImagenes		ti	With(NoLock)	On	(ti.cnsctvo_cdgo_tpo_imgn = d.cnsctvo_cdgo_tpo_imgn)
	Where		d.estdo = 'A'
	Union
	Select		d.cnsctvo_cdgo_dcmnto,			d.cnsctvo_cdgo_tpo_dcmntl,			tdl.dscrpcn_tpo_dcmnto,		d.cnsctvo_cdgo_dgtlzdr,		dg.dscrpcn_dgtlzdr,
				d.nmro_imgns,					d.fcha_dgtlzcn,						d.cnsctvo_cdgo_imgn,		d.cnsctvo_cdgo_tpo_imgn,	ti.dscrpcn_tpo_imgn,
				ltrim(rtrim(rta_imgn)),			prncpl,								estdo,						3
	From		@Documentos									d
	Left Join   BDGestionDocumental.dbo.tbTiposDocumento	tdl	With(NoLock)	On	(d.cnsctvo_cdgo_tpo_dcmntl = tdl.cnsctvo_cdgo_tpo_dcmnto)
	Left Join   BDGestionDocumental.dbo.tbDigitalizadores	dg	With(NoLock)	On	(d.cnsctvo_cdgo_dgtlzdr = dg.cnsctvo_cdgo_dgtlzdr)
	Left Join  BDGestionDocumental. dbo.tbTiposImagenes		ti	With(NoLock)	On	(ti.cnsctvo_cdgo_tpo_imgn = d.cnsctvo_cdgo_tpo_imgn)
	Where		d.estdo Is Null

	Delete
	From		@Documentos
	Where		tmp = 2

	Select		tmp,					cnsctvo_cdgo_dcmnto,			cnsctvo_cdgo_tpo_dcmntl,			dscrpcn_tpo_dcmntl,
				nmro_imgns,				cnsctvo_cdgo_dgtlzdr,			dscrpcn_dgtlzdr,					fcha_dgtlzcn,
				cnsctvo_cdgo_imgn,		cnsctvo_cdgo_tpo_imgn,			dscrpcn_tpo_imgn,					rta_imgn,
				prncpl,					estdo
	From		@Documentos
	Order  By  cnsctvo_cdgo_tpo_dcmntl,cnsctvo_cdgo_imgn ASC
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosDigitalizadosxIndicesXML] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosDigitalizadosxIndicesXML] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosDigitalizadosxIndicesXML] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosDigitalizadosxIndicesXML] TO [visosservice_role]
    AS [dbo];

