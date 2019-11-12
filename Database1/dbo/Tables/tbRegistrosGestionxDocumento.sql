CREATE TABLE [dbo].[tbRegistrosGestionxDocumento] (
    [cnsctvo_cdgo_rgstro_gstn_dcmnto] [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cnsctvo_rgstro_gstn_dcmnto]      [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_dcmnto]             [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_fljo]               [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_gstn]           [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_estdo_dcmnto_antrr] [dbo].[udtConsecutivo] NULL,
    [cnsctvo_cdgo_estdo_dcmnto]       [dbo].[udtConsecutivo] NOT NULL,
    [usro_gstn]                       [dbo].[udtUsuario]     NOT NULL,
    [dscrpcn_gstn]                    VARCHAR (7500)         NULL,
    [cmntro_fljo]                     VARCHAR (7500)         NULL,
    [fcha_asgncn]                     DATETIME               NOT NULL,
    [fcha_inco_gstn]                  DATETIME               NULL,
    [fcha_fn_gstn]                    DATETIME               NULL,
    CONSTRAINT [PK_tbRegistrosGestionxDocumento] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_rgstro_gstn_dcmnto] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbRegistrosGestionxDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbRegistrosGestionxDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbRegistrosGestionxDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRegistrosGestionxDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbRegistrosGestionxDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbRegistrosGestionxDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbRegistrosGestionxDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRegistrosGestionxDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbRegistrosGestionxDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRegistrosGestionxDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRegistrosGestionxDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRegistrosGestionxDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRegistrosGestionxDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRegistrosGestionxDocumento] TO [Unibase]
    AS [dbo];

