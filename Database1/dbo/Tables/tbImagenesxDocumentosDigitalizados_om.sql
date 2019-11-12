CREATE TABLE [dbo].[tbImagenesxDocumentosDigitalizados_om] (
    [cnsctvo_cdgo_imgn]     INT                NOT NULL,
    [cnsctvo_cdgo_dcmnto]   INT                NOT NULL,
    [cnsctvo_cdgo_tpo_imgn] INT                NOT NULL,
    [rta_imgn]              VARCHAR (250)      NOT NULL,
    [prncpl]                CHAR (1)           NOT NULL,
    [estdo]                 CHAR (1)           CONSTRAINT [DF_tbImagenesxDocumentosDigitalizados_estdo_1] DEFAULT ('A') NULL,
    [usro_crcn]             [dbo].[udtUsuario] NULL,
    [fcha_crcn]             DATETIME           NULL,
    CONSTRAINT [PK_tbImagenesxDocumentosDigitalizados] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_imgn] ASC)
);

