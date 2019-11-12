
CREATE Function [dbo].[fnGDCCalcularDireccionArchivoIndice19032009] (@cnsctvo_cdgo_cnfgrcn	int)
Returns varchar(200)   
As
Begin
	Declare  @direccion  varchar(200)
	SELECT	@direccion = [drccn_archvo_indce]
	FROM	[bdGestionDocumental].[dbo].[tbConfiguracionMigracionArchivosIndices]
	Where	cnsctvo_cdgo_cnfgrcn = @cnsctvo_cdgo_cnfgrcn

	Declare @fecha datetime
	Set @fecha = '20090319'--getDate()

	set @direccion = @direccion +  + CAST(DATEPART(year,@fecha) as VARCHAR(4)) + '\' + dbo.fn_Devuelve_Dia_Completo(CAST(DATEPART(month,@fecha) as VARCHAR(2))) + '\' + dbo.fn_Devuelve_Dia_Completo(CAST(DATEPART(day,@fecha) as VARCHAR(2)))
	Return @direccion
End
