/*---------------------------------------------------------------------------------
* Nombre			: spGDTraerParametrosVisualizarPDFVisorWeb
* Desarrollado por	: <\A Andres Taborda							A>
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
DECLARE @vlr_prmtro_nmrco char(1)
EXEC	spGDTraerParametrosVisualizarPDFVisorWeb @vlr_prmtro_nmrco OUTPUT
PRINT	@vlr_prmtro_nmrco
*/

CREATE PROCEDURE [dbo].[spGDTraerParametrosVisualizarPDFVisorWeb]
@vlr_prmtro	char(1) OUTPUT
AS
BEGIN
	SET NOCOUNT ON
	set @vlr_prmtro='N'

	DECLARE @ldFechaActual DATETIME,
			@lccnsctvo_cdgo_prmtro_gnrl int 
	SET		@ldFechaActual = GetDate()
	set		@lccnsctvo_cdgo_prmtro_gnrl  = 16 -- Consecutivo Mostrar Archivo PDF

	Select	@vlr_prmtro = ltrim(rtrim(vlr_prmtro_crctr))
	From	tbParametrosGenerales_Vigencias with (nolock)
	Where	cnsctvo_cdgo_prmtro_gnrl = @lccnsctvo_cdgo_prmtro_gnrl
	And		@ldFechaActual between inco_vgnca and fn_vgnca
END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosVisualizarPDFVisorWeb] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosVisualizarPDFVisorWeb] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosVisualizarPDFVisorWeb] TO [visosservice_role]
    AS [dbo];

