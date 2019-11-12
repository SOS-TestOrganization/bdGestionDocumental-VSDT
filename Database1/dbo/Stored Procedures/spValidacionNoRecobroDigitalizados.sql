
/*---------------------------------------------------------------------------------------------------------------------------                                         
* Procedimiento  :  dbo.spValidacionNoRecobroDigitalizados                                         
* Desarrollado por  : \A Ing. Darling Liliana Dorado   A\                                         
* Descripción  : \D valida indices  D\                                         
* Observaciones  : \O      O\                                         
* Parámetros  : \P  P\                                         
* Variables   : \V      V\                                         
* Fecha Creación : \FC 2009/10/30  FC\                                         
*                                         
*----------------------------------------------------------------------------------------------------------------------------                                         
* DATOS DE MODIFICACION                                          
*----------------------------------------------------------------------------------------------------------------------------                                         
* Modificado Por : \AM   AM\                                         
* Descripción  : \DM  DM\                                         
* Nuevos Parámetros : \PM  PM\                                         
* Nuevas Variables  : \VM  VM\                                         
* Fecha Modificación: \FM  FM\                                         
*----------------------------------------------------------------------------------------------------------------------------  
*/                                         
  
CREATE procedure [dbo].spValidacionNoRecobroDigitalizados
@cnsctvo_cdgo_prcso_crga_imgn INT    
    
as    
  
set nocount on  
  
/*  
select distinct cnsctvo_cdgo_prcso_crga_imgn    
from bdGestionDocumental.dbo.tbRegistrosArchivosIndices    
where estdo_vldcn is null  and cnsctvo_cdgo_tpo_dcmnto = 20 --no recobro

select * from dbo.tbTiposIndicesxTiposDocumentos where cnsctvo_cdgo_tpo_dcmnto = 20 

select * from dbo.tbTiposDocumento_Vigencias
*/  
  
-- indce1 tipo iden indce2 num iden indice 3 noti  
Update  bdGestionDocumental.dbo.tbRegistrosArchivosIndices    
Set   estdo_vldcn = case when b.cnsctvo_ntfccn is null then 1 else 0 end  
From    bdGestionDocumental.dbo.tbRegistrosArchivosIndices a  
left outer join  bdsisalud.dbo.tbactuanotificacion     c On cast(a.indce3 as int)=c.cnsctvo_ntfccn  
AND  cast(a.indce4 as int)=c.cnsctvo_cdgo_ofcna 
--And ltrim(rtrim(a.indce2))=ltrim(rtrim(c.nmro_idntfccn))  
--left outer join  bdafiliacion.dbo.tbTiposIdentificacion    e On e.cnsctvo_cdgo_tpo_idntfccn=c.cnsctvo_cdgo_tpo_idntfccn  
--And ltrim(rtrim(a.indce1))=ltrim(rtrim(e.cdgo_tpo_idntfccn))  
left outer join  bdsisalud.dbo.tbafiliadosmarcados     b On c.cnsctvo_ntfccn=b.cnsctvo_ntfccn  
And c.cnsctvo_cdgo_ofcna=b.cnsctvo_cdgo_ofcna AND b.cnsctvo_cdgo_clsfccn_evnto=12 
where    a.cnsctvo_cdgo_prcso_crga_imgn  = @cnsctvo_cdgo_prcso_crga_imgn  
And     a.cnsctvo_cdgo_tpo_dcmnto  = 19 --icp  
  
insert into  bdGestionDocumental.dbo.tbLogValidaciones  
    ( cnsctvo_cdgo_prcso_crga_imgn,  cnsctvo_cdgo_tpo_vldcn,          nmbre_archvo)  
select distinct  a.cnsctvo_cdgo_prcso_crga_imgn,  6 as cnsctvo_cdgo_tpo_vldcn, /*validación de facturas*/  a.nmbre_archvo  
from   bdGestionDocumental.dbo.tbRegistrosArchivosIndices a  
where   a.cnsctvo_cdgo_prcso_crga_imgn  = @cnsctvo_cdgo_prcso_crga_imgn AND a.estdo_vldcn = 1  
  
  
  

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionNoRecobroDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionNoRecobroDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionNoRecobroDigitalizados] TO [visosservice_role]
    AS [dbo];

