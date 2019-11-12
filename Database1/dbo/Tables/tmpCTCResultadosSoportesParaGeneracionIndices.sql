CREATE TABLE [dbo].[tmpCTCResultadosSoportesParaGeneracionIndices] (
    [id]                     INT                    NULL,
    [cnsctvo_dcmnto]         [dbo].[udtConsecutivo] NULL,
    [cnsctvo_cdgo_tpo_indce] INT                    NULL,
    [vlr]                    [dbo].[udtConsecutivo] NULL,
    [hstrco]                 [dbo].[udtLogico]      DEFAULT ('N') NULL,
    [cnsctvo_cdgo_tpo_sprte] INT                    NULL
);

