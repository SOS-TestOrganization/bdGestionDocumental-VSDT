
CREATE Procedure	[dbo].[spGDRecuperarProveeedoresDigitalizacion]

As
Set Nocount On


Select		dscrpcn_dgtlzdr,	cnsctvo_cdgo_dgtlzdr,		cdgo_dgtlzdr,
			crpta_srvdr
From		dbo.tbDigitalizadores
Where		vsble_usro	=	'S'

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarProveeedoresDigitalizacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarProveeedoresDigitalizacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarProveeedoresDigitalizacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarProveeedoresDigitalizacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarProveeedoresDigitalizacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarProveeedoresDigitalizacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarProveeedoresDigitalizacion] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarProveeedoresDigitalizacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarProveeedoresDigitalizacion] TO [visosservice_role]
    AS [dbo];

