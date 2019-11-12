CREATE TABLE [dbo].[tmpICMImagenesxDocumentosDigitalizados] (
    [cnsctvo_cdgo_imgn]     [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_dcmnto]   [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_imgn] [dbo].[udtConsecutivo] NOT NULL,
    [rta_imgn]              VARCHAR (250)          NOT NULL,
    [prncpl]                [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tmpICMImagenesxDocumentosDigitalizados] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_imgn] ASC),
    CONSTRAINT [FK_tbImagenesxDocumentosDigitalizados_tbDocumentosDigitalizados] FOREIGN KEY ([cnsctvo_cdgo_dcmnto]) REFERENCES [dbo].[tmpICMDocumentosDigitalizados] ([cnsctvo_cdgo_dcmnto])
);

