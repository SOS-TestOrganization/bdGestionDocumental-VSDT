
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
* Metodo o PRG:			fn_Devuelve_Dia_Completo
* Desarrollado por:		<\A	Ing. Jorge Marcos Rincon Ardila	A\>
* Descripcion:			<\D	Devuelve el dia completo	D\>
* Observaciones:		<\O											O\>
* Parametros:			<\P	Numero del Dia	P\>
* Fecha Creacion:		<\FC	07/01/0/2009	FC\>
*---------------------------------------------------------------------------------*/
CREATE    Function [dbo].[fn_Devuelve_Dia_Completo] (@Dia int)
Returns  varchar(5)   
As

Begin 
	
	Declare @DiaChar	varchar(5)
	
	if (@Dia >= 1 And @Dia <= 9) 
		Set @DiaChar = '0' + convert(varchar(1), @Dia) 
	else 
		Set @DiaChar = convert(varchar(2), @Dia) 

	Return (@DiaChar)
End



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fn_Devuelve_Dia_Completo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fn_Devuelve_Dia_Completo] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fn_Devuelve_Dia_Completo] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fn_Devuelve_Dia_Completo] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fn_Devuelve_Dia_Completo] TO [Coordinador Parametros Recobro]
    AS [dbo];

