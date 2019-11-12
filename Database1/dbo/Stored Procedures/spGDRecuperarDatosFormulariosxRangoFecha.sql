Create Procedure	spGDRecuperarDatosFormulariosxRangoFecha

As
Set NoCount On

Select		dscrpcn_tpo_frmlro,			nmro_frmlro,		fcha_rdccn,					fcha_dgtcn_rdccn,		cnsctvo_tpo_idntfccn_ctznte,			nmro_idntfccn_ctznte,
			cnsctvo_cdgo_tpo_frmlro,	usro_dgtdr,			cnsctvo_cdgo_otsrcng,		dscrpcn_prvdr,			usro_frmlro
From		bdGestionDocumental.dbo.tmpTemporalCruceFormulariosGD
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDatosFormulariosxRangoFecha] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDatosFormulariosxRangoFecha] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarDatosFormulariosxRangoFecha] TO [visosservice_role]
    AS [dbo];

