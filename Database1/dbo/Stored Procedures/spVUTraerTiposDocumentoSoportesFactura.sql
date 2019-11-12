
/*---------------------------------------------------------------------------------
* Metodo o PRG:			spVUTraerTiposDocumentoSoportesFactura
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
--exec spVUTraerTiposDocumentoSoportesFactura 
CREATE PROCEDURE [dbo].[spVUTraerTiposDocumentoSoportesFactura] 
AS
BEGIN
	SET NOCOUNT ON;

    select	tpo_dcmnto as dscrpcn_tpo_dcmnto
	from tbImagenesSoporteFactura 
	where tpo_dcmnto Is Not Null
	group by tpo_dcmnto
	
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesFactura] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesFactura] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesFactura] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesFactura] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesFactura] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesFactura] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesFactura] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposDocumentoSoportesFactura] TO [visosservice_role]
    AS [dbo];

