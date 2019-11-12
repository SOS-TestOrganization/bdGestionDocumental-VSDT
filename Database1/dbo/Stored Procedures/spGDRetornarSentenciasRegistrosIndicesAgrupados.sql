


-- [spGDGenerarSentenciasRegistrosIndicesAgrupados] 25,'S'

CREATE PROCEDURE [dbo].[spGDRetornarSentenciasRegistrosIndicesAgrupados]
(
 @lnTipoDocumento	int
,@agrpdo			char(1)
,@offst_clmns		int = Null
,@lnProceso			int = Null
,@query				Nvarchar(1000) output
,@cols				Nvarchar(1000)  output
,@groups			Nvarchar(1000) output
,@innerJoins		Nvarchar(500) output
,@tiposIndices		Nvarchar(1000) output
,@colsNoGroups		Nvarchar(1000) =null output
)
AS
SET NOCOUNT ON
--@offst_clmns
--Por Defecto
SET @offst_clmns = isNull(@offst_clmns,9)

DECLARE  @tmpColumnasTabla table(
	[parametro] [nvarchar](4000) NULL,
	[tipoDato] [sysname] NOT NULL,
	[idTipoDato] [smallint] NULL,
	[tamano] [smallint] NOT NULL,
	[outParam] [int] NULL,
	[colOrder] [smallint] NULL
)

DECLARE  @tmpIndicesValidos table(
	[cnsctvo_tmp] int Identity(1,1),
	[cnsctvo_cdgo_tpo_indce_pr_tpo_dcmnto] [int] NULL,
	[nombreColumna] [varchar](4000) NULL,
	[nmbre] [varchar](150) NULL,
	[pscn] [smallint] NULL,
	[agrpdr] [char](1) NULL,
	[cnsctvo_cdgo_tpo_indce] [int] NULL
)


Insert Into @tmpColumnasTabla([parametro],[tipoDato],[idTipoDato],[tamano],[outParam],[colOrder])
--NO SE PUEDE USAR: Exec dbo.[sp_Select_ParametrosObjeto] 'tbRegistrosArchivosIndices','u'  ....Aparece el sgte Error:
--" An INSERT EXEC statement cannot be nested. "
-- Por eso se usa la consulta a sysobjects
SELECT 		cols.name		parametro,
			tips.name 		tipoDato,
			tips.xusertype 	idTipoDato,
			cols.length		tamano, 
			cols.isoutparam	outParam,colOrder
	--into    select * from dbo.tmpTemporal
	FROM  		dbo.syscolumns 	cols
	INNER JOIN  dbo.sysobjects pr
	ON 		(pr.xtype = 'U' AND pr.name like 'tbRegistrosArchivosIndices')
	INNER JOIN 	dbo.systypes 	tips
	ON 		(tips.xusertype = cols.xtype 
	AND 		cols.id = pr.id)
	ORDER BY 	colOrder


Insert Into @tmpIndicesValidos(cnsctvo_cdgo_tpo_indce_pr_tpo_dcmnto,[nombreColumna],[nmbre],[pscn],[agrpdr],[cnsctvo_cdgo_tpo_indce])
Select		ttd.cnsctvo_cdgo_tpo_indce_pr_tpo_dcmnto,cols.parametro nombreColumna, ttd.nmbre, ttd.pscn, ttd.agrpdr,ttd.cnsctvo_cdgo_tpo_indce
From		@tmpColumnasTabla   cols
Left Join	dbo.tbTiposIndicesxTiposDocumentos	ttd
On			(cols.[colOrder] = (ttd.pscn+@offst_clmns) And ttd.cnsctvo_cdgo_tpo_dcmnto =@lnTipoDocumento)--@offst_clmns)
--Where		ttd.cnsctvo_cdgo_tpo_dcmnto =8-- @lnTipoDocumento
Where		cols.[colOrder] > @offst_clmns

--select * from @tmpIndicesValidos

Declare		@aux			Int
Declare		@posActual		Int
Declare		@colActual		Nvarchar(100)
Declare		@agrupaActual	Nvarchar(1)
Declare		@groupcols		Nvarchar(1000) 
Declare		@dclre_prmtrs	Nvarchar(500)
Declare		@tipoIndice		Int
Declare		@filtro_carga	Nvarchar(500)

