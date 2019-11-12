CREATE TABLE [dbo].[tbTiposIndicesxTiposDocumentos] (
    [cnsctvo_cdgo_tpo_indce_pr_tpo_dcmnto] [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cnsctvo_cdgo_tpo_dcmnto]              [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_indce]               [dbo].[udtConsecutivo] NOT NULL,
    [agrpdr]                               [dbo].[udtLogico]      NOT NULL,
    [nmbre]                                [dbo].[udtDescripcion] NOT NULL,
    [pscn]                                 TINYINT                NOT NULL,
    [ordn_indce]                           TINYINT                NULL,
    [agrpdr_cnslta]                        TINYINT                NULL,
    CONSTRAINT [PK_tbTiposIndicesxTiposDocumentos] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_tpo_indce_pr_tpo_dcmnto] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposIndicesxTiposDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposIndicesxTiposDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposIndicesxTiposDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndicesxTiposDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposIndicesxTiposDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposIndicesxTiposDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposIndicesxTiposDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndicesxTiposDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposIndicesxTiposDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndicesxTiposDocumentos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndicesxTiposDocumentos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndicesxTiposDocumentos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndicesxTiposDocumentos] TO [Unibase]
    AS [dbo];

