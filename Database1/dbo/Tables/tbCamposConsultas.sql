CREATE TABLE [dbo].[tbCamposConsultas] (
    [cnsctvo_cdgo_cmpo_cnslta] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_cmpo_cnslta]         CHAR (4)               NOT NULL,
    [dscrpcn_cmpo_cnslta]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]                DATETIME               NOT NULL,
    [usro_crcn]                [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]               [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbCamposConsultas] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_cmpo_cnslta] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCamposConsultas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCamposConsultas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbCamposConsultas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCamposConsultas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCamposConsultas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCamposConsultas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCamposConsultas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCamposConsultas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCamposConsultas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCamposConsultas] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCamposConsultas] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCamposConsultas] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCamposConsultas] TO [Unibase]
    AS [dbo];

