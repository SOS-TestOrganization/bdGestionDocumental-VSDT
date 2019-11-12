CREATE TABLE [dbo].[tbParametrosGeneralesxProceso] (
    [cnsctvo_cdgo_gnrl_prcso] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_gnrl_prcso]         [dbo].[udtConsecutivo] NOT NULL,
    [dscrpcn_gnrl_prcso]      VARCHAR (150)          NOT NULL,
    [fcha_crcn]               DATETIME               NOT NULL,
    [usro_crcn]               [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]              [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbParametrosGeneralesxProceso] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_gnrl_prcso] DESC) WITH (FILLFACTOR = 50)
);

