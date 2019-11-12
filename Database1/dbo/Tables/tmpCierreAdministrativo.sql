CREATE TABLE [dbo].[tmpCierreAdministrativo] (
    [cdgo_cntcto]     NVARCHAR (255) NULL,
    [fcha_fn_gstn]    DATETIME       NULL,
    [F3]              NVARCHAR (255) NULL,
    [F4]              NVARCHAR (255) NULL,
    [F5]              NVARCHAR (255) NULL,
    [F6]              NVARCHAR (255) NULL,
    [F7]              NVARCHAR (255) NULL,
    [2009-020-030485] NVARCHAR (255) NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tmpCierreAdministrativo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tmpCierreAdministrativo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tmpCierreAdministrativo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpCierreAdministrativo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tmpCierreAdministrativo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpCierreAdministrativo] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpCierreAdministrativo] TO [Unibase]
    AS [dbo];

