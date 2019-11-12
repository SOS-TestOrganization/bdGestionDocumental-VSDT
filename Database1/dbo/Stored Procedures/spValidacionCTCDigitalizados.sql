

/*---------------------------------------------------------------------------------------------------------------------------                                       
* Procedimiento		:  dbo.spValidacionCTCDigitalizados                                       
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
CREATE Procedure [dbo].[spValidacionCTCDigitalizados]
@cnsctvo_cdgo_prcso_crga_imgn Int

As  

Set Nocount On

Update	bdGestionDocumental.dbo.tbRegistrosArchivosIndices  
Set		estdo_vldcn = Case When b.cnsctvo_ntfccn Is Null Then 1 Else 0 End 
From	bdGestionDocumental.dbo.tbRegistrosArchivosIndices a 
Left Outer Join  bdsisalud.dbo.tbctcrecobro b On Cast(a.indce1 as int) = b.cnsctvo_ntfccn And Cast(a.indce2 as int)= b.cnsctvo_cdgo_ctc And Cast(a.indce3 as Int) = b.cnsctvo_cdgo_sde
Where	a.cnsctvo_cdgo_prcso_crga_imgn  = @cnsctvo_cdgo_prcso_crga_imgn
And		a.cnsctvo_cdgo_tpo_dcmnto		= 1 --CTC   

Insert 
Into	bdGestionDocumental.dbo.tbLogValidaciones  (cnsctvo_cdgo_prcso_crga_imgn,    cnsctvo_cdgo_tpo_vldcn,		nmbre_archvo)  
Select Distinct										a.cnsctvo_cdgo_prcso_crga_imgn,  3 as cnsctvo_cdgo_tpo_vldcn,	a.nmbre_archvo  
From	bdGestionDocumental.dbo.tbRegistrosArchivosIndices a 
Where	a.cnsctvo_cdgo_prcso_crga_imgn  = @cnsctvo_cdgo_prcso_crga_imgn 
And		a.estdo_vldcn					= 1  




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionCTCDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionCTCDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionCTCDigitalizados] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionCTCDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionCTCDigitalizados] TO [visosservice_role]
    AS [dbo];

