
/*---------------------------------------------------------------------------------
* Metodo o PRG 	            :  spConsultaImagenesRecobrosFactura
* Desarrollado por		 	: <\A Ing. JORGE A. PARRA							A\>
* Descripcion			  	: <\D PERMITE CONSULTAR LAS IMAGENES DIGITALIZAS PARA SER VISUALIZADAS DESDE EL APLICATIVO DE RECOBROS				D\>
* Observaciones		        : <\O											O\>
* Parametros			  	: <\P @cnsctvo_rcbro , @cnsctvo_tpo_dcmntl											P\>
* Variables			  		: <\V  											V\>
* Fecha Creacion	          		: <\FC 2009/03/13									FC\>
*
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------
* Modificado Por				: <\AM  AM\>
* Descripcion				: <\DM 	DM\>
* Nuevos Parametros			: <\PM 	PM\>
* Nuevas Variables			: <\VM 	VM\>
* Fecha Modificacion			: <\FM 	FM\>
*---------------------------------------------------------------------------------*/
--spGDConsultaImagenesRecobrosFactura 184473, 2
CREATE PROCEDURE [dbo].[spGDConsultaImagenesRecobrosFactura]
--declare
	@cnsctvo_cdgo_rcbro  udtConsecutivo,
	@cnsctvo_cdgo_tpo_dcmntl udtConsecutivo 

AS

SET NOCOUNT ON



		SELECT		('\\ATLAS' + B.rta_imgn) as rta_imgn , C.dscrpcn_tpo_imgn as dscrpcn_tpo_imgn, 'NO SELECCIONADO' AS accn
		FROM		tbIndicesxDocumentosDigitalizados	A
		INNER JOIN	tbImagenesxDocumentosDigitalizados	B
		ON ( A.cnsctvo_cdgo_dcmnto = B.cnsctvo_cdgo_dcmnto)
		INNER JOIN  tbTiposImagenes C
		ON ( B.cnsctvo_cdgo_tpo_imgn = C.cnsctvo_cdgo_tpo_imgn )
		WHERE	cnsctvo_cdgo_tpo_indce	=	9  -- # NUMERO DE RECOBRO
		AND		cnsctvo_cdgo_tpo_dcmntl	=	@cnsctvo_cdgo_tpo_dcmntl
		AND		vlr						= @cnsctvo_cdgo_rcbro


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaImagenesRecobrosFactura] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaImagenesRecobrosFactura] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaImagenesRecobrosFactura] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaImagenesRecobrosFactura] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaImagenesRecobrosFactura] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaImagenesRecobrosFactura] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaImagenesRecobrosFactura] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaImagenesRecobrosFactura] TO [visosservice_role]
    AS [dbo];

