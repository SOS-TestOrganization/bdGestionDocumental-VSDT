CREATE TABLE [dbo].[tbTiposDocumento] (
    [cnsctvo_cdgo_tpo_dcmnto]   [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_tpo_dcmnto]           CHAR (4)               NOT NULL,
    [dscrpcn_tpo_dcmnto]        [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]                 DATETIME               NOT NULL,
    [usro_crcn]                 [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                [dbo].[udtLogico]      NOT NULL,
    [cnsctvo_agrpdr_tpo_dcmntl] [dbo].[udtConsecutivo] NULL,
    CONSTRAINT [PK_tbTiposDocumento] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_tpo_dcmnto] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumento] TO [Unibase]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumento] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumento] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumento] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumento] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];

