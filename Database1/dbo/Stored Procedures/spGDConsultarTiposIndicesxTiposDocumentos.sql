-- =============================================
-- Author:		<sisogb01>
-- Create date: <16/03/2009>
-- Description:	<Procedimiento que consulta las columna Indice que aplican para cada tipo de Documento>
-- =============================================
CREATE Procedure[dbo].[spGDConsultarTiposIndicesxTiposDocumentos] 
(
	@cnsctvo_cdgo_tpo_dcmnto udtConsecutivo,
	@agrpdr udtLogico = Null
)
As
Set Nocount On

Select		ttd.cnsctvo_cdgo_tpo_indce_pr_tpo_dcmnto,	ttd.nmbre, ttd.pscn, ttd.agrpdr,	ti.cnsctvo_cdgo_tpo_indce,
			ti.tpo_dato,								ti.tmno
From		dbo.tbTiposIndicesxTiposDocumentos	ttd
Inner Join	dbo.tbTiposIndices					ti	On	ti.cnsctvo_cdgo_tpo_indce	=	ttd.cnsctvo_cdgo_tpo_indce
--Inner Join	bdserviciocliente.dbo.tbusuariosresponde_vigencias	ur	On	ur.cnsctvo_cdgo_usro_rspnde	=	re.cnsctvo_cdgo_rspnsble
Where		(@agrpdr Is Null	Or		@agrpdr = ttd.agrpdr)
And			ttd.cnsctvo_cdgo_tpo_dcmnto = @cnsctvo_cdgo_tpo_dcmnto

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarTiposIndicesxTiposDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarTiposIndicesxTiposDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarTiposIndicesxTiposDocumentos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarTiposIndicesxTiposDocumentos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarTiposIndicesxTiposDocumentos] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarTiposIndicesxTiposDocumentos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarTiposIndicesxTiposDocumentos] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarTiposIndicesxTiposDocumentos] TO [visosservice_role]
    AS [dbo];

