CREATE TABLE [dbo].[tbCampoConsultaxCriterioConsultas_Vigencias] (
    [cnsctvo_vgnca_cdgo_cnslta_cmpo_crtro] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_cnslta_cmpo_crtro]       [dbo].[udtConsecutivo] NOT NULL,
    [inco_vgnca]                           DATETIME               NOT NULL,
    [fn_vgnca]                             DATETIME               NOT NULL,
    [fcha_crcn]                            DATETIME               NOT NULL,
    [usro_crcn]                            [dbo].[udtUsuario]     NOT NULL,
    [cnsctvo_cdgo_crtro_cnslta]            [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_cnslta_cmpo]             [dbo].[udtConsecutivo] NOT NULL,
    [ordn_cmps]                            TINYINT                NULL,
    [tme_stmp]                             ROWVERSION             NOT NULL,
    CONSTRAINT [PK_tbCampoConsultaxCriterioConsultas_Vigencias] PRIMARY KEY CLUSTERED ([cnsctvo_vgnca_cdgo_cnslta_cmpo_crtro] ASC),
    CONSTRAINT [CKFinicioVgncaMayor_InicioVigencia_tbCampoConsultaxCriterioConsultas_Vigencias] CHECK ([fn_vgnca]>=[inco_vgnca]),
    CONSTRAINT [FK_tbCampoConsultaxCriterioConsultas_Vigencias_tbCampoConsultaxCriterioConsultas] FOREIGN KEY ([cnsctvo_cdgo_cnslta_cmpo_crtro]) REFERENCES [dbo].[tbCampoConsultaxCriterioConsultas] ([cnsctvo_cdgo_cnslta_cmpo_crtro]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas_Vigencias] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas_Vigencias] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas_Vigencias] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas_Vigencias] TO [Unibase]
    AS [dbo];

