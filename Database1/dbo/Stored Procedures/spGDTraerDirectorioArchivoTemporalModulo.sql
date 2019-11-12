
/*---------------------------------------------------------------------------------
* Metodo o PRG 	            :  spGDTraerDirectorioArchivoTemporalModulo
* Desarrollado por		 	: <\A Andres Taborda							A\>
* Descripcion			  	: <\D Permite consultar El directorio para las aplicaciones VFP donde queda almacenado el archivo XML del VISOR	D\>
* Observaciones		        : <\O 							O\>
* Parametros			  	: <\P 											P\>
* Variables			  		: <\V  	V\>
* Fecha Creacion	        : <\FC 2017/01/27 FC\>
*
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------
*---------------------------------------------------------------------------------
* Modificado Por			: <\AM  											AM\>
* Descripcion				: <\DM 												DM\>                            
* Nuevos Parametros			: <\PM 												PM\>
* Nuevas Variables			: <\VM 												VM\>
* Fecha Modificacion		: <\FM												FM\>
*---------------------------------------------------------------------------------
*/

/*
declare @directorio varchar(100)
exec spGDTraerDirectorioArchivoTemporalModulo 22,@directorio output
select @directorio
*/
CREATE procedure [dbo].[spGDTraerDirectorioArchivoTemporalModulo]
@modulo int,
@directorio varchar(100) output

AS

Set nocount on

Select @directorio=rta_ejccn
from BDSeguridad.dbo.tbRutaEjecucionModulos
where cnsctvo_cdgo_mdlo=@modulo


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerDirectorioArchivoTemporalModulo] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerDirectorioArchivoTemporalModulo] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerDirectorioArchivoTemporalModulo] TO [Consultor Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerDirectorioArchivoTemporalModulo] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerDirectorioArchivoTemporalModulo] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerDirectorioArchivoTemporalModulo] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerDirectorioArchivoTemporalModulo] TO [Consultor de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerDirectorioArchivoTemporalModulo] TO [Liquidador Facturas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerDirectorioArchivoTemporalModulo] TO [Coordinador Cuentas Medicas]
    AS [dbo];

