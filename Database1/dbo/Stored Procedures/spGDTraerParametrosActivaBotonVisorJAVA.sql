/*---------------------------------------------------------------------------------
* Nombre			: spGDTraerParametrosActivaBotonVisorJAVA
* Desarrollado por	: <\A Luis Fernando Benavides								A>
* Descripcion		: <\D Obtiene el parámetro para activar boton visor JAVA	D\>
* Observaciones		: <\O	O\>
* Parametros		: <\P @vlr_prmtro_nmrco: valor parametro numerico			P\>
* Variables			: <\V   V\>
* Fecha Creacion	: <\FC 2015/07/29	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------
* Modificado Por	: <\AM  AM\>
* Descripcion		: <\DM  DM\>
* Nuevos Parametros	: <\PM	PM\>
* Nuevas Variables	: <\VM  VM\>
* Fecha Modificacion: <\FM  FM\>
-----------------------------------------------------------------------------------*/
/*
DECLARE @vlr_prmtro_nmrco INT
EXEC	spGDTraerParametrosActivaBotonVisorJAVA @vlr_prmtro_nmrco OUTPUT
PRINT	@vlr_prmtro_nmrco
*/

CREATE PROCEDURE [dbo].[spGDTraerParametrosActivaBotonVisorJAVA]
@vlr_prmtro_nmrco	int OUTPUT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @ldFechaActual DATETIME,
			@lccnsctvo_cdgo_prmtro_gnrl int 
	SET		@ldFechaActual = GetDate()
	set		@lccnsctvo_cdgo_prmtro_gnrl  = 15 -- Consecutivo Parametro activa boton JAVA

	Select	@vlr_prmtro_nmrco = ltrim(rtrim(vlr_prmtro_nmrco))
	From	tbParametrosGenerales_Vigencias with (nolock)
	Where	cnsctvo_cdgo_prmtro_gnrl = @lccnsctvo_cdgo_prmtro_gnrl
	And		@ldFechaActual between inco_vgnca and fn_vgnca
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosActivaBotonVisorJAVA] TO [340007 Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosActivaBotonVisorJAVA] TO [340011 Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosActivaBotonVisorJAVA] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosActivaBotonVisorJAVA] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosActivaBotonVisorJAVA] TO [340014 Consultor Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosActivaBotonVisorJAVA] TO [Consultor Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosActivaBotonVisorJAVA] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosActivaBotonVisorJAVA] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosActivaBotonVisorJAVA] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosActivaBotonVisorJAVA] TO [Liquidador Facturas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosActivaBotonVisorJAVA] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosActivaBotonVisorJAVA] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosActivaBotonVisorJAVA] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosActivaBotonVisorJAVA] TO [Auditor Interno de Cuentas Medicas]
    AS [dbo];

