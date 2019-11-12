CREATE TABLE [dbo].[Formularios20100331] (
    [cnsctvo_cdgo_dcmnto]           INT           NULL,
    [dscrpcn_dgtlzdr]               VARCHAR (50)  NULL,
    [dscrpcn_tpo_dcmnto]            NVARCHAR (50) NULL,
    [fcha_dgtlzcn]                  NVARCHAR (50) NULL,
    [blsa]                          NVARCHAR (50) NULL,
    [tpo_idntfccn]                  VARCHAR (3)   NULL,
    [nmro_idntfccn]                 VARCHAR (20)  NULL,
    [tpo_frmlro]                    VARCHAR (50)  NULL,
    [nmro_frmlro]                   VARCHAR (50)  NULL,
    [nmro_nvdd]                     NVARCHAR (50) NULL,
    [nmro_slctd]                    NVARCHAR (50) NULL,
    [nmro_imgns]                    NVARCHAR (50) NULL,
    [rta_imgn]                      VARCHAR (250) NULL,
    [cnsctvo_cdgo_tpo_frmlro_a]     NVARCHAR (50) NULL,
    [nmro_frmlro_a]                 NVARCHAR (50) NULL,
    [cnsctvo_tpo_idntfccn_ctznte_a] NVARCHAR (50) NULL,
    [nmro_idntfccn_ctznte_a]        NVARCHAR (50) NULL,
    [cnsctvo_tpo_idntfccn_bnfcro_a] NVARCHAR (50) NULL,
    [nmro_idntfccn_bnfcro_a]        NVARCHAR (50) NULL,
    [fcha_ncmnto_a]                 NVARCHAR (50) NULL,
    [cnsctvo_cdgo_sxo_a]            NVARCHAR (50) NULL,
    [enctrdo]                       VARCHAR (10)  NULL,
    [prcsdo]                        INT           NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Formularios20100331] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Formularios20100331] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Formularios20100331] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Formularios20100331] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Formularios20100331] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Formularios20100331] TO [Unibase]
    AS [dbo];

