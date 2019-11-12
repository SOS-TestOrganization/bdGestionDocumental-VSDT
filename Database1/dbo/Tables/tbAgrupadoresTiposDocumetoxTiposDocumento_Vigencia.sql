CREATE TABLE [dbo].[tbAgrupadoresTiposDocumetoxTiposDocumento_Vigencia] (
    [cnsctvo_agrpdrs_tpo_dcmnto_x_tpo_dcmnto_vgnc] [dbo].[udtConsecutivo] NULL,
    [cdgo_agrpdrs_tpo_dcmnto_x_tpo_dcmnto_vgnc]    [dbo].[udtConsecutivo] NULL,
    [dscrpcn]                                      [dbo].[udtDescripcion] NULL,
    [inco_vgnc]                                    DATETIME               NULL,
    [fn_vgnc]                                      DATETIME               NULL,
    [usr_crcn]                                     [dbo].[udtUsuario]     NULL,
    [cnsctvo_cdgo_agrpdr_tpo_dcmto]                [dbo].[udtConsecutivo] NULL,
    [cnsctvo_cdgo_tpo_dcmnto]                      [dbo].[udtConsecutivo] NULL,
    [vsble_usr]                                    CHAR (1)               NULL
);

