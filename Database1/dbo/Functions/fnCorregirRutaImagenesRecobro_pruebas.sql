/*---------------------------------------------------------------------------------
* Metodo o PRG 			: fnCorregirRutaImagenesRecobro
* Desarrollado por		: <\A Luis Fernando Benavides							A\>
* Descripcion			: <\D Consulta el texto enviado y lo devuelve corregido	D\>
* Observaciones			: <\O Se apoya en la tabla: 							O\>
*						  <\O tbGdCorregirRutaImagenesRecobro_vigencias			O\>
* Parametros			: <\P @txto_rta_bscr: texto a buscar					P\>
* Variables				: <\V  													V\>
* Fecha Creacion		: <\FC 2003/06/13										FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION
*---------------------------------------------------------------------------------
* Modificado Por		: <\AM  AM\>
* Descripcion			: <\DM  DM\>
* Nuevos Parametros		: <\PM  PM\>
* Nuevas Variables		: <\VM  VM\>
* Fecha Modificacion	: <\FM  FM\>
*---------------------------------------------------------------------------------*/

/*
Declare	@txto_rta_rmplzr	varchar(200)
--set		@txto_rta_rmplzr	= dbo.fnCorregirRutaImagenesRecobro('\Imagen_SIO\Digitalizacion\CUENTAS MEDICAS\2010\08\30\SIO0000363462.TIF')
--set		@txto_rta_rmplzr	= dbo.fnCorregirRutaImagenesRecobro('\imagensos\ctc\Digitalizacion\CUENTAS MEDICAS\2010\08\30\SIO0000363462.TIF')
set		@txto_rta_rmplzr	= dbo.fnCorregirRutaImagenesRecobro('\Recobros_Anexos_Imagenes\2014\05\30\563349_4_3.tif')
print	@txto_rta_rmplzr
*/

/*
Declare	@txto_rta_rmplzr	varchar(200)
set		@txto_rta_rmplzr	= dbo.fnCorregirRutaImagenesRecobro_pruebas('\Recobros_Anexos_Imagenes\2014\05\30\563349_4_3.tif')
--set		@txto_rta_rmplzr	= dbo.fnCorregirRutaImagenesRecobro_pruebas('\imagensos\ctc\Digitalizacion\CUENTAS MEDICAS\2010\08\30\SIO0000363462.TIF')
print	@txto_rta_rmplzr
*/

--CREATE function  [dbo].[fnCorregirRutaImagenesRecobro_pruebas](
CREATE function  [dbo].[fnCorregirRutaImagenesRecobro_pruebas](
@txto_rta_bscr		varchar(500)
)

RETURNS varchar(500)
as
BEGIN 
	Declare	@txto_rta_rmplzr	varchar(500)
	Declare	@rutatif_minuscula	varchar(100)

	Set		@txto_rta_rmplzr	= @txto_rta_bscr
	Set		@rutatif_minuscula	= '\Recobros_Anexos_Imagenes\'

	Select	@txto_rta_rmplzr = replace(@txto_rta_bscr, txto_rta_bscr, txto_rta_rmplzr)
	From	tbGdCorregirRutaImagenesRecobro_vigencias
	Where	CHARINDEX(txto_rta_bscr, @txto_rta_bscr) != 0

	-- Corrige extencion tif a TIF
	If CHARINDEX(@rutatif_minuscula, @txto_rta_bscr) != 0
		Begin
			Set		@txto_rta_rmplzr = replace(@txto_rta_rmplzr, 'tif', 'TIF')
		End 

	Return @txto_rta_rmplzr

END
	
