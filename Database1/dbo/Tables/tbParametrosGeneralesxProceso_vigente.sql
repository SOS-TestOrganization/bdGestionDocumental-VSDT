CREATE TABLE [dbo].[tbParametrosGeneralesxProceso_vigente] (
    [cnsctvo_vgnca_gnrl_prcso] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_gnrl_prcso]  [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_gnrl_prcso]          CHAR (3)               NOT NULL,
    [dscrpcn_gnrl_prcso]       VARCHAR (150)          NOT NULL,
    [inco_vgnca]               DATETIME               NOT NULL,
    [fn_vgnca]                 DATETIME               NOT NULL,
    [fcha_crcn]                DATETIME               NOT NULL,
    [usro_crcn]                [dbo].[udtUsuario]     NOT NULL,
    [obsrvcns]                 VARCHAR (150)          NOT NULL,
    [vsble_usro]               [dbo].[udtLogico]      NOT NULL,
    [cnsctvo_cdgo_prmtro_gnrl] INT                    NOT NULL,
    [cnsctvo_cdgo_tpo_prcso]   [dbo].[udtConsecutivo] NOT NULL,
    CONSTRAINT [PK_tbParametrosGeneralesxProceso_vigente] PRIMARY KEY CLUSTERED ([cnsctvo_vgnca_gnrl_prcso] DESC) WITH (FILLFACTOR = 50)
);

