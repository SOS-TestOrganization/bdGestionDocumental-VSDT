CREATE TABLE [dbo].[tbTiposDocumento_Vigencias] (
    [cnsctvo_vgnca_cdgo_tpo_dcmnto] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_dcmnto]       [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_tpo_dcmnto]               CHAR (3)               NOT NULL,
    [dscrpcn_tpo_dcmnto]            [dbo].[udtDescripcion] NOT NULL,
    [inco_vgnca]                    DATETIME               NOT NULL,
    [fn_vgnca]                      DATETIME               NOT NULL,
    [fcha_crcn]                     DATETIME               NOT NULL,
    [usro_crcn]                     [dbo].[udtUsuario]     NOT NULL,
    [obsrvcns]                      [dbo].[udtObservacion] NULL,
    [vsble_usro]                    [dbo].[udtLogico]      NOT NULL,
    [tme_stmp]                      ROWVERSION             NOT NULL,
    [cnsctvo_agrpdr_tpo_dcmntl]     [dbo].[udtConsecutivo] NULL,
    [rta_tpo_dcmnto]                [dbo].[udtDescripcion] NULL,
    [mnjo_mlti_tff]                 INT                    NULL,
    CONSTRAINT [PK_tbTiposDocumento_Vigencias] PRIMARY KEY CLUSTERED ([cnsctvo_vgnca_cdgo_tpo_dcmnto] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposDocumento_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposDocumento_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposDocumento_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumento_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposDocumento_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposDocumento_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposDocumento_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumento_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposDocumento_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumento_Vigencias] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumento_Vigencias] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumento_Vigencias] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumento_Vigencias] TO [Unibase]
    AS [dbo];

