Create Procedure	dbo.spCARecuperarConsecutivoDigitalizador
@usro_dgtlzdr			Varchar(15),
@cnsctvo_cdgo_dgtdr		Int		Output

As
Set NoCount On


Select		@cnsctvo_cdgo_dgtdr	=	cnsctvo_cdgo_dgtdr
From		bdSeguridad.dbo.tbUsuarios
where		Ltrim(Rtrim(lgn_usro))	=	@usro_dgtlzdr
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCARecuperarConsecutivoDigitalizador] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCARecuperarConsecutivoDigitalizador] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCARecuperarConsecutivoDigitalizador] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCARecuperarConsecutivoDigitalizador] TO [visosservice_role]
    AS [dbo];

