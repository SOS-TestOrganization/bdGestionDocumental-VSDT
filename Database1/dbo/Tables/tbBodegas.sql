CREATE TABLE [dbo].[tbBodegas] (
    [cnsctvo_cdgo_bdga] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_bdga]         CHAR (4)               NOT NULL,
    [dscrpcn_bdga]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]         DATETIME               NOT NULL,
    [usro_crcn]         [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]        [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbBodegas] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_bdga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbBodegas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbBodegas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbBodegas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbBodegas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbBodegas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbBodegas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbBodegas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbBodegas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbBodegas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbBodegas] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbBodegas] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbBodegas] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbBodegas] TO [Unibase]
    AS [dbo];

