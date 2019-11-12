CREATE TABLE [dbo].[tmp2doc] (
    [cnsctvo_cdgo_dcmnto]     BIGINT        NOT NULL,
    [cnsctvo_cdgo_tpo_dcmntl] INT           NOT NULL,
    [nmro_imgns]              INT           NOT NULL,
    [cnsctvo_cdgo_dgtlzdr]    INT           NOT NULL,
    [fcha_dgtlzcn]            DATETIME2 (3) NOT NULL,
    [cnsctvo_prcso_crga]      INT           NULL,
    [estdo_rgstro]            CHAR (1)      NULL
);

