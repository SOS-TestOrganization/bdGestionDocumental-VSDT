CREATE TABLE [dbo].[tbCajas] (
    [cnsctvo_cdgo_cja] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_cja]         CHAR (4)               NOT NULL,
    [dscrpcn_cja]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]        DATETIME               NOT NULL,
    [usro_crcn]        [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]       [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbCajas] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_cja] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCajas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCajas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbCajas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCajas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCajas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCajas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCajas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCajas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCajas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCajas] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCajas] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCajas] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCajas] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCajas] TO [Unibase]
    AS [dbo];

