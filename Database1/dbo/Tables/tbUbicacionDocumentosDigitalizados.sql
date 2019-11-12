CREATE TABLE [dbo].[tbUbicacionDocumentosDigitalizados] (
    [cnsctvo_cdgo_ubccn_fsca_dcmnto] [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cnsctvo_cdgo_dcmnto]            [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_fljo]              [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_rta]               [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_bdga]              [dbo].[udtConsecutivo] NULL,
    [cnsctvo_cdgo_estntra]           [dbo].[udtConsecutivo] NULL,
    [cnsctvo_cdgo_entrpno]           [dbo].[udtConsecutivo] NULL,
    [cnsctvo_cdgo_cja]               [dbo].[udtConsecutivo] NULL,
    [cnsctvo_cdgo_blsa]              [dbo].[udtConsecutivo] NULL,
    [fcha_crcn]                      DATETIME               NOT NULL,
    [usro_crcn]                      [dbo].[udtUsuario]     NOT NULL,
    CONSTRAINT [PK_tbUbicacionFisicaDocumento] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_ubccn_fsca_dcmnto] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbUbicacionDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbUbicacionDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbUbicacionDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbUbicacionDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbUbicacionDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbUbicacionDocumentosDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbUbicacionDocumentosDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbUbicacionDocumentosDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbUbicacionDocumentosDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbUbicacionDocumentosDigitalizados] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbUbicacionDocumentosDigitalizados] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbUbicacionDocumentosDigitalizados] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbUbicacionDocumentosDigitalizados] TO [Unibase]
    AS [dbo];

