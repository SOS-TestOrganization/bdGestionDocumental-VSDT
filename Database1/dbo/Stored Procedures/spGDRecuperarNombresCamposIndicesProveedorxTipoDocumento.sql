/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDRecuperarNombresCamposIndicesProveedorxTipoDocumento
* Desarrollado por		 :  <\A		Ing. Cesar García																		A\>
* Descripcion			 :  <\D		Recupera los nombres de los campos del archivo plano de acuerdo al tipo de documento	D\>
* Observaciones		     :  <\O																								O\>
* Parametros			 :  <\P		@cnsctvo_cdgo_tpo_dcmnto	udtConsecutivo  											P\>
* Variables				 :  <\V																								V\>
* Fecha Creacion		 :  <\FC 20110328     																				FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM   AM\>
* Descripcion			 : <\DM   DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM   FM\>
*---------------------------------------------------------------------------------*/
CREATE Procedure	spGDRecuperarNombresCamposIndicesProveedorxTipoDocumento
@cnsctvo_cdgo_tpo_dcmnto	udtConsecutivo

As
Set NoCount On

Select		a.cnsctvo_cdgo_nmbre_cmpo_indce_prvdr,		a.cdgo_nmbre_cmpo_indce_prvdr,		a.dscrpcn_nmbre_cmpo_indce_prvdr
From		dbo.tbNombresCamposIndicesProveedor_Vigencias		a
Inner Join	dbo.tbNombresCamposIndicesProveedorxTipoDocumento	b	On	b.cnsctvo_cdgo_nmbre_cmpo_indce_prvdr	=	a.cnsctvo_cdgo_nmbre_cmpo_indce_prvdr
Where		cnsctvo_cdgo_tpo_dcmnto	=	@cnsctvo_cdgo_tpo_dcmnto
Order By	b.ordn_archvo

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarNombresCamposIndicesProveedorxTipoDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarNombresCamposIndicesProveedorxTipoDocumento] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];

