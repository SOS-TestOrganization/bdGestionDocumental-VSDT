
/*---------------------------------------------------------------------------------
* Metodo o PRG:			spVUTraerTiposSoportesAutoliquidacion
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
--exec spVUTraerTiposSoportesAutoliquidacion 
CREATE PROCEDURE [dbo].[spVUTraerTiposSoportesAutoliquidacion] 
AS
BEGIN
	SET NOCOUNT ON;
	
	select	tpo as dscrpcn_tpo 
	from tbImagenesSoporteAutoliquidacion 
	where tpo Is Not Null
	group by tpo 
	
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposSoportesAutoliquidacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposSoportesAutoliquidacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposSoportesAutoliquidacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposSoportesAutoliquidacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposSoportesAutoliquidacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposSoportesAutoliquidacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposSoportesAutoliquidacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerTiposSoportesAutoliquidacion] TO [visosservice_role]
    AS [dbo];

