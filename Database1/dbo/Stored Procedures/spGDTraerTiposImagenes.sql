/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDConsultaDocumentosAfiliacion
* Desarrollado por		 :  <\A   Ing. Jorge Marcos Rincon Ardila		A\>
* Descripcion			 :  <\D  						D\>
* Observaciones		     :  <\O							O\>
* Parametros			 :  <\P   						P\>
* Variables				 :  <\V							V\>
* Fecha Creacion		 :  <\FC	05/03/2010	FC\>
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
--exec spGDTraerTiposImagenes
CREATE PROCEDURE [dbo].[spGDTraerTiposImagenes]
As
Begin
	Set Nocount On
	
	Select		ti.cnsctvo_cdgo_tpo_imgn,	ti.cdgo_tpo_imgn,	ti.dscrpcn_tpo_imgn
	From		dbo.tbTiposImagenesxTiposDocumento titd 
	Inner Join dbo.tbTiposImagenes ti On (titd.cnsctvo_cdgo_tpo_imgn = ti.cnsctvo_cdgo_tpo_imgn)
	Where	ti.vsble_usro = 'S'
	And		titd.cnsctvo_cdgo_tpo_dcmnto = 4 --FORMULARIO
	Order by	ti.dscrpcn_tpo_imgn

End




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerTiposImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerTiposImagenes] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerTiposImagenes] TO [visosservice_role]
    AS [dbo];

