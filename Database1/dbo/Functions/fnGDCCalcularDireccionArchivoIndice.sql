


CREATE Function [dbo].[fnGDCCalcularDireccionArchivoIndice] (@cnsctvo_cdgo_cnfgrcn	int)
Returns varchar(200)   
As
Begin
	Declare  @direccion  varchar(200)
	SELECT	@direccion = [drccn_archvo_indce]
	FROM	[bdGestionDocumental].[dbo].[tbConfiguracionMigracionArchivosIndices]
	Where	cnsctvo_cdgo_cnfgrcn = @cnsctvo_cdgo_cnfgrcn

	Declare @fecha datetime
	Set @fecha = getDate()

	set @direccion = @direccion +  + CAST(DATEPART(year,@fecha) as VARCHAR(4)) + '\' + dbo.fn_Devuelve_Dia_Completo(CAST(DATEPART(month,@fecha) as VARCHAR(2))) + '\' + dbo.fn_Devuelve_Dia_Completo(CAST(DATEPART(day,@fecha) as VARCHAR(2)))
	Return @direccion
End


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnGDCCalcularDireccionArchivoIndice] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnGDCCalcularDireccionArchivoIndice] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnGDCCalcularDireccionArchivoIndice] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnGDCCalcularDireccionArchivoIndice] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnGDCCalcularDireccionArchivoIndice] TO [Coordinador Parametros Recobro]
    AS [dbo];

