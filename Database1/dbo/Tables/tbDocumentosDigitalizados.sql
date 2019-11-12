CREATE TABLE [dbo].[tbDocumentosDigitalizados] (
    [cnsctvo_cdgo_dcmnto]     BIGINT   NOT NULL,
    [cnsctvo_cdgo_tpo_dcmntl] INT      NOT NULL,
    [nmro_imgns]              INT      NOT NULL,
    [cnsctvo_cdgo_dgtlzdr]    INT      NOT NULL,
    [fcha_dgtlzcn]            DATETIME NOT NULL,
    [cnsctvo_prcso_crga]      INT      NULL,
    [estdo_rgstro]            CHAR (1) CONSTRAINT [DF_tbDocumentosDigitalizados_estdo_rgstro1] DEFAULT ('S') NULL,
    CONSTRAINT [PK_tbDocumentosDigitalizados1_old] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_dcmnto] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_cnsctvo_prcso_crga1]
    ON [dbo].[tbDocumentosDigitalizados]([cnsctvo_prcso_crga] ASC)
    ON [FG_INDEXES];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Unibase]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [visosservice_role]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentosDigitalizados] TO [visosservice_role]
    AS [dbo];

