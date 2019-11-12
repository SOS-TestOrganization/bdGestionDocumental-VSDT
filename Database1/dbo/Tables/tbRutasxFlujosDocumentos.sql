CREATE TABLE [dbo].[tbRutasxFlujosDocumentos] (
    [cnsctvo_cdgo_rta_pr_fljo_dcmnto] [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cnsctvo_cdgo_rta]                [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_fljo]               [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_dcmnto]             [dbo].[udtConsecutivo] NOT NULL,
    [fcha_crcn]                       DATETIME               NOT NULL,
    [usro_crcn]                       [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                      [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbRutasxFlujosDocumentos] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_rta_pr_fljo_dcmnto] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbRutasxFlujosDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbRutasxFlujosDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbRutasxFlujosDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRutasxFlujosDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbRutasxFlujosDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbRutasxFlujosDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbRutasxFlujosDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRutasxFlujosDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbRutasxFlujosDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRutasxFlujosDocumentos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRutasxFlujosDocumentos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRutasxFlujosDocumentos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRutasxFlujosDocumentos] TO [Unibase]
    AS [dbo];

