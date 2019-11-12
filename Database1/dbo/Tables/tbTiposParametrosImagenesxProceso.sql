CREATE TABLE [dbo].[tbTiposParametrosImagenesxProceso] (
    [cnsctvo_cdgo_img_prcso] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_img_prcso]         CHAR (3)               NOT NULL,
    [dscrpcn_img_prcso]      VARCHAR (150)          NOT NULL,
    [fcha_crcn]              DATETIME               NOT NULL,
    [usro_crcn]              [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]             [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbTiposParametrosImagenesxProceso] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_img_prcso] DESC) WITH (FILLFACTOR = 50)
);

