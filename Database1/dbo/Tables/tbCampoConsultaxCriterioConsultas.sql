CREATE TABLE [dbo].[tbCampoConsultaxCriterioConsultas] (
    [cnsctvo_cdgo_cnslta_cmpo_crtro] [dbo].[udtConsecutivo] NOT NULL,
    [fcha_crcn]                      DATETIME               NOT NULL,
    [usro_crcn]                      [dbo].[udtUsuario]     NOT NULL,
    [cnsctvo_cdgo_crtro_cnslta]      [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_cnslta_cmpo]       [dbo].[udtConsecutivo] NOT NULL,
    CONSTRAINT [PK_tbCampoConsultaxCriterioConsultas] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_cnslta_cmpo_crtro] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampoConsultaxCriterioConsultas] TO [Unibase]
    AS [dbo];

