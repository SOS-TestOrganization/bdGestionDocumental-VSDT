CREATE TABLE [dbo].[tbCriteriosConsultaxOpcion] (
    [cnsctvo_cdgo_cnslta_opcn]  [dbo].[udtConsecutivo] NOT NULL,
    [fcha_crcn]                 DATETIME               NOT NULL,
    [usro_crcn]                 [dbo].[udtUsuario]     NOT NULL,
    [cnsctvo_cdgo_crtro_cnslta] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_opcn]         [dbo].[udtConsecutivo] NOT NULL,
    CONSTRAINT [PK_tbCriteriosConsultaxOpcion] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_cnslta_opcn] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCriteriosConsultaxOpcion] TO [Unibase]
    AS [dbo];

