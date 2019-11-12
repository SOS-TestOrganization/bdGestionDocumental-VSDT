








/*
dbo.spGDGenerarRegistrosArchivosIndicesDinamico 8,'S'
dbo.spGDGenerarTemporalRegistrosIndicesAgrupados_Borrar 'cccd',8,'S',500
select * from tbRegistrosArchivosIndices
*/

CREATE PROCEDURE [dbo].[spGDGenerarTemporalRegistrosIndicesAgrupados_Borrar]
(
	@lnIdentificadorUnico varchar(20),
	@lnTipoDocumento int,
	@agrpdo char(1) = 'S',
	@prcso_crga int = Null,
	@fcha_crga_inco datetime = Null,
	@fcha_crga_fn datetime = Null,
	@offst_clmns int = Null
)
AS
SET NOCOUNT ON

--Declare		@aux			Int
--Declare		@posActual		Int
--Declare		@colActual		Nvarchar(100)
--Declare		@agrupaActual	Nvarchar(1)
--Declare		@cols			Nvarchar(1000) 
--Declare		@groupcols		Nvarchar(1000) 
Declare		@query			Nvarchar(1000)
Declare		@groups			Nvarchar(1000)
Declare		@dclre_prmtrs	Nvarchar(500)



Set @dclre_prmtrs = '@fcha_crga_inco datetime, @fcha_crga_fn datetime, @lnIdentificadorUnico varchar(20), @lnTipoDocumento int'

Declare @tbSentencias table(query	Nvarchar(1000),
							cols	Nvarchar(1000),
							groups	Nvarchar(1000),
							joins	Nvarchar(1000),
							tipos	Nvarchar(1000),
							colsnogroup	Nvarchar(1000))

Insert Into @tbSentencias(query,cols,groups,joins,tipos,colsnogroup)
exec		dbo.spGDGenerarSentenciasRegistrosIndicesAgrupados @lnTipoDocumento,@agrpdo,Null,@prcso_crga

select @query = query,@groups = groups from @tbSentencias


If(@groups Is Not Null And (Len(Rtrim(@groups)) > 0))
Begin
 Set @groups = @groups + ',r.cnsctvo_cdgo_prcso_crga_imgn' 
End

--Delete from dbo.tbTemporalRegistrosIndicesAgrupados

Declare @queryInsert Nvarchar(1000)
Set @queryInsert = 'INSERT INTO dbo.tbTemporalRegistrosIndicesAgrupados 
Select @lnIdentificadorUnico as idntfcdr_unco,''N'' as mgrdo,Null as cnsctvo_dcmnto_dgtlzdo, @lnTipoDocumento as cnsctvo_cdgo_tpo_dcmnto, count(*) as numeroImagenes,r.cnsctvo_cdgo_prcso_crga_imgn as cnsctvo_prcso_crga,' + 
@query 
+'
'+ @groups + ''

print @queryInsert
exec sp_executesql @queryInsert,@dclre_prmtrs,@fcha_crga_inco,@fcha_crga_fn,@lnIdentificadorUnico,@lnTipoDocumento
--select * from tbTemporalRegistrosIndicesAgrupados

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGenerarTemporalRegistrosIndicesAgrupados_Borrar] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGenerarTemporalRegistrosIndicesAgrupados_Borrar] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGenerarTemporalRegistrosIndicesAgrupados_Borrar] TO [visosservice_role]
    AS [dbo];

