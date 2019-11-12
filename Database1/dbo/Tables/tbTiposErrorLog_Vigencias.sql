CREATE TABLE [dbo].[tbTiposErrorLog_Vigencias] (
    [cnsctvo_vgnca_cdgo_tpo_errr] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_errr]       [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_tpo_errr]               CHAR (3)               NOT NULL,
    [dscrpcn_tpo_errr]            [dbo].[udtDescripcion] NOT NULL,
    [inco_vgnca]                  DATETIME               NOT NULL,
    [fn_vgnca]                    DATETIME               NOT NULL,
    [fcha_crcn]                   DATETIME               NOT NULL,
    [usro_crcn]                   [dbo].[udtUsuario]     NOT NULL,
    [obsrvcns]                    [dbo].[udtObservacion] NULL,
    [vsble_usro]                  [dbo].[udtLogico]      NOT NULL,
    [tme_stmp]                    ROWVERSION             NOT NULL,
    CONSTRAINT [PK_tbTiposErrorLog_Vigencias] PRIMARY KEY CLUSTERED ([cnsctvo_vgnca_cdgo_tpo_errr] ASC),
    CONSTRAINT [FK1_tbTiposErrorLog_Vigencias_tbTiposErrorLog] FOREIGN KEY ([cnsctvo_cdgo_tpo_errr]) REFERENCES [dbo].[tbTiposErrorLog] ([cnsctvo_cdgo_tpo_errr]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposErrorLog_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposErrorLog_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposErrorLog_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposErrorLog_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposErrorLog_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposErrorLog_Vigencias] TO [Unibase]
    AS [dbo];

