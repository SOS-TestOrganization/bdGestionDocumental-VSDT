CREATE TABLE [dbo].[tbTiposErrorLog] (
    [cnsctvo_cdgo_tpo_errr] [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cdgo_tpo_errr]         CHAR (4)               NOT NULL,
    [dscrpcn_tpo_errr]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]             DATETIME               NOT NULL,
    [usro_crcn]             [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]            [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbTiposErrorLog] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_tpo_errr] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposErrorLog] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposErrorLog] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposErrorLog] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposErrorLog] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposErrorLog] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposErrorLog] TO [Unibase]
    AS [dbo];

