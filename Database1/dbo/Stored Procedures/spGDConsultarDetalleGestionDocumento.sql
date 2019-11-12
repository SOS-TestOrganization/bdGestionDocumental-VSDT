


CREATE Procedure	[dbo].[spGDConsultarDetalleGestionDocumento]
@cnsctvo_cdgo_dcmnto		Int,
@nmro_idntfccn				Varchar(20)
As
Set Nocount On


Declare @tmpdetalledocumento As Table
(
cnsctvo_rgstro_gstn_dcmnto		Int,
cnsctvo_cdgo_dcmnto				Int,
dscrpcn_itrcn					Varchar(150),
usro_gstn						Varchar(30),
dscrpcn_gstn					Varchar(7500),
fcha_asgncn						Datetime,
fcha_inco_gstn					Datetime,
fcha_fn_gstn					Datetime,
cnsctvo_cdgo_tpo_gstn			Int,
cnsctvo_cdgo_fljo				Int,
cnsctvo_cdgo_estdo_dcmnto		Int
)

Insert Into		@tmpdetalledocumento
Select			rgd.cnsctvo_rgstro_gstn_dcmnto,			rgd.cnsctvo_cdgo_dcmnto,		'',
				rgd.usro_gstn,							rgd.dscrpcn_gstn,				rgd.fcha_asgncn,
				rgd.fcha_inco_gstn,						rgd.fcha_fn_gstn,				rgd.cnsctvo_cdgo_tpo_gstn,
				fd.cnsctvo_cdgo_fljo,					rgd.cnsctvo_cdgo_estdo_dcmnto
From			tbRegistrosGestionxDocumento	rgd
Inner Join		tbFlujosxDocumentos				fd		On	fd.cnsctvo_cdgo_dcmnto	=	rgd.cnsctvo_cdgo_dcmnto
Where			rgd.cnsctvo_cdgo_dcmnto			=	@cnsctvo_cdgo_dcmnto
And				fd.nmro_idntfccn_dcmnto			=	@nmro_idntfccn

Update			@tmpdetalledocumento
Set				dscrpcn_itrcn	=	iv.dscrpcn_itrcn
From			@tmpdetalledocumento				rgd
Inner Join		tbFlujosxDocumentos					fd		On	fd.cnsctvo_cdgo_dcmnto	=	rgd.cnsctvo_cdgo_dcmnto
Inner Join		tbIteracionesxFlujo					ifl		On	ifl.cnsctvo_cdgo_fljo	=	fd.cnsctvo_cdgo_fljo
Inner Join		tbIteraciones_Vigencias				iv		On	iv.cnsctvo_cdgo_itrcn	=	rgd.cnsctvo_cdgo_estdo_dcmnto

Update			@tmpdetalledocumento
Set				dscrpcn_itrcn	=	'Registro de gestión de documento'
Where			cnsctvo_cdgo_tpo_gstn = 4

Select			cnsctvo_cdgo_dcmnto,					cnsctvo_rgstro_gstn_dcmnto,				Ltrim(Rtrim(dscrpcn_itrcn)) As dscrpcn_itrcn,
				usro_gstn,								dscrpcn_gstn,							Convert(Char(20),fcha_asgncn,120) As fcha_asgncn,
				Convert(Char(20),fcha_inco_gstn,120) As fcha_inco_gstn,							Convert(Char(20),fcha_fn_gstn,120) As fcha_fn_gstn,
				cnsctvo_cdgo_tpo_gstn,					cnsctvo_cdgo_fljo,						cnsctvo_cdgo_estdo_dcmnto
From			@tmpdetalledocumento




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleGestionDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleGestionDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleGestionDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleGestionDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleGestionDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleGestionDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleGestionDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleGestionDocumento] TO [visosservice_role]
    AS [dbo];

