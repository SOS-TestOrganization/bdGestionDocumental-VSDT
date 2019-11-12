
CREATE Procedure [dbo].[spGDConsultarUbicacionFisicaDocumento]
@cnsctvo_cdgo_dcmnto	Int

As
Set Nocount On

Select		b.dscrpcn_bdga,	e.dscrpcn_estntra,		en.dscrpcn_entrpno,		c.dscrpcn_cja,
			bo.dscrpcn_blsa
From		bdGestionDocumental.dbo.tbUbicacionDocumentosDigitalizados	u
Inner Join	bdGestionDocumental.dbo.tbBodegas							b		On	b.cnsctvo_cdgo_bdga		=	u.cnsctvo_cdgo_bdga
Inner Join	bdGestionDocumental.dbo.tbEstanterias						e		On	e.cnsctvo_cdgo_estntra	=	u.cnsctvo_cdgo_estntra
Inner Join	bdGestionDocumental.dbo.tbEntrepanos						en		On	en.cnsctvo_cdgo_entrpno	=	u.cnsctvo_cdgo_entrpno
Inner Join	bdGestionDocumental.dbo.tbCajas								c		On	c.cnsctvo_cdgo_cja		=	u.cnsctvo_cdgo_cja
Inner Join	bdGestionDocumental.dbo.tbBolsas							bo		On	bo.cnsctvo_cdgo_blsa	=	u.cnsctvo_cdgo_blsa
Where		cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarUbicacionFisicaDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarUbicacionFisicaDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarUbicacionFisicaDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarUbicacionFisicaDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarUbicacionFisicaDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarUbicacionFisicaDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarUbicacionFisicaDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarUbicacionFisicaDocumento] TO [visosservice_role]
    AS [dbo];

