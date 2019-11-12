CREATE TABLE [dbo].[tbDocumentosDigitalizados_lfb] (
    [cnsctvo_cdgo_dcmnto]     BIGINT   NOT NULL,
    [cnsctvo_cdgo_tpo_dcmntl] INT      NOT NULL,
    [nmro_imgns]              INT      NOT NULL,
    [cnsctvo_cdgo_dgtlzdr]    INT      NOT NULL,
    [fcha_dgtlzcn]            DATETIME NOT NULL,
    [cnsctvo_prcso_crga]      INT      NULL,
    [estdo_rgstro]            CHAR (1) CONSTRAINT [DF_tbDocumentosDigitalizados_estdo_rgstro] DEFAULT ('S') NULL,
    CONSTRAINT [PK_tbDocumentosDigitalizados] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_dcmnto] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_cnsctvo_prcso_crga]
    ON [dbo].[tbDocumentosDigitalizados_lfb]([cnsctvo_prcso_crga] ASC)
    ON [FG_INDEXES];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Unibase]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados_lfb] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];

