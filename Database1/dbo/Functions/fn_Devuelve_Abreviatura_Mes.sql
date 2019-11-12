


/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
* Metodo o PRG:			fn_Devuelve_Abreviatura_Mes
* Desarrollado por:		<\A	Ing. Jorge Marcos Rincon Ardila	A\>
* Descripcion:			<\D	Devuelve la Abreviacion del Mes	D\>
* Observaciones:		<\O		O\>
* Parametros:			<\P	Numero del Mes	P\>
* Fecha Creacion:		<\FC	07/01/0/2009	FC\>
*---------------------------------------------------------------------------------*/
CREATE    Function [dbo].[fn_Devuelve_Abreviatura_Mes] (@Mes int)
Returns  varchar(5)   
As

Begin 
	Declare @MesChar	varchar(5)
	if (@Mes = 1) 
		Set @MesChar = 'Ene' 
	else if (@Mes = 2) 
		Set @MesChar = 'Feb' 
	else if (@Mes = 3) 
		Set @MesChar = 'Mar' 
	else if (@Mes = 4) 
		Set @MesChar = 'Abr' 
	else if (@Mes = 5) 
		Set @MesChar = 'May' 
	else if (@Mes = 6) 
		Set @MesChar = 'Jun' 
	else if (@Mes = 7) 
		Set @MesChar = 'Jul' 
	else if (@Mes = 8) 
		Set @MesChar = 'Ago' 
	else if (@Mes = 9) 
		Set @MesChar = 'Sep' 
	else if (@Mes = 10) 
		Set @MesChar = 'Oct' 
	else if (@Mes = 11) 
		Set @MesChar = 'Nov' 
	else if (@Mes = 12) 
		Set @MesChar = 'Dic' 
	else
		Set @MesChar = null 

	Return (@MesChar)
End




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fn_Devuelve_Abreviatura_Mes] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fn_Devuelve_Abreviatura_Mes] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fn_Devuelve_Abreviatura_Mes] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fn_Devuelve_Abreviatura_Mes] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fn_Devuelve_Abreviatura_Mes] TO [Coordinador Parametros Recobro]
    AS [dbo];

