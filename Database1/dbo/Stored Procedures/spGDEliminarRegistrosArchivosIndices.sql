
/*---------------------------------------------------------------------------------------------------------------------------                                       
* Procedimiento		:  dbo.spGDEliminarRegistrosArchivosIndices                                       
* Desarrollado por  : \A Ing. Cesar García   A\                                       
* Descripción		: \D Eliminar registros de índices temporales utilizados en el proceso de carga  D\                                       
* Observaciones		: \O      O\                                       
* Parámetros		: \P  @cnsctvo_cdgo_prcso_crga_imgn: Consecutivo del proceso de carga de imágenes a eliminar P\                                       
* Variables			: \V      V\                                       
* Fecha Creación	: \FC 2012/07/21  FC\                                       
*                                       
*----------------------------------------------------------------------------------------------------------------------------                                       
* DATOS DE MODIFICACION                                        
*----------------------------------------------------------------------------------------------------------------------------                                       
* Modificado Por	: \AM   AM\                                       
* Descripción		: \DM   DM\                                       
* Nuevos Parámetros : \PM  PM\                                       
* Nuevas Variables  : \VM  VM\                                       
* Fecha Modificación: \FM   FM\                                       
*----------------------------------------------------------------------------------------------------------------------------
*/ 
CREATE PROCEDURE [dbo].[spGDEliminarRegistrosArchivosIndices]
@cnsctvo_cdgo_prcso_crga_imgn	INT

As
Set NoCount On

BEGIN TRAN
DELETE
FROM	dbo.tbRegistrosArchivosIndices
WHERE	cnsctvo_cdgo_prcso_crga_imgn = @cnsctvo_cdgo_prcso_crga_imgn
COMMIT TRAN


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarRegistrosArchivosIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarRegistrosArchivosIndices] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];

