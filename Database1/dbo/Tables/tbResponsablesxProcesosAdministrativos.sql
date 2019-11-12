CREATE TABLE [dbo].[tbResponsablesxProcesosAdministrativos] (
    [cnsctvo_cdgo_rspnsble_pr_prcso_admnstrtvo] [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cnsctvo_cdgo_rspnsble]                     [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_prcso_admnstrtvo]             [dbo].[udtConsecutivo] NOT NULL,
    [fcha_crcn]                                 DATETIME               NOT NULL,
    [usro_crcn]                                 [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                                [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbResponsablesxProcesosAdministrativos] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_rspnsble_pr_prcso_admnstrtvo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbResponsablesxProcesosAdministrativos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbResponsablesxProcesosAdministrativos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbResponsablesxProcesosAdministrativos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResponsablesxProcesosAdministrativos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbResponsablesxProcesosAdministrativos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbResponsablesxProcesosAdministrativos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbResponsablesxProcesosAdministrativos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResponsablesxProcesosAdministrativos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbResponsablesxProcesosAdministrativos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResponsablesxProcesosAdministrativos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResponsablesxProcesosAdministrativos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResponsablesxProcesosAdministrativos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResponsablesxProcesosAdministrativos] TO [Unibase]
    AS [dbo];

