
/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDTraerCiudades
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
--exec spGDTraerCiudades 1
CREATE PROCEDURE [dbo].[spGDTraerCiudades]
/* 1 */		@consDepartamento		int
As
Set Nocount On

Select		cnsctvo_cdgo_cdd,		cdgo_cdd,		dscrpcn_cdd
From		bdAfiliacion.dbo.tbCiudades_Vigencias
Where		cnsctvo_cdgo_dprtmnto		= @consDepartamento
And			vsble_usro					= 'S'
Order by	dscrpcn_cdd


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerCiudades] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerCiudades] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerCiudades] TO [visosservice_role]
    AS [dbo];

