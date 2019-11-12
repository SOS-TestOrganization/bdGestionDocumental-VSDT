


/*---------------------------------------------------------------------------------
* Metodo o PRG:			spGDIngresarDocumento
* Desarrollado por:		<\A	Jorge Marcos Rincón Ardila	A\>
* Descripcion:			<\D	Ingresa un Documento desde el Portal	D\>
* Parametros:			<\P   	P\>
* Fecha Creacion:		<\FC	07/01/2009	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:				<\AM		AM\>
* Descripcion Modificacion:		<\DM		DM\>
* Fecha Modificacion:			<\FM		FM\>
*---------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[spGDIngresarDocumento] 
/* 1 */		@cdgo_dcmnto						varchar(100), 
/* 2 */		@cnsctvo_cdgo_tpo_dcmnto			Int, 
/* 3 */		@cnsctvo_cdgo_nmro_rdccn			Int, 
/* 4 */		@dscrpcn_dcmnto						text, 
/* 5 */		@usro								Char(30),
/* 6 */		@cnsctvo_cdgo_dcmnto				Int			output, 
/* 7 */		@error								varchar(5)	output
AS

BEGIN
	SET NOCOUNT ON;
	
	--Se settea la variable @error en '0'
	Set @error = '0'
	
	--Se ingresa el documento
	Begin Transaction
		Set @cnsctvo_cdgo_dcmnto = IsNull((Select Max(cnsctvo_cdgo_dcmnto) + 1 From tbDocumentos), 1)
		
		Insert Into tbDocumentos(
			cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_nmro_rdccn,	cdgo_dcmnto, 
			cnsctvo_cdgo_tpo_dcmnto,	dscrpcn_dcmnto,				fcha_crcn
		) Values (
			@cnsctvo_cdgo_dcmnto,		@cnsctvo_cdgo_nmro_rdccn,	@cdgo_dcmnto, 
			@cnsctvo_cdgo_tpo_dcmnto,	@dscrpcn_dcmnto,			getDate()
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
    ON OBJECT::[dbo].[spGDIngresarDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumento] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumento] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumento] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumento] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumento] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumento] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumento] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumento] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumento] TO [Autorizador Validacion Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarDocumento] TO [visosservice_role]
    AS [dbo];

