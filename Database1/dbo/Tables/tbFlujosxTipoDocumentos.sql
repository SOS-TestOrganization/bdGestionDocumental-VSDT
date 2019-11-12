CREATE TABLE [dbo].[tbFlujosxTipoDocumentos] (
    [cnsctvo_cdgo_fljo_pr_tpo_dcmnto] [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cnsctvo_cdgo_fljo]               [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_dcmnto]         [dbo].[udtConsecutivo] NOT NULL,
    [fcha_crcn]                       DATETIME               NOT NULL,
    [usro_crcn]                       [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                      [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbFlujosxTipoDocumentos] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_fljo_pr_tpo_dcmnto] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbFlujosxTipoDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbFlujosxTipoDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbFlujosxTipoDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujosxTipoDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbFlujosxTipoDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbFlujosxTipoDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbFlujosxTipoDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujosxTipoDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbFlujosxTipoDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujosxTipoDocumentos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujosxTipoDocumentos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujosxTipoDocumentos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujosxTipoDocumentos] TO [Unibase]
    AS [dbo];

