
/*---------------------------------------------------------------------------------
* Metodo o PRG:			spVUTraerBasesDatosSoportesAutoliquidacion
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
--exec spVUTraerBasesDatosSoportesAutoliquidacion 
CREATE PROCEDURE [dbo].[spVUTraerBasesDatosSoportesAutoliquidacion] 
AS
BEGIN
	SET NOCOUNT ON;
	
	select	anno as dscrpcn_bs_dto 
	from tbImagenesSoporteAutoliquidacion 
	where anno Is Not Null
	group by anno 
	
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerBasesDatosSoportesAutoliquidacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerBasesDatosSoportesAutoliquidacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerBasesDatosSoportesAutoliquidacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerBasesDatosSoportesAutoliquidacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerBasesDatosSoportesAutoliquidacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerBasesDatosSoportesAutoliquidacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerBasesDatosSoportesAutoliquidacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerBasesDatosSoportesAutoliquidacion] TO [visosservice_role]
    AS [dbo];

