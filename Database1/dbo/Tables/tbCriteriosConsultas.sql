CREATE TABLE [dbo].[tbCriteriosConsultas] (
    [cnsctvo_cdgo_crtro_cnslta] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_crtro_cnslta]         CHAR (4)               NOT NULL,
    [dscrpcn_crtro_cnslta]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]                 DATETIME               NOT NULL,
    [usro_crcn]                 [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbCriteriosConsultas] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_crtro_cnslta] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCriteriosConsultas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCriteriosConsultas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbCriteriosConsultas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCriteriosConsultas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCriteriosConsultas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCriteriosConsultas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCriteriosConsultas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultas] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultas] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultas] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultas] TO [Unibase]
    AS [dbo];

