
--select * from bdafiliacion.dbo.tboficinas where dscrpcn_ofcna like '%armenia%'
-- EXEC spGDConsultarDocumentosAnexosTutelas 529306,64,1
--EXEC spGDConsultarDocumentosAnexosTutelas         632848,29,1
CREATE Procedure [dbo].[spGDConsultarDocumentosAnexosTutelas]  
@cnsctvo_cdgo_ntfccn  Int,  
@cnsctvo_cdgo_ofcna   Int,  
@opcn_ejccn     Int  
  
As  
Set NoCount On  
  
  
Declare  @cdgo_ntfccn    Char(15),  
   @cdgo_ofcna     Char(3),  
   @cnsctvo_cdgo_tpo_dcmntl Int,
   @rta_srvdr			Varchar(150) 
  
  
Set   @cdgo_ntfccn    = Convert(Char(15),@cnsctvo_cdgo_ntfccn)  
Set   @cdgo_ofcna     = Convert(Char(3),@cnsctvo_cdgo_ofcna)  
Set   @cnsctvo_cdgo_tpo_dcmntl = 3    
set		@rta_srvdr	=	'\TUTELAS_ANEXOS\'
  
  
Declare  @documentosanexos As Table  
(  
 cnsctvo_cdgo_dcmnto  Int,  
 rta_imgn    Varchar(150),  
 nmbre_dcmnto   Varchar(150),  
 cnsctvo_cdgo_tpo_imgn Int,  
 cdgo_tpo_imgn   Varchar(10),  
 dscrpcn_tpo_imgn  Varchar(150),  
 cnsctvo_cdgo_imgn  Int,  
 accn     Varchar(50),  
 nmro_fllo    Varchar(50),  
 nmro_dscto    Varchar(50),  
 cnsctvo_tpo_dcmnto  Int,
 usro				varchar(30),
 nmbre_usro varchar(250)
)  
  
Declare @tmpdocumentos As Table  
(  
 cnsctvo_cdgo_dcmnto  Int  
)  

--2011-03-07 Darling Dorado el indice de notificacion y oficina se cambia a identificacion y oficina
--porque el consecutivo de oficina se graba mal
DECLARE @nmro_idntfccn VARCHAR(20)

Select @nmro_idntfccn=c.nmro_idntfccn 
From	bdsisalud.dbo.tbactuanotificacion c Inner Join  bdsisalud.dbo.tbafiliadosmarcados b 
		On	c.cnsctvo_ntfccn		= b.cnsctvo_ntfccn 
		And c.cnsctvo_cdgo_ofcna	= b.cnsctvo_cdgo_ofcna 
		And b.cnsctvo_cdgo_clsfccn_evnto=8
WHERE	c.cnsctvo_ntfccn		= @cdgo_ntfccn 
And		c.cnsctvo_cdgo_ofcna	= @cdgo_ofcna

  
Insert Into @tmpdocumentos  
Select  a.cnsctvo_cdgo_dcmnto  
From	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados a  
		Inner Join ( Select	b.cnsctvo_cdgo_dcmnto  
					 From	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados b  
					 Where  b.cnsctvo_cdgo_tpo_dcmntl	= @cnsctvo_cdgo_tpo_dcmntl  
					 And	b.cnsctvo_cdgo_tpo_indce	= 1--2011-03-07 21  
					 And	b.vlr						= @nmro_idntfccn--2011-03-07 @cdgo_ofcna  
					) As c 
		On c.cnsctvo_cdgo_dcmnto = a.cnsctvo_cdgo_dcmnto  
Where	a.cnsctvo_cdgo_tpo_dcmntl	= @cnsctvo_cdgo_tpo_dcmntl  
And		a.cnsctvo_cdgo_tpo_indce	= 5  
And		a.vlr						= @cdgo_ntfccn
Union
Select  a.cnsctvo_cdgo_dcmnto  
From	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados a  
		Inner Join ( Select  b.cnsctvo_cdgo_dcmnto  
					From  bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados b  
					Where  b.cnsctvo_cdgo_tpo_dcmntl  = @cnsctvo_cdgo_tpo_dcmntl  
					And   b.cnsctvo_cdgo_tpo_indce  = 21
					And   b.vlr       = @cdgo_ofcna  
				   ) As c 
		On c.cnsctvo_cdgo_dcmnto = a.cnsctvo_cdgo_dcmnto  
Where	a.cnsctvo_cdgo_tpo_dcmntl	= @cnsctvo_cdgo_tpo_dcmntl  
And		a.cnsctvo_cdgo_tpo_indce	= 5  
And		 a.vlr						= @cdgo_ntfccn
  
  
  
Insert Into  @documentosanexos  
Select Distinct 
	a.cnsctvo_cdgo_dcmnto,		c.rta_imgn,					'',  
    c.cnsctvo_cdgo_tpo_imgn,	'',							'',  
    c.cnsctvo_cdgo_imgn,		'NO SELECCIONADO' As accn,  Null,  
    Null,						0  , c.usro_crcn,''
From	@tmpdocumentos      a  Inner Join  tbIndicesxDocumentosDigitalizados b 
			On b.cnsctvo_cdgo_dcmnto = a.cnsctvo_cdgo_dcmnto  
		Inner Join  tbImagenesxDocumentosDigitalizados c 
			On a.cnsctvo_cdgo_dcmnto = c.cnsctvo_cdgo_dcmnto  
