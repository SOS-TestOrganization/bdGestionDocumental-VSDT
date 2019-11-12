CREATE TABLE [dbo].[tbTiposImagenes_Vigencias] (
    [cnsctvo_vgnca_cdgo_tpo_imgn] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_imgn]       [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_tpo_imgn]               CHAR (3)               NOT NULL,
    [dscrpcn_tpo_imgn]            [dbo].[udtDescripcion] NOT NULL,
    [inco_vgnca]                  DATETIME               NOT NULL,
    [fn_vgnca]                    DATETIME               NOT NULL,
    [fcha_crcn]                   DATETIME               NOT NULL,
    [usro_crcn]                   [dbo].[udtUsuario]     NOT NULL,
    [obsrvcns]                    [dbo].[udtObservacion] NULL,
    [vsble_usro]                  [dbo].[udtLogico]      NOT NULL,
    [cnsctvo_cdgo_tpo_imgn_fnte]  [dbo].[udtConsecutivo] NULL,
    [tme_stmp]                    ROWVERSION             NOT NULL,
    CONSTRAINT [PK_tbTiposImagenesDocumentos_Vigencias] PRIMARY KEY CLUSTERED ([cnsctvo_vgnca_cdgo_tpo_imgn] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [Unibase]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [websos]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [visosservice_role]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposImagenes_Vigencias] TO [visosservice_role]
    AS [dbo];

