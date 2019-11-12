CREATE TABLE [dbo].[tbIteracionesxFlujo] (
    [cnsctvo_cdgo_itrcn_pr_fljo] [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cnsctvo_cdgo_itrcn]         [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_fljo]          [dbo].[udtConsecutivo] NOT NULL,
    [fcha_crcn]                  DATETIME               NOT NULL,
    [usro_crcn]                  [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                 [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbIteracionesxFlujo] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_itrcn_pr_fljo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIteracionesxFlujo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIteracionesxFlujo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbIteracionesxFlujo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteracionesxFlujo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIteracionesxFlujo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIteracionesxFlujo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIteracionesxFlujo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteracionesxFlujo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIteracionesxFlujo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteracionesxFlujo] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteracionesxFlujo] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteracionesxFlujo] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteracionesxFlujo] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteracionesxFlujo] TO [Unibase]
    AS [dbo];

