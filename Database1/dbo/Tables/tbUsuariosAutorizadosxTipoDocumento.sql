CREATE TABLE [dbo].[tbUsuariosAutorizadosxTipoDocumento] (
    [cnsctvo_cdgo_tpo_dcmnto_x_usro] INT               IDENTITY (1, 1) NOT NULL,
    [cnsctvo_cdgo_tpo_dcmnto]        INT               NOT NULL,
    [lgn_usro]                       VARCHAR (20)      NOT NULL,
    [fcha_crcn]                      DATETIME          NOT NULL,
    [usro_crcn]                      VARCHAR (20)      NOT NULL,
    [vsble_usro]                     [dbo].[udtLogico] NOT NULL,
    CONSTRAINT [PK_tbUsuariosAutorizadosxTipoDocumento] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_tpo_dcmnto_x_usro] ASC)
);

