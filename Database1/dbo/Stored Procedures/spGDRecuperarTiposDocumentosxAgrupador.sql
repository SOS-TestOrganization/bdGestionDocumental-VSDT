/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDConsultaDocumentosNotificacion
* Desarrollado por		 :  <\A   Ing. Jorge Marcos Rincón Árdila	A\>
* Descripcion			 :  <\D		D\>
* Observaciones		     :  <\O		O\>
* Parametros			 :  <\P		P\>
* Variables				 :  <\V		V\>
* Fecha Creacion		 :  <\FC 19/03/2009	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM		AM\>
* Descripcion			 : <\DM		DM\>
* Nuevos Parametros	 	 : <\PM		PM\>
* Nuevas Variables		 : <\VM		VM\>
* Fecha Modificacion	 : <\FM		FM\>
*---------------------------------------------------------------------------------*/
CREATE PROCEDURE	[dbo].[spGDRecuperarTiposDocumentosxAgrupador]
/*1*/	@CodigoAgrupador		int		= Null
As
Set Nocount On

Select		dscrpcn_tpo_dcmnto,		cnsctvo_cdgo_tpo_dcmnto,		cdgo_tpo_dcmnto, 
			cnsctvo_agrpdr_tpo_dcmntl 
From		bdGestionDocumental.dbo.tbTiposDocumento_Vigencias
Where		(@CodigoAgrupador Is Null Or cnsctvo_agrpdr_tpo_dcmntl = @CodigoAgrupador) 
And			Getdate()	>=	inco_vgnca
And			Getdate()	<=	fn_vgnca


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumentosxAgrupador] TO [sisweb01]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumentosxAgrupador] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumentosxAgrupador] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumentosxAgrupador] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumentosxAgrupador] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumentosxAgrupador] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumentosxAgrupador] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumentosxAgrupador] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumentosxAgrupador] TO [respondews]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumentosxAgrupador] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumentosxAgrupador] TO [visosservice_role]
    AS [dbo];

