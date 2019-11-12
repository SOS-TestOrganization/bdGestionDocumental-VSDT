CREATE TABLE [dbo].[tbTiposFlujo] (
    [cnsctvo_cdgo_tpo_fljo] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_tpo_fljo]         CHAR (4)               NOT NULL,
    [dscrpcn_tpo_fljo]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]             DATETIME               NOT NULL,
    [usro_crcn]             [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]            [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbTipoFlujo] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_tpo_fljo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposFlujo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposFlujo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposFlujo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposFlujo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposFlujo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposFlujo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposFlujo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposFlujo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposFlujo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposFlujo] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposFlujo] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposFlujo] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposFlujo] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposFlujo] TO [Unibase]
    AS [dbo];

