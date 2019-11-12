/*---------------------------------------------------------------------------------
* Metodo o PRG:			spVUTraerCiudadesSoportesNotificacion
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
--exec spVUTraerCiudadesSoportesNotificacion 
CREATE PROCEDURE [dbo].[spVUTraerCiudadesSoportesNotificacion] 
AS
BEGIN
	SET NOCOUNT ON;

    select	cdd as dscrpcn_cdd 
	from tbImagenesSoporteNotificacion 
	where cdd Is Not Null
	group by cdd
	
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerCiudadesSoportesNotificacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerCiudadesSoportesNotificacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerCiudadesSoportesNotificacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerCiudadesSoportesNotificacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerCiudadesSoportesNotificacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerCiudadesSoportesNotificacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerCiudadesSoportesNotificacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerCiudadesSoportesNotificacion] TO [visosservice_role]
    AS [dbo];

