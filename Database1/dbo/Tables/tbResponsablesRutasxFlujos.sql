CREATE TABLE [dbo].[tbResponsablesRutasxFlujos] (
    [cnsctvo_cdgo_rspnsble_rta_pr_fljo_dcmnto] [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cnsctvo_cdgo_rspnsble]                    [dbo].[udtConsecutivo] NULL,
    [cnsctvo_cdgo_prcso_admnstrtvo]            [dbo].[udtConsecutivo] NULL,
    [cnsctvo_cdgo_rta]                         [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_fljo]                        [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_rspnsble]                [dbo].[udtConsecutivo] NOT NULL,
    [fcha_crcn]                                DATETIME               NOT NULL,
    [usro_crcn]                                [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                               [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbResponsablesRutasxFlujos] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_rspnsble_rta_pr_fljo_dcmnto] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbResponsablesRutasxFlujos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbResponsablesRutasxFlujos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbResponsablesRutasxFlujos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResponsablesRutasxFlujos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbResponsablesRutasxFlujos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbResponsablesRutasxFlujos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbResponsablesRutasxFlujos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResponsablesRutasxFlujos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbResponsablesRutasxFlujos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResponsablesRutasxFlujos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResponsablesRutasxFlujos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResponsablesRutasxFlujos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResponsablesRutasxFlujos] TO [Unibase]
    AS [dbo];

