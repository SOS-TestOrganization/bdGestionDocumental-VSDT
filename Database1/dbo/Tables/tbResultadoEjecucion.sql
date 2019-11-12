CREATE TABLE [dbo].[tbResultadoEjecucion] (
    [cnsctvo] INT            IDENTITY (1, 1) NOT NULL,
    [slda]    NVARCHAR (MAX) NULL,
    [fcha]    DATETIME       DEFAULT (getdate()) NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbResultadoEjecucion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbResultadoEjecucion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbResultadoEjecucion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResultadoEjecucion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbResultadoEjecucion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbResultadoEjecucion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbResultadoEjecucion] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResultadoEjecucion] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbResultadoEjecucion] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResultadoEjecucion] TO [Unibase]
    AS [dbo];

