  
CREATE Procedure [dbo].[spCARecuperarInformacionDigitalizador]  
@cnsctvo_cdgo_dgtlzdr	Int

As  
Set Nocount On  
    
Select  dscrpcn_dgtlzdr,		cnsctvo_cdgo_dgtlzdr,		cdgo_dgtlzdr,			crpta_srvdr
From	bdGestionDocumental.dbo.tbDigitalizadores
Where	cnsctvo_cdgo_dgtlzdr	=	@cnsctvo_cdgo_dgtlzdr
And		vsble_usro = 'S'
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCARecuperarInformacionDigitalizador] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCARecuperarInformacionDigitalizador] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCARecuperarInformacionDigitalizador] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCARecuperarInformacionDigitalizador] TO [visosservice_role]
    AS [dbo];

