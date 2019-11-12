CREATE TABLE [dbo].[tmpFormulariosEmpleador] (
    [dscrpcn_tpo_frmlro_crta] VARCHAR (50)  NULL,
    [nmro_frmlro]             VARCHAR (50)  NULL,
    [nmro_ga]                 VARCHAR (50)  NULL,
    [cdgo_tpo_idntfccn]       VARCHAR (50)  NULL,
    [nmro_idntfccn_emprsa]    VARCHAR (50)  NULL,
    [prmr_nmbr]               VARCHAR (50)  NULL,
    [sgndo_nmbr]              VARCHAR (50)  NULL,
    [prmr_aplldo]             VARCHAR (50)  NULL,
    [sgndo_aplldo]            VARCHAR (50)  NULL,
    [rzn_scl]                 VARCHAR (150) NULL,
    [fcha_dgtcn]              VARCHAR (50)  NULL,
    [cdgo_dgtdr]              VARCHAR (50)  NULL,
    [dscrpcn_dgtdr]           VARCHAR (50)  NULL,
    [cnsctvo_cdgo_tpo_frmlro] VARCHAR (50)  NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tmpFormulariosEmpleador] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tmpFormulariosEmpleador] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tmpFormulariosEmpleador] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpFormulariosEmpleador] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tmpFormulariosEmpleador] TO [GestionDocumental]
    AS [dbo];

