CREATE TABLE [dbo].[tbTiposParametrosImagenesxProceso_vigente] (
    [cnsctvo_vgnca_img_prcso] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_img_prcso]  [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_img_prcso]          CHAR (3)               NOT NULL,
    [dscrpcn_img_prcso]       VARCHAR (150)          NOT NULL,
    [inco_vgnca]              DATETIME               NOT NULL,
    [fn_vgnca]                DATETIME               NOT NULL,
    [fcha_crcn]               DATETIME               NOT NULL,
    [usro_crcn]               [dbo].[udtUsuario]     NOT NULL,
    [obsrvcns]                VARCHAR (150)          NOT NULL,
    [vsble_usro]              [dbo].[udtLogico]      NOT NULL,
    [cnsctvo_cdgo_tpo_imgn]   [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_prcso]  [dbo].[udtConsecutivo] NOT NULL,
    CONSTRAINT [PK_tbTiposParametrosImagenesxProceso_vigente] PRIMARY KEY CLUSTERED ([cnsctvo_vgnca_img_prcso] DESC) WITH (FILLFACTOR = 50),
    CONSTRAINT [FK_tbTiposParametrosImagenesxProceso_vigente_tbtiposImagenes] FOREIGN KEY ([cnsctvo_cdgo_tpo_imgn]) REFERENCES [dbo].[tbTiposImagenes] ([cnsctvo_cdgo_tpo_imgn])
);

