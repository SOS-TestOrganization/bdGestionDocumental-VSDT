CREATE TABLE [dbo].[tbProcesos] (
    [cnsctvo_cdgo_prcso] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_prcso]         CHAR (4)               NOT NULL,
    [dscrpcn_prcso]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]          DATETIME               NOT NULL,
    [usro_crcn]          [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]         [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbProcesos] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_prcso] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbProcesos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbProcesos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbProcesos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbProcesos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbProcesos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbProcesos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbProcesos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesos] TO [Unibase]
    AS [dbo];

