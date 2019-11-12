



/* Exec dbo.spGDConsultarConfiguracionMigracionArchivosIndices 27,'n'
Exec dbo.spGDConsultarConfiguracionMigracionArchivosIndices 27 

*/
CREATE PROCEDURE [dbo].[spGDConsultarConfiguracionMigracionArchivosIndices] 
	@idConfig		udtConsecutivo,
	@esMigracion	udtLogico	   = 'S',
	@tipoDoc		udtConsecutivo = NULL,
	@digitalizador  udtConsecutivo = NULL
	 
AS
SET NOCOUNT ON


Declare @cnsctvo_cdgo_cnfgrcn	udtConsecutivo
Declare @cnsctvo_imgn_incl		udtConsecutivo
Declare @fncn_clclo_drccn		varchar(200)
Declare @fncn_clclo_indce		varchar(200)
Declare @ruta					Nvarchar(200)
Declare @rutaIndice				Nvarchar(200)

Declare @declares				Nvarchar(500)
Declare @query					Nvarchar(500)
Declare	@fecha1					Datetime
Declare	@fecha2					Datetime
Declare	@cnsctvo_opcn_ejccn		udtConsecutivo
Declare	@cnsctvo_dcmnto			udtConsecutivo
	--Set @fecha = getDate()



SELECT	@cnsctvo_cdgo_cnfgrcn	= cnsctvo_cdgo_cnfgrcn,
		@fncn_clclo_drccn		= fncn_clclo_drccn,
		@fncn_clclo_indce		= fncn_clclo_drccn_indce,
		@ruta					= drccn_archvo_fsco,
		@rutaIndice				= drccn_archvo_indce
		,@fecha1					= fcha_rta_fsco,
		@fecha2					= fcha_rta_indce
FROM	[dbo].[tbConfiguracionMigracionArchivosIndices] 
Where	((cnsctvo_cdgo_tpo_dcmnto= @tipoDoc
And		cnsctvo_cdgo_dgtlzdr	= @digitalizador)
Or		cnsctvo_cdgo_cnfgrcn	= @idConfig)
And		((@esMigracion			= 'S'	And		cnfgrcn_actva_mgrcn		= 'S')
			Or
		(@esMigracion			= 'N'	And		cnfgrcn_actva_indce		= 'S')
)

	
Create Table #tmpFechas(fecha Datetime)
While(@fecha1 <= @fecha2)
Begin
	Insert Into #tmpFechas(fecha)
	Select @fecha1
	Set @fecha1 = DateAdd(dd,1,@fecha1) -- @fecha1 = @fecha1 + 1
End

Set @declares= '@ruta nvarchar(200) output,@rutaIndice nvarchar(200) output, @cnsctvo_imgn_incl int,@cnsctvo_cdgo_cnfgrcn	udtConsecutivo'
Set @query = 'Select @ruta = ' + (case when (@fncn_clclo_drccn is Null) then '@ruta' else  (@fncn_clclo_drccn + ' + ''\''') End) + ',
					 @rutaIndice = '+ (case when (@fncn_clclo_indce is Null) then '@rutaIndice' else  (@fncn_clclo_indce +' + ''\''') End)

Exec sp_executesql @query,@declares,@ruta output,@rutaIndice output,@cnsctvo_imgn_incl,@cnsctvo_cdgo_cnfgrcn

/*
Select	@cnsctvo_imgn_incl = (max(cnsctvo_cdgo_imgn)+1)
From	dbo.tbImagenesxDocumentosDigitalizados
*/

Set		@cnsctvo_dcmnto		=	0
Set		@cnsctvo_opcn_ejccn =	2
Exec	spGDCalcularConsecutivo @cnsctvo_dcmnto Output, @cnsctvo_imgn_incl Output,	@cnsctvo_opcn_ejccn
--Poner  el ultimo '\' asi ya lo tenga
--Set @ruta = Replace(Replace(@ruta+';','\;',''),';','') + '\'
/*
Select [cnsctvo_cdgo_cnfgrcn]
      ,[srvdr_archvs]
      ,@ruta as drccn_archvo_fsco
      ,[fncn_clclo_drccn]
	  ,[srvdr_indce]
	  ,@rutaIndice as [drccn_archvo_indce]
      ,[nmbre_archvo_indce]
      ,[fncn_clclo_drccn_indce]
      ,[cnsctvo_cdgo_tpo_dcmnto]
      ,[cnsctvo_cdgo_dgtlzdr]
      ,Case When @cnsctvo_imgn_incl > [cnsctvo_imgn_incl] Then @cnsctvo_imgn_incl Else  [cnsctvo_imgn_incl] End As cnsctvo_imgn_incl
	  ,getDate() as fcha_ato_crccn
	  ,[vldcn_actva]
FROM [dbo].[tbConfiguracionMigracionArchivosIndices]
Where	cnsctvo_cdgo_cnfgrcn	= @cnsctvo_cdgo_cnfgrcn
*/
Select [cnsctvo_cdgo_cnfgrcn]
      ,[srvdr_archvs], 
      case When fecha is null then @ruta else dbo.fnGDCCalcularDireccionConFecha(@ruta,fecha) +'\'end as drccn_archvo_fsco
      ,[fncn_clclo_drccn]
	  ,[srvdr_indce],
	  case When fecha is null then @rutaIndice else dbo.fnGDCCalcularDireccionConFecha(@rutaIndice,fecha)+'\' end as [drccn_archvo_indce]
      ,[nmbre_archvo_indce]
      ,[fncn_clclo_drccn_indce]
      ,[cnsctvo_cdgo_tpo_dcmnto]
      ,[cnsctvo_cdgo_dgtlzdr]
      ,Case When @cnsctvo_imgn_incl > [cnsctvo_imgn_incl] Then @cnsctvo_imgn_incl Else  [cnsctvo_imgn_incl] End As cnsctvo_imgn_incl
	  ,getDate() as fcha_ato_crccn
	  ,fcha_crgda as fcha_crga_prvdr
	  ,[vldcn_actva]
	  ,[cnsctvo_cdgo_prcso_crga]
FROM [dbo].[tbConfiguracionMigracionArchivosIndices]
LEFT JOIN #tmpFechas f
ON(1 = 1)
Where	cnsctvo_cdgo_cnfgrcn	= @cnsctvo_cdgo_cnfgrcn 

Drop Table #tmpFechas




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarConfiguracionMigracionArchivosIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarConfiguracionMigracionArchivosIndices] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarConfiguracionMigracionArchivosIndices] TO [visosservice_role]
    AS [dbo];

