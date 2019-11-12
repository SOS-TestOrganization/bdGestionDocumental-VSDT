CREATE TABLE [dbo].[tbIteraciones_Vigencias] (
    [cnsctvo_vgnca_cdgo_itrcn] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_itrcn]       [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_itrcn]               CHAR (4)               NOT NULL,
    [dscrpcn_itrcn]            [dbo].[udtDescripcion] NOT NULL,
    [inco_vgnca]               DATETIME               NOT NULL,
    [fn_vgnca]                 DATETIME               NOT NULL,
    [fcha_crcn]                DATETIME               NOT NULL,
    [usro_crcn]                [dbo].[udtUsuario]     NOT NULL,
    [obsrvcns]                 [dbo].[udtObservacion] NOT NULL,
    [vsble_usro]               [dbo].[udtLogico]      NOT NULL,
    [ara_fnte]                 [dbo].[udtDescripcion] NULL,
    [ara_dstno]                [dbo].[udtDescripcion] NULL,
    [estdo]                    [dbo].[udtDescripcion] NULL,
    [rspnsble_itrcn]           [dbo].[udtUsuario]     NOT NULL,
    [tme_stmp]                 ROWVERSION             NOT NULL,
    CONSTRAINT [PK_tbIteraciones_Vigencias] PRIMARY KEY CLUSTERED ([cnsctvo_vgnca_cdgo_itrcn] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIteraciones_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIteraciones_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbIteraciones_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteraciones_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIteraciones_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIteraciones_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIteraciones_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteraciones_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIteraciones_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteraciones_Vigencias] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteraciones_Vigencias] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteraciones_Vigencias] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIteraciones_Vigencias] TO [Unibase]
    AS [dbo];