Where	IsNull(c.estdo,'')			!= 'I'
--And		PatIndex('%.TIF%',rta_imgn) != 0	-- Solo recupera los archivos .tif
  
  
Update   @documentosanexos  
Set    nmbre_dcmnto   = b.vlr  
From	@documentosanexos     a  Inner Join  tbIndicesxImagenesDigitalizadas  b 
			On	b.cnsctvo_cdgo_dcmnto	= a.cnsctvo_cdgo_dcmnto  
			And b.cnsctvo_cdgo_imgn		= a.cnsctvo_cdgo_imgn  
Where   b.cnsctvo_cdgo_tpo_indce = 22  
  
  
Update	@documentosanexos  
Set		cnsctvo_tpo_dcmnto  = b.vlr  
From	@documentosanexos     a  Inner Join  tbIndicesxImagenesDigitalizadas  b
			On	b.cnsctvo_cdgo_dcmnto	= a.cnsctvo_cdgo_dcmnto  
			And b.cnsctvo_cdgo_imgn		= a.cnsctvo_cdgo_imgn  
Where   b.cnsctvo_cdgo_tpo_indce = 37  
  
  
Update	@documentosanexos  
Set		nmro_fllo  = b.vlr  
From	@documentosanexos     a  Inner Join  tbIndicesxImagenesDigitalizadas  b 
			On	b.cnsctvo_cdgo_dcmnto	= a.cnsctvo_cdgo_dcmnto  
			And b.cnsctvo_cdgo_imgn		= a.cnsctvo_cdgo_imgn  
Where   b.cnsctvo_cdgo_tpo_indce = 38  
  
  
Update	@documentosanexos  
Set		nmro_dscto  = b.vlr  
From	@documentosanexos     a  Inner Join  tbIndicesxImagenesDigitalizadas  b 
			On	b.cnsctvo_cdgo_dcmnto	= a.cnsctvo_cdgo_dcmnto  
			And b.cnsctvo_cdgo_imgn		= a.cnsctvo_cdgo_imgn  
Where	b.cnsctvo_cdgo_tpo_indce = 36  
  
  
Update	@documentosanexos  
Set		dscrpcn_tpo_imgn = b.dscrpcn_tpo_imgn  
From	@documentosanexos   a  Inner Join  tbTiposImagenes_Vigencias b 
		On b.cnsctvo_cdgo_tpo_imgn  = a.cnsctvo_cdgo_tpo_imgn  

Update	@documentosanexos
set		rta_imgn = @rta_srvdr + rta_imgn
Where	rta_imgn Like '20%'
  
Update @documentosanexos
set nmbre_usro = ltrim(rtrim(d2.prmr_nmbre_usro)) + ' ' +ltrim(rtrim(isnull(sgndo_nmbre_usro,'') ))+ ' '+ltrim(rtrim(prmr_aplldo_usro))+ ' '+ltrim(rtrim(isnull(sgndo_aplldo_usro,'')))
from @documentosanexos d1 inner join bdSeguridad.dbo.tbUsuarios  d2
on d1.usro = d2.lgn_usro 

--se adiciona este ajuste ya que se identifco que en los documentos digitalizados de 2007
--no trae le nombre del documento (nmbre_dcmnto) en el visor de salud notificaciones tutelas (20130902 sisatv01)
update @documentosanexos
set nmbre_dcmnto=cnsctvo_cdgo_imgn
where ltrim(rtrim(isnull(nmbre_dcmnto,'')))=''

Select  accn,  rta_imgn,  dscrpcn_tpo_imgn,  nmbre_dcmnto , cnsctvo_cdgo_dcmnto, cnsctvo_cdgo_imgn,	nmbre_usro, usro
From @documentosanexos

/* 2011-03-07
If @opcn_ejccn = 1 -- Tutelas  
 Begin  
  Select   accn,  rta_imgn,  dscrpcn_tpo_imgn,  nmbre_dcmnto  
  From   @documentosanexos  
  Where   cnsctvo_tpo_dcmnto = @opcn_ejccn  
 End  
Else  
 If @opcn_ejccn = 2  
  Begin  
   -- Fallos  
   Select   accn,  rta_imgn,  dscrpcn_tpo_imgn,  nmbre_dcmnto,  nmro_fllo  
   From   @documentosanexos  
   Where   cnsctvo_tpo_dcmnto = @opcn_ejccn  
   Order By  nmro_fllo  
  End  
 Else  
  Begin  
   -- Desacatos  
   Select   accn,  rta_imgn,  dscrpcn_tpo_imgn,  nmbre_dcmnto,  nmro_dscto  
   From   @documentosanexos  
   Where   cnsctvo_tpo_dcmnto = @opcn_ejccn  
   Order By  nmro_dscto  
  End 
*/ 
  
  

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosAnexosTutelas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosAnexosTutelas] TO [310007 Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosAnexosTutelas] TO [Consultor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosAnexosTutelas] TO [Auxiliar Sipres Analista Notificaciones]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosAnexosTutelas] TO [Auxiliar de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosAnexosTutelas] TO [Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosAnexosTutelas] TO [Validador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosAnexosTutelas] TO [Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosAnexosTutelas] TO [Auditor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosAnexosTutelas] TO [Autorizadora Notificacion]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosAnexosTutelas] TO [Auditoria Interna Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosAnexosTutelas] TO [Auxiliar Prestaciones Medicas y Validacion de Derechos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosAnexosTutelas] TO [Administrador Notificaciones Atep SOA]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosAnexosTutelas] TO [Coordinador Juridico Notificaciones]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosAnexosTutelas] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosAnexosTutelas] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosAnexosTutelas] TO [visosservice_role]
    AS [dbo];

