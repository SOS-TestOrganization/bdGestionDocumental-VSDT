CREATE TABLE [dbo].[tbIndicesxImagenesDigitalizadas_om] (
    [cnsctvo_indce_imgn_dgtlzda] INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [cnsctvo_cdgo_imgn]          INT           NOT NULL,
    [cnsctvo_cdgo_dcmnto]        INT           NOT NULL,
    [cnsctvo_cdgo_tpo_dcmntl]    INT           NOT NULL,
    [cnsctvo_cdgo_tpo_indce]     INT           NOT NULL,
    [vlr]                        VARCHAR (255) NOT NULL,
    CONSTRAINT [PK_tbIndicesxImagenesDigitalizadas] PRIMARY KEY CLUSTERED ([cnsctvo_indce_imgn_dgtlzda] ASC)
);

