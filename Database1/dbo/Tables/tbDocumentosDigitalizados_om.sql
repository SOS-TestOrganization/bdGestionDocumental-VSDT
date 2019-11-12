CREATE TABLE [dbo].[tbDocumentosDigitalizados_om] (
    [cnsctvo_cdgo_dcmnto]     BIGINT   NOT NULL,
    [cnsctvo_cdgo_tpo_dcmntl] INT      NOT NULL,
    [nmro_imgns]              INT      NOT NULL,
    [cnsctvo_cdgo_dgtlzdr]    INT      NOT NULL,
    [fcha_dgtlzcn]            DATETIME NOT NULL,
    [cnsctvo_prcso_crga]      INT      NULL,
    [estdo_rgstro]            CHAR (1) NULL,
    CONSTRAINT [PK_tbDocumentosDigitalizados1] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_dcmnto] ASC)
);

