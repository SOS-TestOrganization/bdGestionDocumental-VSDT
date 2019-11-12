CREATE TABLE [dbo].[tbLogValidaciones] (
    [cnsctvo_cdgo_lg_vldcn]        INT           IDENTITY (1, 1) NOT NULL,
    [cnsctvo_cdgo_prcso_crga_imgn] INT           NOT NULL,
    [cnsctvo_cdgo_tpo_vldcn]       INT           NOT NULL,
    [nmbre_archvo]                 VARCHAR (150) NULL,
    CONSTRAINT [PK_tbLogValidacionCargaImagenes] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_lg_vldcn] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbLogValidaciones] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbLogValidaciones] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbLogValidaciones] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbLogValidaciones] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbLogValidaciones] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbLogValidaciones] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbLogValidaciones] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbLogValidaciones] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbLogValidaciones] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbLogValidaciones] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbLogValidaciones] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbLogValidaciones] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbLogValidaciones] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbLogValidaciones] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbLogValidaciones] TO [Unibase]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbLogValidaciones] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbLogValidaciones] TO [websos]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbLogValidaciones] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbLogValidaciones] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbLogValidaciones] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbLogValidaciones] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbLogValidaciones] TO [visosservice_role]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbLogValidaciones] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbLogValidaciones] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbLogValidaciones] TO [visosservice_role]
    AS [dbo];

