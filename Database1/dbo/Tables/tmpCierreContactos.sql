CREATE TABLE [dbo].[tmpCierreContactos] (
    [Codigo Contacto]   VARCHAR (20) NULL,
    [Fecha de Solución] DATETIME     NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tmpCierreContactos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tmpCierreContactos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tmpCierreContactos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpCierreContactos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tmpCierreContactos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpCierreContactos] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpCierreContactos] TO [Unibase]
    AS [dbo];

