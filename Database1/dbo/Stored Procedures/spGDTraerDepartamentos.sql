
/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDTraerDepartamentos
* Desarrollado por		 :  <\A   Ing. Jorge Marcos Rincon Ardila		A\>
* Descripcion			 :  <\D  						D\>
* Observaciones		     :  <\O							O\>
* Parametros			 :  <\P   						P\>
* Variables				 :  <\V							V\>
* Fecha Creacion		 :  <\FC	18/03/2010	FC\>
*  
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM   AM\>
* Descripcion			 : <\DM   DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM   FM\>
*---------------------------------------------------------------------------------*/
--exec spGDTraerDepartamentos
CREATE PROCEDURE [dbo].[spGDTraerDepartamentos]
As
Begin
	Set Nocount On
	
	Select		cnsctvo_cdgo_dprtmnto,		cdgo_dprtmnto,		dscrpcn_dprtmnto
	From		bdAfiliacion.dbo.tbDepartamentos_Vigencias
	Where		vsble_usro					= 'S'
	Order by	dscrpcn_dprtmnto
	
End

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerDepartamentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerDepartamentos] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerDepartamentos] TO [visosservice_role]
    AS [dbo];

