CREATE TABLE [dbo].[tbBolsas] (
    [cnsctvo_cdgo_blsa] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_blsa]         CHAR (4)               NOT NULL,
    [dscrpcn_blsa]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]         DATETIME               NOT NULL,
    [usro_crcn]         [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]        [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbBolsas] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_blsa] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbBolsas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbBolsas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbBolsas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbBolsas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbBolsas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbBolsas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbBolsas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbBolsas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbBolsas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbBolsas] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbBolsas] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbBolsas] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbBolsas] TO [Unibase]
    AS [dbo];

