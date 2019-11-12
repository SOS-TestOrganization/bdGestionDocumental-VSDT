CREATE TABLE [dbo].[tmpICMDocumentosDigitalizados] (
    [cnsctvo_cdgo_dcmnto]     [dbo].[udtConsecutivo] NOT NULL,
    [nmro_imgns]              INT                    NOT NULL,
    [fcha_dgtlzcn]            DATETIME               NOT NULL,
    [cnsctvo_lte_imgns]       [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_dcmnto] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_prcso]           [dbo].[udtConsecutivo] NOT NULL,
    CONSTRAINT [PK_tmpICMDocumentosDigitalizados] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_dcmnto] ASC)
);

