CREATE TABLE [dbo].[tbImagenesxDocumentosDigitalizadosTest] (
    [cnsctvo_cdgo_imgn]     INT           NOT NULL,
    [cnsctvo_cdgo_dcmnto]   INT           NOT NULL,
    [cnsctvo_cdgo_tpo_imgn] INT           NOT NULL,
    [rta_imgn]              VARCHAR (250) NOT NULL,
    [prncpl]                CHAR (1)      NOT NULL,
    [estdo]                 CHAR (1)      CONSTRAINT [DF_tbImagenesxDocumentosDigitalizadosTest_estdo] DEFAULT ('A') NULL,
    [usro_crcn]             CHAR (30)     NULL,
    [fcha_crcn]             DATETIME      CONSTRAINT [DF_fcha_crcn_nueva_1] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_tbImagenesxDocumentosDigitalizadosTest] PRIMARY KEY NONCLUSTERED ([cnsctvo_cdgo_imgn] ASC)
);

