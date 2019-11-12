
/*---------------------------------------------------------------------------------
* Metodo o PRG:			spGDEliminarNumeroRadicacion
* Desarrollado por:		<\A	Jorge Marcos Rincón Ardila	A\>
* Descripcion:			<\D	Devuelve un numero de radicacion	D\>
* Parametros:			<\P	Consecutivo numero de radicacion	P\>
* Fecha Creacion:		<\FC	07/01/2009	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:				<\AM		AM\>
* Descripcion Modificacion:		<\DM		DM\>
* Fecha Modificacion:			<\FM		FM\>
*---------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[spGDEliminarNumeroRadicacion] 
/* 1 */		@cnsctvo_cdgo_nmro_rdccn			udtConsecutivo, 
/* 2 */		@error								varchar(5) output
AS
BEGIN
	SET NOCOUNT ON;
	
	--Se settea la variable @error en '0'
	Set @error = '0'
	
	Begin Transaction
		
		Delete from bdGestionDocumental.dbo.tbNumeroRadicacion 
		Where cnsctvo_cdgo_nmro_rdccn = @cnsctvo_cdgo_nmro_rdccn
		
		If @@Error <> 0
			Begin
				Set @error = '1'
				Rollback Transaction
				Return -1
			End
		else
			Begin
				Commit Transaction
			End
	
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarNumeroRadicacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarNumeroRadicacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarNumeroRadicacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarNumeroRadicacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarNumeroRadicacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarNumeroRadicacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarNumeroRadicacion] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarNumeroRadicacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarNumeroRadicacion] TO [visosservice_role]
    AS [dbo];

