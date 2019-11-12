
/*---------------------------------------------------------------------------------
* Metodo o PRG:			spVUTraerNombresContratoSoportesAfiliacion
* Desarrollado por:		<\A	Ing. Jorge Marcos Rincon Ardila	A\>
* Descripcion:			<\D	Consultar Bases de Datos de tbImagenesSoporteAfiliacion	D\>
* Observaciones:		<\O		O\>
* Parametros:			<\P		P\>
* Fecha Creacion:		<\FC	06/03/2008	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:		<\AM		AM\>
* Descripcion:			<\DM		DM\>
* Nuevos Parametros:	<\PM		PM\>
* Nuevas Variables:		<\VM		VM\>
* Fecha Modificacion:	<\FM		FM\>
*---------------------------------------------------------------------------------*/
--exec spVUTraerNombresContratoSoportesAfiliacion 
CREATE PROCEDURE [dbo].[spVUTraerNombresContratoSoportesAfiliacion] 
AS
BEGIN
	SET NOCOUNT ON;
	
	select	nmbre_cntrto as dscrpcn_nmbre_cntrto 
	from tbImagenesSoporteAfiliacion 
	where nmbre_cntrto Is Not Null
	group by nmbre_cntrto 
	
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerNombresContratoSoportesAfiliacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerNombresContratoSoportesAfiliacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerNombresContratoSoportesAfiliacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerNombresContratoSoportesAfiliacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerNombresContratoSoportesAfiliacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerNombresContratoSoportesAfiliacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerNombresContratoSoportesAfiliacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerNombresContratoSoportesAfiliacion] TO [visosservice_role]
    AS [dbo];

