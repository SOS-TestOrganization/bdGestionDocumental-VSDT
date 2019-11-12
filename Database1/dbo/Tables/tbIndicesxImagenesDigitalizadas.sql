CREATE TABLE [dbo].[tbIndicesxImagenesDigitalizadas] (
    [cnsctvo_indce_imgn_dgtlzda] INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [cnsctvo_cdgo_imgn]          INT           NOT NULL,
    [cnsctvo_cdgo_dcmnto]        INT           NOT NULL,
    [cnsctvo_cdgo_tpo_dcmntl]    INT           NOT NULL,
    [cnsctvo_cdgo_tpo_indce]     INT           NOT NULL,
    [vlr]                        VARCHAR (255) NOT NULL,
    CONSTRAINT [PK_tbIndicesxImagenesDigitalizadas_old] PRIMARY KEY CLUSTERED ([cnsctvo_indce_imgn_dgtlzda] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_cnsctvo_cdgo_dcmnto_old]
    ON [dbo].[tbIndicesxImagenesDigitalizadas]([cnsctvo_cdgo_dcmnto] ASC, [cnsctvo_cdgo_tpo_indce] ASC, [cnsctvo_cdgo_imgn] ASC)
    ON [FG_INDEXES];


GO
CREATE NONCLUSTERED INDEX [idx_cnsctvo_cdgo_imgn_old]
    ON [dbo].[tbIndicesxImagenesDigitalizadas]([cnsctvo_cdgo_imgn] ASC)
    ON [FG_INDEXES];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Unibase]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Auditor Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [RespondeService]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT TAKE OWNERSHIP
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [websos]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [visosservice_role]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIndicesxImagenesDigitalizadas] TO [visosservice_role]
    AS [dbo];

