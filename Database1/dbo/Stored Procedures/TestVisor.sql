
/*
exec TestVisor
*/

CREATE Procedure [dbo].[TestVisor]
AS

SET NOCOUNT ON

DECLARE @x AS XML;

SELECT * FROM #temp
/*
-- Enviar xml resultado de la consulta a una variable tipo xml
set @x = (select top 1000 *
from tbImagenesxDocumentosDigitalizados
FOR XML RAW, ELEMENTS, root('xml'))

-- Enviar a fox de esta forma porque para ajustar nombre del campo y no vaya a salir error 
SELECT @x.query('//xml')
AS [ejemplo];
*/
