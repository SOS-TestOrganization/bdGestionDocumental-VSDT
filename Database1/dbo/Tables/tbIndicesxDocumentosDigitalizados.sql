CREATE TABLE [dbo].[tbIndicesxDocumentosDigitalizados] (
    [cnsctvo_indce_dcmnto]    INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [cnsctvo_cdgo_dcmnto]     INT           NOT NULL,
    [cnsctvo_cdgo_tpo_dcmntl] INT           NOT NULL,
    [cnsctvo_cdgo_tpo_indce]  INT           NOT NULL,
    [vlr]                     VARCHAR (255) NOT NULL,
    CONSTRAINT [PK_tbIndicesxDocumentosDigitalizados2_old] PRIMARY KEY CLUSTERED ([cnsctvo_indce_dcmnto] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_cnsctvo_cdgo_dcmnto_old]
    ON [dbo].[tbIndicesxDocumentosDigitalizados]([cnsctvo_cdgo_dcmnto] ASC)
    ON [FG_INDEXES];


GO
CREATE NONCLUSTERED INDEX [idx_dba_tbIndicesxDocumentosDigitalizados_02_old]
    ON [dbo].[tbIndicesxDocumentosDigitalizados]([cnsctvo_cdgo_tpo_dcmntl] ASC, [cnsctvo_cdgo_tpo_indce] ASC)
    INCLUDE([cnsctvo_cdgo_dcmnto], [vlr])
    ON [FG_INDEXES];


GO
CREATE NONCLUSTERED INDEX [IX_tbIndicesxDocumentosDigitalizados_2_old]
    ON [dbo].[tbIndicesxDocumentosDigitalizados]([cnsctvo_cdgo_tpo_indce] ASC, [cnsctvo_cdgo_dcmnto] ASC)
    ON [FG_INDEXES];


GO
CREATE NONCLUSTERED INDEX [idx_cnsctvo_cdgo_tpo_indce_old]
    ON [dbo].[tbIndicesxDocumentosDigitalizados]([cnsctvo_cdgo_tpo_indce] ASC, [vlr] ASC)
    INCLUDE([cnsctvo_cdgo_dcmnto])
    ON [FG_INDEXES];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Unibase]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Auditor Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT TAKE OWNERSHIP
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [visosservice_role]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxDocumentosDigitalizados] TO [visosservice_role]
    AS [dbo];

