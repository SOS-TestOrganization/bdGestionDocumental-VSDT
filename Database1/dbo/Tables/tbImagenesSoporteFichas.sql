CREATE TABLE [dbo].[tbImagenesSoporteFichas] (
    [cnsctvo_cdgo_imgn]   INT           NOT NULL,
    [anno]                VARCHAR (150) NOT NULL,
    [fcha_dgtlzcn]        DATETIME      NULL,
    [cntdd_pgns]          INT           NULL,
    [nmro_dsco]           INT           NULL,
    [nmro_idntfccn]       VARCHAR (150) NULL,
    [nmbre_prsna]         VARCHAR (150) NULL,
    [espcldd]             VARCHAR (150) NULL,
    [sde]                 VARCHAR (150) NULL,
    [tpo]                 VARCHAR (150) NULL,
    [blsa]                VARCHAR (150) NULL,
    [rta]                 VARCHAR (150) NULL,
    [cnsctvo_agrpdr_imgn] VARCHAR (150) NULL,
    [nmbre_prvdr]         VARCHAR (150) NULL,
    CONSTRAINT [PK_tbImagenesSoporteFichas] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_imgn] ASC, [anno] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_tbImagenesSoporteFichasIdentificacion]
    ON [dbo].[tbImagenesSoporteFichas]([nmro_idntfccn] ASC)
    ON [FG_INDEXES];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [Unibase]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [websos]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [visosservice_role]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesSoporteFichas] TO [visosservice_role]
    AS [dbo];

