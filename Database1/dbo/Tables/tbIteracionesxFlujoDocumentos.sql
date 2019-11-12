CREATE TABLE [dbo].[tbIteracionesxFlujoDocumentos] (
    [cnsctvo_cdgo_itrcn_pr_fljo_pr_dcmnto] [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cnsctvo_cdgo_itrcn]                   [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_fljo_pr_dcmnto]          [dbo].[udtConsecutivo] NOT NULL,
    [fcha_crcn]                            DATETIME               NOT NULL,
    [usro_crcn]                            [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                           [dbo].[udtLogico]      NOT NULL,
    [obsrvcns]                             [dbo].[udtObservacion] NULL,
    CONSTRAINT [PK_tbIteracionesxFlujoDocumentos] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_itrcn_pr_fljo_pr_dcmnto] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIteracionesxFlujoDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIteracionesxFlujoDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbIteracionesxFlujoDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteracionesxFlujoDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIteracionesxFlujoDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIteracionesxFlujoDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIteracionesxFlujoDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteracionesxFlujoDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIteracionesxFlujoDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteracionesxFlujoDocumentos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteracionesxFlujoDocumentos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteracionesxFlujoDocumentos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteracionesxFlujoDocumentos] TO [Unibase]
    AS [dbo];

