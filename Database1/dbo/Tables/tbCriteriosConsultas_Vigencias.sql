CREATE TABLE [dbo].[tbCriteriosConsultas_Vigencias] (
    [cnsctvo_vgnca_crtro_cnslta] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_crtro_cnslta]  [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_crtro_cnslta]          CHAR (4)               NOT NULL,
    [dscrpcn_crtro_cnslta]       [dbo].[udtDescripcion] NOT NULL,
    [inco_vgnca]                 DATETIME               NOT NULL,
    [fn_vgnca]                   DATETIME               NOT NULL,
    [fcha_crcn]                  DATETIME               NOT NULL,
    [usro_crcn]                  [dbo].[udtUsuario]     NOT NULL,
    [obsrvcns]                   [dbo].[udtObservacion] NOT NULL,
    [vsble_usro]                 [dbo].[udtLogico]      NOT NULL,
    [tme_stmp]                   ROWVERSION             NOT NULL,
    CONSTRAINT [PK_tbCriteriosConsultas_Vigencias] PRIMARY KEY CLUSTERED ([cnsctvo_vgnca_crtro_cnslta] ASC),
    CONSTRAINT [CKFinicioVgncaMayor_InicioVigencia_tbCriteriosConsultas_Vigencias] CHECK ([fn_vgnca]>=[inco_vgnca]),
    CONSTRAINT [FK_tbCriteriosConsultas_Vigencias_tbCriteriosConsultas] FOREIGN KEY ([cnsctvo_cdgo_crtro_cnslta]) REFERENCES [dbo].[tbCriteriosConsultas] ([cnsctvo_cdgo_crtro_cnslta]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCriteriosConsultas_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCriteriosConsultas_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbCriteriosConsultas_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultas_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCriteriosConsultas_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCriteriosConsultas_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCriteriosConsultas_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultas_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCriteriosConsultas_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultas_Vigencias] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultas_Vigencias] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultas_Vigencias] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultas_Vigencias] TO [Unibase]
    AS [dbo];

