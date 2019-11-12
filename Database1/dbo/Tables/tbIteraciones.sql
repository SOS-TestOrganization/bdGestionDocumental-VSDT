CREATE TABLE [dbo].[tbIteraciones] (
    [cnsctvo_cdgo_itrcn] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_itrcn]         CHAR (4)               NOT NULL,
    [dscrpcn_itrcn]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]          DATETIME               NOT NULL,
    [usro_crcn]          [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]         [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbIteraciones] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_itrcn] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIteraciones] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIteraciones] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbIteraciones] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteraciones] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIteraciones] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIteraciones] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIteraciones] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteraciones] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIteraciones] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteraciones] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteraciones] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteraciones] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteraciones] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteraciones] TO [Unibase]
    AS [dbo];

