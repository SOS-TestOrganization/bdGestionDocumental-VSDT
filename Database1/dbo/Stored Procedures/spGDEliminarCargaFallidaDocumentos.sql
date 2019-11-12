

CREATE Procedure [dbo].[spGDEliminarCargaFallidaDocumentos]
@cnsctvo_cdgo_prcso_crga_imgn	Int,
@estdo							Int	Output

As
Set NoCount On

Set	@estdo = 0

If Exists	(	Select	1
				From	tbprocesoscargaimagenes
				Where	cnsctvo_cdgo_prcso_crga_imgn	=	@cnsctvo_cdgo_prcso_crga_imgn
			)
	Begin
		Begin Tran
			Delete
			From	tbConfiguracionMigracionArchivosIndices
			Where	cnsctvo_cdgo_prcso_crga			=	@cnsctvo_cdgo_prcso_crga_imgn

			Delete
			From	tbprocesoscargaimagenes
			Where	cnsctvo_cdgo_prcso_crga_imgn	=	@cnsctvo_cdgo_prcso_crga_imgn

			Delete
			From	tbregistrosarchivosindices
			Where	cnsctvo_cdgo_prcso_crga_imgn	=	@cnsctvo_cdgo_prcso_crga_imgn

			Delete
			From	tbLogValidaciones
			Where	cnsctvo_cdgo_prcso_crga_imgn	=	@cnsctvo_cdgo_prcso_crga_imgn

			Exec	spGDBorrarDocumentoDigitalizadoxMigracion null, null, null, @cnsctvo_cdgo_prcso_crga_imgn
		Commit Tran
	End
Else
	Set	@estdo = 1
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarCargaFallidaDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDEliminarCargaFallidaDocumentos] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];

