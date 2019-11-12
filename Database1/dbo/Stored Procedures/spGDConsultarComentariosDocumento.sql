

CREATE Procedure [dbo].[spGDConsultarComentariosDocumento]
@cnsctvo_cdgo_dcmnto		udtConsecutivo

As
Set Nocount On

Select		c.cnsctvo_cdgo_cmntro,										c.cmntro,				u.dscrpcn_usro_rspnde,
			Convert(Char(20),c.fcha_cmntro,120) As fcha_cmntro,			r.dscrpcn_rta
From		bdGestionDocumental.dbo.tbComentariosDocumentos		c
Inner Join	bdGestionDocumental.dbo.tbRutas						r	On	r.cnsctvo_cdgo_fljo					=	c.cnsctvo_cdgo_fljo
																	And	r.cnsctvo_cdgo_rta					=	c.cnsctvo_cdgo_rta
Inner Join	bdServicioCliente.dbo.tbUsuariosResponde_Vigencias	u	On	Ltrim(Rtrim(u.lgn_usro_rspnde))		=	Ltrim(Rtrim(c.usro_cmntro))
Where		c.cnsctvo_cdgo_dcmnto = @cnsctvo_cdgo_dcmnto

	

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarComentariosDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarComentariosDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarComentariosDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarComentariosDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarComentariosDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarComentariosDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarComentariosDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarComentariosDocumento] TO [visosservice_role]
    AS [dbo];

