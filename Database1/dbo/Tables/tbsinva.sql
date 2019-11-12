CREATE TABLE [dbo].[tbsinva] (
    [nmro_rdccn]    INT NULL,
    [cnsctvo_rcbro] INT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbsinva] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbsinva] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbsinva] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbsinva] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbsinva] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbsinva] TO [Unibase]
    AS [dbo];

