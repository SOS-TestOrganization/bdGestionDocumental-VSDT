CREATE TABLE [dbo].[tmpICMIndicesxImagenesDigitalizadas] (
    [cnsctvo_indce_imgn_dgtlzda] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_imgn]          [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_indce]     [dbo].[udtConsecutivo] NOT NULL,
    [vlr]                        VARCHAR (255)          NOT NULL,
    CONSTRAINT [PK_tmpICMIndicesxImagenesDigitalizadas] PRIMARY KEY CLUSTERED ([cnsctvo_indce_imgn_dgtlzda] ASC),
    CONSTRAINT [FK_tbIndicesxImagenesDigitalizadas_tbImagenesxDocumentosDigitalizados] FOREIGN KEY ([cnsctvo_cdgo_imgn]) REFERENCES [dbo].[tmpICMImagenesxDocumentosDigitalizados] ([cnsctvo_cdgo_imgn])
);

