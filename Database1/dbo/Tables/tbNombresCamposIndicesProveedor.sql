CREATE TABLE [dbo].[tbNombresCamposIndicesProveedor] (
    [cnsctvo_cdgo_nmbre_cmpo_indce_prvdr] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_nmbre_cmpo_indce_prvdr]         CHAR (2)               NOT NULL,
    [dscrpcn_nmbre_cmpo_indce_prvdr]      VARCHAR (50)           NOT NULL,
    [fcha_crcn]                           DATETIME               NOT NULL,
    [usro_crcn]                           [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                          [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbNombresCamposIndicesProveedor] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_nmbre_cmpo_indce_prvdr] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbNombresCamposIndicesProveedor] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbNombresCamposIndicesProveedor] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNombresCamposIndicesProveedor] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbNombresCamposIndicesProveedor] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNombresCamposIndicesProveedor] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];

