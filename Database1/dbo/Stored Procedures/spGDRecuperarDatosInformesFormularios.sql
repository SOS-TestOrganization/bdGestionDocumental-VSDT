Create Procedure	spGDRecuperarDatosInformesFormularios

As
Set Nocount On

Select		cnsctvo_cdgo_dcmnto,			dscrpcn_tpo_frmlro,			nmro_frmlro,					dscrpcn_tpo_frmlro_gd,			ttl_imgns,
			nmro_blsa,						fcha_rdccn,					fcha_dgtcn_rdccn,				cnsctvo_tpo_idntfccn_ctznte,	nmro_idntfccn_ctznte,
			fcha_crga,						fcha_dgtlzcn,				cnsctvo_cdgo_prcso_crga_imgn,	prvdr,							frmlro_afldo,
			cnsctvo_cdgo_tpo_frmlro,		nmro_idntfccn_ctznte_gd,	dscrpcn_prvdr,					usro_dgtdr,						frmlro_exstnte
From		bdGestionDocumental.dbo.tbDatosFinalesConsultaFormularios
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDatosInformesFormularios] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDatosInformesFormularios] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDatosInformesFormularios] TO [visosservice_role]
    AS [dbo];

