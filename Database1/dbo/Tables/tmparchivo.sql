CREATE TABLE [dbo].[tmparchivo] (
    [nmro_rdccn] VARCHAR (50) NULL,
    [nmro_rcbro] VARCHAR (50) NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tmparchivo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tmparchivo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tmparchivo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmparchivo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tmparchivo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmparchivo] TO [Unibase]
    AS [dbo];

