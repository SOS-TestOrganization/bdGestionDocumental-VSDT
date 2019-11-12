CREATE TABLE [dbo].[tbTiposImagenes] (
    [cnsctvo_cdgo_tpo_imgn]      [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_tpo_imgn]              CHAR (10)              NOT NULL,
    [dscrpcn_tpo_imgn]           [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]                  DATETIME               NOT NULL,
    [usro_crcn]                  [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                 [dbo].[udtLogico]      NOT NULL,
    [cnsctvo_cdgo_tpo_imgn_fnte] [dbo].[udtConsecutivo] NULL,
    CONSTRAINT [PK_tbTiposImagenesDocumentos] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_tpo_imgn] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposImagenes] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposImagenes] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenes] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposImagenes] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenes] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenes] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenes] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenes] TO [Unibase]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenes] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenes] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenes] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenes] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposImagenes] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposImagenes] TO [websos]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposImagenes] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenes] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposImagenes] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposImagenes] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposImagenes] TO [visosservice_role]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposImagenes] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenes] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposImagenes] TO [visosservice_role]
    AS [dbo];

