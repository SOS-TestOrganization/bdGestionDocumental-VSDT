CREATE TABLE [dbo].[tbEstadosDocumento] (
    [cnsctvo_cdgo_estdo_dcmnto] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_estdo_dcmnto]         CHAR (4)               NOT NULL,
    [dscrpcn_estdo_dcmnto]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]                 DATETIME               NOT NULL,
    [usro_crcn]                 [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbEstadosDocumento] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_estdo_dcmnto] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbEstadosDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstadosDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbEstadosDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstadosDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbEstadosDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstadosDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstadosDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosDocumento] TO [Unibase]
    AS [dbo];

