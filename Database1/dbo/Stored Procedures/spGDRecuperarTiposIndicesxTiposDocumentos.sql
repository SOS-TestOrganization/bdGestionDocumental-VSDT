CREATE Procedure	spGDRecuperarTiposIndicesxTiposDocumentos
@cnsctvo_cdgo_tpo_dcmnto	udtConsecutivo

As
Set Nocount On


Declare	@tbtiposindicesxtiposdocumentos As Table
(
dscrpcn_tpo_indce		Varchar(150),
vlr						Varchar(250),
cdgo_indce				Char(4),
cnsctvo_cdgo_tpo_indce	Int,
tpo_dato				Char(1),
tmno					Int
)

Insert Into		@tbtiposindicesxtiposdocumentos
Select			t.dscrpcn_tpo_indce,		'',			t.cdgo_indce,		t.cnsctvo_cdgo_tpo_indce,
				t.tpo_dato,					t.tmno
From			dbo.tbTiposIndices	t
Inner Join		dbo.tbTiposIndicesxTiposDocumentos	o	On	o.cnsctvo_cdgo_tpo_indce	=	t.cnsctvo_cdgo_tpo_indce
Where			o.cnsctvo_cdgo_tpo_dcmnto	=	@cnsctvo_cdgo_tpo_dcmnto


Select			*
From			@tbtiposindicesxtiposdocumentos
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIndicesxTiposDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIndicesxTiposDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIndicesxTiposDocumentos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIndicesxTiposDocumentos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIndicesxTiposDocumentos] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIndicesxTiposDocumentos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIndicesxTiposDocumentos] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIndicesxTiposDocumentos] TO [visosservice_role]
    AS [dbo];

