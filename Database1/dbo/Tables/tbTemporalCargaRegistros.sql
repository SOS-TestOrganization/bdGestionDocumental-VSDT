CREATE TABLE [dbo].[tbTemporalCargaRegistros] (
    [rta]    VARCHAR (100) NOT NULL,
    [archvo] NUMERIC (20)  NOT NULL,
    [anno]   VARCHAR (10)  NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTemporalCargaRegistros] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTemporalCargaRegistros] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTemporalCargaRegistros] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTemporalCargaRegistros] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTemporalCargaRegistros] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTemporalCargaRegistros] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTemporalCargaRegistros] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTemporalCargaRegistros] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTemporalCargaRegistros] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTemporalCargaRegistros] TO [Unibase]
    AS [dbo];

