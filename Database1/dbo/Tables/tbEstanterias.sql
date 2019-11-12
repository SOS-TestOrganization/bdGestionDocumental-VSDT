CREATE TABLE [dbo].[tbEstanterias] (
    [cnsctvo_cdgo_estntra] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_estntra]         CHAR (4)               NOT NULL,
    [dscrpcn_estntra]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]            DATETIME               NOT NULL,
    [usro_crcn]            [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]           [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbEstanterias] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_estntra] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbEstanterias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstanterias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbEstanterias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstanterias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstanterias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbEstanterias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstanterias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstanterias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstanterias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstanterias] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstanterias] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstanterias] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstanterias] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstanterias] TO [Unibase]
    AS [dbo];

