CREATE TABLE [dbo].[tbasd] (
    [tpo_frmlro]  NVARCHAR (255) NULL,
    [nmro_frmlro] NVARCHAR (255) NULL,
    [cnsctvo]     INT            NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbasd] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbasd] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbasd] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbasd] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbasd] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbasd] TO [Unibase]
    AS [dbo];

