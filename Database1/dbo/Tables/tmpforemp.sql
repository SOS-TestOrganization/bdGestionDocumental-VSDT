CREATE TABLE [dbo].[tmpforemp] (
    [tpo_frmlro]          VARCHAR (50) NULL,
    [nmro_frmlro]         VARCHAR (50) NULL,
    [Estdo]               VARCHAR (50) NULL,
    [tpo_idntfccn]        VARCHAR (50) NULL,
    [nmro_idntfccn]       VARCHAR (50) NULL,
    [Ms]                  VARCHAR (50) NULL,
    [cnsctvo_cdgo_dcmnto] INT          NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tmpforemp] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tmpforemp] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tmpforemp] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpforemp] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tmpforemp] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpforemp] TO [Unibase]
    AS [dbo];

