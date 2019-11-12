CREATE TABLE [dbo].[tbFechas] (
    [cnsctvo] BIGINT        NULL,
    [fcha1]   VARCHAR (50)  NULL,
    [fcha2]   VARCHAR (50)  NULL,
    [fcha3]   VARCHAR (150) NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbFechas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbFechas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbFechas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFechas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbFechas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFechas] TO [Unibase]
    AS [dbo];

