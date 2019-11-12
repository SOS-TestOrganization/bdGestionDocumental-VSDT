CREATE TABLE [dbo].[tbConfiguracionMigracionArchivosIndices] (
    [cnsctvo_cdgo_cnfgrcn]    [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [srvdr_archvs]            [dbo].[udtDescripcion] NOT NULL,
    [drccn_archvo_fsco]       [dbo].[udtDescripcion] NOT NULL,
    [fncn_clclo_drccn]        [dbo].[udtDescripcion] NULL,
    [srvdr_indce]             [dbo].[udtDescripcion] NULL,
    [drccn_archvo_indce]      [dbo].[udtDescripcion] NULL,
    [nmbre_archvo_indce]      [dbo].[udtDescripcion] NULL,
    [fncn_clclo_drccn_indce]  [dbo].[udtDescripcion] NULL,
    [cnsctvo_cdgo_tpo_dcmnto] [dbo].[udtConsecutivo] NULL,
    [cnsctvo_cdgo_dgtlzdr]    [dbo].[udtConsecutivo] NULL,
    [cnsctvo_imgn_incl]       INT                    NOT NULL,
    [cnfgrcn_actva_indce]     [dbo].[udtLogico]      NULL,
    [cnfgrcn_actva_mgrcn]     [dbo].[udtLogico]      NULL,
    [vldcn_actva]             [dbo].[udtLogico]      CONSTRAINT [DF_tbConfiguracionMigracionArchivosIndices_vldcn_fsco_actva] DEFAULT ('S') NOT NULL,
    [cnsctvo_cdgo_prcso_crga] [dbo].[udtConsecutivo] NULL,
    [estdo_mgrcn]             TINYINT                CONSTRAINT [DF_tbConfiguracionMigracionArchivosIndices_indce_mgrdo] DEFAULT ((0)) NULL,
    [fcha_rta_fsco]           DATETIME               NULL,
    [fcha_rta_indce]          DATETIME               NULL,
    [usro_crcn]               [dbo].[udtUsuario]     NOT NULL,
    [fcha_crcn]               DATETIME               CONSTRAINT [DF_tbConfiguracionMigracionArchivosIndices_fcha_crcn] DEFAULT (getdate()) NOT NULL,
    [vsble_usro]              [dbo].[udtLogico]      NOT NULL,
    [fcha_crgda]              DATETIME               NULL,
    [crga_mlti_tff]           INT                    NULL,
    CONSTRAINT [PK_tbConfiguracionMigracionArchivosIndices] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_cnfgrcn] ASC),
    CONSTRAINT [FK_tbConfiguracionMigracionArchivosIndices_tbProcesosCargaImagenes] FOREIGN KEY ([cnsctvo_cdgo_prcso_crga]) REFERENCES [dbo].[tbProcesosCargaImagenes] ([cnsctvo_cdgo_prcso_crga_imgn])
);


GO
CREATE NONCLUSTERED INDEX [idx_cnsctvo_prcso_crga]
    ON [dbo].[tbConfiguracionMigracionArchivosIndices]([cnsctvo_cdgo_prcso_crga] ASC)
    INCLUDE([drccn_archvo_indce], [estdo_mgrcn], [crga_mlti_tff]);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [Unibase]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [websos]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [visosservice_role]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbConfiguracionMigracionArchivosIndices] TO [visosservice_role]
    AS [dbo];

