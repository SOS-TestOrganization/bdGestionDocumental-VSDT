

/*---------------------------------------------------------------------------------
* Metodo o PRG:			spGDIngresarEstadoxDocumento
* Desarrollado por:		<\A	Jorge Marcos Rincón Ardila	A\>
* Descripcion:			<\D	Ingresa un cambio de Estado de un Documento	D\>
* Parametros:			<\P   	P\>
* Fecha Creacion:		<\FC	07/01/2009	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:				<\AM		AM\>
* Descripcion Modificacion:		<\DM		DM\>
* Fecha Modificacion:			<\FM		FM\>
*---------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[spGDIngresarEstadoxDocumento] 
/* 1 */		@cnsctvo_cdgo_dcmnto			Int, 
/* 2 */		@cnsctvo_cdgo_estdo_dcmnto		Int, 
/* 3 */		@usro_cmbo_estdo				Char(30),
/* 4 */		@error							varchar(5)	output
AS
BEGIN
	SET NOCOUNT ON;
	
	Declare @cnsctvo_cdgo_estdo_pr_dcmnto	int
	
	--Se settea la variable @error en '0'
	Set @error = '0'
	
	--Se ingresa el cambio de estado
	Begin Transaction
		Set @cnsctvo_cdgo_estdo_pr_dcmnto = IsNull((Select Max(cnsctvo_cdgo_estdo_pr_dcmnto) + 1 From tbEstadosxDocumentos), 1)
		
		--Se ingresa el cambio de Estado del Documento
		Insert Into tbEstadosxDocumentos(
			cnsctvo_cdgo_estdo_pr_dcmnto,		cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_estdo_dcmnto, 
			fcha_cmbo_estdo,					usro_cmbo_estdo
		) Values (
			@cnsctvo_cdgo_estdo_pr_dcmnto,		@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_estdo_dcmnto, 
			getDate(),							@usro_cmbo_estdo
		)
		
		If @@Error <> 0
			Begin
				Set @error = '1'
				Rollback Transaction
				Return -1
			End
		else
			Begin
				Commit Transaction
			End
	
END






GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarEstadoxDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarEstadoxDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarEstadoxDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarEstadoxDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarEstadoxDocumento] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarEstadoxDocumento] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarEstadoxDocumento] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarEstadoxDocumento] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarEstadoxDocumento] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarEstadoxDocumento] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarEstadoxDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarEstadoxDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarEstadoxDocumento] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarEstadoxDocumento] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarEstadoxDocumento] TO [Autorizador Validacion Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarEstadoxDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarEstadoxDocumento] TO [visosservice_role]
    AS [dbo];

