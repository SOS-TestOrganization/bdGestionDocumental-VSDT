CREATE TABLE [dbo].[tbNombresCamposIndicesProveedor_Vigencias] (
    [cnsctvo_vgnca_cdgo_nmbre_cmpo_indce_prvdr] [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cnsctvo_cdgo_nmbre_cmpo_indce_prvdr]       [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_nmbre_cmpo_indce_prvdr]               CHAR (2)               NOT NULL,
    [dscrpcn_nmbre_cmpo_indce_prvdr]            VARCHAR (50)           NOT NULL,
    [inco_vgnca]                                DATETIME               NOT NULL,
    [fn_vgnca]                                  DATETIME               NOT NULL,
    [fcha_crcn]                                 DATETIME               NOT NULL,
    [usro_crcn]                                 [dbo].[udtUsuario]     NOT NULL,
    [obsrvcns]                                  VARCHAR (150)          NULL,
    [vsble_usro]                                [dbo].[udtLogico]      NOT NULL,
    [tmestmp]                                   ROWVERSION             NOT NULL,
    CONSTRAINT [PK_tbNombresCamposIndicesProveedor_Vigencias] PRIMARY KEY CLUSTERED ([cnsctvo_vgnca_cdgo_nmbre_cmpo_indce_prvdr] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbNombresCamposIndicesProveedor_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbNombresCamposIndicesProveedor_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNombresCamposIndicesProveedor_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbNombresCamposIndicesProveedor_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNombresCamposIndicesProveedor_Vigencias] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];

