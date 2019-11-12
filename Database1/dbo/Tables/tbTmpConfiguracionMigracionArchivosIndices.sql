CREATE TABLE [dbo].[tbTmpConfiguracionMigracionArchivosIndices] (
    [cnsctvo_cdgo_cnfgrcn]    [dbo].[udtConsecutivo] NOT NULL,
    [srvdr_archvs]            [dbo].[udtDescripcion] NULL,
    [drccn_archvo_fsco]       NVARCHAR (200)         NULL,
    [fncn_clclo_drccn]        [dbo].[udtDescripcion] NULL,
    [srvdr_indce]             [dbo].[udtDescripcion] NULL,
    [drccn_archvo_indce]      [dbo].[udtDescripcion] NULL,
    [nmbre_archvo_indce]      [dbo].[udtDescripcion] NULL,
    [fncn_clclo_drccn_indce]  [dbo].[udtDescripcion] NULL,
    [cnsctvo_cdgo_tpo_dcmnto] [dbo].[udtConsecutivo] NULL,
    [cnsctvo_cdgo_dgtlzdr]    [dbo].[udtConsecutivo] NULL,
    [cnsctvo_imgn_incl]       INT                    NOT NULL,
    [fcha_ato_crccn]          DATETIME               CONSTRAINT [DF_tbTmpConfiguracionMigracionArchivosIndices_fcha_ato_crccn] DEFAULT (getdate()) NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTmpConfiguracionMigracionArchivosIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTmpConfiguracionMigracionArchivosIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTmpConfiguracionMigracionArchivosIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTmpConfiguracionMigracionArchivosIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTmpConfiguracionMigracionArchivosIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTmpConfiguracionMigracionArchivosIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTmpConfiguracionMigracionArchivosIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTmpConfiguracionMigracionArchivosIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTmpConfiguracionMigracionArchivosIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTmpConfiguracionMigracionArchivosIndices] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTmpConfiguracionMigracionArchivosIndices] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTmpConfiguracionMigracionArchivosIndices] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTmpConfiguracionMigracionArchivosIndices] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTmpConfiguracionMigracionArchivosIndices] TO [Unibase]
    AS [dbo];

