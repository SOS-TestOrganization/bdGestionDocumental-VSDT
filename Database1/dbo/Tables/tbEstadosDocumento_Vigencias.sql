CREATE TABLE [dbo].[tbEstadosDocumento_Vigencias] (
    [cnsctvo_vgnca_cdgo_estdo_dcmnto] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_estdo_dcmnto]       [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_estdo_dcmnto]               CHAR (3)               NOT NULL,
    [dscrpcn_estdo_dcmnto]            [dbo].[udtDescripcion] NOT NULL,
    [inco_vgnca]                      DATETIME               NOT NULL,
    [fn_vgnca]                        DATETIME               NOT NULL,
    [fcha_crcn]                       DATETIME               NOT NULL,
    [usro_crcn]                       [dbo].[udtUsuario]     NOT NULL,
    [obsrvcns]                        [dbo].[udtObservacion] NULL,
    [vsble_usro]                      [dbo].[udtLogico]      NOT NULL,
    [tme_stmp]                        ROWVERSION             NOT NULL,
    CONSTRAINT [PK_tbEstadosDocumento_Vigencias] PRIMARY KEY CLUSTERED ([cnsctvo_vgnca_cdgo_estdo_dcmnto] ASC),
    CONSTRAINT [FK1_tbEstadosDocumento_Vigencias_tbEstadosDocumento] FOREIGN KEY ([cnsctvo_cdgo_estdo_dcmnto]) REFERENCES [dbo].[tbEstadosDocumento] ([cnsctvo_cdgo_estdo_dcmnto]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbEstadosDocumento_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstadosDocumento_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbEstadosDocumento_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosDocumento_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstadosDocumento_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbEstadosDocumento_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstadosDocumento_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosDocumento_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstadosDocumento_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosDocumento_Vigencias] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosDocumento_Vigencias] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosDocumento_Vigencias] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosDocumento_Vigencias] TO [Unibase]
    AS [dbo];

