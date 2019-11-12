/*---------------------------------------------------------------------------------
* Metodo o PRG:			spVUTraerTiposDocumentoSoportesAfiliacion
* Desarrollado por:		<\A	Ing. Jorge Marcos Rincon Ardila	A\>
* Descripcion:			<\D	Consultar Tipos de Documentos de tbImagenesSoporteAfiliacion	D\>
* Observaciones:		<\O		O\>
* Parametros:			<\P		P\>
* Fecha Creacion:		<\FC	04/03/2008	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:		<\AM		AM\>
* Descripcion:			<\DM		DM\>
* Nuevos Parametros:	<\PM		PM\>
* Nuevas Variables:		<\VM		VM\>
* Fecha Modificacion:	<\FM		FM\>
*---------------------------------------------------------------------------------*/
--exec spVUTraerTiposDocumento 
CREATE PROCEDURE [dbo].[spVUTraerTiposDocumentoSoportesAfiliacion] 
AS
BEGIN
	SET NOCOUNT ON;
	
	select	tpo_dcmnto as dscrpcn_tpo_dcmnto
	from tbImagenesSoporteAfiliacion 
	where tpo_dcmnto Is Not Null
	group by tpo_dcmnto
	
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesAfiliacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesAfiliacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesAfiliacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesAfiliacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesAfiliacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesAfiliacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesAfiliacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesAfiliacion] TO [visosservice_role]
    AS [dbo];

