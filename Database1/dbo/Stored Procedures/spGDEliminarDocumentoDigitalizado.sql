
/* 
==========================================================================================
-- Author:		<sisogb01>
-- Create date: 20/04/2010
-- Description: Elimina (inactiva) los documentos digitalizados y sus imagenes asociadas.
==========================================================================================
*/
CREATE PROCEDURE dbo.spGDEliminarDocumentoDigitalizado
(	
	@cnsctvo_cdgo_dcmnto Int 
)
As
Set NoCount On

Declare @count Int
--Inactivar el maestro
Update		dbo.tbDocumentosDigitalizados
Set			estdo_rgstro			=	'N'
Where		cnsctvo_cdgo_dcmnto		=	@cnsctvo_cdgo_dcmnto

Set @count = @@rowcount

--Inactivar los detalles
Update		dbo.tbImagenesxDocumentosDigitalizados
Set			estdo					=	'I'
Where		cnsctvo_cdgo_dcmnto		=	@cnsctvo_cdgo_dcmnto


Select @count as "count"

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentoDigitalizado] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentoDigitalizado] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentoDigitalizado] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarDocumentoDigitalizado] TO [visosservice_role]
    AS [dbo];

