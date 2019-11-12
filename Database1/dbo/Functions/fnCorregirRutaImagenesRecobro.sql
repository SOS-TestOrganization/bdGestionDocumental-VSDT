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
* Modificado Por		: <\AM Luis Fernando Benavides AM\>
* Descripcion			: <\DM Adicionar ruta imagenes con extencion escrita en mayuscula en bd DM\>
* Nuevos Parametros		: <\PM  PM\>
* Nuevas Variables		: <\VM @rutatif_minuscula1: Nueva ruta con extencion mayuscula en bd VM\>
* Fecha Modificacion	: <\FM 2016/04/14 FM\>
*---------------------------------------------------------------------------------
* Modificado Por		: <\AM Meissner Preciado AM\>
* Descripcion			: <\DM Adicionar ruta '\ImagenSOS\CTC\' imagenes con extension escrita en mayuscula en bd DM\>
* Nuevos Parametros		: <\PM  PM\>
* Nuevas Variables		: <\VM @rutatif_minuscula2: Nueva ruta con extencion mayuscula en bd VM\>
* Fecha Modificacion	: <\FM 2016/09/15 FM\>
*---------------------------------------------------------------------------------
* Modificado Por		: <\AM Ing. Jean Paul Villaquiran AM\>
* Descripcion			: <\DM Se realiza adicion de funciones para quitar espacios en el resultado DM\>
* Nuevos Parametros		: <\PM PM\>
* Nuevas Variables		: <\VM VM\>
* Fecha Modificacion	: <\FM 2018/08/09 FM\>
*---------------------------------------------------------------------------------
*/

/*
	Declare		@txto_rta_rmplzr	varchar(200)
	--set		@txto_rta_rmplzr	= dbo.fnCorregirRutaImagenesRecobro('\Imagen_SIO\Digitalizacion\CUENTAS MEDICAS\2010\08\30\SIO0000363462.TIF')
	--set		@txto_rta_rmplzr	= dbo.fnCorregirRutaImagenesRecobro('\imagensos\ctc\Digitalizacion\CUENTAS MEDICAS\2010\08\30\SIO0000363462.TIF')
	set			@txto_rta_rmplzr	= dbo.fnCorregirRutaImagenesRecobro('\imagenes\ImagenSOS\CTC\2016\08\22\2024072_2_1.PAGE1.TIF')
	print		@txto_rta_rmplzr

*/

CREATE function  [dbo].[fnCorregirRutaImagenesRecobro]
(
	@txto_rta_bscr varchar(500)
)

returns varchar(500)
as
begin 
	declare	@txto_rta_rmplzr	varchar(500),
			@rutatif_minuscula	varchar(100),
			@rutatif_minuscula1	varchar(100),
			@rutatif_minuscula2	varchar(100);
	
	declare @tbRutasImagenesRecobros table(txto_rta_bscr varchar(200),txto_rta_rmplzr varchar(200),posicionCaracter int);

	set		@txto_rta_rmplzr	= @txto_rta_bscr
	set		@rutatif_minuscula	= '\Recobros_Anexos_Imagenes\'
	set		@rutatif_minuscula1	= '\ImagenIQ\Digitalizacion\CuentasMedicas\'
	set		@rutatif_minuscula2	= '\ImagenSOS\CTC\'

	insert 
	into	@tbRutasImagenesRecobros
			(
			txto_rta_bscr,
			txto_rta_rmplzr,
			posicionCaracter
			)
	select	txto_rta_bscr,
			txto_rta_rmplzr,
			charindex(txto_rta_bscr, @txto_rta_bscr)
	from	dbo.tbGdCorregirRutaImagenesRecobro_vigencias;

	select	@txto_rta_rmplzr = replace(@txto_rta_bscr, txto_rta_bscr, txto_rta_rmplzr)
	from	@tbRutasImagenesRecobros
	where	posicionCaracter != 0;

	-- Corrige extencion tif a TIF
	If charindex(@rutatif_minuscula, @txto_rta_bscr) != 0 OR charindex(@rutatif_minuscula1, @txto_rta_bscr) != 0 or charindex(@rutatif_minuscula2, @txto_rta_bscr) != 0 
		Begin
			Set	@txto_rta_rmplzr = replace(@txto_rta_rmplzr, 'TIF', 'tif');
		End 

	return rtrim(ltrim(@txto_rta_rmplzr));
end
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnCorregirRutaImagenesRecobro] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnCorregirRutaImagenesRecobro] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnCorregirRutaImagenesRecobro] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnCorregirRutaImagenesRecobro] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnCorregirRutaImagenesRecobro] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnCorregirRutaImagenesRecobro] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnCorregirRutaImagenesRecobro] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnCorregirRutaImagenesRecobro] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnCorregirRutaImagenesRecobro] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnCorregirRutaImagenesRecobro] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnCorregirRutaImagenesRecobro] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnCorregirRutaImagenesRecobro] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnCorregirRutaImagenesRecobro] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnCorregirRutaImagenesRecobro] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnCorregirRutaImagenesRecobro] TO [rcbrs_usr]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnCorregirRutaImagenesRecobro] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnCorregirRutaImagenesRecobro] TO [visosservice_role]
    AS [dbo];

