/*---------------------------------------------------------------------------------
* Metodo o PRG:			spVUTraerArpsSoportesNotificacion
* Desarrollado por:		<\A	Ing. Jorge Marcos Rincon Ardila	A\>
* Descripcion:			<\D	Consultar ARPs de tbImagenesSoporteFactura	D\>
* Observaciones:		<\O		O\>
* Parametros:			<\P		P\>
* Fecha Creacion:		<\FC	11/03/2008	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:		<\AM		AM\>
* Descripcion:			<\DM		DM\>
* Nuevos Parametros:	<\PM		PM\>
* Nuevas Variables:		<\VM		VM\>
* Fecha Modificacion:	<\FM		FM\>
*---------------------------------------------------------------------------------*/
--exec spVUTraerArpsSoportesNotificacion 
CREATE PROCEDURE [dbo].[spVUTraerArpsSoportesNotificacion] 
AS
BEGIN
	SET NOCOUNT ON;

    select	arp as dscrpcn_arp 
	from tbImagenesSoporteNotificacion 
	where arp Is Not Null 
	group by arp 
	
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerArpsSoportesNotificacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerArpsSoportesNotificacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerArpsSoportesNotificacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerArpsSoportesNotificacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerArpsSoportesNotificacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerArpsSoportesNotificacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerArpsSoportesNotificacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerArpsSoportesNotificacion] TO [visosservice_role]
    AS [dbo];

