

--sp_helptext spGDConsultarRegistrosArchivosIndicesxTemporal 'cccd',4,'N','S',500

CREATE PROCEDURE [dbo].[spGDConsultarRegistrosArchivosIndicesxTemporal]
(
	@lnIdentificadorUnico varchar(20),
	@lnTipoDocumento int,
	@agrpdo char(1) = 'N',
	@slo_vlrs_no_grps char(1) = 'N', --Usar unicamente cuando @agrpdo = 'N'...cuando @agrpdo = 'S' no tiene Sentido usar @slo_vlrs_no_grps = 'S' poque no existirian sis e agrupa
	@lnProcesoCarga	int	= Null,
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
Declare		@cols			Nvarchar(1000) 
Declare		@groupcols		Nvarchar(1000) 
Declare		@query			Nvarchar(1000)
Declare		@joins			Nvarchar(1000)
Declare		@tipos			Nvarchar(1000)
Declare		@dclre_prmtrs	Nvarchar(500)
Declare		@colsnogroups	Nvarchar(1000) 
Declare		@filtro_carga	Nvarchar(500)

Set @slo_vlrs_no_grps = isNull(@slo_vlrs_no_grps,'N')
Set @dclre_prmtrs = '@fcha_crga_inco datetime, @fcha_crga_fn datetime, @lnIdentificadorUnico varchar(20)'
/*
Declare @tbSentencias table(query	Nvarchar(1000),
							cols	Nvarchar(1000),
							groups	Nvarchar(1000),
							joins	Nvarchar(1000),
							tipos	Nvarchar(1000))

Insert Into @tbSentencias(query,cols,groups,joins,tipos)
exec		dbo.spGDGenerarSentenciasRegistrosIndicesAgrupados @lnTipoDocumento,@agrpdo

select @cols = cols,@joins = joins,@tipos = tipos,@groupcols=groups from @tbSentencias
*/
--Generar Identificador Unico
--exec spGDGenerarTemporalRegistrosIndicesAgrupados @lnIdentificadorUnico,@lnTipoDocumento,'N',@fcha_crga_inco,@fcha_crga_fn
Exec dbo.spGDRetornarSentenciasRegistrosIndicesAgrupados
	@lnTipoDocumento,
	@agrpdo,
	Null, --off_set, Se Usa Por Defecto
	@lnProcesoCarga, -- filtroProceso
	@query output,
	@cols output,
	@groupcols output, 
	@joins output,
	@tipos output,
	@colsnogroups output

Declare @joinTipoImagen Nvarchar(150)
Declare @colAdicionales Nvarchar(500)
 
IF(@groupcols Is Not Null And len(Rtrim(@groupcols)) > 0)
Begin
	Set @groupcols = @groupcols+',d.cnsctvo_dcmnto_dgtlzdo,r.cnsctvo_cdgo_prcso_crga_imgn'

	Set @joinTipoImagen = ''
	Set @colAdicionales = ' Null as cnsctvo_cdgo_tpo_imgn,r.cnsctvo_cdgo_prcso_crga_imgn as cnsctvo_prcso_crga, Null as rta_archvo_fsco,'
End
Else
Begin
	/**NOTA(sisogb01,13/04/2011)Se cambia la linea con Join porque de ahora en adelante no se necesita "Buscar" el consecutivo, ya que viene en la columna r.tpo_anxo */
	--Set @joinTipoImagen = 'left join dbo.tbTiposImagenes t on (r.tpo_anxo like rtrim(t.cdgo_tpo_imgn))'
	Set @joinTipoImagen = ' '
	/**NOTA(sisogb01,13/04/2011)Se cambia la linea con Case porque de ahora en adelante solo vienen consecutivos (numeros enteros) para la columna 'cnsctvo_cdgo_tpo_imgn' */
	--Set @colAdicionales = ' case When t.cnsctvo_cdgo_tpo_imgn Is Null then 999 Else t.cnsctvo_cdgo_tpo_imgn end As cnsctvo_cdgo_tpo_imgn,r.cnsctvo_cdgo_prcso_crga_imgn as cnsctvo_prcso_crga, r.rta_archvo_fsco, '
	Set @colAdicionales = ' cast(r.tpo_anxo as Int) As cnsctvo_cdgo_tpo_imgn,r.cnsctvo_cdgo_prcso_crga_imgn as cnsctvo_prcso_crga, r.rta_archvo_fsco, '
End


IF(@agrpdo = 'N' AND @slo_vlrs_no_grps = 'S')
Begin
 Set @cols = @colsnogroups
End

Set @filtro_carga = Case When @lnProcesoCarga Is Not Null 
						Then isNull(@filtro_carga,'') + 'And 	(r.cnsctvo_cdgo_prcso_crga_imgn = ' + cast(@lnProcesoCarga as varchar(8)) + ') '
						Else isNull(@filtro_carga,'')
					End

-- 2013/01/10 sismpr01 se modifica el nombre del archivo, debido a que los nombres de los archivos de retornos estan quedando asi :
-- 00BCDA85.TIF,0,0		donde ,0,0  es el campo tipo y nro de formulario de retorno que puede venir con valores ó 0,0 como se muestra en el ejm

UPDATE	bdgestiondocumental.dbo.tbRegistrosArchivosIndices
Set		nmbre_archvo =	case when charindex(',',ltrim(rtrim(nmbre_archvo)))-1 > 0
							then substring(ltrim(rtrim(nmbre_archvo)),1,charindex(',',ltrim(rtrim(nmbre_archvo)))-1)
							else ltrim(rtrim(nmbre_archvo))
						end
--select nmbre_archvo ,	case when charindex(',',ltrim(rtrim(nmbre_archvo)))-1 > 0							then substring(ltrim(rtrim(nmbre_archvo)),1,charindex(',',ltrim(rtrim(nmbre_archvo)))-1)							else ltrim(rtrim(nmbre_archvo))						end
from	bdgestiondocumental.dbo.tbRegistrosArchivosIndices r
where	r.indce_mgrdo = 'N' 
And		r.nmbre_archvo_indce like '%Formularios%'
And		charindex(',',ltrim(rtrim(nmbre_archvo)))-1 > 0
And		(@lnProcesoCarga	Is Null Or r.cnsctvo_cdgo_prcso_crga_imgn = @lnProcesoCarga)
And		(@fcha_crga_inco	Is Null Or r.fcha_crga >= @fcha_crga_inco)
And		(@fcha_crga_fn		Is Null Or r.fcha_crga <= @fcha_crga_fn)

Declare @queryJoin Nvarchar(3000)
Set @queryJoin = '
Select	@lnIdentificadorUnico as idntfcdr_unco, d.cnsctvo_dcmnto_dgtlzdo,' + @colAdicionales + @cols +','+@tipos+'
from	dbo.tbRegistrosArchivosIndices r
inner join dbo.tbTemporalRegistrosIndicesAgrupados d
on(' +  @joins +' AND (d.cnsctvo_dcmnto_dgtlzdo is not null))'+
@joinTipoImagen + '
Where	r.indce_mgrdo = ''N'' 
' + @filtro_carga  + '
And		d.cnsctvo_cdgo_tpo_dcmnto = ' +  cast(@lnTipoDocumento as varchar(3))  +'
And		(@fcha_crga_inco Is Null Or r.fcha_crga >= @fcha_crga_inco)
And		(@fcha_crga_fn Is Null Or r.fcha_crga <= @fcha_crga_fn)
And		d.idntfcdr_unco = @lnIdentificadorUnico'
+ isNull(@groupcols,'')


print @queryJoin

exec sp_executesql @queryJoin,@dclre_prmtrs,@fcha_crga_inco,@fcha_crga_fn,@lnIdentificadorUnico
--select * from tbTemporalRegistrosIndicesAgrupados












GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosArchivosIndicesxTemporal] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosArchivosIndicesxTemporal] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosArchivosIndicesxTemporal] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosArchivosIndicesxTemporal] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosArchivosIndicesxTemporal] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosArchivosIndicesxTemporal] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosArchivosIndicesxTemporal] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarRegistrosArchivosIndicesxTemporal] TO [visosservice_role]
    AS [dbo];

