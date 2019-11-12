
/*---------------------------------------------------------------------------------
* Metodo o PRG:			spVUTraerBasesDatosSoportesAfiliacion
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
--exec spVUTraerBasesDatosSoportesAfiliacion 
CREATE PROCEDURE [dbo].[spVUTraerBasesDatosSoportesAfiliacion] 
AS
BEGIN
	SET NOCOUNT ON;
	
	select	anno as dscrpcn_bs_dto 
	from tbImagenesSoporteAfiliacion 
	where anno Is Not Null
	group by anno 
	
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerBasesDatosSoportesAfiliacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerBasesDatosSoportesAfiliacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerBasesDatosSoportesAfiliacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerBasesDatosSoportesAfiliacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerBasesDatosSoportesAfiliacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerBasesDatosSoportesAfiliacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerBasesDatosSoportesAfiliacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUTraerBasesDatosSoportesAfiliacion] TO [visosservice_role]
    AS [dbo];

