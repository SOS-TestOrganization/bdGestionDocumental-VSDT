CREATE TABLE [dbo].[tbCriteriosConsultaxOpcion_Vigencias] (
    [cnsctvo_vgnca_cdgo_cnslta_opcn] [dbo].[udtConsecutivo]  NOT NULL,
    [cnsctvo_cdgo_cnslta_opcn]       [dbo].[udtConsecutivo]  NOT NULL,
    [inco_vgnca]                     DATETIME                NOT NULL,
    [fn_vgnca]                       DATETIME                NOT NULL,
    [fcha_crcn]                      DATETIME                NOT NULL,
    [usro_crcn]                      [dbo].[udtUsuario]      NOT NULL,
    [cnsctvo_cdgo_crtro_cnslta]      [dbo].[udtConsecutivo]  NOT NULL,
    [cnsctvo_cdgo_opcn]              [dbo].[udtConsecutivo]  NOT NULL,
    [nmbre_sp_ejcn]                  [dbo].[udtDescripcion]  NULL,
    [tme_stmp]                       ROWVERSION              NOT NULL,
    [prmtrs_adcnls]                  [dbo].[udtDescripcion]  NULL,
    [tpo_cnxn]                       CHAR (10)               DEFAULT ('ADO') NULL,
    [nmbre_rprte_dtlldo]             [dbo].[udtNombreObjeto] NULL,
    [nmbre_sp_ejcn_cnslddo]          [dbo].[udtNombreObjeto] NULL,
    [nmbre_rprte_cnslddo]            [dbo].[udtNombreObjeto] NULL,
    CONSTRAINT [PK_tbCriteriosConsultaxOpcion_Vigencias] PRIMARY KEY CLUSTERED ([cnsctvo_vgnca_cdgo_cnslta_opcn] ASC),
    CONSTRAINT [CKFinicioVgncaMayor_InicioVigencia_tbCriteriosConsultaxOpcion_Vigencias] CHECK ([fn_vgnca]>=[inco_vgnca]),
    CONSTRAINT [FK_tbCriteriosConsultaxOpcion_Vigencias_tbCriteriosConsultaxOpcion] FOREIGN KEY ([cnsctvo_cdgo_cnslta_opcn]) REFERENCES [dbo].[tbCriteriosConsultaxOpcion] ([cnsctvo_cdgo_cnslta_opcn]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion_Vigencias] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion_Vigencias] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion_Vigencias] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion_Vigencias] TO [Unibase]
    AS [dbo];

