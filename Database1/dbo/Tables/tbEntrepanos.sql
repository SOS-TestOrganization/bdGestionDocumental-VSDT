CREATE TABLE [dbo].[tbEntrepanos] (
    [cnsctvo_cdgo_entrpno] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_entrpno]         CHAR (4)               NOT NULL,
    [dscrpcn_entrpno]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]            DATETIME               NOT NULL,
    [usro_crcn]            [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]           [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbEntrepanos] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_entrpno] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbEntrepanos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEntrepanos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbEntrepanos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEntrepanos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEntrepanos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbEntrepanos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEntrepanos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEntrepanos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEntrepanos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEntrepanos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEntrepanos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEntrepanos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEntrepanos] TO [Unibase]
    AS [dbo];

