CREATE TABLE [dbo].[tbCotizantesImagenesSinva] (
    [nmro_idntfccn_ctznte] VARCHAR (20) NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCotizantesImagenesSinva] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCotizantesImagenesSinva] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbCotizantesImagenesSinva] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCotizantesImagenesSinva] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCotizantesImagenesSinva] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCotizantesImagenesSinva] TO [Unibase]
    AS [dbo];

