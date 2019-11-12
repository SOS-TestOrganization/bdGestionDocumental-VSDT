
/*---------------------------------------------------------------------------------
* Metodo o PRG 	            :  spGDConsultaVisorImagenes
* Desarrollado por		 	: <\A Ing. JORGE A. PARRA							A\>
* Descripcion			  	: <\D PERMITE CONSULTAR LAS IMAGENES DIGITALIZAS PARA SER VISUALIZADAS DESDE EL APLICATIVO DE RECOBROS				D\>
* Observaciones		        : <\O											O\>
* Parametros			  	: <\P @mensaje											P\>
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
CREATE PROCEDURE [dbo].[spGDConsultaVisorImagenes]
	@msnje varchar(150) output

AS

SET NOCOUNT ON


create table #tmpIndicesXTipoDocumento
(
	cnsctvo_vlr				udtConsecutivo identity(1,1) ,
	ordn_indce				udtConsecutivo,
	cnsctvo_cdgo_tpo_indce	udtConsecutivo,
	cnsctvo_cdgo_tpo_dcmnto	udtConsecutivo
)

BEGIN TRY

		--Actualizo la posicion de cada indice
		--obteniendo aquellos que son principales o comunes a cada aplicativo de SIACS
		insert into #tmpIndicesXTipoDocumento
		(		ordn_indce,
				cnsctvo_cdgo_tpo_indce,
				cnsctvo_cdgo_tpo_dcmnto)			
		select distinct	
				a.ordn_indce ,
				a.cnsctvo_cdgo_tpo_indce,
				a.cnsctvo_cdgo_tpo_dcmnto
		FROM tbTiposIndicesxTiposDocumentos a
		INNER JOIN #tmpValoresIndices b
		ON( a.cnsctvo_cdgo_tpo_dcmnto = b.cnsctvo_tpo_dcmntl)
		WHERE a.agrpdr_cnslta = 1 --indica si es un indice principal
		ORDER BY a.cnsctvo_cdgo_tpo_dcmnto desc



		UPDATE #tmpValoresIndices
		SET ordn_indce		=	a.ordn_indce,
			cnsctvo_indce	=	a.cnsctvo_cdgo_tpo_indce
		From #tmpIndicesXTipoDocumento a
		inner join #tmpValoresIndices b
		On( a.cnsctvo_vlr = b.cnsctvo_vlr)



		select distinct 'NO SELECCIONADO' AS accn, ('\\ATLAS' + B.rta_imgn) as rta_imgn, C.dscrpcn_tpo_imgn
		FROM	#tmpValoresIndices	X
		INNER JOIN tbIndicesxDocumentosDigitalizados	A
		ON(	X.cnsctvo_indce			= A.cnsctvo_cdgo_tpo_indce	AND 
			ltrim(rtrim(X.vlr))		= ltrim(rtrim(A.vlr))		AND
			X.cnsctvo_tpo_dcmntl	= A.cnsctvo_cdgo_tpo_dcmntl  )
		INNER JOIN	tbImagenesxDocumentosDigitalizados	B
		ON ( A.cnsctvo_cdgo_dcmnto = B.cnsctvo_cdgo_dcmnto)
		INNER JOIN  tbTiposImagenes C
		ON ( B.cnsctvo_cdgo_tpo_imgn = C.cnsctvo_cdgo_tpo_imgn )
		ORDER BY C.dscrpcn_tpo_imgn

		DROP TABLE #tmpIndicesXTipoDocumento

END TRY
BEGIN CATCH

	set @msnje = 'Se presento un error consultando las Imagenes para el Visor.'
	DROP TABLE #tmpIndicesXTipoDocumento
	
END CATCH



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes] TO [380003 Auditor Interno Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes] TO [Auditor Interno Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes] TO [visosservice_role]
    AS [dbo];

