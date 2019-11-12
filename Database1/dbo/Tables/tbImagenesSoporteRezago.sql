CREATE TABLE [dbo].[tbImagenesSoporteRezago] (
    [cnsctvo_cdgo_imgn]   INT           NOT NULL,
    [anno]                VARCHAR (150) NOT NULL,
    [cnsctvo_agrpdr_imgn] VARCHAR (150) NULL,
    [fcha_dgtlzcn]        VARCHAR (150) NULL,
    [cntdd_pgns]          INT           NULL,
    [nmro_dsco]           VARCHAR (150) NULL,
    [plnlla]              VARCHAR (150) NOT NULL,
    [nit]                 VARCHAR (150) NULL,
    [nmbre]               VARCHAR (150) NULL,
    [nmro_blsa]           VARCHAR (50)  NULL,
    [tpo]                 VARCHAR (150) NULL,
    [nmro]                VARCHAR (150) NULL,
    [rta]                 VARCHAR (150) NULL,
    CONSTRAINT [PK_tbImagenesSoporteRezago] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_imgn] ASC, [anno] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_tbImagenesSoporteRezagoIdentificacion]
    ON [dbo].[tbImagenesSoporteRezago]([nit] ASC)
    ON [FG_INDEXES];


GO
CREATE NONCLUSTERED INDEX [IX_tbImagenesSoporteRezagoPlanilla]
    ON [dbo].[tbImagenesSoporteRezago]([plnlla] ASC)
    ON [FG_INDEXES];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [Unibase]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [websos]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [visosservice_role]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesSoporteRezago] TO [visosservice_role]
    AS [dbo];

