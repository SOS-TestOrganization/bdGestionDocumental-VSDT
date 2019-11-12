



/*---------------------------------------------------------------------------------------------------------------------------                                       
* Procedimiento		:  dbo.spValidacionTutelaDigitalizados                                       
* Desarrollado por  : \A Ing. Darling Liliana Dorado   A\                                       
* Descripción		: \D valida indices  D\                                       
* Observaciones		: \O      O\                                       
* Parámetros		: \P  P\                                       
* Variables			: \V      V\                                       
* Fecha Creación	: \FC 2009/07/10  FC\                                       
*                                       
*----------------------------------------------------------------------------------------------------------------------------                                       
* DATOS DE MODIFICACION                                        
*----------------------------------------------------------------------------------------------------------------------------                                       
* Modificado Por	: \AM   AM\                                       
* Descripción		: \DM  DM\                                       
* Nuevos Parámetros : \PM  PM\                                       
* Nuevas Variables  : \VM  VM\                                       
* Fecha Modificación: \FM  FM\                                       
*----------------------------------------------------------------------------------------------------------------------------
*/                                       

CREATE procedure [dbo].[spValidacionTutelaDigitalizados]
@cnsctvo_cdgo_prcso_crga_imgn INT  
  
as  

set nocount on

/*
select distinct cnsctvo_cdgo_prcso_crga_imgn  
into #cargas  
from bdGestionDocumental.dbo.tbRegistrosArchivosIndices  
where estdo_vldcn is null  and cnsctvo_cdgo_tpo_dcmnto = 3 --TUTELA  
*/

-- indce1 tipo iden indce2 num iden indice 3 noti
update bdGestionDocumental.dbo.tbRegistrosArchivosIndices  
set  estdo_vldcn = case when b.cnsctvo_ntfccn is null then 1 else 0 end 
--  select c.cnsctvo_cdgo_tpo_idntfccn,c.nmro_idntfccn,a.* 
from bdGestionDocumental.dbo.tbRegistrosArchivosIndices a 
left outer join  bdsisalud.dbo.tbactuanotificacion c ON cast(a.indce3 as int)=c.cnsctvo_ntfccn
AND ltrim(rtrim(a.indce2))=ltrim(rtrim(c.nmro_idntfccn))
left outer join  bdafiliacion.dbo.tbTiposIdentificacion e ON e.cnsctvo_cdgo_tpo_idntfccn=c.cnsctvo_cdgo_tpo_idntfccn
AND ltrim(rtrim(a.indce1))=ltrim(rtrim(e.cdgo_tpo_idntfccn))
left outer join  bdsisalud.dbo.tbafiliadosmarcados b ON c.cnsctvo_ntfccn=b.cnsctvo_ntfccn 
AND c.cnsctvo_cdgo_ofcna=b.cnsctvo_cdgo_ofcna AND b.cnsctvo_cdgo_clsfccn_evnto=8
--inner join #cargas d on a.cnsctvo_cdgo_prcso_crga_imgn = d.cnsctvo_cdgo_prcso_crga_imgn  
where a.cnsctvo_cdgo_prcso_crga_imgn  = @cnsctvo_cdgo_prcso_crga_imgn
AND a.cnsctvo_cdgo_tpo_dcmnto = 3 --TUTELA    

--b.cnsctvo_cdgo_clsfccn_evnto in (4,5)

insert into bdGestionDocumental.dbo.tbLogValidaciones  
  (cnsctvo_cdgo_prcso_crga_imgn,  
  cnsctvo_cdgo_tpo_vldcn,  
  nmbre_archvo)  
select distinct a.cnsctvo_cdgo_prcso_crga_imgn,  
2 as cnsctvo_cdgo_tpo_vldcn, -- validación de facturas  
a.nmbre_archvo  
from bdGestionDocumental.dbo.tbRegistrosArchivosIndices a 
--inner join #cargas b on a.cnsctvo_cdgo_prcso_crga_imgn = b.cnsctvo_cdgo_prcso_crga_imgn  
where a.cnsctvo_cdgo_prcso_crga_imgn  = @cnsctvo_cdgo_prcso_crga_imgn AND a.estdo_vldcn = 1  


--DROP TABLE #cargas  



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionTutelaDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionTutelaDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionTutelaDigitalizados] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionTutelaDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionTutelaDigitalizados] TO [visosservice_role]
    AS [dbo];

