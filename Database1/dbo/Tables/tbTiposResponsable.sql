CREATE TABLE [dbo].[tbTiposResponsable] (
    [cnsctvo_cdgo_tpo_rspnsble] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_tpo_rspnsble]         CHAR (4)               NOT NULL,
    [dscrpcn_tpo_rspnsble]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]                 DATETIME               NOT NULL,
    [usro_crcn]                 [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbTiposResponsable] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_tpo_rspnsble] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposResponsable] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposResponsable] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposResponsable] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposResponsable] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposResponsable] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposResponsable] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposResponsable] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposResponsable] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposResponsable] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposResponsable] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposResponsable] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposResponsable] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposResponsable] TO [Unibase]
    AS [dbo];

