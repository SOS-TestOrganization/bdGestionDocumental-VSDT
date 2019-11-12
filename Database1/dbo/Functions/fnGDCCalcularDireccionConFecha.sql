




CREATE Function [dbo].[fnGDCCalcularDireccionConFecha] (@direccion  varchar(200),@fecha datetime)
Returns varchar(200)   
As
Begin
	Set @direccion = @direccion +  CAST(DATEPART(year,@fecha) as VARCHAR(4)) + '\' + dbo.fn_Devuelve_Dia_Completo(CAST(DATEPART(month,@fecha) as VARCHAR(2))) + '\' + dbo.fn_Devuelve_Dia_Completo(CAST(DATEPART(day,@fecha) as VARCHAR(2)))
	Return @direccion
End

