CREATE TABLE [dbo].[tbIndicesxDocumentosDigitalizados_om] (
    [cnsctvo_indce_dcmnto]    INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [cnsctvo_cdgo_dcmnto]     INT           NOT NULL,
    [cnsctvo_cdgo_tpo_dcmntl] INT           NOT NULL,
    [cnsctvo_cdgo_tpo_indce]  INT           NOT NULL,
    [vlr]                     VARCHAR (255) NOT NULL,
    CONSTRAINT [PK_tbIndicesxDocumentosDigitalizados] PRIMARY KEY CLUSTERED ([cnsctvo_indce_dcmnto] ASC)
);

