


-- [spGDGenerarSentenciasRegistrosIndicesAgrupados] 8,'N'
CREATE PROCEDURE [dbo].[spGDGenerarSentenciasRegistrosIndicesAgrupados]
(
	@lnTipoDocumento int,
	@agrpdo char(1),
	@offst_clmns int = Null,
	@lnProceso  int = Null
)
AS
SET NOCOUNT ON

Declare		@cols			Nvarchar(1000) 
Declare		@query			Nvarchar(1000)
Declare		@groups			Nvarchar(1000)
Declare		@innerJoins		Nvarchar(500)
Declare		@tiposIndices	Nvarchar(1000)
Declare		@colsNoGroups	Nvarchar(1000)
Exec dbo.spGDRetornarSentenciasRegistrosIndicesAgrupados
	@lnTipoDocumento,
	@agrpdo,
	@offst_clmns,
	@lnProceso,
	@query output,
	@cols output,
	@groups output, 
	@innerJoins output,
	@tiposIndices output,
	@colsNoGroups output 
--print (@colsNoGroups)
select @query consulta,@cols columnas,@groups groupby, @innerJoins joins,@tiposIndices tiposIndices, @colsNoGroups colsNoGroups





GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGenerarSentenciasRegistrosIndicesAgrupados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGenerarSentenciasRegistrosIndicesAgrupados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGenerarSentenciasRegistrosIndicesAgrupados] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGenerarSentenciasRegistrosIndicesAgrupados] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGenerarSentenciasRegistrosIndicesAgrupados] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGenerarSentenciasRegistrosIndicesAgrupados] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGenerarSentenciasRegistrosIndicesAgrupados] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGenerarSentenciasRegistrosIndicesAgrupados] TO [visosservice_role]
    AS [dbo];

