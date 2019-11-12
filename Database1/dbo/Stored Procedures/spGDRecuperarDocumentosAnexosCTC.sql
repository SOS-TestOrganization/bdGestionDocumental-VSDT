CREATE Procedure [dbo].[spGDRecuperarDocumentosAnexosCTC]    
--Declare
@cnsctvo_dcmnto  Int  
    
As    
Set NoCount On    
    
    
--Set   @cnsctvo_dcmnto   = 79987398

    
   
Declare  @documentosanexos As Table
(    
	cnsctvo_cdgo_dcmnto	Int,
	rta_imgn			Varchar(150),
	vlr_nmro_ntfccn		Varchar(20),
	vlr_nmro_acta		Varchar(20),
	vlr_cdgo_sde		Varchar(3),
	cnsctvo_cdgo_imgn	Int,
	dscrpcn_tpo_imgn	Varchar(50),
	nmbre_dcmnto		Varchar(150)
)    
    
Insert Into	@documentosanexos
Select		cnsctvo_cdgo_dcmnto,   rta_imgn,   '',   '',	'', cnsctvo_cdgo_imgn,	'', ''
From		tbImagenesxDocumentosDigitalizados
Where		cnsctvo_cdgo_dcmnto  = @cnsctvo_dcmnto
  
Update		@documentosanexos
Set			vlr_nmro_ntfccn   = a.vlr
From		tbIndicesxDocumentosDigitalizados a,   @documentosanexos b
Where		a.cnsctvo_cdgo_dcmnto  = b.cnsctvo_cdgo_dcmnto
And			a.cnsctvo_cdgo_tpo_indce = 5

Update		@documentosanexos
Set			vlr_nmro_acta   = a.vlr
From		tbIndicesxDocumentosDigitalizados a,   @documentosanexos b
Where		a.cnsctvo_cdgo_dcmnto  = b.cnsctvo_cdgo_dcmnto
And			a.cnsctvo_cdgo_tpo_indce = 8
  
Update		@documentosanexos
Set			vlr_cdgo_sde   = a.vlr
From		tbIndicesxDocumentosDigitalizados a,   @documentosanexos b
Where		a.cnsctvo_cdgo_dcmnto  = b.cnsctvo_cdgo_dcmnto
And			a.cnsctvo_cdgo_tpo_indce = 19

Update		@documentosanexos
Set			dscrpcn_tpo_imgn   = c.dscrpcn_tpo_imgn
From		tbImagenesxDocumentosDigitalizados a,   @documentosanexos b,	tbTiposImagenes	c
Where		a.cnsctvo_cdgo_dcmnto		= b.cnsctvo_cdgo_dcmnto
And			a.cnsctvo_cdgo_imgn			= b.cnsctvo_cdgo_imgn
And			a.cnsctvo_cdgo_tpo_imgn		= c.cnsctvo_cdgo_tpo_imgn

Update		@documentosanexos
Set			nmbre_dcmnto   =	b.vlr
From		@documentosanexos a,	tbIndicesxImagenesDigitalizadas	b
Where		a.cnsctvo_cdgo_dcmnto		= b.cnsctvo_cdgo_dcmnto
And			a.cnsctvo_cdgo_imgn			= b.cnsctvo_cdgo_imgn

    
Select		cnsctvo_cdgo_dcmnto,			rta_imgn,					vlr_nmro_ntfccn,				vlr_nmro_acta,
			vlr_cdgo_sde,					dscrpcn_tpo_imgn,			nmbre_dcmnto
From		@documentosanexos


---
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosCTC] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosCTC] TO [310009 Autorizadora Notificacion]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosCTC] TO [310007 Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosCTC] TO [310004 Consultor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosCTC] TO [310008 Auditor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosCTC] TO [Administrador Notificaciones Atep SOA]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosCTC] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosCTC] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosCTC] TO [visosservice_role]
    AS [dbo];

