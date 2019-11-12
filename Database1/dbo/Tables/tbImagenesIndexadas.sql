CREATE TABLE [dbo].[tbImagenesIndexadas] (
    [cnsctvo_cdgo_imgn]     [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [nmbre_imgn]            [dbo].[udtDescripcion] NOT NULL,
    [cnsctvo_imgn]          BIGINT                 NOT NULL,
    [nmro_idntfccn]         VARCHAR (20)           NULL,
    [nmro_fctra]            VARCHAR (30)           NULL,
    [indice_3]              VARCHAR (30)           NULL,
    [indice_4]              VARCHAR (30)           NULL,
    [rta_orgnl_imgn]        [dbo].[udtDescripcion] NOT NULL,
    [rta_fnl_imgn]          [dbo].[udtDescripcion] NULL,
    [cnsctvo_cdgo_tpo_imgn] [dbo].[udtConsecutivo] CONSTRAINT [DF_tbDocumentosAnexos_cnsctvo_cdgo_tpo_dcmnto] DEFAULT ((0)) NOT NULL,
    [cpa_elctrnca]          [dbo].[udtLogico]      CONSTRAINT [DF_tbDocumentosAnexos_cpa_elctrnca] DEFAULT ('N') NOT NULL,
    [extnsn_imgn]           CHAR (5)               CONSTRAINT [DF_tbDocumentosAnexos_extnsn_archvo] DEFAULT ('') NOT NULL,
    [fcha_crpta_imgn]       CHAR (6)               NULL,
    [fcha_crcn]             DATETIME               NOT NULL,
    [usro_crcn]             [dbo].[udtUsuario]     NOT NULL,
    [obsrvcns]              [dbo].[udtObservacion] CONSTRAINT [DF_tbDocumentosAnexos_obsrvcns] DEFAULT ('') NOT NULL,
    [actvo]                 [dbo].[udtLogico]      CONSTRAINT [DF_tbDocumentosAnexos_actvo] DEFAULT ('S') NOT NULL,
    [cnsctvo_cdgo_fljo]     [dbo].[udtConsecutivo] NULL,
    [crtla]                 [dbo].[udtLogico]      NULL,
    [cnsctvo_imgn_pr_crtla] [dbo].[udtConsecutivo] NULL,
    [cnsctvo_cdgo_indce]    [dbo].[udtConsecutivo] NULL,
    CONSTRAINT [PK_tbImagenesIndexadas] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_imgn] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesIndexadas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesIndexadas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbImagenesIndexadas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesIndexadas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesIndexadas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesIndexadas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesIndexadas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesIndexadas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesIndexadas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesIndexadas] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesIndexadas] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesIndexadas] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesIndexadas] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesIndexadas] TO [Unibase]
    AS [dbo];

