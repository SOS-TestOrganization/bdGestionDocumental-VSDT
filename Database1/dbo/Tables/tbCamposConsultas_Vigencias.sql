CREATE TABLE [dbo].[tbCamposConsultas_Vigencias] (
    [cnsctvo_vgnca_cdgo_cmpo_cnslta] [dbo].[udtConsecutivo]  NOT NULL,
    [cnsctvo_cdgo_cmpo_cnslta]       [dbo].[udtConsecutivo]  NOT NULL,
    [cdgo_cmpo_cnslta]               CHAR (4)                NOT NULL,
    [dscrpcn_cmpo_cnslta]            [dbo].[udtDescripcion]  NOT NULL,
    [inco_vgnca]                     DATETIME                NOT NULL,
    [fn_vgnca]                       DATETIME                NOT NULL,
    [fcha_crcn]                      DATETIME                NOT NULL,
    [usro_crcn]                      [dbo].[udtUsuario]      NOT NULL,
    [obsrvcns]                       [dbo].[udtObservacion]  NOT NULL,
    [vsble_usro]                     [dbo].[udtLogico]       NOT NULL,
    [nmbre_sp_prmtro]                [dbo].[udtDescripcion]  NULL,
    [prmtrs_sp]                      VARCHAR (100)           NULL,
    [clse_lgca]                      CHAR (50)               NOT NULL,
    [tpo_dts]                        VARCHAR (50)            NULL,
    [lngtd_cmpo]                     INT                     NOT NULL,
    [nmbre_cmpo_cdgo]                [dbo].[udtNombreObjeto] NULL,
    [nmbre_cmpo_cnsctvo]             [dbo].[udtNombreObjeto] NULL,
    [nmbre_cmpo_dscrpcn]             [dbo].[udtNombreObjeto] NULL,
    [nmro_crctrs_dscrpcn]            [dbo].[udtConsecutivo]  NULL,
    [nmbrs_clmns_grd]                [dbo].[udtDescripcion]  NULL,
    [dscrpcn_bsqda]                  [dbo].[udtDescripcion]  NULL,
    [tpo_aplccn]                     [dbo].[udtConsecutivo]  NULL,
    [nmbre_cmpo_prncpl]              [dbo].[udtNombreObjeto] NULL,
    [envr_cmo_prmtro]                TINYINT                 NULL,
    [ordn_prmtro_adcnl]              TINYINT                 NULL,
    [tme_stmp]                       ROWVERSION              NOT NULL,
    CONSTRAINT [PK_tbCamposConsultas_Vigencias] PRIMARY KEY CLUSTERED ([cnsctvo_vgnca_cdgo_cmpo_cnslta] ASC),
    CONSTRAINT [CKFinicioVgncaMayor_InicioVigencia_tbCamposConsultas_Vigencias] CHECK ([fn_vgnca]>=[inco_vgnca]),
    CONSTRAINT [FK_tbCamposConsultas_Vigencias_tbCamposConsultas] FOREIGN KEY ([cnsctvo_cdgo_cmpo_cnslta]) REFERENCES [dbo].[tbCamposConsultas] ([cnsctvo_cdgo_cmpo_cnslta]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCamposConsultas_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCamposConsultas_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbCamposConsultas_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCamposConsultas_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCamposConsultas_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCamposConsultas_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCamposConsultas_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCamposConsultas_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCamposConsultas_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCamposConsultas_Vigencias] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCamposConsultas_Vigencias] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCamposConsultas_Vigencias] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCamposConsultas_Vigencias] TO [Unibase]
    AS [dbo];

