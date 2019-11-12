CREATE TABLE [dbo].[tbProcesosAdministrativos] (
    [cnsctvo_cdgo_prcso_admnstrtvo] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_prcso_admnstrtvo]         CHAR (4)               NOT NULL,
    [dscrpcn_prcso_admnstrtvo]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]                     DATETIME               NOT NULL,
    [usro_crcn]                     [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                    [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbProcesosAdministrativos] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_prcso_admnstrtvo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbProcesosAdministrativos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbProcesosAdministrativos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbProcesosAdministrativos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosAdministrativos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbProcesosAdministrativos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbProcesosAdministrativos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbProcesosAdministrativos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosAdministrativos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbProcesosAdministrativos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosAdministrativos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosAdministrativos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosAdministrativos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosAdministrativos] TO [Unibase]
    AS [dbo];

