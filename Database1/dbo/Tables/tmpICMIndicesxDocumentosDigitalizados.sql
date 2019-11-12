CREATE TABLE [dbo].[tmpICMIndicesxDocumentosDigitalizados] (
    [cnsctvo_indce_dcmnto]   [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_dcmnto]    [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_indce] [dbo].[udtConsecutivo] NOT NULL,
    [vlr]                    VARCHAR (255)          NOT NULL,
    CONSTRAINT [PK_tmpICMIndicesxDocumentosDigitalizados] PRIMARY KEY CLUSTERED ([cnsctvo_indce_dcmnto] ASC),
    CONSTRAINT [FK_tbIndicesxDocumentosDigitalizados_tbDocumentosDigitalizados] FOREIGN KEY ([cnsctvo_cdgo_dcmnto]) REFERENCES [dbo].[tmpICMDocumentosDigitalizados] ([cnsctvo_cdgo_dcmnto])
);

