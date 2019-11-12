
CREATE Procedure	[dbo].[spGDRecuperarProcesoCargaImagen]
@cnsctvo_cdgo_cnfgrcn			Int,
@cnsctvo_cdgo_prcso_crga		Int		Output

As
Set Nocount On


Select		@cnsctvo_cdgo_prcso_crga		=	cnsctvo_cdgo_prcso_crga
From		bdGestionDocumental.dbo.tbConfiguracionMigracionArchivosIndices
Where		cnsctvo_cdgo_cnfgrcn			=	@cnsctvo_cdgo_cnfgrcn

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarProcesoCargaImagen] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarProcesoCargaImagen] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarProcesoCargaImagen] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarProcesoCargaImagen] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarProcesoCargaImagen] TO [visosservice_role]
    AS [dbo];

