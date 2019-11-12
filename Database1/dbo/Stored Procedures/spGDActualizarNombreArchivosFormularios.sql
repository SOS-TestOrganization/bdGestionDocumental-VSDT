CREATE Procedure	[dbo].[spGDActualizarNombreArchivosFormularios]
@cnsctvo_cdgo_prcso_crga_imgn	Int

As
Set NoCount On

Update	tbregistrosarchivosindices
Set		nmbre_archvo	=	Substring(nmbre_archvo,1,Charindex(',',nmbre_archvo,1)-1)							
Where	cnsctvo_cdgo_prcso_crga_imgn	=	@cnsctvo_cdgo_prcso_crga_imgn
and		Charindex(',',nmbre_archvo,1) > 0
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarNombreArchivosFormularios] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarNombreArchivosFormularios] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarNombreArchivosFormularios] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarNombreArchivosFormularios] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarNombreArchivosFormularios] TO [visosservice_role]
    AS [dbo];

