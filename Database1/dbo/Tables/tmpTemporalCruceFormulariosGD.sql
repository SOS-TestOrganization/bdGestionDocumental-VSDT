CREATE TABLE [dbo].[tmpTemporalCruceFormulariosGD] (
    [dscrpcn_tpo_frmlro]          VARCHAR (20) NULL,
    [nmro_frmlro]                 VARCHAR (20) NULL,
    [fcha_rdccn]                  DATETIME     NULL,
    [fcha_dgtcn_rdccn]            DATETIME     NULL,
    [cnsctvo_tpo_idntfccn_ctznte] INT          NULL,
    [nmro_idntfccn_ctznte]        VARCHAR (20) NULL,
    [cnsctvo_cdgo_tpo_frmlro]     INT          NULL,
    [usro_dgtdr]                  VARCHAR (20) NULL,
    [cnsctvo_cdgo_otsrcng]        INT          NULL,
    [dscrpcn_prvdr]               VARCHAR (50) NULL,
    [usro_frmlro]                 INT          NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tmpTemporalCruceFormulariosGD] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tmpTemporalCruceFormulariosGD] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tmpTemporalCruceFormulariosGD] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpTemporalCruceFormulariosGD] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tmpTemporalCruceFormulariosGD] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpTemporalCruceFormulariosGD] TO [Unibase]
    AS [dbo];

