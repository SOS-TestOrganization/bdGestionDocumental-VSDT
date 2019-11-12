CREATE TABLE [dbo].[tbFlujos_Vigencias_old] (
    [cnsctvo_vgnca_cdgo_fljo] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_fljo]       [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_fljo]               CHAR (4)               NOT NULL,
    [dscrpcn_fljo]            [dbo].[udtDescripcion] NOT NULL,
    [inco_vgnca]              DATETIME               NOT NULL,
    [fn_vgnca]                DATETIME               NOT NULL,
    [fcha_crcn]               DATETIME               NOT NULL,
    [usro_crcn]               [dbo].[udtUsuario]     NOT NULL,
    [obsrvcns]                [dbo].[udtObservacion] NOT NULL,
    [vsble_usro]              [dbo].[udtLogico]      NOT NULL,
    [nmro_itrcns]             [dbo].[udtConsecutivo] NOT NULL,
    [tme_stmp]                ROWVERSION             NOT NULL,
    CONSTRAINT [PK_tbFlujos_Vigencias] PRIMARY KEY CLUSTERED ([cnsctvo_vgnca_cdgo_fljo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbFlujos_Vigencias_old] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbFlujos_Vigencias_old] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbFlujos_Vigencias_old] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujos_Vigencias_old] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbFlujos_Vigencias_old] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbFlujos_Vigencias_old] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbFlujos_Vigencias_old] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujos_Vigencias_old] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbFlujos_Vigencias_old] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujos_Vigencias_old] TO [Unibase]
    AS [dbo];

