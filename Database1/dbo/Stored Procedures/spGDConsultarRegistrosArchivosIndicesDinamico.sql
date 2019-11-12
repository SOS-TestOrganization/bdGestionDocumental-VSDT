/*
declare @lnTipoDocumento int
set @lnTipoDocumento = 8

declare @agrpdo char(1)
set @agrpdo = 'S'


declare @offst_clmns int
set @offst_clmns = 7


declare @fcha_crga_inco datetime
declare @fcha_crga_fn datetime

set @fcha_crga_inco = null-- getDate()-1
set @fcha_crga_fn = null -- getDate()-1

dbo.spGDConsultarRegistrosArchivosIndicesDinamico 8,'S'

*/
CREATE PROCEDURE dbo.spGDConsultarRegistrosArchivosIndicesDinamico
(
	@lnTipoDocumento int,
	@agrpdo char(1),
	@fcha_crga_inco datetime = Null,
	@fcha_crga_fn datetime = Null,
	@offst_clmns int = Null
)
AS
--@offst_clmns
--Por Defecto
SET @offst_clmns = isNull(@offst_clmns,7)

DECLARE  @tmpColumnasTabla table(
	[parametro] [nvarchar](4000) NULL,
	[tipoDato] [sysname] NOT NULL,
	[idTipoDato] [smallint] NULL,
	[tamano] [smallint] NOT NULL,
	[outParam] [int] NULL,
	[colOrder] [smallint] NULL
)

DECLARE  @tmpIndicesValidos table(
	[cnsctvo_cdgo_tpo_indce_pr_tpo_dcmnto] [int] NULL,
	[nombreColumna] [varchar](4000) NOT NULL,
	[nmbre] [varchar](150) NULL,
	[pscn] [smallint] NOT NULL,
	[agrpdr] [char](1) NULL
)


Insert Into @tmpColumnasTabla([parametro],[tipoDato],[idTipoDato],[tamano],[outParam],[colOrder])
Exec dbo.[sp_Select_ParametrosObjeto] 'tbRegistrosArchivosIndices','u'
--select * from #tmpColumnasTabla
Insert Into @tmpIndicesValidos(cnsctvo_cdgo_tpo_indce_pr_tpo_dcmnto,[nombreColumna],[nmbre],[pscn],[agrpdr])
Select		ttd.cnsctvo_cdgo_tpo_indce_pr_tpo_dcmnto,cols.parametro nombreColumna, ttd.nmbre, ttd.pscn, ttd.agrpdr
From		dbo.tbTiposIndicesxTiposDocumentos	ttd
Inner Join	@tmpColumnasTabla   cols 
On			(cols.[colOrder] = ttd.pscn+@offst_clmns)
Where		ttd.cnsctvo_cdgo_tpo_dcmnto = @lnTipoDocumento

Declare		@aux			Int
Declare		@posActual		Int
Declare		@colActual		Nvarchar(100)
Declare		@cols			Nvarchar(1000) 
Declare		@query			Nvarchar(1000)
Declare		@groups			Nvarchar(1000)
Declare		@dclre_prmtrs	Nvarchar(100)
Set @dclre_prmtrs = '@fcha_crga_inco datetime, @fcha_crga_fn datetime'
Set @aux = 0
Set @cols = ''

Select top 1 @posActual = pscn,@colActual = [nombreColumna]  from @tmpIndicesValidos where pscn > @aux and agrpdr = @agrpdo --group by [nombreColumna] having 
While(@posActual> @aux)
Begin
	Set @aux = @posActual
	Set @cols = @cols + @colActual+','
	Select Top 1  @posActual = pscn,@colActual = [nombreColumna]  from @tmpIndicesValidos where pscn > @aux and agrpdr = @agrpdo-- group by [nombreColumna]
End

Set @cols = replace(@cols + '*',',*','')
Set @groups = case when @agrpdo = 'S' then ' group by ' + @cols else ' ' end
Set @cols = case when @agrpdo = 'S' then @cols + ', count(*) as numeroImagenes ' else @cols end


Set @query  = 
'Select '+ @cols + ' 
From	dbo.tbRegistrosArchivosIndices 
Where	indce_mgrdo = ''N'' 
And		cnsctvo_cdgo_tpo_dcmnto = ' +  cast(@lnTipoDocumento as varchar(3))  +'
And		(@fcha_crga_inco Is Null Or fcha_crga >= @fcha_crga_inco)
And		(@fcha_crga_fn Is Null Or fcha_crga <= @fcha_crga_fn)'
+ @groups

print @query
exec sp_executesql @query,@dclre_prmtrs, @fcha_crga_inco,@fcha_crga_fn

--DROP TABLE #tmpColumnasTabla
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosArchivosIndicesDinamico] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosArchivosIndicesDinamico] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosArchivosIndicesDinamico] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosArchivosIndicesDinamico] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosArchivosIndicesDinamico] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosArchivosIndicesDinamico] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosArchivosIndicesDinamico] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosArchivosIndicesDinamico] TO [visosservice_role]
    AS [dbo];

