CREATE TABLE [dbo].[tbFlujosxDocumentos] (
    [cnsctvo_cdgo_fljo_pr_dcmnto] [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cnsctvo_cdgo_fljo]           [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_dcmnto]         [dbo].[udtConsecutivo] NOT NULL,
    [fcha_crcn]                   DATETIME               NOT NULL,
    [usro_crcn]                   [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                  [dbo].[udtLogico]      NOT NULL,
    [nmro_idntfccn_dcmnto]        VARCHAR (20)           NULL,
    CONSTRAINT [PK_tbFlujosxDocumentos] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_fljo_pr_dcmnto] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbFlujosxDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbFlujosxDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbFlujosxDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujosxDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbFlujosxDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbFlujosxDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbFlujosxDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujosxDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbFlujosxDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujosxDocumentos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujosxDocumentos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujosxDocumentos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujosxDocumentos] TO [Unibase]
    AS [dbo];

