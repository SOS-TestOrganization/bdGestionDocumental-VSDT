CREATE TABLE [dbo].[tbSoportesSolicitudesRecibidas_Copy] (
    [cnsctvo_sprte_slctds_rcbds]    INT           NOT NULL,
    [cnsctvo_slctd_srvco_sld_rcbda] INT           NOT NULL,
    [rta_dcmnto]                    VARCHAR (500) NOT NULL,
    [cnsctvo_dcmnto]                INT           NULL,
    [cnsctvo_cdgo_tpo_sprte]        INT           NOT NULL,
    [nmbre_dto_sprte]               VARCHAR (200) NOT NULL,
    [fcha_crcn]                     DATETIME      NOT NULL,
    [usro_crcn]                     CHAR (30)     NOT NULL,
    [fcha_ultma_mdfccn]             DATETIME      NOT NULL,
    [usro_ultma_mdfccn]             CHAR (30)     NOT NULL,
    [dscrpcn_tpo_sprte]             VARCHAR (150) NULL,
    [url_dcmnto]                    VARCHAR (500) NULL,
    [usro_ultma_dscrga]             CHAR (30)     NULL,
    [fcha_ultma_dscrga]             DATETIME      NULL,
    [cnsctvo_sprte_slctd_orgn]      INT           NULL,
    [ruta_correcta]                 VARCHAR (500) NULL
);

