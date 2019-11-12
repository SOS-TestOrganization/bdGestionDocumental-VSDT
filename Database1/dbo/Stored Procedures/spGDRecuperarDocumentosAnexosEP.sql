

create Procedure [dbo].[spGDRecuperarDocumentosAnexosEP]    
--Declare
@cnsctvo_dcmnto  Int  
    
As    
Set NoCount On    
    
    
--Set   @cnsctvo_dcmnto   = 797584004

    
   
Declare  @documentosanexos As Table
(    
	cnsctvo_cdgo_dcmnto	Int,
	rta_imgn			Varchar(150),
	vlr_nmro_ntfccn		Varchar(20),
	vlr_cdgo_ofcna		Varchar(3),
	cnsctvo_cdgo_imgn	Int,
	dscrpcn_tpo_imgn	Varchar(100),
	nmbre_dcmnto		Varchar(150)
)    
    
Insert Into	@documentosanexos
Select		cnsctvo_cdgo_dcmnto,   rta_imgn,     '',	'', cnsctvo_cdgo_imgn,	'', ''
From		tbImagenesxDocumentosDigitalizados
Where		cnsctvo_cdgo_dcmnto  = @cnsctvo_dcmnto
And		    estdo		=	'A'
  
Update		@documentosanexos
Set			vlr_nmro_ntfccn   = a.vlr
From		tbIndicesxDocumentosDigitalizados a,   @documentosanexos b
Where		a.cnsctvo_cdgo_dcmnto  = b.cnsctvo_cdgo_dcmnto
And			a.cnsctvo_cdgo_tpo_indce = 5

  
Update		@documentosanexos
Set			vlr_cdgo_ofcna   = a.vlr
From		tbIndicesxDocumentosDigitalizados a,   @documentosanexos b
Where		a.cnsctvo_cdgo_dcmnto  = b.cnsctvo_cdgo_dcmnto
And			a.cnsctvo_cdgo_tpo_indce = 21

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

    
Select		cnsctvo_cdgo_dcmnto,			rta_imgn,					vlr_nmro_ntfccn,
			vlr_cdgo_ofcna,					dscrpcn_tpo_imgn,	cnsctvo_cdgo_imgn,		nmbre_dcmnto
From		@documentosanexos

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosEP] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosEP] TO [Consultor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosEP] TO [Auxiliar Sipres Analista Notificaciones]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosEP] TO [Auxiliar de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosEP] TO [Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosEP] TO [Validador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosEP] TO [Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosEP] TO [Auditor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosEP] TO [Autorizadora Notificacion]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosEP] TO [Auditoria Interna Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosEP] TO [Auxiliar Prestaciones Medicas y Validacion de Derechos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosEP] TO [Administrador Notificaciones Atep SOA]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosEP] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosEP] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDocumentosAnexosEP] TO [visosservice_role]
    AS [dbo];

