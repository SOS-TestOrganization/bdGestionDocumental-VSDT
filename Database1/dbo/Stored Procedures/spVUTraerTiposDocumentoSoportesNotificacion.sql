/*---------------------------------------------------------------------------------
* Metodo o PRG:			spVUTraerTiposDocumentoSoportesNotificacion
* Desarrollado por:		<\A	Ing. Jorge Marcos Rincon Ardila	A\>
* Descripcion:			<\D	Consultar Tipos de Documentos de tbImagenesSoporteFactura	D\>
* Observaciones:		<\O		O\>
* Parametros:			<\P		P\>
* Fecha Creacion:		<\FC	09/03/2008	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:		<\AM		AM\>
* Descripcion:			<\DM		DM\>
* Nuevos Parametros:	<\PM		PM\>
* Nuevas Variables:		<\VM		VM\>
* Fecha Modificacion:	<\FM		FM\>
*---------------------------------------------------------------------------------*/
--exec spVUTraerTiposDocumentoSoportesNotificacion 
CREATE PROCEDURE [dbo].[spVUTraerTiposDocumentoSoportesNotificacion] 
AS
BEGIN
	SET NOCOUNT ON;

    select	tpo_dcmnto as dscrpcn_tpo_dcmnto
	from tbImagenesSoporteNotificacion 
	where tpo_dcmnto Is Not Null
	group by tpo_dcmnto
	
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesNotificacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesNotificacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesNotificacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesNotificacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesNotificacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesNotificacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesNotificacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesNotificacion] TO [visosservice_role]
    AS [dbo];

