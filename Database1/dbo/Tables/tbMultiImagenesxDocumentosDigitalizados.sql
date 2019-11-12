CREATE TABLE [dbo].[tbMultiImagenesxDocumentosDigitalizados] (
    [cnsctvo_cdgo_mlti_imgn] [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cnsctvo_cdgo_dcmnto]    [dbo].[udtConsecutivo] NOT NULL,
    [rta_imgn]               VARCHAR (250)          NOT NULL,
    CONSTRAINT [PK_tbMultiImagenesxDocumentosDigitalizados1] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_mlti_imgn] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbMultiImagenesxDocumentosDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbMultiImagenesxDocumentosDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbMultiImagenesxDocumentosDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbMultiImagenesxDocumentosDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbMultiImagenesxDocumentosDigitalizados] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbMultiImagenesxDocumentosDigitalizados] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbMultiImagenesxDocumentosDigitalizados] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbMultiImagenesxDocumentosDigitalizados] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbMultiImagenesxDocumentosDigitalizados] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];

