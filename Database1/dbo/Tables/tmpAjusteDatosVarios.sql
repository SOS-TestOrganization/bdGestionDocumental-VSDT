CREATE TABLE [dbo].[tmpAjusteDatosVarios] (
    [cmpo1]  VARCHAR (250) NULL,
    [cmpo2]  VARCHAR (250) NULL,
    [cmpo3]  VARCHAR (250) NULL,
    [cmpo4]  VARCHAR (250) NULL,
    [cmpo5]  VARCHAR (250) NULL,
    [cmpo6]  INT           NULL,
    [cmpo7]  INT           NULL,
    [cmpo8]  INT           NULL,
    [cmpo9]  INT           NULL,
    [cmpo10] INT           NULL,
    [cmpo11] DATETIME      NULL,
    [cmpo12] DATETIME      NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tmpAjusteDatosVarios] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tmpAjusteDatosVarios] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpAjusteDatosVarios] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tmpAjusteDatosVarios] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tmpAjusteDatosVarios] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tmpAjusteDatosVarios] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpAjusteDatosVarios] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tmpAjusteDatosVarios] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tmpAjusteDatosVarios] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tmpAjusteDatosVarios] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpAjusteDatosVarios] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tmpAjusteDatosVarios] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tmpAjusteDatosVarios] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tmpAjusteDatosVarios] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpAjusteDatosVarios] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tmpAjusteDatosVarios] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];