Set @dclre_prmtrs = '@fcha_crga_inco datetime, @fcha_crga_fn datetime, @lnIdentificadorUnico varchar(20)'
Set @aux = 0
Set @cols = ''
Set @groupcols = ''
Set @innerJoins = ''
Set @tiposIndices = ''
Set @colsNoGroups = ''
Select top 1 @posActual = [cnsctvo_tmp],@colActual = [nombreColumna] , @agrupaActual = agrpdr,@tipoIndice= cnsctvo_cdgo_tpo_indce From @tmpIndicesValidos Where [cnsctvo_tmp] > @aux --and agrpdr = @agrpdo --group by [nombreColumna] having 
While(@posActual> @aux)
Begin
	Set @aux = @posActual
	

	Set @cols	  =	Case	When (@agrpdo = 'S' And (@agrupaActual = 'N' Or @agrupaActual Is Null)) 
							Then @cols + 'Null as "' + @colActual+'",' 
							Else @cols + 'r.'+@colActual+',' 
					End
	Set @groupcols=	Case	When @agrupaActual = 'S' 
							Then @groupcols + 'r.'+@colActual+',' 
							Else @groupcols 
					End

	Set @tiposIndices=Case	When @tipoIndice Is Null 
							Then @tiposIndices + '0 ' + ' as "tipo_' + @colActual + '",'
							Else @tiposIndices + cast(@tipoIndice as varchar(3)) + ' as "tipo_' + @colActual + '",'
					End
	Set @innerJoins=Case	When @agrupaActual = 'S' 
							Then @innerJoins + '(r.' + @colActual + ' = d.' + @colActual + ') AND '
							Else @innerJoins 
					End

	Set @colsNoGroups=Case	When (@agrupaActual = 'N') 
							Then @colsNoGroups + 'r.'+@colActual+','
							Else @colsNoGroups + 'Null as "' + @colActual+'",' 
					End
	Select Top 1  @posActual = [cnsctvo_tmp],@colActual = [nombreColumna], @agrupaActual = agrpdr, @tipoIndice= cnsctvo_cdgo_tpo_indce   From @tmpIndicesValidos Where [cnsctvo_tmp] > @aux --and agrpdr = @agrpdo-- group by [nombreColumna]
End

--Quitar las commas
Set @cols = replace(@cols+';',',;','')
Set @groupcols = replace(@groupcols+';',',;','')
Set @innerJoins= replace(@innerJoins+';','AND ;','')
Set @tiposIndices = replace(@tiposIndices+';',',;','')
set	@colsNoGroups = replace(@colsNoGroups+';',',;','')

Set @groups =	Case	When @agrpdo = 'S' 
						Then ' group by ' + @groupcols 
						Else ' ' 
				End
/*Set @cols	=	Case When @agrpdo = 'S' 
					 Then @cols + ', count(*) as numeroImagenes ' 
					 Else @cols + ', Null as numeroImagenes ' 
				End*/

Set @filtro_carga=	Case When @lnProceso Is Not Null 
						Then isNull(@filtro_carga,'') + 'And r.cnsctvo_cdgo_prcso_crga_imgn = ' + cast(@lnProceso as varchar(8)) + ' '
						Else isNull(@filtro_carga,'')
					End

Set @query  = 
@cols + ' 
From	dbo.tbRegistrosArchivosIndices r
Where	r.indce_mgrdo = ''N'' 
And		r.cnsctvo_cdgo_tpo_dcmnto = ' +  cast(@lnTipoDocumento as varchar(3)) +' '
+ @filtro_carga + '
And		(@fcha_crga_inco Is Null Or r.fcha_crga >= @fcha_crga_inco)
And		(@fcha_crga_fn Is Null Or r.fcha_crga <= @fcha_crga_fn)'

--select @query consulta,@cols columnas,@groups groupby, @innerJoins joins,@tiposIndices tiposIndices





GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRetornarSentenciasRegistrosIndicesAgrupados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRetornarSentenciasRegistrosIndicesAgrupados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRetornarSentenciasRegistrosIndicesAgrupados] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRetornarSentenciasRegistrosIndicesAgrupados] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRetornarSentenciasRegistrosIndicesAgrupados] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRetornarSentenciasRegistrosIndicesAgrupados] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRetornarSentenciasRegistrosIndicesAgrupados] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRetornarSentenciasRegistrosIndicesAgrupados] TO [visosservice_role]
    AS [dbo];

