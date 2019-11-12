

/*---------------------------------------------------------------------------------
* Metodo o PRG 	            :  spGDConsultaIndicesXTipoDocumentos
* Desarrollado por		 	: <\A Ing. JORGE A. PARRA							A\>
* Descripcion			  	: <\D CONSULTA LOS INDICES QUE PERTENECEN EL UN TIPO DE DOCUMENTO				D\>
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
-- exec spGDConsultaIndicesXTipoDocumentos 1

CREATE PROCEDURE [dbo].[spGDConsultaIndicesXTipoDocumentos] 
	@cnsctvo_tpo_dcmntl	int	--udtConsecutivo

AS

SET NOCOUNT ON


BEGIN TRY

		--Actualizo la posicion de cada indice
		--obteniendo aquellos que son principales o comunes a cada aplicativo de SIACS
		select distinct	
				a.ordn_indce ,
				a.cnsctvo_cdgo_tpo_indce,
				a.cnsctvo_cdgo_tpo_dcmnto
		FROM	tbTiposIndicesxTiposDocumentos a
		WHERE a.agrpdr_cnslta = 1 --indica si es un indice principal
			  AND a.cnsctvo_cdgo_tpo_dcmnto  = @cnsctvo_tpo_dcmntl
		order by a.cnsctvo_cdgo_tpo_dcmnto, a.ordn_indce --b.ordn_insrcn asc

END TRY
BEGIN CATCH


	
END CATCH




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaIndicesXTipoDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaIndicesXTipoDocumentos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaIndicesXTipoDocumentos] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaIndicesXTipoDocumentos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaIndicesXTipoDocumentos] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaIndicesXTipoDocumentos] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaIndicesXTipoDocumentos] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaIndicesXTipoDocumentos] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaIndicesXTipoDocumentos] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaIndicesXTipoDocumentos] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaIndicesXTipoDocumentos] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaIndicesXTipoDocumentos] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaIndicesXTipoDocumentos] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaIndicesXTipoDocumentos] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaIndicesXTipoDocumentos] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaIndicesXTipoDocumentos] TO [visosservice_role]
    AS [dbo];

