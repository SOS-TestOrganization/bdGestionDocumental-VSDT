/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDBuscarCiudad
* Desarrollado por		 :  <\A   Julian Andres Mina Caicedo	A\>
* Descripcion			 :  <\D  						D\>
* Observaciones		     :  <\O							O\>
* Parametros			 :  <\P   						P\>
* Variables				 :  <\V							V\>
* Fecha Creacion		 :  <\FC 20090318     			FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM   AM\>
* Descripcion			 : <\DM   DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM   FM\>
*---------------------------------------------------------------------------------*/

--exec spGDBuscarCiudad 7360
CREATE Procedure [dbo].[spGDBuscarCiudad]
@lnConsecutivoCiudad			Int
As
Begin
	Set NoCount On
	
	Select	ciu.cnsctvo_cdgo_cdd,ciu.cdgo_cdd,ltrim(rtrim(ciu.dscrpcn_cdd)) as dscrpcn_cdd,
			dep.cnsctvo_cdgo_dprtmnto,ltrim(rtrim(dep.dscrpcn_dprtmnto)) as dscrpcn_dprtmnto
	From	bdAfiliacion.dbo.tbCiudades_Vigencias ciu,  
			bdAfiliacion.dbo.tbDepartamentos dep
	Where	ciu.cnsctvo_cdgo_dprtmnto = dep.cnsctvo_cdgo_dprtmnto
	and		cnsctvo_cdgo_cdd = @lnConsecutivoCiudad
End






GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDBuscarCiudad] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDBuscarCiudad] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDBuscarCiudad] TO [visosservice_role]
    AS [dbo];

