CREATE TABLE [dbo].[tbdatosctc] (
    [cnsctvo_cdgo_dcmnto]  FLOAT (53)    NULL,
    [nmro_ntfccn]          FLOAT (53)    NULL,
    [nmro_acta]            FLOAT (53)    NULL,
    [sde]                  VARCHAR (255) NULL,
    [COD SEDE]             FLOAT (53)    NULL,
    [OBSERVACION MAURICIO] VARCHAR (255) NULL,
    [opcn]                 INT           NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbdatosctc] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbdatosctc] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbdatosctc] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbdatosctc] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbdatosctc] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbdatosctc] TO [Unibase]
    AS [dbo];

