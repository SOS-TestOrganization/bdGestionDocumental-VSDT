


/*---------------------------------------------------------------------------------------------------------------------------                                         
* Procedimiento  :  dbo.spValidacionICPDigitalizados                                         
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
CREATE procedure [dbo].[spValidacionICPDigitalizados]
@cnsctvo_cdgo_prcso_crga_imgn Int
    
As
Set Nocount On
  
/*  
select distinct cnsctvo_cdgo_prcso_crga_imgn
from bdGestionDocumental.dbo.tbRegistrosArchivosIndices
where estdo_vldcn is null  and cnsctvo_cdgo_tpo_dcmnto = 19 --icp Seguimiento Incapacidad Continua Prolongada
select * from dbo.tbTiposIndicesxTiposDocumentos where cnsctvo_cdgo_tpo_dcmnto = 19
select * from dbo.tbTiposDocumento_Vigencias
*/


-- indce1 tipo iden indce2 num iden indice 3 noti  
Update			bdGestionDocumental.dbo.tbRegistrosArchivosIndices
Set				estdo_vldcn = Case When b.cnsctvo_ntfccn Is Null Then 1 Else 0 End
From			bdGestionDocumental.dbo.tbRegistrosArchivosIndices	a
Left Outer Join bdsisalud.dbo.tbactuanotificacion					c	On		Cast(a.indce3 As Int)			=	c.cnsctvo_ntfccn
																		And		Cast(a.indce4 as int)			=	c.cnsctvo_cdgo_ofcna
																		And		Ltrim(Rtrim(a.indce2))			=	Ltrim(Rtrim(c.nmro_idntfccn))
Left Outer Join  bdafiliacion.dbo.tbTiposIdentificacion				e	On		e.cnsctvo_cdgo_tpo_idntfccn		=	c.cnsctvo_cdgo_tpo_idntfccn
																		And		Ltrim(Rtrim(a.indce1))			=	Ltrim(Rtrim(e.cdgo_tpo_idntfccn))
Left Outer Join  bdsisalud.dbo.tbafiliadosmarcados					b	On		c.cnsctvo_ntfccn				=	b.cnsctvo_ntfccn
																		And		c.cnsctvo_cdgo_ofcna			=	b.cnsctvo_cdgo_ofcna
																		And		b.cnsctvo_cdgo_clsfccn_evnto	=	12
Where			a.cnsctvo_cdgo_prcso_crga_imgn  =	@cnsctvo_cdgo_prcso_crga_imgn
And				a.cnsctvo_cdgo_tpo_dcmnto		=	19 --icp
  

Insert Into		bdGestionDocumental.dbo.tbLogValidaciones  
				(	cnsctvo_cdgo_prcso_crga_imgn,		cnsctvo_cdgo_tpo_vldcn,          nmbre_archvo)
Select Distinct	a.cnsctvo_cdgo_prcso_crga_imgn,  5 As cnsctvo_cdgo_tpo_vldcn, /*validación de facturas*/  a.nmbre_archvo
From			bdGestionDocumental.dbo.tbRegistrosArchivosIndices a
Where			a.cnsctvo_cdgo_prcso_crga_imgn  = @cnsctvo_cdgo_prcso_crga_imgn And a.estdo_vldcn = 1
  
  
  



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionICPDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionICPDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionICPDigitalizados] TO [visosservice_role]
    AS [dbo];

