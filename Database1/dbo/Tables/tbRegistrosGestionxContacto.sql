CREATE TABLE [dbo].[tbRegistrosGestionxContacto] (
    [cnsctvo_cdgo_rgstro_gstn_cntcto] [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cnsctvo_rgstro_gstn_cntcto]      [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_cntcto]             [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_gstn]           [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_estdo_cntcto]       [dbo].[udtConsecutivo] NOT NULL,
    [usro_gstn_cntcto]                [dbo].[udtUsuario]     NOT NULL,
    [dscrpcn_gstn]                    VARCHAR (7500)         NOT NULL,
    [fcha_asgncn]                     DATETIME               NOT NULL,
    [fcha_inco_gstn]                  DATETIME               NULL,
    [fcha_fn_gstn]                    DATETIME               NULL,
    [fcha_aprtra_cntcto]              DATETIME               NULL,
    [usro_orgn_cntcto]                [dbo].[udtUsuario]     NULL,
    CONSTRAINT [PK_tbRegistrosGestionxContacto_1] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_rgstro_gstn_cntcto] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbRegistrosGestionxContacto] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbRegistrosGestionxContacto] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRegistrosGestionxContacto] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbRegistrosGestionxContacto] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRegistrosGestionxContacto] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRegistrosGestionxContacto] TO [Administrador Servicio al Cliente]
    AS [dbo];

