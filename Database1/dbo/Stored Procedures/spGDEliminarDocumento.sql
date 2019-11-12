
/*---------------------------------------------------------------------------------
* Metodo o PRG:			spGDEliminarDocumento
* Desarrollado por:		<\A	Jorge Marcos Rincón Ardila	A\>
* Descripcion:			<\D	Elimina un Contacto por el Portal Web	D\>
* Parametros:			<\P   	P\>
* Fecha Creacion:		<\FC	09/01/2009	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:			<\AM		AM\>
* Descripcion:				<\DM		DM\>
* Nuevos Parametros:		<\PM		PM\>
* Fecha Modificacion:		<\FM		FM\>
*---------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[spGDEliminarDocumento] 
/* 1 */	@cnsctvo_cdgo_dcmnto			udtConsecutivo, 
/* 2 */	@error							varchar(10) output
AS
BEGIN
	SET NOCOUNT ON;
	
	--Se settea la variable @error en '0'
	Set @error = '0'
	
	Begin Transaction
		
		Delete From bdGestionDocumental.dbo.tbEstadosxDocumentos 
		Where cnsctvo_cdgo_dcmnto = @cnsctvo_cdgo_dcmnto
		
		Delete From bdGestionDocumental.dbo.tbDocumentos 
		Where cnsctvo_cdgo_dcmnto = @cnsctvo_cdgo_dcmnto
		
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
    ON OBJECT::[dbo].[spGDEliminarDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumento] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumento] TO [visosservice_role]
    AS [dbo];

