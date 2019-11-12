

/*---------------------------------------------------------------------------------
* Metodo o PRG 	            :  fnValidarExisteArchivo
* Desarrollado por		 	: <\A Ing. Andres Taborda									A\>
* Descripcion			  	: <\D Validar si un archivo existe					D\>
* Observaciones		        : <\O																		O\>
* Parametros			  	: <\P																		P\>
* Variables			  		: <\V  																		V\>
* Fecha Creacion	        : <\FC 2017/04/10
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------
* Modificado Por			: <\AM  AM\>
* Descripcion				: <\DM 	DM\>
* Nuevos Parametros			: <\PM 	PM\>
* Nuevas Variables			: <\VM 	VM\>
* Fecha Modificacion		: <\FM  FM\>
*---------------------------------------------------------------------------------
*/

CREATE FUNCTION dbo.fnValidarExisteArchivo(@rutaImagen varchar(250)) RETURNS BIT
AS BEGIN
	DECLARE @resultado INT
	EXEC master.dbo.xp_fileexist @rutaImagen, @resultado OUTPUT
	RETURN cast(@resultado as bit)
END