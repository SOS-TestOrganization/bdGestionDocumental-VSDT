
/*---------------------------------------------------------------------------------
* Nombre			: spGDTraerParametrosInstruccionJAVAVisor
* Desarrollado por	: <\A Ing. JUAN CARLOS VASQUEZ GARCIA									A>
* Descripcion		: <\D Obtiene el parámetro nombre del JAR y los parámetros del
						  Comando a ejecutar del visor de cuentas médicas			 		D\>
* Observaciones		: <\O																	O\>
* Parametros		: <\P 	@cnsctvo_cdgo_prmtro_gnrl = consecutivo parámetros generales	P\>
* Variables			: <\V       									  						V\>
* Fecha Creacion	: <\FC 2015/07/29														FC\>
*
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------
*---------------------------------------------------------------------------------
* Modificado Por	: <\AM Andres Taborda  AM\>
* Descripcion		: <\DM Ajuste tamaño del campo devuelve a 150 caracteres DM\>
* Nuevos Parametros	: <\PM	PM\>
* Nuevas Variables	: <\VM  VM\>
* Fecha Modificacion: <\FM 20161101 FM\>
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------*/

-- exec spGDTraerParametrosInstruccionInvocarVisorJAVADinamico null

CREATE PROCEDURE [dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico]

/*1*/ @lcvlr_prmtro						varchar(150) = '' output

AS
SET NOCOUNT ON


BEGIN
	DECLARE @ldFechaActual DATETIME,
			@lccnsctvo_cdgo_prmtro_gnrl int 
	SET		@ldFechaActual = GetDate()
	set		@lccnsctvo_cdgo_prmtro_gnrl  = 18 -- Consecutivo Parametro Nombre Jar y Parámetros Visor Ctas Médicas

	Select	@lcvlr_prmtro = ltrim(rtrim(vlr_prmtro_crctr))
	From	tbParametrosGenerales_Vigencias with (nolock)
	Where	cnsctvo_cdgo_prmtro_gnrl = @lccnsctvo_cdgo_prmtro_gnrl
	And		@ldFechaActual between inco_vgnca and fn_vgnca
END




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [340007 Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [340011 Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [Consultor de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [Liquidador Facturas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametrosInstruccionInvocarVisorJAVADinamico] TO [visosservice_role]
    AS [dbo];

