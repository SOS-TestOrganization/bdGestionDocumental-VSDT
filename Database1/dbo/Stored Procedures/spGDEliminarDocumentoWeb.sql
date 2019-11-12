/*---------------------------------------------------------------------------------
* Metodo o PRG:			spGDEliminarDocumento
* Desarrollado por:		<\A	Jorge Marcos Rincón Ardila	A\>
* Descripcion:			<\D	Elimina un Contacto por el Portal Web	D\>
* Parametros:			<\P   	P\>
* Fecha Creacion:		<\FC	07/02/2011	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:			<\AM		AM\>
* Descripcion:				<\DM		DM\>
* Nuevos Parametros:		<\PM		PM\>
* Fecha Modificacion:		<\FM		FM\>
*---------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[spGDEliminarDocumentoWeb] 
/* 1 */	@cnsctvo_cdgo_dcmnto			udtConsecutivo, 
/* 2 */	@error							varchar(10) output
AS
BEGIN
	SET NOCOUNT ON;
	
	--Se settea la variable @error en '0'
	Set @error = '0'
	
	Begin Transaction
		Delete from bdGestionDocumental.dbo.tbNumeroRadicacion 
		Where cnsctvo_cdgo_dcmnto = @cnsctvo_cdgo_dcmnto
		
		Delete from bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
		Where cnsctvo_cdgo_dcmnto = @cnsctvo_cdgo_dcmnto
		
		Delete from bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
		Where cnsctvo_cdgo_dcmnto = @cnsctvo_cdgo_dcmnto
		
		Delete from bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
		Where cnsctvo_cdgo_dcmnto = @cnsctvo_cdgo_dcmnto
		
		Delete From bdGestionDocumental.dbo.tbDocumentosDigitalizados 
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
    ON OBJECT::[dbo].[spGDEliminarDocumentoWeb] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentoWeb] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentoWeb] TO [visosservice_role]
    AS [dbo];

