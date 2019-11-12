CREATE TABLE [dbo].[tmpDocDigitlizadosServiciosRecibidos] (
    [cnsctvo_sprte_slctds_rcbds] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_dcmnto]        BIGINT                 NULL,
    [cnsctvo_prcso_crga]         INT                    NOT NULL,
    [rta_dcmnto]                 VARCHAR (500)          NOT NULL,
    [rta_dcmnto_cmbnda]          VARCHAR (500)          NULL,
    CONSTRAINT [PK_tmpDocDigitlizadosServiciosRecibidos] PRIMARY KEY CLUSTERED ([cnsctvo_sprte_slctds_rcbds] ASC)
);

