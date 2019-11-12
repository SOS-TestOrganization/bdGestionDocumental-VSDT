CREATE TABLE [dbo].[tbTiposValidacion_Vigencias] (
    [cnsctvo_vgnca_cdgo_tpo_vldcn] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_vldcn]       [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_tpo_vldcn]               CHAR (3)               NOT NULL,
    [dscrpcn_tpo_vldcn]            [dbo].[udtDescripcion] NOT NULL,
    [inco_vgnca]                   DATETIME               NOT NULL,
    [fn_vgnca]                     DATETIME               NOT NULL,
    [fcha_crcn]                    DATETIME               NOT NULL,
    [usro_crcn]                    [dbo].[udtUsuario]     NOT NULL,
    [obsrvcns]                     [dbo].[udtObservacion] NULL,
    [vsble_usro]                   [dbo].[udtLogico]      NOT NULL,
    [tme_stmp]                     ROWVERSION             NOT NULL,
    CONSTRAINT [PK_tbTiposValidacion_Vigencias] PRIMARY KEY CLUSTERED ([cnsctvo_vgnca_cdgo_tpo_vldcn] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposValidacion_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposValidacion_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposValidacion_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposValidacion_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposValidacion_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposValidacion_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposValidacion_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposValidacion_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposValidacion_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposValidacion_Vigencias] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposValidacion_Vigencias] TO [Unibase]
    AS [dbo];

