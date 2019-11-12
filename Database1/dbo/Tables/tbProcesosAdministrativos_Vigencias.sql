CREATE TABLE [dbo].[tbProcesosAdministrativos_Vigencias] (
    [cnsctvo_vgnca_cdgo_prcso_admnstrtvo] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_prcso_admnstrtvo]       [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_prcso_admnstrtvo]               CHAR (4)               NOT NULL,
    [dscrpcn_prcso_admnstrtvo]            [dbo].[udtDescripcion] NOT NULL,
    [inco_vgnca]                          DATETIME               NOT NULL,
    [fn_vgnca]                            DATETIME               NOT NULL,
    [fcha_crcn]                           DATETIME               NOT NULL,
    [usro_crcn]                           [dbo].[udtUsuario]     NOT NULL,
    [obsrvcns]                            [dbo].[udtObservacion] NOT NULL,
    [vsble_usro]                          [dbo].[udtLogico]      NOT NULL,
    [tme_stmp]                            ROWVERSION             NOT NULL,
    CONSTRAINT [PK_tbProcesosAdministrativos_Vigencias] PRIMARY KEY CLUSTERED ([cnsctvo_vgnca_cdgo_prcso_admnstrtvo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbProcesosAdministrativos_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbProcesosAdministrativos_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbProcesosAdministrativos_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosAdministrativos_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbProcesosAdministrativos_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbProcesosAdministrativos_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbProcesosAdministrativos_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosAdministrativos_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbProcesosAdministrativos_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosAdministrativos_Vigencias] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosAdministrativos_Vigencias] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosAdministrativos_Vigencias] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosAdministrativos_Vigencias] TO [Unibase]
    AS [dbo];

