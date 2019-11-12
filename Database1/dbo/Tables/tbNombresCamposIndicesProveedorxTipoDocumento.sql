CREATE TABLE [dbo].[tbNombresCamposIndicesProveedorxTipoDocumento] (
    [cnsctvo_cdgo_nmbre_cmpo_indce_prvdr_pr_tpo_dcmnto] [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cnsctvo_cdgo_nmbre_cmpo_indce_prvdr]               [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_dcmnto]                           [dbo].[udtConsecutivo] NOT NULL,
    [ordn_archvo]                                       [dbo].[udtConsecutivo] NULL,
    [fcha_crcn]                                         DATETIME               NOT NULL,
    [usro_crcn]                                         [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                                        [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbNombresCamposIndicesProveedorxTipoDocumento] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_nmbre_cmpo_indce_prvdr_pr_tpo_dcmnto] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbNombresCamposIndicesProveedorxTipoDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbNombresCamposIndicesProveedorxTipoDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNombresCamposIndicesProveedorxTipoDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbNombresCamposIndicesProveedorxTipoDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNombresCamposIndicesProveedorxTipoDocumento] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];

