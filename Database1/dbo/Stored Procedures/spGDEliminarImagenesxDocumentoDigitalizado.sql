
/* 
==========================================================================================
-- Author:		<sisogb01>
-- Create date: 20/04/2010
-- Description: Elimina (inactiva) las imagenes de acuerdo a su llave o las imagenes deacuerdo a  su documento.
==========================================================================================
*/
CREATE PROCEDURE dbo.spGDEliminarImagenesxDocumentoDigitalizado
(	
@cnsctvo_cdgo_imgn   Int = Null,	
@cnsctvo_cdgo_dcmnto Int = Null
	
)
As
Set NoCount On
Declare @count int

IF(@cnsctvo_cdgo_dcmnto Is Not Null) --Asegurar q no se borren todas
Begin
	--Inactivar los detalles
	Update		dbo.tbImagenesxDocumentosDigitalizados
	Set			estdo					=	'I'
	Where		(cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto)

	Set @count = @@rowcount
End

If(@cnsctvo_cdgo_imgn Is Not Null)
Begin
	Update		dbo.tbImagenesxDocumentosDigitalizados
	Set			estdo				=	'I'
	Where		(cnsctvo_cdgo_imgn	=	@cnsctvo_cdgo_imgn)

	Set @count = @@rowcount
End

Select @count as "count"

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarImagenesxDocumentoDigitalizado] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarImagenesxDocumentoDigitalizado] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarImagenesxDocumentoDigitalizado] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarImagenesxDocumentoDigitalizado] TO [visosservice_role]
    AS [dbo];

