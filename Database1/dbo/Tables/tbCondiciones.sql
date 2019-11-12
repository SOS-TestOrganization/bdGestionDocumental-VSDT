CREATE TABLE [dbo].[tbCondiciones] (
    [cnsctvo_cdgo_cndcn] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_cndcn]         CHAR (4)               NOT NULL,
    [dscrpcn_cndcn]      [dbo].[udtObservacion] NOT NULL,
    [fcha_crcn]          DATETIME               NOT NULL,
    [usro_crcn]          [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]         [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbCondiciones] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_cndcn] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCondiciones] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCondiciones] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbCondiciones] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCondiciones] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCondiciones] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCondiciones] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCondiciones] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCondiciones] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCondiciones] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCondiciones] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCondiciones] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCondiciones] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCondiciones] TO [Unibase]
    AS [dbo];

