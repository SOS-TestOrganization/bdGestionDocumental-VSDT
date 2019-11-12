Create Procedure	spGDVerificarRutaMasivaDocumentos
@nmensaje		udtConsecutivo	Output

As
Set Nocount On

Declare @tbdocumentosmasivos As Table
(
cnsctvo_cdgo_rta	Int
)

Set	@nmensaje	=	0

Insert Into	@tbdocumentosmasivos
Select		cnsctvo_cdgo_rta
From		#tmpDocumentos
Group By 	cnsctvo_cdgo_rta

If @@rowcount > 1 
	Set	@nmensaje	=	1
Else
	Set	@nmensaje	=	0


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDVerificarRutaMasivaDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDVerificarRutaMasivaDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDVerificarRutaMasivaDocumentos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDVerificarRutaMasivaDocumentos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDVerificarRutaMasivaDocumentos] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDVerificarRutaMasivaDocumentos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDVerificarRutaMasivaDocumentos] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDVerificarRutaMasivaDocumentos] TO [visosservice_role]
    AS [dbo];

