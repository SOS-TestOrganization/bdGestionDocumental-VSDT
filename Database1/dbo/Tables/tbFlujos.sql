CREATE TABLE [dbo].[tbFlujos] (
    [cnsctvo_cdgo_fljo] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_fljo]         CHAR (4)               NOT NULL,
    [dscrpcn_fljo]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]         DATETIME               NOT NULL,
    [usro_crcn]         [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]        [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbFlujos] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_fljo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbFlujos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbFlujos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbFlujos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbFlujos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbFlujos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbFlujos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbFlujos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujos] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujos] TO [Unibase]
    AS [dbo];

